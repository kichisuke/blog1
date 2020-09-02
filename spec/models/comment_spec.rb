require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with name, content" do
    blog = FactoryBot.create(:blog)
    comment = blog.comments.build(
      blog_id: 1,
      name: "hoge",
      content: "hogehoge"
    )
    expect(comment).to be_valid
  end
end
