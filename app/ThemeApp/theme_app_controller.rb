require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ThemeAppController < Rho::RhoController
  include BrowserHelper

  # GET /ThemeApp
  def index
    @theme_apps = ThemeApp.find(:all)
    render :back => '/app'
  end

  # GET /ThemeApp/{1}
  def show
    @theme_app = ThemeApp.find(@params['id'])
    if @theme_app
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /ThemeApp/new
  def new
    @theme_app = ThemeApp.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /ThemeApp/{1}/edit
  def edit
    @theme_app = ThemeApp.find(@params['id'])
    if @theme_app
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /ThemeApp/create
  def create
    @theme_app = ThemeApp.create(@params['theme_app'])
    redirect :action => :index
  end

  # POST /ThemeApp/{1}/update
  def update
    @theme_app = ThemeApp.find(@params['id'])
    @theme_app.update_attributes(@params['theme_app']) if @theme_app
    redirect :action => :index
  end

  # POST /ThemeApp/{1}/delete
  def delete
    @theme_app = ThemeApp.find(@params['id'])
    @theme_app.destroy if @theme_app
    redirect :action => :index  
  end
end
