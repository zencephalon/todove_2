get '/tasks' do

end

get '/tasks/:id' do |id|

end

# Two ways to create new tasks
post '/tasks' do
  task = Task.create(params[:task])
  redirect project_url(task.project)
end

get '/tasks/new' do

end

post '/projects/:id/tasks' do |id|

end

get '/projects/:id/tasks/new' do |id|

end


delete '/tasks/:id' do |id|
  
end

put '/tasks/:id' do |id|
end

get '/tasks/:id/edit' do |id|
end