require 'rails_helper'

RSpec.describe Deployment, type: :model do

  describe 'find deployment' do
    
    context 'inexistent deployment' do
      it { expect { Deployment.find 12345 }.to raise_exception(NoMethodError) }
    end

    context 'existent deployment' do
      it { expect(Deployment.find 1234).to be }
    end

  end
  
end
