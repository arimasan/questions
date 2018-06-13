Rails.application.routes.draw do

  root 'notes#index'
  get 'notes/search' => 'notes#search'
  get 'notes/:id/question/' => 'notes#show_question'
  get 'notes/:id/show_answer/' => 'notes#show_answer'
  patch 'answer_check' => 'notes#answer_check'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :answers
  resources :favorites
  resources :records
  resources :tags
  resources :note_tags
  resources :notes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
