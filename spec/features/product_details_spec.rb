require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do

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

  scenario "see a product's detail page" do
    # ACT
    visit root_path
    find("img[src*='apparel1.jpg']", match: :first).click

    # DEBUG
    save_screenshot('product_detail.png')

    # VERIFY
    expect(page).to have_text("Quantity")
    expect(page).to have_text("10")
    save_screenshot('product_detail.png')
  end
end