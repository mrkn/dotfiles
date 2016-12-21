MItamae::RecipeContext.class_eval do
  def include_module(name)
    include_recipe File.join(top_dir, 'recipes', 'modules', name, 'default')
  end

  def include_role(name)
    include_recipe File.join(top_dir, 'recipes', 'roles', name, 'default')
  end

  def brew(*args)
    execute "brew #{args.join(' ')}" do
      command "brew #{args.join(' ')}"
    end
  end

  def mas_package(app_id, app_name=nil)
    local_ruby_block "Install or upgrade the application of #{app_name || app_id}" do
      block do
        if system("mas list | grep -q #{app_id} >&/dev/null")
          # installed
          if system("mas outdated | grep -q #{app_id} >&/dev/null")
            # need to upgrade
            system("mas upgrade #{app_id}")
          end
        else
          # not installed
          system("mas install #{app_id}")
        end
      end
    end
  end

  def top_dir
    @top_dir ||= File.expand_path('../..', __FILE__)
  end
end
