class PagesController < ApplicationController

  def index
    @pages = Page.where(['language = ?', I18n.locale])
  end

end
