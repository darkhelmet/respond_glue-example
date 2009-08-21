class WidgetsController < ApplicationController
  include RespondGlue

  def index
    @widgets = widget_class.all
    respond_glue(:html) { render(:template => "widgets/index") }
    respond_glue(:js) { render(:json => @widgets) }
  end

  def show
    @widget = widget_class.find(params[:id])
    respond_glue(:html) { render(:template => "widgets/show") }
    emit
  end

  def new
    @widget = widget_class.new
    respond_glue(:html) { render(:template => "widgets/new") }
    emit
  end

  def edit
    @widget = widget_class.find(params[:id])
    respond_glue(:html) { render(:template => "widgets/edit") }
    emit
  end

  def create
    @widget = widget_class.new(params[widget_symbol])
    @widget.save
    respond_glue(:html) { redirect_to(@widget) }
    emit
  end

  def update
    @widget = widget_class.find(params[:id])
    @widget.update_attributes(params[widget_symbol])
    respond_glue(:html) { redirect_to(@widget) }
    emit
  end

  def destroy
    @widget = widget_class.find(params[:id])
    @widget.destroy
    respond_glue(:html) { redirect_to(fancy_widgets_path) }
    emit
  end

protected

  def emit
    respond_glue(:js) { render(:json => @widget.to_json(:methods => [:valid])) }
  end

  def widget_class
    params[:controller].singularize.camelize.constantize
  end

  def widget_symbol
    params[:controller].singularize.intern
  end
end
