require 'rails_helper'

RSpec.describe Like, type: :model do
  it "is valid with blog_id" do
    blog = FactoryBot.create(:blog)
    like = blog.likes.build(
      blog_id: 1,
    )
    expect(like).to be_valid
  end
end
