require "carrierwave/cequel/version"
require 'cequel'
require 'carrierwave'

module Carrierwave
  module Cequel
    include CarrierWave::Mount

    def mount_uploader(column, uploader, options={}, &block)
      super

      alias_method :read_uploader, :read_attribute
      alias_method :write_uploader, :write_attribute
      public :read_uploader
      public :write_uploader

      after_save :"store_#{column}!"
      before_save :"write_#{column}_identifier"
      after_destroy :"remove_#{column}!"
      before_update :"store_previous_model_for_#{column}"
      after_save :"remove_previously_stored_#{column}"
    end
  end
end

Cequel::Record.send(:extend, CarrierWave::Cequel)
