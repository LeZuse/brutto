module BillApp
  class ResourceFactory
    def self.resource_for(element_name, klass, agenda, user, password)
      Class.new(ActiveResource::Base) do
        self.site = "https://#{agenda}.billapp.cz"
        self.user = user
        self.password = password
        self.element_name = element_name

        create_reflection :user_macro, :user, class_name: klass.to_s
      end
    end
  end
end
