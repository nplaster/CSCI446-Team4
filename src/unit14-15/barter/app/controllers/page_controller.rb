class PageController < ApplicationController
  before_filter :require_login, :only => :account
  def index
  end
  def account
    
  end
end
