require 'rails_helper'
require 'json'

RSpec.describe PostgreSQL::CurrentQueriesController, type: :controller do

  describe 'GET index' do
    context 'with html' do
      before { get :index, account_slug: 'nice-co', deployment_id: 1234 }
      it { expect(response.status).to eq(200) }
    end
  end

  describe 'GET index' do
    context 'with json' do
      before { request.headers["accept"] = 'application/json' }
      before { get :index, account_slug: 'nice-co', deployment_id: 1234 }
      it { expect(response.status).to eq(200) }
      it { expect(JSON.parse(response.body)).to be }
    end
  end
  
end
