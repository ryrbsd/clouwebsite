RailsAdmin.config do |config|
  # config.authorize_with do
  #   # redirect_to main_app.root_path unless current_user.admin == true
  # end
  config.default_items_per_page = 50 # number of records per page
  config.included_models = ["Category", "Type", "Product", "PopProduct", "CompanyNews", 
                            "IndustryNews", "Bid", "CampusRecuritment", "EmployeeStory", 
                            "SocietyRecuritment", "User", "YearReport", "Announcement",
                            "QandA", "QType", "ServiceCase", "CaseType", "Complain", 
                            "Trouble", "Honor", "SpecialNewsOne", "SpecialNewsTwo", 
                            "Clounewspapers", "Training"]
                            
  #history
  # config.audit_with :history
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0
  # config.audit_with :paper_trail, 'User', 'Version' # PaperTrail < 3.0.0
  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan # add cancancan to rails_admin config
  config.current_user_method { current_user } # set up the initializer to current 
  
  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0
  
  PAPER_TRAIL_AUDIT_MODEL =  ["Category", "Type", "Product", "PopProduct", "CompanyNews", 
                            "IndustryNews", "Bid", "CampusRecuritment", "EmployeeStory", 
                            "SocietyRecuritment", "User", "YearReport", "Announcement",
                            "QandA", "QType", "ServiceCase", "CaseType", "Complain", 
                            "Trouble", "Honor", "SpecialNewsOne", "SpecialNewsTwo", 
                            "Clounewspapers", "Training"]

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    ## With an audit adapter, you can add:
    # history_index
    # history_show
    history_index do
      only PAPER_TRAIL_AUDIT_MODEL
    end
    history_show do
      only PAPER_TRAIL_AUDIT_MODEL
    end
  end
end
