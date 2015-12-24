require 'rails_helper'
describe Product do
        before do
				@product = Product.create!(:name => "shoe" , :description => "Shoe")
				@user = User.create
            @product.comments.create!(:rating => 1, :user => @user, :body => "Horrible Services")
			@product.comments.create!(:rating => 3, :user => @user, :body => "Mediocre")
			@product.comments.create!(:rating => 5, :user => @user, :body => "Amazing Services")

		end

 it "returns the average rating of all the comments" do
 	expect(@product.average_rating).to eq 3

 end
end


context "product with no name" do
	
	before do
	       @product = Product.create(:name => nil , :description => "Shoe")
    end
	
    it "Fail validation without name" do
        expect(@product).not_to be_valid
    end
end
