describe UsersController do
  describe 'user access' do
    let!(:user) { create(:user) }
    before :each do
      session[:user_id] = user.id
    end

    describe 'GET#index' do
      it 'collects users into users' do
        user2 = create(:user)
        get :index
        expect(assigns(:users)).to match_array [user,user2]
      end

      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET#new ' do
      it 'denies access'do
        get :new
        expect(response).to redirect_to root_url
      end
    end

    describe 'POST#create ' do
      it 'denies access'do
        get :create, user: attributes_for(:user)
        expect(response).to redirect_to root_url
      end
    end
  end
end
