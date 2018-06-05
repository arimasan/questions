Rails.application.routes.draw do

  get 'notes/:id/question/' => 'notes#show_question'

  resources :tags
  resources :note_tags
  resources :notes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
