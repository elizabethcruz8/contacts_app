Rails.application.routes.draw do

  namespace :api do 

    get "/contacts" => "contacts#index"

    post "/contacts" => "contacts#create"

    get "/contacts/:id" => "contacts#show"

    patch "/contacts/:id" => "contacts#update" 
    
    delete "/contacts/:id" => "contacts#destroy"  
  end 
end 











  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

