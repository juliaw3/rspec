require 'rails_helper'

describe PostsController do 
	describe 'POST #create' do
		context 'with valid attributes' do
			it 'creates the post' do
				post :create, cehicles: attributes_for(:posts)
				expect(Post.count).to eq(1)
			end

			it 'redirects to the "show" action for the post' do
				post :create, posts:attributes_for(:posts)
				expect(response).to redirect_to Vehicle.first
			end
		end

		context 'with invalid attributes' do
			it 'does not create the post' do
				post :create, posts: attributes_for(:posts, published: false)
				expect(VPost.count).to eq(0)
			end

			it 're-renders the "new" view' do
				post :create, posts: attributes_for(:posts, published: false)
				expect(response).to render_template :new
			end
		end
	end
end