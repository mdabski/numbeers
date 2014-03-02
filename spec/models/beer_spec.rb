require 'spec_helper'

describe Beer do
  it "is valid with a brewer, name and style" do
    beer = Beer.new(
      brewer: 'Broadhead',
      name: 'Dark Horse',
      style: 'Stout')
    expect(beer).to be_valid
  end
  
end