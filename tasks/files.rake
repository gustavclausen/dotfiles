namespace :install do
  desc 'Install files'

  task :dotbot do
    section 'Using Dotbot to symlink dotfiles'

    run %( ./dotbot_install )
  end
end

namespace :uninstall do
  desc 'Uninstall dotfiles'

  task :dotbot do
    section 'Uninstall Dotbot and restoring dotfiles'

    run %( ./dotbot_uninstall )
  end
end

namespace :update do
  desc 'Update Dotbot'
  task :dotbot do
    section 'Updating Dotbot'
    run %( git submodule update --remote dotbot )
    run %( ./dotbot_install )
  end
end
