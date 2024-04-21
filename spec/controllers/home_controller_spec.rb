require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    before do
      5.times do
        create(:post, created_at: Time.current + 1.day)
      end
    end

    it 'Verifica a paginação dos posts' do
      get :index, params: { page: 1 }
      expect(assigns(:posts).size).to eq(3)
    end
  end
end
