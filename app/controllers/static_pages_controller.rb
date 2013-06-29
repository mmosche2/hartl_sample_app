class StaticPagesController < ApplicationController
  
  def home
  	@title = 'ROR Sample | Home'
  end

  def help
  	@title = 'ROR Sample | Help'
  end

  def about
  	@title = 'ROR Sample | About'
	end

end
