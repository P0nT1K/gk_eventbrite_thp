class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
        

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
end
