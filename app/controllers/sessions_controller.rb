class SessionsController < Clearance::SessionsController

      def create_from_omniauth

        auth_hash = request.env["omniauth.auth"]
        authentication = Authentication.create_with_omniauth(auth_hash)
        #   
        if authentication.user
          user = authentication.user 
          authentication.update_token(auth_hash)
          @next = root_url
          @notice = "Signed in! "
        else
          user = User.create_with_auth_and_hash(authentication,auth_hash)
          @next = root_url #edit_user_path(user)   
          @notice = "User created - confirm or edit details..."
        end
        sign_in(user)
        redirect_to @next, :notice => @notice
      end
end