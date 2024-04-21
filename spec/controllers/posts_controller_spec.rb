require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:post_record) { create(:post, user: user) }

  before do
    sign_in user
  end

  describe 'PATCH #update' do
    it 'Update o Post e redireciona para user_profile_path' do
      patch :update, params: { id: post_record.id, post: { body: 'teste 2' } }
      expect(response).to redirect_to(user_profile_path)
    end
  end

  describe 'DELETE #destroy' do
    it 'Deleta o post e redireciona para o user_profile_path' do
      delete :destroy, params: { id: post_record.id }
      expect(response).to redirect_to(user_profile_path)
    end
  end
end
