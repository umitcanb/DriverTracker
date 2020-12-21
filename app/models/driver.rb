class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
    has_many :check_ins #, dependent: :destroy

    def findCheckinsOfLastWeek
        today = Date.today
        lastWeekCheckins = []

        self.check_ins.each do |checkin| 
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
