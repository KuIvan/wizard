class WizardController < ApplicationController
  include Wicked::Wizard

  steps :profile, :work_experience, :interests, :thank_you

  layout 'wizard'

  before_action :define_user, only: [:show, :update]

  def show
    case step
    when :profile
      load_profile_collections
    when :work_experience
      load_work_exp_collections
      @work_experience = @user.work_experiences.build
    when :interests
      load_interests_collections
    else
    end
    render_wizard
  end

  def update
    case step
    when :profile
      load_profile_collections
      @user.attributes = user_params
      # NOTE: just authorize temporary user for DEMO purposes
      unless @user.persisted?
        password = Devise.friendly_token.first(6)
        @user.password = password
        @user.password_confirmation = password
      end
      @user.save
      bypass_sign_in(@user) # needed for devise
    when :work_experience
      load_work_exp_collections
      @work_experience = @user.work_experiences.create(work_experience_params)
    when :interests
      load_interests_collections
      @user.update(interests_params)
    end
    render_wizard @user
  end

  private

  def define_user
    @user = current_user || User.new
  end

  def load_profile_collections
    @languages = Language.order(name: :asc)
    @countries = Country.order(name: :asc)
  end

  def load_work_exp_collections
    @countries = Country.order(name: :asc)
  end

  def load_interests_collections
    @interests = Interest.order(name: :asc)
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :address, :language_id, :country_id, :gender)
  end

  def work_experience_params
    params.require(:work_experience).permit(:start_at, :end_at, :active, :organization_name, :country_id)
  end

  def interests_params
    params.require(:user).permit(:interest_ids)
  end

end
