Rails.application.routes.draw do

  resources :answers
  resources :favorites
  resources :records
  get 'notes/:id/question/' => 'notes#show_question'
  get 'notes/:id/show_answer/' => 'notes#show_answer'
  patch 'answer_check' => 'notes#answer_check'

  resources :tags
  resources :note_tags
  resources :notes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
