DOTS_FOLDER = 'dotfiles-2.0'
DIRECTORY_NAME = File.dirname(__dir__)
SKIP_TESTS_FOR = %w[].freeze # mas.rake brew.rake

Dir.glob('./tasks/**/*').map { |file| load file }

task default: [:backup]

desc 'Backup Everything'
task :backup do
  section 'Backing up'
  Rake::Task['backup:brew'].invoke
end

desc 'Install Everything'
task :install do
  section 'Installing'
  Rake::Task['install:brew_packages'].invoke
  Rake::Task['install:brew_cask_packages'].invoke
  Rake::Task['install:brew_clean_up'].invoke
  Rake::Task['install:dotbot'].invoke
  Rake::Task['install:asdf_plugins'].invoke
end

desc 'Update Everything'
task :update do
  section 'Updating'
  Rake::Task['update:brew'].invoke
  Rake::Task['update:dotbot'].invoke
  Rake::Task['update:asdf_plugins'].invoke
  Rake::Task['update:tmux'].invoke
  Rake::Task['update:neovim_plugins'].invoke
end

desc 'Sync Everything'
task :sync do
  section 'Syncing'
  Rake::Task['update'].invoke
  Rake::Task['backup'].invoke
  Rake::Task['install:brew_clean_up'].invoke
end
