require 'rails_helper'

RSpec.describe Post, type: :model do
  ### Associations
  it { is_expected.to belong_to(:user) }

  ### Validations
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_length_of(:content).is_at_most(140)}
end
