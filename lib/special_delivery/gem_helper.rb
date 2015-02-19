require 'bundler/gem_helper'

module SpecialDelivery
  class GemHelper < ::Bundler::GemHelper
    def install
      built_gem_path = nil

      desc "Build #{name}-#{version}.gem into the pkg directory."
      task 'build' do
        built_gem_path = build_gem
      end

      desc "Build and install #{name}-#{version}.gem into system gems."
      task 'install' => 'build' do
        install_gem(built_gem_path)
      end

      desc "Create tag #{version_tag} and build and push #{name}-#{version}.gem to Rubygems"
      task 'release' => ['build', 'release:guard_clean',
                         'release:source_control_push', 'release:geminabox_push'] do
      end

      task 'release:guard_clean' do
        guard_clean
      end

      task 'release:source_control_push' do
        tag_version { git_push } unless already_tagged?
      end

      task 'release:geminabox_push' do
        geminabox_push(built_gem_path) if gem_push?
      end

      task 'release:rubygem_push' do
        rubygem_push(built_gem_path) if gem_push?
      end

      GemHelper.instance = self
    end

    def geminabox_push(path)
      if Pathname.new("~/.gem/geminabox").expand_path.exist?
        sh("gem inabox #{path}")
        ::Bundler.ui.confirm "Pushed #{name} #{version} to your geminabox server."
      else
        raise "You have not configured geminabox. Please run `gem inabox --configure` to configure it."
      end
    end
  end
end
