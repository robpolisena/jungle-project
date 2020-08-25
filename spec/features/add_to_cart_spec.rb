require 'rails_helper'

RSpec.feature "Visitor clicks on the Add to cart for a product on home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "see top nav bar change My Cart from 0 to 1" do
    # ACT
    visit root_path

    # VERIFY
    expect(page).to have_text("My Cart (0)")
    
    # DEBUG
    save_screenshot('add_cart_before.png')
    
    # ACT
    find_button('Add', match: :first).click
   
    # DEBUG
    save_screenshot('add_cart_after.png')
    
    # VERIFY
    expect(page).to have_text("My Cart (1)")
  end
end