require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @user = create(:user)
    @user2 = User.create(email: "test@example.com", password: "1234567890")
  end

  describe "GET #show" do
     context "User is logged in" do
     	before do
     		sign_in @user

     end

      it "loads correct user details" do
     	get :show, id: @user.id
     	expect(assigns(:user)).to eq @user
     	expect(repsonse).to have_http_status(200)
     end

     context "first user cannot acess second user page" do
	 it "redirects to index" do
	 get :show, id @user2.id
	 expect(response).to redirect_to(root_path)
	end
     
     context "No user is logged in" do
       it "redirects to login" do
         get :show, id: @user.id
         expect(response).to redirect_to(root_path)

       end
     end
  end

end
