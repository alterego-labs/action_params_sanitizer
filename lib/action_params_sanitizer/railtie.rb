module ActionParamsSanitizer
  class Railtie < Rails::Railtie
    config.after_initialize do
      ActiveSupport.on_load(:action_controller) do
        include ActionParamsSanitizer::Helpers::Controller
      end
    end
  end
end
