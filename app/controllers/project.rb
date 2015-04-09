# Index

get '/' do
  redirect '/projects'
end

get '/projects' do
  bounce_guest!

  @projects = current_user.projects

  erb :'project/index'
end

# Update routes

put '/projects/:id' do |id|
  bounce_guest!

  project = Project.find(id)
  check_permission!(project)

  project.update(description: params[:description])
  redirect project_url(project) 
end

get '/projects/:id/edit' do |id|
  bounce_guest!

  @project = Project.find(id)
  check_permission!(@project)

  erb :'project/edit'
end

# Create routes

get '/projects/new' do
  erb :'project/new'
end

post '/projects' do
  project = Project.create(description: params[:description])
  redirect project_url(project) 
end

# Delete and Read

delete '/projects/:id' do |id|
  bounce_guest!

  project = Project.find(id)
  check_permission!(project)

  project.destroy

  redirect "/projects"
end

get '/projects/:id' do |id|
  bounce_guest!

  @project = Project.find(id)

  check_permission!(@project)

  erb :'project/show'
end
