TestApp::Application.routes.draw do
  root :to => 'email_contacts#index'
  get "/auth/:provider/callback" => "email_contact#create"
end
