require "contact_us"
require "rails"

module ContactUs
  class Engine < ::Rails::Engine
    isolate_namespace ContactUs

    initializer "contact_us", after: :load_config_initializers do |app|
      if ContactUs.mount_point
        Rails.application.routes.append do
          mount ContactUs::Engine, at: ContactUs.mount_point
        end
      end
    end
  end
end
