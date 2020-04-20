# frozen_string_literal: true

# Static pages controllers
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include SessionsHelper
  include EventsHelper

  def home; end

  def help; end

  def login; end

  def signup; end
end
