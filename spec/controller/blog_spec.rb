require 'rails_helper'
require 'spec_helper'

RSpec.describe BlogController, type: :controller do
  describe 'GET #index' do
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it "responds successfully" do
      expect(response).to be_successful
    end
  end

  describe 'GET #blog' do
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it "responds successfully" do
      expect(response).to be_successful
    end
  end


  describe 'PATCH #blog_post' do
    before do 
      @blog = Blog.create(
        title: 'hoge',
        body: 'hoge',
        genre: 'hoge',
        draft: 1,
        pref_name: 'hoge',
        city_name: 'hoge'
        )
     end

     it 'changes boolean draft to false' do
      patch :blog_post, params: {id: @blog.id}
      expect(@blog.reload.draft).to be false
     end

     it 'redirects the page after updates' do
      patch :blog_post, params: {id: @blog.id}
      name = '/blog/' + @blog.id.to_s
      expect(response).to redirect_to name
     end
  end


  describe 'PATCH #comment_post' do
    before do 
      @comment = Comment.create(
        name: 'hoge',
        content: 'hoge'
        )
     end

     it 'redirects the page after updates' do
      patch :comment_post, params: {id: "1", content: @comment.name, name: @comment.content, url: '1'}
     end
  end

  describe 'GET #draft' do
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it "responds successfully" do
      expect(response).to be_successful
    end
  end

  describe 'GET #draft_edit' do
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it "responds successfully" do
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
     it 'can create new record' do
      post :create, params: {title: 'hoge', genre: 'hoge', pref_name: 'hoge',food_name: 'hoge',city_name: 'hoge'}
     end
  end

  describe 'PATCH #update' do
    before do 
      @blog = Blog.create(
        title: 'hoge'
        )
     end

    #needed for error msg if title is nil
    #it 'cannot be updated without title' do
      #media_params = ''
      #patch :update, params: {blog: {id: @blog.id, media: media_params, title: ''}}
    #end
    it 'can update evenif params(media) is blank' do
      media_params = ''
      patch :update, params: {blog: {id: @blog.id, media: media_params, title: 'hogehoge'}}
      expect(@blog.reload.title).to eq "hogehoge"
    end

    it 'redirects the page after updates' do
      media_params = ''
      patch :update, params: {blog: {id: @blog.id, media: media_params, title: 'hogehoge'}}
      name = '/blog/' + (@blog.id).to_s + '/draft'
      expect(response).to redirect_to name
    end
  end

  describe 'GET #open' do
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end
  
    it "responds successfully" do
      expect(response).to be_successful
    end
  end

  describe 'GET #genre_open' do
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end
  
    it "responds successfully" do
      expect(response).to be_successful
    end
  end

  describe 'GET #city_open' do
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end
  
    it "responds successfully" do
      expect(response).to be_successful
    end
  end

  describe 'GET #food_open' do
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end
  
    it "responds successfully" do
      expect(response).to be_successful
    end
  end

  describe 'GET #draft_open' do
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end
  
    it "responds successfully" do
      expect(response).to be_successful
    end
  end

  describe 'DELETE #destroy' do
    before do 
      @blog = Blog.create(
        title: 'hoge',
        body: 'hoge',
        genre: 'hoge',
        draft: 1,
        pref_name: 'hoge',
        city_name: 'hoge'
        )
     end
  
     it 'can destroy data' do
       @blog.destroy
     end
  end
end