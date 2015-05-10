class MiscellaneousController < ApplicationController
  def home
    @onomatopes = Onomatope.all
  end
end
