Rails.application.routes.draw do
  mount Authentication::Engine, at: 'auth'
  devise_for :users, class_name: "Authentication::User"
end

Authentication::Engine.routes.draw do
end
