require "rake"
require "parallel"
require "rspec/core/rake_task"

tasks = [["single", "android"],
         ["local", "android"],
         ["single", "ios"],
         ["local", "ios"]]

tasks.each do |row|
  task_name, task_os = row
  rake_task = "#{task_name}_#{task_os}"
  RSpec::Core::RakeTask.new(rake_task.to_sym) do |t|
    ENV["CONFIG_NAME"] ||= rake_task
    t.pattern = Dir.glob("spec/#{task_os}/#{task_name}_test.rb")
    t.rspec_opts = "--format documentation"
    t.verbose = false
  end

  task rake_task.to_sym do |t, args|
    Rake::Task[rake_task].invoke
    Rake::Task[rake_task].reenable
  end
end

task :parallel_android do |t, args|
  @num_parallel = 4

  Parallel.map([*1..@num_parallel], :in_processes => @num_parallel) do |task_id|
    ENV["TASK_ID"] = (task_id - 1).to_s
    ENV["name"] = "parallel_android"
    ENV["CONFIG_NAME"] = "parallel_android"

    Rake::Task["single_android"].invoke
    Rake::Task["single_android"].reenable
  end
end

task :parallel_ios do |t, args|
  @num_parallel = 4

  Parallel.map([*1..@num_parallel], :in_processes => @num_parallel) do |task_id|
    ENV["TASK_ID"] = (task_id - 1).to_s
    ENV["name"] = "parallel_ios"
    ENV["CONFIG_NAME"] = "parallel_ios"

    Rake::Task["single_ios"].invoke
    Rake::Task["single_ios"].reenable
  end
end