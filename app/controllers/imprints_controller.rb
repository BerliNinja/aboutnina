class ImprintsController < ApplicationController

def show
  render params[:id]
end

end