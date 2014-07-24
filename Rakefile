# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :package do
  changed_files = `git status --porcelain`.split("\n")
  abort "You have local changes:\n#{changed_files.join("\n")}" unless changed_files.empty?
  chdir("..") do
    command = "zip -x clothing-warehouse-next-level/tmp/cache/\\* -x clothing-warehouse-next-level/.git/\\* -x clothing-warehouse-next-level/RUBRIC.md -r tclothing-warehouse.zip clothing-warehouse-next-level/*"
    sh command do |ok,res|
      raise "Problem running #{command}" unless ok
    end
  end 
end
