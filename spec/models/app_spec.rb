require 'spec_helper'

describe App do
  include Regex

  let(:attributes) { { spot: '12345', app: '54321', destination_url: 'http://example.com', source: 'image_url' } }
  subject { App.new(attributes) }

  it { subject.class.included_modules.should include(ActiveModel::Serialization) }
  it { subject.class.included_modules.should include(ActiveModel::Validations) }
  it { subject.class.included_modules.should include(Regex) }

  context 'accessors' do
    it { subject.methods.should include(:attributes, :attributes=) }

    it 'only allows legitimate attributes' do
      attributes.merge!(random_ass_attribute: 'test')
      app = App.new(attributes)
      app.attributes[:random_ass_attribute].should be_nil
    end

    it 'assigns attributes on initialize' do
      attributes.merge!(spot: '1234567890')
      app = App.new(attributes)
      app.attributes[:spot].should == '1234567890'
    end

    it 'assigns defaults on initialize' do
      app = App.new

      app.attributes.should == {
        spot: nil,
        app: nil,
        destination_url: nil,
        source: nil,
        preview: 'true'
      }
    end
  end

  context 'validations' do
    it { should validate_presence_of(:spot).unless(:preview?) }
    it { should validate_presence_of(:app).unless(:preview?) }
    it { should validate_presence_of(:source) }

    it { should validate_inclusion_of(:preview).in('true', 'false').message('must be true or false') }

    it { should validate_format_of(:destination_url).with(URL_REGEX).message('must be a valid URL (including protocol)').unless(:preview?) }

    it 'validates attributes' do
      subject.class.validators.should_not == []
      expect do
        subject.valid?
      end.should_not raise_error(NoMethodError)
    end
  end
end
