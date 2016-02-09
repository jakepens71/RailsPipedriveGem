module PipedrivePUT
    module Generators
        
        # Generates a sample config file
        class ConfigGenerator < ::Rails::Generators::Base
            source_root File.expand_path('../templates', __FILE__)
            
            def generate_config
                template "config.rb.erb", "config/initializers/pipedriveput.rb"
            end
        end
    end
end
