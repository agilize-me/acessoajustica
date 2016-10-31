require 'rails_helper'

describe Tenant do
  it "has a valid factory" do
    expect(FactoryGirl.build(:tenant)).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of :nome }
    it { should_not allow_value('').for(:nome) }
    it { should allow_value('IX de Agosto').for(:nome) }

    it { should validate_presence_of :subdomain }
    it { should_not allow_value('').for(:subdomain) }
    it { should allow_value('ixdeagosto').for(:subdomain) }
    it { should validate_uniqueness_of(:subdomain) }

    it "should be valid with a correct subdomain" do
      expect(FactoryGirl.build(:tenant, subdomain: 'ixdeagosto')).to be_valid
      expect(FactoryGirl.build(:tenant, subdomain: 'a' * 63)).to be_valid
    end

    it "should be invalid with an invalid subdomain" do
      expect(FactoryGirl.build(:tenant, subdomain: 'ixdeagosto-')).to_not be_valid
      expect(FactoryGirl.build(:tenant, subdomain: '-ixdeagosto')).to_not be_valid
      expect(FactoryGirl.build(:tenant, subdomain: 'ixde agosto')).to_not be_valid
      expect(FactoryGirl.build(:tenant, subdomain: 'âêíòü')).to_not be_valid
      expect(FactoryGirl.build(:tenant, subdomain: 'smtp')).to_not be_valid
      expect(FactoryGirl.build(:tenant, subdomain: 'pop')).to_not be_valid
      expect(FactoryGirl.build(:tenant, subdomain: '12')).to_not be_valid
      expect(FactoryGirl.build(:tenant, subdomain: 'a' * 64)).to_not be_valid
    end
  end
end
