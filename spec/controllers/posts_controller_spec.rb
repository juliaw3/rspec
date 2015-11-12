require 'rails_helper'

describe PostsController do 
	describe 'POST #create' do
		context 'with valid attributes' do
			it 'creates the post' do
				post :create, post: attributes_for(:post)
				expect(Post.count).to eq(1)
			end

			it 'redirects to the "show" action for the post' do
				post :create, post:attributes_for(:post)
				expect(response).to redirect_to Post.first
			end
		end

		context 'with invalid attributes' do
			it 'does not create the post' do
				post :create, post: attributes_for(:post, published: false)
				expect(Post.count).to eq(1)
			end

			it 're-renders the "new" view' do
				post :create, post: attributes_for(:post, published: false)
				get :new
				expect(response).to render_template :new

			end
		end
	end
end