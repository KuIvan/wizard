class WizardController < ApplicationController
  include Wicked::Wizard

  steps :profile, :parents, :experience

  def show
    @user = User.new
    case step
    when :profile
    when :parents
    when :experience
      # @friends = @user.find_friends
    else
    end
    render_wizard
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :address)
  end

end
