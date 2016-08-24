class TicketLog < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :developer
end
