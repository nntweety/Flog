class HomesController < ApplicationController

  require 'themoviedb-api'
  Tmdb::Api.key("de02a1639be95fbfec0058fd054d9de5")
  Tmdb::Api.language("ja")

  def top
      @keywords = params[:looking_for]

    if @keywords.present?

      @search = Tmdb::Search.movie(@keywords)
      # 変換処理
      @conversion = JSON.parse(@search.to_json)
      # view へ 変数を渡す
      @search_results = @conversion["table"]["results"]
      #@sample_search_results = 結果

    end

      render "top"
  end
  def about
  end
end
