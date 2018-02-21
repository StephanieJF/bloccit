require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsoredpost) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99) }

  describe "GET show" do
    it "returns http success" do
      get :show, params: { topic_id: my_topic.id, id: my_sponsoredpost.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { topic_id: my_topic.id, id: my_sponsoredpost.id }
      expect(response).to render_template :show
    end

    it "assigns my_sponsoredpost to @sponsoredpost" do
      get :show, params: { topic_id: my_topic.id, id: my_sponsoredpost.id }
      expect(assigns(:sponsoredpost)).to eq(my_sponsoredpost)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to render_template :new
    end

    it "initializes @sponsoredpost" do
      get :new, params: { topic_id: my_topic.id }
      expect(assigns(:sponsoredpost)).not_to be_nil
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: { topic_id: my_topic.id, id: my_sponsoredpost.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: { topic_id: my_topic.id, id: my_sponsoredpost.id }
      expect(response).to render_template :edit
    end

    it "assigns sponsoredpost to be updated to @sponsoredpost" do
      get :edit, params: { topic_id: my_topic.id, id: my_sponsoredpost.id }
      sponsored_post_instance = assigns(:sponsoredpost)

      expect(sponsored_post_instance.id).to eq my_sponsoredpost.id
      expect(sponsored_post_instance.title).to eq my_sponsoredpost.title
      expect(sponsored_post_instance.body).to eq my_sponsoredpost.body
      expect(sponsored_post_instance.price).to eq my_sponsoredpost.price
    end
  end
end
