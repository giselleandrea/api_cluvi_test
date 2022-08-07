class Api::V1::LinksController < ApplicationController
  require 'base64'

  # PATCH /all_links
  #visualizar links y contador de visitas o clicks
  def index
    @links = Link.all
    render json: @links
  end

  # POST /create_link
  # Crea url corta desde url completa
  def create
    short_url = Base64.encode64(params[:url])[0..7] 
    link = Link.create(url: params[:url], slug: 'https://'+short_url)
    render json: {message: "Link save #{link.slug}", status: 200}
  end

  # GET /:slug
  # Acceso al link guarda las veces que se hace click desde el link corto
  def show_link
    @link = Link.find_by_slug(params[:slug])

    if !@link.blank?
      click = (@link.clicked + 1)
      @link.clicked = click.to_i
      @link.save!
    
      #render json: {url: @link.url, status: 200}
      external_url = @link.url 
      redirect_to  external_url, allow_other_host: true
    else 
      render json: {message: "errors/404", status: 404}
    end 
  end

  # GET /get/alexa_rank
  # Consumo de api Alexa rank se implementa desde app/services/alexa_services.rb
  def alexa_rank
    @alexa = AlexaServices.alexa_rank
    render json: @alexa
  end

 
end
