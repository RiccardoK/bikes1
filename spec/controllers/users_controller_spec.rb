require 'rails_helper'

describe UsersController, type: :controller do

  before do
   # @user1 = User.create!(first_name: "Jack", last_name: "Black", email: "jackblack@gmail.com", password: "123456", admin: false)
   # @user2 = User.create!(first_name: "Maggi", last_name: "Magenta", email: "magmag@gmail.com", password: "567891", admin: true)
   @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)

  end

  describe 'GET #show' do

    context 'User is logged in' do
      before do
        sign_in @user1
      end
      
      it 'loads correct user details' do
        get :show, params: { id: @user1.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user1
      end

      it 'other users profile restricted' do
        get :show, params: { id: @user2.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
      
    end

     context 'No user is logged in' do
       it 'redirects to login' do
         get :show, params: { id: @user2.id }
         expect(response).to redirect_to(new_user_session_path)
       end
     end

  end

end