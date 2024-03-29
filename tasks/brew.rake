BREW_TAPS_FILE = File.expand_path('../misc/packages/brew_taps.txt', __dir__).gsub(/ /, '\ ')
BREW_PACKAGES_FILE = File.expand_path('../misc/packages/brew_packages.txt', __dir__).gsub(/ /, '\ ')
BREW_CASK_PACKAGES_FILE = File.expand_path('../misc/packages/brew_cask.txt', __dir__).gsub(/ /, '\ ')

HEAD_ONLY_FORMULAS = ''

def brew_taps
  File.readlines(BREW_TAPS_FILE).map(&:strip)
end

def brew_packages
  File.readlines(BREW_PACKAGES_FILE).map(&:strip)
end

def brew_cask_packages
  File.readlines(BREW_CASK_PACKAGES_FILE).map(&:strip)
end

namespace :backup do
  desc 'Backup Homebrew'
  task :brew do
    section 'Backing up Homebrew'

    run %( brew update )
    run %( brew upgrade )
    Rake::Task['backup:brew_packages'].invoke
    Rake::Task['backup:brew_cask_packages'].invoke
    Rake::Task['backup:brew_taps'].invoke
  end

  desc 'Backup Brew Packages'
  task :brew_packages do
    run %( brew leaves > #{BREW_PACKAGES_FILE} )
  end

  desc 'Backup Brew Cask Packages'
  task :brew_cask_packages do
    run %( brew list --cask > #{BREW_CASK_PACKAGES_FILE} )
  end

  desc 'Backup Brew Taps'
  task :brew_taps do
    run %( brew tap > #{BREW_TAPS_FILE} )
  end
end

namespace :install do
  desc 'Setup Brew Taps'
  task :brew_taps do
    section 'Setting up brew taps'

    brew_taps.each do |tap|
      run %( brew tap #{tap} )
    end
  end


  desc 'Install Brew Packages'
  task :brew_packages do
    section 'Installing Brew Packages'

    brew_packages.each do |package|
      if HEAD_ONLY_FORMULAS.include?(package)
        run %( brew install --HEAD #{package} )
      else
        run %( brew install #{package} )
      end
    end
  end

  desc 'Install Brew Cask Packages'
  task :brew_cask_packages do
    section 'Installing Brew Cask Packages'

    brew_cask_packages.each do |package|
      run %( brew install --appdir="/Applications" --fontdir="/Library/Fonts" #{package} )
    end
  end

  desc 'Clean up Brew'
  task :brew_clean_up do
    section 'Cleaning up Brew'

    run %( brew cleanup )
  end
end

namespace :update do
  desc 'Updating Homebrew'
  task :brew do
    section 'Updating Homebrew'

    run %( brew update )
    run %( brew upgrade )
    run %( brew list --cask | xargs brew upgrade )
  end
end
