class ItemController < ApplicationController
  def index
    itens = Item.all

    render json: itens
  end

  def create
    item_params = permited_params

    item = Item.new(item_params)
    item.save

    render json: item
  end

  def bulk_create
    binding.pry
    
    start_date = permited_params[:start_date].to_datetime
    end_date = permited_params[:end_date].to_datetime

    dates = (start_date..end_date).to_a

    itens = dates.each_with_object([]) do |date, memo|
      memo[:title] = permited_params[:title]
      memo[:description] = permited_params[:description]
      memo[:value] = permited_params[:value]
      memo[:kind] = permited_params[:kind]
      memo[:checked] = permited_params[:checked]
      memo[:date] = date

      memo.append()
    end


  end

  private

  def permited_params
    params.permit(:title, :description, :value, :kind, :date, :checked, :assigned, :start_date, :end_date)
  end
end
