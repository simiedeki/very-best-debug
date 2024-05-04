class UsersController < ApplicationController
  def index
    matching_users=User.all
    @list_of_users = matching_users.order({:username => :asc})
    render "users/index"
  end
  def show
    url_username = params.fetch("username")

    matching_usernames = User.where({ :username => url_username })
    @the_user = matching_usernames.first
    if @the_user.nil?
      redirect_to users_path, alert: "User not found."
      return
    end
      
    render({ :template => "users/show" })
  end
  def create
    a = User.new
    a.username = params.fetch("input_username")
    a.save

    redirect_to "/users/#{a.username}"
  end
  def update
    the_id = params.fetch("path_id")
    @the_user = User.where({ :id => the_id }).at(0)

    @the_user.username = params.fetch("query_username")


    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", { :notice => "user updated successfully."} )
    else
      redirect_to("/users/#{@the_user.id}", { :alert => "user failed to update successfully." })
    end
  end
   
  
    


  

  
   
end
