module V1
  class MembersController < ApplicationController
    before_action :authenticate_user!

    def index
      if !user_signed_in?
        render json: { status: :bad_status, data: "アクセスが拒否されました" }
      else
        render json: { status: :ok, data: Member.all }
      end
    end

    def member_prams
      # code here
      params.require(:member).permit(:, :)
    end

    def create
      member = Member.new(member_prams)
      if(member.save)
        render json: { status: :ok, data: "正常に終了しました" }
      else
        render json: { status: :ok, data: member.errors }
      end
    end
  end
end


