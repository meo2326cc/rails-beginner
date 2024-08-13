require "rails_helper"

RSpec.describe "Model", type: :model do

  let(:task) { build(:empty_task) }

  context "when inputs is empty" do
    it { expect( task.valid? ).to be false } 
    end
  end
