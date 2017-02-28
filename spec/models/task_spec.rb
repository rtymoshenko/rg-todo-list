require 'rails_helper'

RSpec.describe Task, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "validation" do
    it { should validate_presence_of :name }
  end
  describe "association" do
    it { should belong_to :project }
  end
end
