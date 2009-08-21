class WidgetsController < ApplicationController
  def index
    @widgets = widget_class.all
    respond_to do |format|
      format.html { render(:template => "widgets/index") }
      format.js { render(:json => @widgets) }
    end
  end

  def show
    @widget = widget_class.find(params[:id])
    respond_to do |format|
      format.html { render(:template => "widgets/show") }
      format.js { render(:json => @widget.to_json(:methods => [:valid])) }
    end
  end

  def new
    @widget = widget_class.new
    respond_to do |format|
      format.html { render(:template => "widgets/new") }
    end
  end

  def edit
    @widget = widget_class.find(params[:id])
    respond_to do |format|
      format.html { render(:template => "widgets/edit") }
      format.js { render(:json => @widget.to_json(:methods => [:valid])) }
    end
  end

  def create
    @widget = widget_class.new(params[widget_symbol])
    @widget.save
    respond_to do |format|
      format.html { redirect_to(@widget) }
      format.js { render(:json => @widget.to_json(:methods => [:valid])) }
    end
  end

  def update
    @widget = widget_class.find(params[:id])
    @widget.update_attributes(params[widget_symbol])
    respond_to do |format|
      format.html { redirect_to(@widget) }
      format.js { render(:json => @widget.to_json(:methods => [:valid])) }
    end
  end

  def destroy
    @widget = widget_class.find(params[:id])
    @widget.destroy
    respond_to do |format|
      format.html { redirect_to(fancy_widgets_path) }
      format.js { head(:ok) }
    end
  end

protected

  def widget_class
    params[:controller].singularize.camelize.constantize
  end

  def widget_symbol
    params[:controller].singularize.intern
  end
end
