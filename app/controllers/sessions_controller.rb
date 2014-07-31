class SessionsController < ApplicationController

  def new
  end

  def create
    @usuario = Usuario.find_by(email: params[:session][:email].downcase)
    if @usuario && @usuario.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in @usuario
      redirect_to @usuario
    else
    # Create an error message and re-render the signin form.
      flash[:error] = 'Combinacion de Email/Password Invalido'# Not quite right!
      redirect_to session_error_path
    end
  end

  def destroy
    sign_out
    redirect_to static_url
  end

  def signin
  end

  def signin_error
  end
end
