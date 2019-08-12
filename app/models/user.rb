class User < ApplicationRecord
    after_create :welcome_send
    has_many :attendances
    #un user à plusieurs inscriptions(attendences)
    has_many :events, through: :attendances
    #participe à plusieurs EVT via les inscriptions
    has_many :event_admin, foreign_key: 'administrator_id', class_name: 'Event'
    #event_admin correspond à une méthode qui permet de recuperer l'index de l'administrator
    #l'adiminstrator_id corespond au User_id
    #User.find(2).event_admin permet d'afficher la liste de tous les events crées par le User(2)
    

    def welcome_send
        UserMailer.welcome_email(self).deliver_now
    end

    
end
