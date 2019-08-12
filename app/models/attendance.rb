class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event

    #after_create :attendance_send

    #def Attendance_send
        #UserMailer.attendance_admin(self).deliver_now
    #end
end
