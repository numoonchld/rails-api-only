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

end
