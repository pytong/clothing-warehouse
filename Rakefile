# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :package do
  changed_files = `git status --porcelain`.split("\n")
  abort "You have local changes:\n#{changed_files.join("\n")}" unless changed_files.empty?
  chdir("..") do
    command = "zip -x take-home-challenge-next-level/tmp/cache/\\* -x take-home-challenge-next-level/.git/\\* -x take-home-challenge-next-level/RUBRIC.md -r take-home-challenge.zip take-home-challenge-next-level/*"
    sh command do |ok,res|
      raise "Problem running #{command}" unless ok
    end
  end 
end
