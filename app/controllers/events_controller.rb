class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
        @end_date = @event.start_date + (@event.duration * 60)
        @admin = is_admin? #j'apelle la methode is admin? qui verifie si le current user est l'admin de l'event
        @already_attend = already_attend? #j'appelle la méthode is attended qui verifie si le user est déjà inscris

    end
    

    def new
        @events = Event.new
    end

    def create
        @events = Event.new(title: params[:title], description: params[:description], start_date: params[:start_date], duration: params[:duration], price: params[:price], location: params[:location], administrator: current_user)
        
        if @events.save
            flash[:success] = "Event successfully edited"
            redirect_to root_path
          else
            render 'new'
        end
    end

    def edit
    
    end

    def update
    
    end

    def destroy
    
    end
private

  def is_admin?
    @event.administrator == current_user ? true : false
  end

  def already_attend?
    @event.participants.include?(current_user) ? true : false
  end 



end
