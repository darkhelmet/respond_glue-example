class WidgetsController < ApplicationController
  def index
    @widgets = widget_class.all
    respond_to do |format|
      format.js { render(:json => @widgets) }
    end
  end

  def show
    @widget = widget_class.find(params[:id])
    emit
  end

  def new
    @widget = widget_class.new
    emit
  end

  def edit
    @widget = widget_class.find(params[:id])
    emit
  end

  def create
    @widget = widget_class.new(params[:widget])
    @widget.save
    emit
  end

  def update
    @widget = widget_class.find(params[:id])
    @widget.update_attributes(params[:widget])
    emit
  end

  def destroy
    @widget = widget_class.find(params[:id])
    @widget.destroy
    emit
  end

protected

  def emit
    respond_to do |format|
      format.js { render(:json => @widget.to_json(:methods => [:valid]))}
    end
  end

  def widget_class
    params[:controller].singularize.camelize.constantize
  end

  def widget_symbol
    params[:controller].singular.intern
  end
end
