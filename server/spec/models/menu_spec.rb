require 'rails_helper'

describe Menu do
  let(:menu) { Menu.new( restaurant_name: "Pete's Pizza" ) }

  describe "Menu attributes" do
  	it 'restaurant_name are present' do
  		expect(menu.restaurant_name).to eq "Pete's Pizza"
  	end

	  it { should have_attached_file(:image) }
	  it { should validate_attachment_presence(:image) }
	  it { should validate_attachment_content_type(:image).
	                allowing("image/jpeg", "image/gif", "image/png").
	                rejecting('text/plain', 'text/xml') }
	  it { should validate_attachment_size(:image).
	                less_than(10.megabytes) }
  end
end



  # describe "#throw_for_computer" do
  #   context "when the game already has a computer throw" do
  #     it "returns the computer throw" do
  #       game.computer_throw = "paper"
  #       expect(game.throw_for_computer).to eq "paper"
  #     end
  #   end
  # end