require 'rails_helper'

RSpec.describe PostgreSQL::Table, type: :model do

  describe 'retrieve columns' do
    before do
      @deployment = PostgreSQL::Deployment.new type: :postgresql, host: :localhost, port: 6432
      @db = PostgreSQL::Database.new deployment: @deployment, name: :booktown
      @schema = PostgreSQL::Schema.new deployment: @deployment, database: @db, name: :public
    end

    context 'inexistent table' do
      before { @table = PostgreSQL::Table.new deployment: @deployment,
                                              database: @db,
                                              schema: @schema,
                                              name: :nonexistent_table }
      it { expect { @table.columns }.to raise_exception(RuntimeError) }
    end

    context 'existent databases' do
      before { @table = PostgreSQL::Table.new deployment: @deployment,
                                              database: @db,
                                              schema: @schema, 
                                              name: :customers }
      it { expect(@table.columns).to be }
    end
    
  end
  
end

