require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it "is invalid without a title" do 
    ticket = Ticket.new(title:nil)
    ticket.valid?
    expect(ticket.errors[:title]).to include("can't be blank")
  end
  it "is invalid without a state" do 
    ticket = Ticket.new(state:nil)
    ticket.valid?
    expect(ticket.errors[:state]).to include("can't be blank")
  end
  it "is invalid without a priority" do
    ticket = Ticket.new(priority:nil)
    ticket.valid?
    expect(ticket.errors[:priority]).to include("can't be blank")
  end
  it "is invalid without a category" do 
    ticket = Ticket.new(category:nil)
    ticket.valid?
    expect(ticket.errors[:category]).to include("can't be blank")
  end
  it "is invalid without a owner" do
    ticket = Ticket.new
    ticket.valid?
    expect(ticket.errors[:user]).to include("can't be blank")
  end
end
