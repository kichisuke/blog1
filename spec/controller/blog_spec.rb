require 'rails_helper'
require 'spec_helper'

RSpec.describe BlogController, type: :controller do
  describe 'GET #index' do
    before do 
     get :index
     @blog = Blog.new
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it "responds successfully" do
      expect(response).to be_successful
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
end