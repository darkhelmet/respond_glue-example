class WidgetsController < ApplicationController
  def index
    @widgets = widget_class.all
    respond_to do |format|
      format.html
      format.js { render(:json => @widgets) }
    end
  end

  def show
    @widget = widget_class.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render(:json => @widget.to_json(:methods => [:valid])) }
    end
  end

  def new
    @widget = widget_class.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @widget = widget_class.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render(:json => @widget.to_json(:methods => [:valid])) }
    end
  end

  def create
    @widget = widget_class.new(params[:widget])
    @widget.save
    respond_to do |format|
      format.html
      format.js { render(:json => @widget.to_json(:methods => [:valid])) }
    end
  end

  def update
    @widget = widget_class.find(params[:id])
    @widget.update_attributes(params[:widget])
    respond_to do |format|
      format.html
      format.js { render(:json => @widget.to_json(:methods => [:valid])) }
    end
  end

  def destroy
    @widget = widget_class.find(params[:id])
    @widget.destroy
    respond_to do |format|
      format.html
      format.js { head(:ok) }
    end
  end

protected

  def widget_class
    params[:controller].singularize.camelize.constantize
  end

  def widget_symbol
    params[:controller].singular.intern
  end
end
