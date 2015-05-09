require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves the new message in the database' do
        expect{
          post :create, message: attributes_for(:message)
        }.to change(Message, :count).by(1)
      end

      it 'redirects to index' do
        post :create, message: attributes_for(:message)
        expect(response).to redirect_to messages_path
      end
    end

    context 'with invalid attributes' do
      it 'does not the new message in the database' do
        expect{
          post :create, message: attributes_for(:message, { content: nil })
        }.not_to change(Message, :count)
      end

      it 're-renders the :new template' do
        post :create, message: attributes_for(:message, { content: nil })
        expect(response).to render_template :new
      end
    end
  end

  describe 'DESTROY' do
    context 'with valid id' do
      it 'destroy the message from the database' do
        message = FactoryGirl.create(:message, { user: @user })
        expect{
          delete :destroy, id: message
        }.to change(Message, :count).by(-1)
      end

      it 'redirects to index' do
        message = FactoryGirl.create(:message, { user: @user })
        delete :destroy, id: message
        expect(response).to redirect_to messages_path
      end
    end

    context 'with invalid id' do
      it 'doesn\'t destroy message from the database' do
        expect{
          delete :destroy, id: -1
        }.not_to change(Message, :count)
      end

      it 're-renders the :index template' do
        delete :destroy, id: -1
        expect(response).to render_template :index
      end
    end
  end
end