class WorkExperiencesController < ApplicationController

  def destroy
    WorkExperience.find_by({id: params[:id]})&.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def delete_work_experiences_params
    params.permit(:id)
  end

end
