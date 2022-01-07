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
    start_date = permited_params[:start_date].to_datetime
    end_date = permited_params[:end_date].to_datetime

    dates = (start_date..end_date).to_a

    itens = dates.map do |date|
      Item.new(
        {
          title: permited_params[:title],
          description: permited_params[:description],
          value: permited_params[:value],
          kind: permited_params[:kind],
          checked: permited_params[:checked],
          date: date
        }
      ).tap { |item| puts "Something wrong with item: #{item.title} -- #{item.date} \n" unless item.save }
    end

    render json: itens
  end

  def check
    item = Item.update(permited_params[:id], checked: permited_params[:checked])

    render json: item
  end

  private

  def permited_params
    params.permit(:id, :title, :description, :value, :kind, :date, :checked, :assigned, :start_date, :end_date)
  end
end
