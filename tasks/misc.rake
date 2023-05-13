namespace :install do
  desc 'Install asdf plugins'
  task :asdf_plugins do
    section 'Install asdf plugins'

    run %( asdf plugin update --all )
    run %( cat ~/.tool-versions | cut -f 1 -d ' ' | xargs -d"\n" -I"{}" asdf plugin add "{}" )
    run %( asdf install )
  end
end

namespace :update do
  desc 'Update Neovim plugins'
  task :neovim_plugins do
    section 'Updating Neovim plugins'

    run %( nvim --headless "+Lazy! update" +qa )
  end

  desc 'Update Tmux plugins'
  task :tmux do
    section 'Updating Tmux plugins'

    run %( ~/.tmux/plugins/tpm/bin/update_plugins all )
  end

  desc 'Update asdf plugins'
  task :asdf_plugins do
    section 'Updating asdf plugins'

    run %( asdf plugin update --all )
  end
end
