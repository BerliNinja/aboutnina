require 'spec_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET index" do
    context "not authenticated client and organization" do
      it "redirect to sessions new" do
        get :index
        expect(response).to redirect_to new_sessions_path
      end

      it "redirects to sessions new" do
        get :show, id: 'foobarbaz'
        expect(response).to redirect_to new_sessions_path
      end
    end

    context "authenticated client and organization" do
      before(:each) do
        stub_organization_and_client!
      end

      describe 'GET show' do
        it 'renders the show template' do
          get :show, id: client.user.login
          expect(response).to render_template 'show'
        end
      end

      describe 'GET index' do
        it "assigns @users" do
          client
          stub_client!
          get :index
          expect(assigns(:users)).not_to be_nil
        end

        it "renders the index template" do
          get :index
          expect(response).to render_template("index")
        end
      end
    end
  end

  describe "GET rebuild" do
    before(:each) do
      stub_organization_and_client!
      allow(client).to receive(:organization_members).and_return(
        []
      )
    end

    it "renders the index template" do
      get :rebuild
      expect(response).to redirect_to(users_path)
    end
  end

end