class QuestionsController < ApplicationController
  before_action :authenticate_user!

  helper_method :collection, :resource
end