require 'spec_helper'

describe 'GET /customization.css' do
  it 'should render based on a given height' do
    visit customization_path(:format => 'css', :height => '400' )

    page.text.should include("height: 40em")
  end

  it 'should render based on a given width' do
    visit customization_path(:format => 'css', :width => '400')

    page.text.should include("width: 40em")
  end
end
