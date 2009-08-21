ActionController::Routing::Routes.draw do |map|
  map.resources :widgets

  map.resources :foos

  map.resources :fancy_widgets
  map.resources :weird_widgets

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
