require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to(:garden) }
  end

  describe 'validations' do
    it { should validate_presence_of(:size) }
    it { should validate_presence_of(:direction) }
    it { should validate_presence_of(:number) }
    it { should validate_numericality_of(:number) }
  end
end
