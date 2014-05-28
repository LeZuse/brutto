module Devise
  module Strategies
    class BillAppAuthenticable < Devise::Strategies::Authenticatable
      def valid?
        params[:user].present?
      end

      def authenticate!
        user = find_or_create_user
        remote_user = self.find_remote_user(user)
        user.update_attributes name: remote_user.name,
                               bill_app_id: remote_user.id

        save_password_to_session

        success! user
      end

      # Add strategy to Warden
      Warden::Strategies.add :bill_app_authenticable, self

    protected

      def save_password_to_session
        session[:bill_app_api_password] = password
      end

      def find_or_create_user
        klass = mapping.to
        klass.find_or_create_by(email: params[:user][:email], agenda_id: agenda.id) do |new_user|
          new_user.password = password
        end
      end

      def agenda
        @agenda ||= Agenda.find_or_create_by(name: params[:user][:agenda])
      end

      def find_remote_user(user)
        user_resource(user).all.find { |u| u.email == user.email }
      end

      def user_resource(user)
        BillApp::ResourceFactory.resource_for(user, password, 'user')
      end

      def password
        params[:user][:password]
      end
    end
  end
end
