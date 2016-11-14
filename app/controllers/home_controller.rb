class HomeController < ApplicationController

  def index
    @save_me = "test de sauvetage"
  end

  def search

    @save_me = "belle recherche coco !"

  end
end
