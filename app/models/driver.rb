class Driver < ApplicationRecord
    has_many :check_ins #, dependent: :destroy
    require 'date'
    require 'check_in.rb' #use check_in class

    def check_in(hours)
        date = Date.today
        checkIn = CheckIn.new(:date => date, :hours => hours, :driver_id => self.id) 
        checkIn.save

        return true
    end

    def findCheckinsOfLastWeek
        today = Date.today
        lastWeekCheckins = []
        checkins = self.check_ins

        checkins.each do |checkin| 
            if checkin.date < today-7      #it returns the array when it reachs a week before
                return lastWeekCheckins
            end
            lastWeekCheckins.append(checkin)
        end 
    end

    def calculateWorkedHoursOfLastWeek
        totalHours = 0
        checkins = findCheckinsOfLastWeek

        checkins.each do |checkin|
            totalHours += checkin.hours
        end   

        return totalHours
    end



end
