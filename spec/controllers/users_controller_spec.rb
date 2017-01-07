require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:attributes) { {email: 'derp@derp.com', password: 'password'} }

  describe '#create' do

    it 'creates a new user' do
      expect{post :create, params: {user: attributes}, format: :json}.to change(User, :count).by(1)
    end

  end

  describe '#update' do

    let(:new_attributes) { {email: 'test@test.com'} }
    let(:user) { User.create!(attributes) }

    it "updates the requested user" do
      put :update, params: {id: user.to_param, user: new_attributes}, format: :json
      user.reload
      expect(user.email).to eq(new_attributes[:email])
    end

  end

  describe '#destroy' do

    let!(:user) { User.create!(attributes) }

    it 'destroys the requested user' do
      expect{delete :destroy, params: {id: user.to_param}, format: :json}.to change(User, :count).by(-1)
    end
  end
end
