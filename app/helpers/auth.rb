def current_user
  User.find(session[:user_id]) if session[:user_id]
end

def bounce_guest!
  unless current_user
    set_error! "Please sign in to do that."
    redirect '/signin'
  end
end

def check_permission(user_bearer)
  unless current_user == user_bearer.user
    set_error! "U don't have permission to see that."
    redirect '/projects' 
  end
end
