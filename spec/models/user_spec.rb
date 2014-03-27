require 'spec_helper'

describe User do
  it "is invalid without a role" do
    user = User.new()
    expect(user).to have(1).errors_on(:roles)
  end
  
end
