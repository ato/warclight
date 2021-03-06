# frozen_string_literal: true

require 'generators/warclight/install_generator'

module Warclight
  ##
  # Warclight Update generator. This subclasses the Install generator, so this is
  # intended to override behavior in the install generator that can allow the
  # downstream application to choose if they want to take our changes or not and
  # can choose to see a diff of our changes to help them decide.
  class Update < Warclight::Install
    source_root File.expand_path('../templates', __FILE__)

    def create_blacklight_catalog
      copy_file 'catalog_controller.rb', 'app/controllers/catalog_controller.rb'
    end

    def solr_config
      directory '../../../../solr', 'solr'
    end
  end
end
