require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    roles: Field::HasMany,
    chapter: Field::BelongsTo,
    zone: Field::BelongsTo,
    id: Field::Number,
    email: Field::String,
    password_digest: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    password_reset_token: Field::String,
    password_reset_sent_at: Field::DateTime,
    first_name: Field::String,
    last_name: Field::String,
    gender: Field::String,
    date_of_birth: Field::DateTime,
    residential_address: Field::String,
    phone_no: Field::String,
    additional_phone_no: Field::String,
    email_address: Field::String,
    marital_status: Field::Boolean,
    name_of_spouse: Field::String,
    wedding_anniversary: Field::DateTime,
    date_born_again: Field::DateTime,
    date_joined_christ_embassy: Field::DateTime,
    current_local_church: Field::String,
    water_baptized: Field::Boolean,
    date_water_baptized: Field::DateTime,
    completed_foundation_school: Field::Boolean,
    date_completed_foundation_school: Field::DateTime,
    family: Field::String.with_options(searchable: false),
    previous_membership: Field::String.with_options(searchable: false),
    title: Field::String,
    country: Field::String,
    state: Field::String,
    city: Field::String,
    home_address: Field::String,
    designation: Field::String,
    cell: Field::String,
    current_employment: Field::String.with_options(searchable: false),
    academic_qualifications: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  roles
  chapter
  zone
  id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  roles
  chapter
  zone
  id
  email
  password_digest
  created_at
  updated_at
  password_reset_token
  password_reset_sent_at
  first_name
  last_name
  gender
  date_of_birth
  residential_address
  phone_no
  additional_phone_no
  email_address
  marital_status
  name_of_spouse
  wedding_anniversary
  date_born_again
  date_joined_christ_embassy
  current_local_church
  water_baptized
  date_water_baptized
  completed_foundation_school
  date_completed_foundation_school
  family
  previous_membership
  title
  country
  state
  city
  home_address
  designation
  cell
  current_employment
  academic_qualifications
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  roles
  chapter
  zone
  email
  password_digest
  password_reset_token
  password_reset_sent_at
  first_name
  last_name
  gender
  date_of_birth
  residential_address
  phone_no
  additional_phone_no
  email_address
  marital_status
  name_of_spouse
  wedding_anniversary
  date_born_again
  date_joined_christ_embassy
  current_local_church
  water_baptized
  date_water_baptized
  completed_foundation_school
  date_completed_foundation_school
  family
  previous_membership
  title
  country
  state
  city
  home_address
  designation
  cell
  current_employment
  academic_qualifications
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
