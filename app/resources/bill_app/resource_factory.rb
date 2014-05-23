module BillApp
  class ResourceFactory
    def self.resource_for(user, password, element_name, reflection_options = {})
      reflection_options.reverse_merge! class_name: 'BillApp::ResourceStruct'

      Class.new(ActiveResource::Base) do
        self.site = "https://#{user.agenda.name}.billapp.cz"
        self.user = user.email
        self.password = password
        self.element_name = element_name

        create_reflection :user_macro, :user, reflection_options
      end
    end
  end

  class ResourceStruct < OpenStruct
    def initialize(attributes, persisted)
      super(attributes)
    end
  end
end
