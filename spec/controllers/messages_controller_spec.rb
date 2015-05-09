require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
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
      it 'does not save the new message in the database' do
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
end