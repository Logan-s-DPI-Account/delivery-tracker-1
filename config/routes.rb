Rails.application.routes.draw do



  # Routes for the User account:
  #HOME
  get("/", { :controller => "deiveries", :action => "index"})

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Deivery resource:

  # CREATE
  post("/insert_deivery", { :controller => "deiveries", :action => "create" })
          
  # READ
  get("/deiveries", { :controller => "deiveries", :action => "index" })
  
  get("/deiveries/:path_id", { :controller => "deiveries", :action => "show" })
  
  # UPDATE
  
  post("/modify_deivery/:path_id", { :controller => "deiveries", :action => "update" })
  
  # DELETE
  get("/delete_deivery/:path_id", { :controller => "deiveries", :action => "destroy" })

  #------------------------------

end
