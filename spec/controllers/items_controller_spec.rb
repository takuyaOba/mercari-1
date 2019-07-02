require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
  
    it'レスポンスが正しいか'do
      get :index
      expect(response).to be_success
    end
    it '200レスポンスが返ってきているか？' do
      get :index
      expect(response).to have_http_status "200"
    end

    it "renders 部分テンプレートに問題はないか？" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET#show' do

  before { get :show, params: { id: item.id }, session: {} }
    it  '200レスポンスが返ってきているか？' do
      expect(response).to render_template :show
    end
    it 'renders the :show template' do
      expect(response).to render_template :show
    end
  end

end

