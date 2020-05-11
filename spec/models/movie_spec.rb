require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "Associations" do
    it { should have_many(:seats) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:genre) }
    it { should validate_presence_of(:rows) }
    it { should validate_presence_of(:columns) }
  end

  describe "Seats count" do 
    let(:movie) { create(:movie) }
    it "should equal rows * columns" do
      expect(movie.seats.count).eql? (movie.rows * movie.columns)
    end
  end

  it "has a valid factory" do
    expect(create(:movie)).to be_valid
  end

  it "is invalid without title" do
    expect(build(:movie, title: nil)).not_to be_valid
  end

  it "is invalid without summary" do
    expect(build(:movie, summary: nil)).not_to be_valid
  end

  it "is invalid without year" do
    expect(build(:movie, year: nil)).not_to be_valid
  end

  it "is invalid without genre" do
    expect(build(:movie, genre: nil)).not_to be_valid
  end

  it "is invalid without rows" do
    expect(build(:movie, rows: nil)).not_to be_valid
  end

  it "is invalid without columns" do
    expect(build(:movie, columns: nil)).not_to be_valid
  end

  it "is valid without imdb_link" do
    expect(build(:movie, imdb_link: nil)).to be_valid
  end

  it "has a invalid without summary" do
    expect(build(:movie, summary: nil)).not_to be_valid
  end
end
