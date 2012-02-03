require 'spec_helper'

describe Customization do
  include Regex

  subject { Customization.new }

  it { subject.class.included_modules.should include(ActiveModel::Serialization) }
  it { subject.class.included_modules.should include(ActiveModel::Validations) }
  it { subject.class.included_modules.should include(Regex) }

  context 'accessors' do
    it { subject.methods.should include(:attributes, :attributes=) }

    it 'only allows legitimate attributes' do
      customization = Customization.new({ :random_ass_attribute => 'test' })
      customization.attributes[:random_ass_attribute].should be_nil
    end

    it 'assigns defaults on initialize' do
      customization = Customization.new
      customization.attributes.should == {
        :height => '250',
        :width => '300'
      }
    end
  end

  context 'validations' do
    it { should validate_numericality_of(:height).only_integer }
    it { should validate_numericality_of(:width).only_integer }

    it 'validates attributes' do
      subject.class.validators.should_not == []
      expect do
        subject.valid?
      end.should_not raise_error(NoMethodError)
    end
  end

  context 'instance methods' do
    it "#to_query_string returns a query string version of the model's attributes" do
      Customization.new.to_query_string.should == "height=250&width=300"
    end
  end
end

