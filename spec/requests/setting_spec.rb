require 'spec_helper'

describe 'GET /settings.json' do
  it 'should render correctly formatted json' do
    visit settings_path(:format => 'json')

    json = JSON.parse(page.text)
    json.should_not be_nil
  end

  it 'should render with all the right keys' do
    visit settings_path(:format => 'json')

    json = JSON.parse(page.text)

    json_field_keys = json['config_options'].map {|option| option["key"].to_sym}

    field_keys_custom = Customization.validators.inject([]) {|result, value| result << value.attributes[0] unless result.include?(value.attributes[0]); result}
    field_keys_app = App.validators.inject([]) {|result, value| result << value.attributes[0] unless result.include?(value.attributes[0]); result}
    field_keys = field_keys_app + field_keys_custom
    field_keys -= [:spot, :app, :preview, :height, :width]

    field_keys.sort.should == json_field_keys.sort
  end

  it 'should have only valid values for field_type' do 
    visit settings_path(:format => 'json')

    json = JSON.parse(page.text)
    json['config_options'].each do |option|
      ['Drop-down', 'String', 'Color', 'Boolean'].should include(option['field_type'])
    end
  end

  it 'should have all required fields be validated as required' do 
    visit settings_path(:format => 'json')

    json = JSON.parse(page.text)
    json_required_fields = json['config_options'].select { |option| option['required'] == "true" }

    validators = App.validators + Customization.validators
    presence_validators = validators.select { |v| v.class == ActiveModel::Validations::PresenceValidator and not [:spot, :app, :preview, :height, :width].include?(v.attributes[0])}

    presence_validators.each do |validator|
      required_option = json_required_fields.find {|option| option['key'].to_sym == validator.attributes[0]}
      required_option.should_not be_nil
    end

    json_required_fields.count.should == presence_validators.count
  end

  it 'should for all fields of type Drop-down have the correct possible values' do
    visit settings_path(:format => 'json')

    json = JSON.parse(page.text)

    json_drop_down_options = json['config_options'].select { |option| option['field_type'] == 'Drop-down' }

    inclusion_validators_app = App.validators.select { |validator| validator.class == ActiveModel::Validations::InclusionValidator }
    inclusion_validators_custom = Customization.validators.select { |validator| validator.class == ActiveModel::Validations::InclusionValidator }

    inclusion_validators = inclusion_validators_app + inclusion_validators_custom

    json_drop_down_options.each do |option|
      inclusion_validator = inclusion_validators.find { |validator| validator.attributes[0] == option['key'].to_sym }
      inclusion_validator.options[:in].sort.each do |valid_value|
        option['possible_values'].should include(valid_value)
      end

      inclusion_validator.options[:in].count.should == option['possible_values'].count
    end
  end
end

