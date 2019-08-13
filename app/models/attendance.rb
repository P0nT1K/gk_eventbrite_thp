class Attendance < ApplicationRecord
   
    belongs_to :participant, class_name: "User"
    belongs_to :event

   
    after_create :attendance_admin

    def attendance_admin
        UserMailer.attendance_admin(self).deliver_now
    end
  
end

