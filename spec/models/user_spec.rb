require 'spec_helper'

describe User do
  it 'does not allow users without names' do
    user = build(:user, name: nil)

    expect(user).to_not be_valid
  end

  it 'has invoices' do
    user = create(:user)

    create_list(:invoice, 3, agenda: user.agenda)

    expect(user.invoices.size).to eq(3)
  end
end
