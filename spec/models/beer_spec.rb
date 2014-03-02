require 'spec_helper'

describe Beer do
  it "is valid with a brewer, name, style and url" do
    beer = Beer.new(
      brewer: 'Broadhead',
      name: 'Dark Horse',
      style: 'Stout',
      url: 'www.broadhead.com')
    expect(beer).to be_valid
  end
  
  it "is invalid without a brewer" do
    beer = Beer.new(brewer: nil)
    expect(beer).to have(1).errors_on(:brewer)
  end
  
  it "is invalid without a name" do
    beer = Beer.new(name: nil)
    expect(beer).to have(1).errors_on(:name)
  end
  
  it "is invalid without a style" do
    beer = Beer.new(style: nil)
    expect(beer).to have(1).errors_on(:style)
  end
  
  it "is valid without a url" do
    beer = Beer.new(
      brewer: 'Broadhead',
      name: 'Dark Horse',
      style: 'Stout',
      url: nil)
    expect(beer).to be_valid
  end
  
end