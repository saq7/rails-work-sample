require 'rails_helper'

RSpec.describe PostgreSQL::ColumnsController, type: :controller do

  describe 'GET index' do
    context 'inexistent table' do
      before do
        get :index,
            account_slug: 'nice-co',
            deployment_id: 1234,
            database_name: 'booktown',
            schema_name: 'public',
            table_name: 'hello'
      end
      it { expect(response.status).to eq(404) }
    end
  end

  describe 'GET index' do
    context 'existent table' do
      before do
        get :index,
            account_slug: 'nice-co',
            deployment_id: 1234,
            database_name: 'booktown',
            schema_name: 'public',
            table_name: 'customers'
      end
      it { expect(response.status).to eq(200) }
    end
  end
  
end
