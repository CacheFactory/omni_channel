class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  layout 'non_admin_layout'

  def index

  end
end
