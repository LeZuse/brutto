require 'spec_helper'

describe Agenda do
  it "does not allow duplicate names" do
    create(:agenda, name: 'myagenda')
    second_agenda = build(:agenda, name: 'myagenda')

    expect(second_agenda).to_not be_valid
  end
end
