require 'rails_helper'

RSpec.describe Project, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "validation" do
    it { should validate_presence_of :name }
  end
  describe "associations" do
    it { should belong_to :user }
    it { should have_many :tasks }
  end
end
