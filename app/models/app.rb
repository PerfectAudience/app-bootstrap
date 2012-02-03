class App
  include ActiveModel::Serialization
  include ActiveModel::Validations
  include Regex

  ### Keys
  attr_accessor :attributes

  ### Validations
  validates :spot, presence: true, unless: :preview?
  validates :app, presence: true, unless: :preview?
  validates :destination_url, format: { with: URL_REGEX, message: 'must be a valid URL (including protocol)' }, unless: :preview?
  validates :source, presence: true
  validates :preview, inclusion: { in: %w(true false), message: 'must be true or false' }

  ### Instance Methods
  def initialize(attributes={})
    defaults = {
      spot: nil,
      app: nil,
      destination_url: nil,
      source: nil,
      preview: 'true'
    }

    valid_keys = defaults.keys
    relevant_attributes = attributes.slice(*valid_keys)
    relevant_attributes.reverse_merge!(defaults)

    @attributes = relevant_attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  private

  def preview?
    attributes[:preview] == 'true'
  end
end
