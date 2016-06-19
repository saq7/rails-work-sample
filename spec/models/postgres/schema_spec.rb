require 'rails_helper'

RSpec.describe PostgreSQL::Schema, type: :model do

  describe 'retrieve tables' do
    before do
      @deployment = PostgreSQL::Deployment.new type: :postgresql, host: :localhost, port: 6432
      @db = PostgreSQL::Database.new deployment: @deployment, name: :booktown
    end

    context 'inexistent schema' do
      before { @schema = PostgreSQL::Schema.new deployment: @deployment,
                                                database: @db,
                                                name: 'nonexistent_schema'}
      it { expect { @schema.tables }.to raise_exception(RuntimeError) }
    end

    context 'existent schema' do
      before { @schema = PostgreSQL::Schema.new deployment: @deployment,
                                                database: @db,
                                                name: 'public'}
      it { expect(@schema.tables).to be }
    end
    
  end
end
