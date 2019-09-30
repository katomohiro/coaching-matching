#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                     new_coach_session GET    /coaches/sign_in(.:format)                                                               coaches/sessions#new
#                         coach_session POST   /coaches/sign_in(.:format)                                                               coaches/sessions#create
#                 destroy_coach_session DELETE /coaches/sign_out(.:format)                                                              coaches/sessions#destroy
#                    new_coach_password GET    /coaches/password/new(.:format)                                                          devise/passwords#new
#                   edit_coach_password GET    /coaches/password/edit(.:format)                                                         devise/passwords#edit
#                        coach_password PATCH  /coaches/password(.:format)                                                              devise/passwords#update
#                                       PUT    /coaches/password(.:format)                                                              devise/passwords#update
#                                       POST   /coaches/password(.:format)                                                              devise/passwords#create
#             cancel_coach_registration GET    /coaches/cancel(.:format)                                                                coaches/registrations#cancel
#                new_coach_registration GET    /coaches/sign_up(.:format)                                                               coaches/registrations#new
#               edit_coach_registration GET    /coaches/edit(.:format)                                                                  coaches/registrations#edit
#                    coach_registration PATCH  /coaches(.:format)                                                                       coaches/registrations#update
#                                       PUT    /coaches(.:format)                                                                       coaches/registrations#update
#                                       DELETE /coaches(.:format)                                                                       coaches/registrations#destroy
#                                       POST   /coaches(.:format)                                                                       coaches/registrations#create
#                        coaches_search GET    /coaches/search(.:format)                                                                coaches/coaches#search
#                          coaches_show GET    /coaches/show(.:format)                                                                  coaches/coaches#show
#                                       GET    /user/:id(.:format)                                                                      coaches/registrations#detail
#                                signup GET    /signup(.:format)                                                                        coaches/registrations#new
#                                 login GET    /login(.:format)                                                                         coaches/sessions#new
#                                logout GET    /logout(.:format)                                                                        coaches/sessions#destroy
#                                  root GET    /                                                                                        coaches/coaches#search
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
Rails.application.routes.draw do
  devise_for :coaches, :controllers => {
      :registrations => 'coaches/registrations',
      :sessions => 'coaches/sessions'
  }

  namespace :coaches do
    get "search",:to=>"coaches#search"
    get ":id",:to=>"coaches#show"
  end

  devise_scope :coach do
    # get "coaches/:id", :to => "coaches/registrations#detail"
    get "signup", :to => "coaches/registrations#new"
    get "login", :to => "coaches/sessions#new"
    get "logout", :to => "coaches/sessions#destroy"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'coaches/coaches#search'
end
# INSERT INTO coaches (email, encrypted_password, created_at, updated_at, name ,nickname, description, contact) VALUES ('test1@test.com', '$2a$11$1LQZC8BpPNIkqEVdaWxxnuT5DfR/yxfjkfW8w/Fwskh6j6YFKJMWu', '2019-09-25 13:25:00', '2019-09-25 13:25:00', 'テスト1', 'てすと1', '説明文', 'コンタクト');
# INSERT INTO coaches (email, encrypted_password, created_at, updated_at, name ,nickname, description, contact) VALUES ('test2@test.com', '$2a$11$1LQZC8BpPNIkqEVdaWxxnuT5DfR/yxfjkfW8w/Fwskh6j6YFKJMWu', '2019-09-25 13:25:00', '2019-09-25 13:25:00', 'テスト2', 'てすと2', '説明文', 'コンタクト');
# INSERT INTO coaches (email, encrypted_password, created_at, updated_at, name ,nickname, description, contact) VALUES ('test3@test.com', '$2a$11$1LQZC8BpPNIkqEVdaWxxnuT5DfR/yxfjkfW8w/Fwskh6j6YFKJMWu', '2019-09-25 13:25:00', '2019-09-25 13:25:00', 'テスト3', 'てすと3', '説明文', 'コンタクト');
