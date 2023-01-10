require 'microsoft_kiota_abstractions'
require_relative './models'

module MicrosoftGraph::Models
    class IosMobileAppConfiguration < MicrosoftGraph::Models::ManagedDeviceMobileAppConfiguration
        include MicrosoftKiotaAbstractions::Parsable
        ## 
        # mdm app configuration Base64 binary.
        @encoded_setting_xml
        ## 
        # app configuration setting items.
        @settings
        ## 
        ## Instantiates a new IosMobileAppConfiguration and sets the default values.
        ## @return a void
        ## 
        def initialize()
            super
            @odata_type = "#microsoft.graph.iosMobileAppConfiguration"
        end
        ## 
        ## Creates a new instance of the appropriate class based on discriminator value
        ## @param parseNode The parse node to use to read the discriminator value and create the object
        ## @return a ios_mobile_app_configuration
        ## 
        def self.create_from_discriminator_value(parse_node)
            raise StandardError, 'parse_node cannot be null' if parse_node.nil?
            return IosMobileAppConfiguration.new
        end
        ## 
        ## Gets the encodedSettingXml property value. mdm app configuration Base64 binary.
        ## @return a binary
        ## 
        def encoded_setting_xml
            return @encoded_setting_xml
        end
        ## 
        ## Sets the encodedSettingXml property value. mdm app configuration Base64 binary.
        ## @param value Value to set for the encodedSettingXml property.
        ## @return a void
        ## 
        def encoded_setting_xml=(value)
            @encoded_setting_xml = value
        end
        ## 
        ## The deserialization information for the current model
        ## @return a i_dictionary
        ## 
        def get_field_deserializers()
            return super.merge({
                "encodedSettingXml" => lambda {|n| @encoded_setting_xml = n.get_string_value() },
                "settings" => lambda {|n| @settings = n.get_collection_of_object_values(lambda {|pn| MicrosoftGraph::Models::AppConfigurationSettingItem.create_from_discriminator_value(pn) }) },
            })
        end
        ## 
        ## Serializes information the current object
        ## @param writer Serialization writer to use to serialize this model
        ## @return a void
        ## 
        def serialize(writer)
            raise StandardError, 'writer cannot be null' if writer.nil?
            super
            writer.write_object_value("encodedSettingXml", @encoded_setting_xml)
            writer.write_collection_of_object_values("settings", @settings)
        end
        ## 
        ## Gets the settings property value. app configuration setting items.
        ## @return a app_configuration_setting_item
        ## 
        def settings
            return @settings
        end
        ## 
        ## Sets the settings property value. app configuration setting items.
        ## @param value Value to set for the settings property.
        ## @return a void
        ## 
        def settings=(value)
            @settings = value
        end
    end
end
