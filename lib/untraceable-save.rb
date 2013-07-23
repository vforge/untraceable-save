require "untraceable-save/version"

require "active_record" unless defined?(ActiveRecord)
require "active_support" unless defined?(ActiveSupport)

module UntraceableSave
  extend ActiveSupport::Concern

  included do
    # update that record without timestamping
    def untraceable_save(options = {})
      class << self
        def record_timestamps; false; end
      end

      ret = save options

      class << self
        remove_method :record_timestamps
      end

      ret
    end

    # update record without validation and timestamping
    def quiet_save(options = {})
      options[:validate] = false

      self.untraceable_save(options)
    end

    # update that record without timestamping
    def untraceable_save!(options = {})
      class << self
        def record_timestamps; false; end
      end

      ret = save! options

      class << self
        remove_method :record_timestamps
      end

      ret
    end

    # update record without validation and timestamping
    def quiet_save!(options = {})
      options[:validate] = false

      self.untraceable_save!(options)
    end
  end

  module ClassMethods
  end
end

# include the extension 
ActiveRecord::Base.send :include, UntraceableSave


