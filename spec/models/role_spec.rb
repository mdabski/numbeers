require 'spec_helper'

describe Role do
  it "does not allow duplicate names" do
    roleA = Role.create(name:"user")
    roleB = Role.new(name:"user")
    expect(roleB).to have(1).errors_on(:name)
  end
end
