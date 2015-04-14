get '/' do
  redirect '/tasks'
end

get '/tasks' do
  bounce_guest!

  @tasks = current_user.top_level_tasks

  erb :'task/index'
end

get '/tasks/:id' do |id|
  task = Task.find(id)
  erb :'task/show', locals: {task: task}
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
  task = Task.find(id)
  task.destroy
  redirect project_url(task.project)
end

put '/tasks/:id' do |id|
  task = Task.find(id)
  task.update(params[:task])
  redirect project_url(task.project)
end

get '/tasks/:id/edit' do |id|
  @task = Task.find(id)
  @projects = Project.all
  erb :'task/edit'
end