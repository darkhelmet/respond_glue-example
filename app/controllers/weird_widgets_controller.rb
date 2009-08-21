class WeirdWidgetsController < WidgetsController
  def index
    super
    respond_glue(:js) { render(:json => { :count => @widgets.count }.to_json) }
  end

  glue_for(:index)
end
