class WelcomeController < ApplicationController
  def show
    render :text => "検索商品名 = #{params[:item]}"
  end
end
