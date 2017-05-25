class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif  self.user.tickets < self.attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
      return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
       current_ticket_count = self.user.tickets - self.attraction.tickets
       current_happiness_count = self.user.happiness + self.attraction.happiness_rating
       current_nausea_count = self.user.nausea + self.attraction.nausea_rating

       self.user.update(tickets: current_ticket_count, happiness: current_happiness_count, nausea: current_nausea_count)
       return false
    end
  end
end
