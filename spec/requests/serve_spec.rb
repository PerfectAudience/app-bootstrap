require 'spec_helper'

describe 'GET /serve' do
  let(:parameters) { { spot: '1234567890', app: '0987654321', destination_url: 'http://example.com', source: 'image_url', preview: 'false' } }

  it 'renders an app' do
    visit serve_path(parameters)

    expected_html = load_fixture('happy_path.html')
    compare_html(expected_html, page.html)
  end

  it 'renders a list of errors when the required parameters are invalid' do
    invalid_parameters = {
      spot: nil,
      app: nil,
      destination_url: 'x',
      source: nil,
      preview: 'x',
      height: 'x',
      width: 'x'
    }

    visit serve_path(invalid_parameters)

    expected_html = load_fixture('unhappy_path_invalid_parameters.html')
    compare_html(expected_html, page.html)
  end

end
