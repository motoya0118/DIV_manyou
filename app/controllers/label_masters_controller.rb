class LabelMastersController < ApplicationController

    def index
        @labels = current_user.label_masters
        @label = current_user.label_masters.build
    end

    def new
        @label = LabelMaster.new
    end

    def create
        @label = current_user.label_masters.build(label_params)
        if @label.save
            redirect_to label_masters_path, notice: 'ラベルを追加しました'
        else
            @labels = current_user.label_masters
            render :index
        end
    end

    def edit
        @label = LabelMaster.find(params[:id])
    end

    def update
        @label = LabelMaster.find(params[:id])
        if @label.update
            redirect_to label_masters_path, notice: 'ラベルを編集しました'
        else
            render :index
        end
    end

    def destroy
        @label = LabelMaster.find(params[:id])
        @label.destroy
        redirect_to label_masters_path, notice: 'ラベルを削除しました'
    end
    private
    def label_params
        params.require(:label_master).permit(:user_id,:name)
    end

end