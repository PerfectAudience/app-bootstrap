class Customization
  include ActiveModel::Serialization
  include ActiveModel::Validations
  include Regex

  ### Keys
  attr_accessor :attributes

  ### Validations
  validates :height,
            numericality: { only_integer: true }
  validates :width,
            numericality: { only_integer: true }

  ### Instance Methods
  def initialize(attributes={})
    defaults = {
      height: '250',
      width: '300'
    }

    valid_keys = defaults.keys
    relevant_attributes = attributes.slice(*valid_keys)
    relevant_attributes.reverse_merge!(defaults)

    @attributes = relevant_attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def to_query_string
    attributes.to_param
  end
end
