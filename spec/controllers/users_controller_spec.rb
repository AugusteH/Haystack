require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe '#create' do

    let(:attributes) { {email: 'derp@derp.com', password: 'password'} }
    it 'creates a new user' do
      expect{post :create, params: {user: attributes}, format: :json}.to change(User, :count).by(1)
    end

  end
end
