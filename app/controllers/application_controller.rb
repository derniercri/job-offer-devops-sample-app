class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    render text: "<html><body><div style=\"width: 700px; margin: 0 auto; text-align: center; font-family: helvetica\"><h1>Hello world!</h1> <p>Time is: #{DateTime.now}</p> <img src=\"http://troll.me/images/victory-baby/devops-deploy-all-the-things.jpg\"/></div></body></html>"
  end
end
