module V1
  class EventsController < ApplicationController
    before_action :authenticate_user!
    def create
      event = Event.new(event_params)
      if event.save
        render json: { status: :ok, data: event }
      else
        render json: { status: :ok,message:"登録に失敗しました" data: event.errors }
      end
    end

    def new
    end

    def index
      render json: { status: :ok, data: Event.all }
    end

    def show
      render json: { status: :ok, data: Event.find(params[:id]) }
    end

    def edit
    end

    def update
      event = Event.find(params[:id])
      if event.update(event_params)
        render json:{ status: :accepted,data:event }
      else
        render json:{ status: :accepted,message:"データ更新失敗",data:event.errors }
      end

    end

    def destroy
      if event=Event.destroy(params[:id])
        render json: { status: :accepted, data: Event.find(params[:id]) }
      else
        render json: { status: :not_acceptable, data: event.errors }
      end
    end

    def invite
      event = Event.find(params[:event_id])
      invite_members = Member.where(invite_params)
      event.members << invite_members
      render json: { status: :not_acceptable, data: event }
    end

    def cancel_invite
      event = Event.find(params[:event_id])
      event.members.delete(params[:member_ids])
    end

    private
    def event_params
      params.require(:event).permit(:id,:name,:location,:note,:owner,:start,:end)
    end

    def invite_params
      params.require(:member).require({member_ids: []})
    end


  end
end
