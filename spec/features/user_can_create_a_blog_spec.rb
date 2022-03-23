require 'spec_helper'
RSpec.describe "User can post a blog" do
 it "when filling in all information" do
   visit "/"
   fill_in "blog[title]", with: "Test"
   fill_in "blog[content]", with: "This is my new blog."
   click_on "Post"
   new_blog = Blog.last
   expect(new_blog.title).to eq("Test")
   expect(new_blog.content).to eq("This is my new blog")
   expect(current_path).to eq("/blogs/#{new_blog.id}")
   expect(page).to have_content("This is my new blog.")
   expect(page).to have_content("Test")
 end
end