require 'rails_helper'

RSpec.describe "product_areas/index", type: :view do
  before(:each) do
    assign(:product_areas, [
      ProductArea.create!(
        :name => "Name"
      ),
      ProductArea.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of product_areas" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
