class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all

    @list_of_venues=matching_venues.order({:created_at => :desc})

    render "venues/index"
  end

  def show
    venue_id = params.fetch("path_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.first


  
    if @the_venue.nil?
      redirect_to venues_path, alert: "Venue not found."
      return
    end
    render "venues/show"
  end

  def create
    venue = Venue.new
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save

    redirect_to("/venues/#{venue.id}")
  end
  
  def update
    the_id = params.fetch("path_id")
    @venue = Venue.find_by(id: the_id)
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
  
    if @venue.save
      redirect_to("/venues/#{@venue.id}", { notice: "Venue updated successfully." })
    else
      redirect_to("/venues/#{@venue.id}", { alert: "Venue failed to update successfully." })
    end
  end
  
  
  
  


  

  
  def delete
    the_id = params.fetch("path_id")
    venue = Venue.find_by({ :id => the_id })
    venue.destroy

    redirect_to("/venues")
  
  
  end
end
