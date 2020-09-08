require 'rails_helper'

RSpec.describe Authenticable do
  controller(ApplicationController) do
    include Authenticable
  end

  let(:app_controller) { subject }

  describe '#current_user' do
    let(:user) { create(:user) }

    before do
      req = double(:headers => { 'Authorization' => user.auth_token })
      allow(app_controller).to receive(:request).and_return(req)
    end

    it 'returns the user from authorization header' do
      expect(app_controller.current_user).to eq(user)
    end
  end

  describe '#authentication_with_token!' do
    controller do
      before_action :authentication_with_token!

      def restricted_action; end
    end

    context 'when there is no user loggedin' do
      before do
        allow(app_controller).to receive(:current_user).and_return(nil)

        routes.draw { get 'restricted_action' => 'anonymous#restricted_action' }

        get :restricted_action
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end

      it 'returns the json data for erros' do
        expect(json_body).to have_key(:errors)
      end
    end
  end

end
