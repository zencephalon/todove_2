def set_error!(error_msg)
  session[:error] = error_msg
end

def get_error
  msg = session[:error]
  session[:error] = nil
  msg
end