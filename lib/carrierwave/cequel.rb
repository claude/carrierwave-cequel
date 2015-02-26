require "carrierwave/cequel/version"
require 'cequel'
require 'carrierwave'

module CarrierWave
  module Cequel
    include CarrierWave::Mount

    def mount_uploader(column, uploader, options={}, &block)
      super

      alias_method :read_uploader, :[]
      alias_method :write_uploader, :[]=
      public :read_uploader
      public :write_uploader

      after_save :"store_#{column}!"
      before_save :"write_#{column}_identifier"
      after_destroy :"remove_#{column}!"
      after_save :"remove_previously_stored_#{column}"
    end
  end
end
