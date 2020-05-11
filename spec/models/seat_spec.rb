require 'rails_helper'

RSpec.describe Seat, type: :model do
  describe "Associations" do
    it { should belong_to(:movie) }
  end

  describe "Validations" do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:row) }
    it { should validate_presence_of(:column) }
    it { should validate_presence_of(:status) }
  end
end
