class PaymentsController < ApplicationController
  before_action :authenticate_user!
  expose(:payments)
  def index; end
end
