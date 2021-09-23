require 'rails_helper'

RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "tests a number to be postive" do
    expect(1).to be_positive
    expect(5).to be > 3
  end

  it 'tests article object' do 
    article = create(:article)
    expect(article.title).to eq('MyString')
  end
  
  
  describe '#validations' do

    let(:article) { build(:article) }

    it 'tests that factory is valid' do
      # article = create(:article)
      expect(article).to be_valid
      article.save!
      another_article = build(:article)
      another_article.to be_valid
    end
  
    it 'has an invalid title' do 
      # article = build :article, title: ''
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    pending 'has invalid content'
    pending 'has an invalid slug'
    pending 'validates the uniqueness of the slug'




  end


end
