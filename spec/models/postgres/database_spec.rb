require 'rails_helper'

RSpec.describe PostgreSQL::Database, type: :model do

  describe 'retrieve schemas' do
    before { @deployment = PostgreSQL::Deployment.new type: :postgresql, host: :localhost, port: 6432 }

    context 'inexistent database' do
      before { @db = PostgreSQL::Database.new deployment: @deployment, name: :nonexistent_database }
      it { expect { @db.schemas }.to raise_exception(PG::ConnectionBad) }
    end

    context 'existent databases' do
      before { @db = PostgreSQL::Database.new deployment: @deployment, name: :postgres }
      it { expect(@db.schemas).to be }
    end
    
  end
  
end

