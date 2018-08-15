#!/usr/bin/env ruby
require 'json'

def extract_max(arr)
  arr.compact.sort.last || 0
end

def header
  [
    "workflow_id",
    "workflow_name",
    "workflow_total_duration",
    "download_duration",
    "processing_duration",
    "instance_type",
    "status",
    "run_id",
    "cpu",
    "mem",
    "cache",
    "blkio",
  ]
end

if __FILE__ == $0
  path_to_json_dir = ARGV.first
  list_path_to_json = Dir.glob("#{path_to_json_dir}/*json")

  list_json = list_path_to_json.map do |path|
    JSON.load(open(path))["CWL-metrics"]
  end

  workflow_metrics = list_json.flatten.map do |wf|
    id = wf["workflow_id"]
    name = wf["workflow_name"]
    duration = wf["workflow_elapsed_sec"]
    instance_type = wf["platform"]["instance_type"]

    status = []
    inputs = []
    cpu = []
    mem = []
    cache = []
    blkio = []
    download_duration = 0

    wf["steps"].each_pair do |k,v|
      status << v["tool_status"]
      inputs << v["input_files"]
      cpu    << v["metrics"]["cpu_total_percent"]
      mem    << v["metrics"]["memory_max_usage"]
      cache  << v["metrics"]["memory_cache"]
      blkio  << v["metrics"]["blkio_total_bytes"]

      if v["stepname"] == "download-sra"
        download_duration = v["docker_elapsed_sec"]
      end
    end

    input_names = inputs.reduce(Hash.new, :merge).keys
    fq_names = input_names.select{|s| s =~ /fastq/ }
    run_id = fq_names.map{|s| s.split("_").first }.first

    [
      id[0..6],
      name,
      duration,
      download_duration,
      duration - download_duration,
      instance_type,
      status.uniq.join(","),
      run_id,
      extract_max(cpu),
      extract_max(mem),
      extract_max(cache),
      extract_max(blkio),
    ].join("\t")
  end

  puts header.join("\t")
  puts workflow_metrics.join("\n")
end
