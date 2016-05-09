Rails.application.routes.draw do
  get ":controller(/:action(/:id))"
  post ":controller(/:action(/:id))"
  root:to => "home#input"
end
