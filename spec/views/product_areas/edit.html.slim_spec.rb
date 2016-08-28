require 'rails_helper'

RSpec.describe "product_areas/edit", type: :view do
  before(:each) do
    @product_area = assign(:product_area, ProductArea.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit product_area form" do
    render

    assert_select "form[action=?][method=?]", product_area_path(@product_area), "post" do

      assert_select "input#product_area_name[name=?]", "product_area[name]"
    end
  end
end
