require 'rails_helper'

RSpec.describe "product_areas/show", type: :view do
  before(:each) do
    @product_area = assign(:product_area, ProductArea.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
