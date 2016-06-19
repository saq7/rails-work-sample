require 'rails_helper'

RSpec.describe PostgreSQL::Deployment, type: :model do

  describe 'retrieve databases' do
    
    context 'inexistent deployment' do
      before { @deployment = PostgreSQL::Deployment.new type: :postgresql, host: :localhost, port:6433 }
      it { expect { @deployment.databases }.to raise_exception(PG::ConnectionBad) }
    end

    context 'existent deployment' do
      before { @deployment = PostgreSQL::Deployment.new type: :postgresql, host: :localhost, port:6432 }
      it { expect(@deployment.databases).to be }     
    end
  
  end
  
end

