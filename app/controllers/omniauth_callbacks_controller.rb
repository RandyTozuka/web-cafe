class OmniauthCallbacksController < Devise::OmniauthCallbacksController
# https://techblog.gmo-ap.jp/2019/02/08/rails%E3%81%A7omniauth-twitter%E3%82%92%E5%88%A9%E7%94%A8%E3%81%97%E3%81%A6twitter%E8%AA%8D%E8%A8%BC%E3%82%92%E5%AE%9F%E8%A3%85%E3%81%99%E3%82%8B/
  def twitter
      callback_from :twitter
    end
 
    private

    def callback_from(provider)
      provider = provider.to_s

      @user = User.find_for_oauth(request.env['omniauth.auth'])

      if @user.persisted?
        flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
        sign_in_and_redirect @user, event: :authentication
      else
        session["devise.#{provider}_data"] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end
end
