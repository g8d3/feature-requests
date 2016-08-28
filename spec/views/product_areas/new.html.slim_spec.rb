require 'rails_helper'

RSpec.describe "product_areas/new", type: :view do
  before(:each) do
    assign(:product_area, ProductArea.new(
      :name => "MyString"
    ))
  end

  it "renders new product_area form" do
    render

    assert_select "form[action=?][method=?]", product_areas_path, "post" do

      assert_select "input#product_area_name[name=?]", "product_area[name]"
    end
  end
end
