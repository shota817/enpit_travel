require 'rakuten_web_service'

class WelcomeController < ApplicationController
  def index
    @items
  end
  def test
    render :text => "検索商品名 = #{params[:item]}"
  end
  def show
    RakutenWebService.configuration do |c|
      c.application_id = ENV["APPID"]
      c.affiliate_id = ENV["AFID"]
    end
    keyword = params[:item]
    @items = RakutenWebService::Ichiba::Item.search(:keyword => keyword, :hits => 10, :sort => '-itemPrice') # This returns Enamerable object
    render :action => 'item_result.erb'
  end
end
