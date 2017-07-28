class HogesController < ApplicationController
  def start
    # scraping 開始
    # task実行 -> backprocessで sidekiq, sucker_punch
    # heroku run rake .....
    redirect_to aaa_url
  end

  def fetch
    # scrapingが終わったか？
    post = Post.find_by(params[:id])
    if post.completed?
      @yes_complete = true
    end
  end
end
