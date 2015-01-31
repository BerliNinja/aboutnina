class PagesController < ApplicationController

before_action :authenticate_user!

def show
  render params[:id]
end

end