require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:post_text) { create(:post) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    let(:comment_params) { { body: 'Teste' } }
    let(:invalid_comment_params) { { body: '' } }

    context 'Atributo válido' do
      it 'Cria um novo comentário' do
        expect {
          post :create, params: { post_id: post_text.id, comment: comment_params }
        }.to change(Comment, :count).by(1)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Comentário adicionado com sucesso.')
      end
    end

    context 'Atributo inválido' do
      it 'Não cria um novo comentário' do
        expect {
          post :create, params: { post_id: post_text.id, comment: invalid_comment_params }
        }.not_to change(Comment, :count)
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq('Não foi possível adicionar o comentário.')
      end
    end
  end
end
