class SaveTemporaryUser
  include Interactor


  def call
    context.user.attributes = context.params
    # NOTE: just authorize temporary user for DEMO purposes
    unless context.user.persisted?
      password = Devise.friendly_token.first(6)
      context.user.password = password
      context.user.password_confirmation = password
    end
    context.user.save
  end

end
