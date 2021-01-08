class SearchController < ApplicationController
  def index
    poems = PoemFacade.authors_poems(params[:author])
    @results = ToneFacade.analyze(poems)
  end
end
