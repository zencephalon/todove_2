get '/' do
  redirect '/tasks'
end

get '/tasks' do
  bounce_guest!

  @tasks = current_user.top_level_tasks

  erb :'task/index'
end

get '/tasks/new' do
  erb :'task/_new_form'
end

get '/tasks/:id' do |id|
  task = Task.find(id)
  erb :'task/show', locals: {task: task}
end

# Two ways to create new tasks
post '/tasks' do
  params[:task][:user_id] = current_user.id
  task = Task.create(params[:task])
  redirect '/'
end


delete '/tasks/:id' do |id|
  task = Task.find(id)
  task.destroy
  if request.xhr?
    "done"
  else
    redirect '/'
  end
end

put '/tasks/:id' do |id|
  task = Task.find(id)
  task.update(params[:task])
  redirect '/'
end

get '/tasks/:id/edit' do |id|
  @task = Task.find(id)
  erb :'task/edit'
end