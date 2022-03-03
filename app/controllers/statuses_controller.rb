module V1
  class StatusesController < ApplicationController
    def create
      status = Status.new(status_params)
      if status.save
        render json: { status: :accepted, data: status }
      else
        render json: { status: :not_accepted, data: status.errors }
      end
    end

    def destroy
      status = Status.find(status_params)
      if status.destroy
        render json: { status: :accepted, data: status }
      else
        render json: { status: :not_accepted, data: status.errors }
      end
    end

    def index
      render json:{ status: :ok,data: Status.all }
    end

    def show
      status = Status.find(status_params)
      render json:{ status: :ok,data: status }
    end


    private
    def status_params
      params.require(:status).permit(:id,:name)
    end
  end
end
