require 'rails_helper'

RSpec.describe PostgreSQL::SchemasController, type: :controller do

  describe 'GET index' do
    context 'inexistent database' do
      before do
        get :index,
            account_slug: 'nice-co',
            deployment_id: 1234,
            database_name: 'hello'
      end
      it { expect(response.status).to eq(404) }
    end
  end

  describe 'GET index' do
    context 'existent database' do
      before do
        get :index,
            account_slug: 'nice-co',
            deployment_id: 1234,
            database_name: 'booktown'
      end
      it { expect(response.status).to eq(200) }
    end
  end

end
