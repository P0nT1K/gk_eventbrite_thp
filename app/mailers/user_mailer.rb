class UserMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'
   
    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://monsite.fr/login' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end

    def attendance_admin(attendance)
      @event_id= attendance.event_id #id de l'event ressort un integer
      @title = Event.find(@event_id).title #ressort e titre de l'event en cherchant avec l'id
      @admin_id = Event.find(@event_id).administrator_id #id de l'admin ressort un integer
      @admin_email = User.find(@admin_id).email #ressort l'email de l'admin en cherchant avec l'id
      @admin_first_name = User.find(@admin_id).first_name #ressort le nom de l'admin en cherchant avec l'id
      @participant = attendance.participant_id #ressort l'id du participant
      @participant_find = User.find(@participant).first_name #ressort le nom du participant en utilisant l'id

      mail(to: @admin_email, subject: "Un nouveau participant a rejoint votre évenement #{@title} !") 
    end
end



