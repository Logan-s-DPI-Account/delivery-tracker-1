class DeiveriesController < ApplicationController
  def index
    matching_deiveries = Deivery.all

    @list_of_deiveries = matching_deiveries.order({ :created_at => :desc })

    render({ :template => "deiveries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_deiveries = Deivery.where({ :id => the_id })

    @the_deivery = matching_deiveries.at(0)

    render({ :template => "deiveries/show.html.erb" })
  end

  def create
    @the_deivery = Deivery.new
    @the_deivery.description = params.fetch("query_description")
    @the_deivery.details = params.fetch("query_details")
    @the_deivery.arrives = params.fetch("query_arrives")
    @the_deivery.recieved = params.fetch("query_recieved", false)
    @the_deivery.user_id = params.fetch("query_user_id")

    if @the_deivery.valid?
      @the_deivery.save
      redirect_to("/deiveries", { :notice => "Added to list" })
    else
      redirect_to("/deiveries", { :alert => the_deivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_deivery = Deivery.where({ :id => the_id }).at(0)

    # the_deivery.description = params.fetch("query_description")
    # the_deivery.details = params.fetch("query_details")
    # the_deivery.arrives = params.fetch("query_arrives")
    the_deivery.recieved = params.fetch("query_recieved", false)
    the_deivery.user_id = params.fetch("query_user_id")

    if the_deivery.valid?
      the_deivery.save
      redirect_to("/deiveries/", { :notice => "Deivery updated successfully."} )
    else
      redirect_to("/deiveries/#{the_deivery.id}", { :alert => the_deivery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_deivery = Deivery.where({ :id => the_id }).at(0)

    the_deivery.destroy

    redirect_to("/deiveries", { :notice => "Deleted."} )
  end
end
