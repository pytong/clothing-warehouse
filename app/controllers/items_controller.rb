class ItemsController < ApplicationController

  def search
    @search_params = search_params
    @items = Item.where(@search_params)
  end

  private

  def search_params
    search_params = {}

    status = params[:status]
    clearance_batch_id = params[:clearance_batch_id]

    search_params[:status] = status if status
    search_params[:clearance_batch_id] = clearance_batch_id if clearance_batch_id 

    search_params
  end

end
