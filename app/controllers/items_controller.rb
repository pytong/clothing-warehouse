class ItemsController < ApplicationController

  def index
    @clearance_batch  = ClearanceBatch.find(params[:clearance_batch_id])
    @items = @clearance_batch.items
  end

  def search
    status = params[:status]
    @items = Item.find_by_status(status)
  end

end
