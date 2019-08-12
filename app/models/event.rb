class Event < ApplicationRecord
    validates :start_date, presence: true, if: :is_past?

    validates :duration, presence: true,  numericality: {only_integer: true, message: "Muste be an integer", minimum: 0}, if: :is_modulo5?
    # le nombre de minutes doit être un multiple de 5, et est strictement positif

    validates :title, 
    presence: true,
    length: { in: 5..140 }
    #doit faire au moins 5 caractères et maxi 140 caractères.

    validates :description, 
    presence: true,
    length: { in: 20..1000 }
    #doit faire entre 20 et 1000 caractères.
   
    validates :price, 
    presence: true,
    numericality: {only_integer: true, message: "Muste be an integer", in: 1..1000}
    #doit être compris entre 1 et 1000.

    validates :location, presence: true


    belongs_to :administrator, class_name: "User" 
    #appartiens à un User qui est administrateur
    has_many :attendances
    #un event à pluieurs inscription(attendences)
    has_many :users, through: :attendances
    #un event à plusieurs participants(user) via les insecriptions(attenances)

    def is_past?
        start_date >= Date.today
    end

    def is_modulo5?
        (duration/5).class == Integer     
    end
end


