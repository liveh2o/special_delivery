require 'bundler/gem_helper'

module SpecialDelivery
  class GemHelper < ::Bundler::GemHelper
    def install
      desc "Build #{name}-#{version}.gem into the pkg directory."
      task 'build' do
        build_gem
      end

      desc "Build and install #{name}-#{version}.gem into system gems."
      task 'install' do
        install_gem
      end

      desc "Create tag #{version_tag} and build and push #{name}-#{version}.gem to your geminabox server"
      task 'release' do
        release_gem
      end

      ::Bundler::GemHelper.instance = self
    end

    def rubygem_push(path)
      if Pathname.new("~/.gem/geminabox").expand_path.exist?
        sh("gem inabox #{path}")
        ::Bundler.ui.confirm "Pushed #{name} #{version} to your geminabox server."
      else
        raise "You have not configured geminabox. Please run `gem inabox --configure` to configure it."
      end
    end
  end
end
