ActionController::Routing::Routes.draw do |map|
  map.resources :fancy_widgets
  map.resources :weird_widgets

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
