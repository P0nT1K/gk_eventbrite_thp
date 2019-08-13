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
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @admin = attendance.event_id.administrator_id
      @participant = attendance.participant_id
      @participant_find = User.find(@participant).first_name
      @event = attendance.event_id
    
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @admin.email, subject: "Un nouveau participant a rejoint votre évenement #{@event.title} !") 
    end
end



