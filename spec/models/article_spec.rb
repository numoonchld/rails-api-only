require 'rails_helper'

RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "tests a number to be postive" do
    expect(1).to be_positive
    expect(5).to be > 3
  end

  it 'tests article object' do 
    article = create(:article)
    expect(article.title).to eq('Sample Article 1')
  end
  
  
  describe '#validations' do

    let(:article) { FactoryBot.build(:article) }

    it 'tests that factory is valid' do
      # article = create(:article)
      expect(article).to be_valid
      article.save!
      another_article = FactoryBot.build(:article)
      expect(another_article).to be_valid
    end
  
    it 'has an invalid title' do 
      # article = build :article, title: ''
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'has invalid content' do
      article.content = ''
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'has an invalid slug' do
      article.slug = ''
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end

    it 'validates the uniqueness of the slug' do
      article1 = FactoryBot.create(:article)
      expect(article1).to be_valid
      article2 = FactoryBot.build(:article, slug: article1.slug)
      expect(article2).not_to be_valid
      expect(article2.errors[:slug]).to include('has already been taken')
    end

  end

  describe '.recent' do
    it 'returns articles in the correct order' do
      older_article = FactoryBot.create :article, created_at: 1.hour.ago
      recent_article = FactoryBot.create :article

      expect(described_class.recent).to eq([recent_article, older_article])

      recent_article.update_column(:created_at, 2.hours.ago)
      expect(described_class.recent).to eq([older_article, recent_article])
    end
  end

end
