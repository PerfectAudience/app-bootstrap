module LoadFixture
  def load_fixture(file)
    File.new(File.join(app.root, 'spec/fixtures', file)).read
  end

  def compare_html(expected_html, page_html)
    expected_lines = expected_html.split("\n").map(&:strip).reject { |line| line.blank? }
    test_lines = page_html.split("\n").map(&:strip).reject { |line| line.blank? }

    expected_lines.each_with_index do |expected_line, index|
      test_lines[index].should == expected_line
    end
  end
end
