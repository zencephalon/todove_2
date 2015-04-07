# Index

get '/projects' do
  @projects = Project.all

  erb :'project/index'
end

# Update routes

put '/projects/:id' do |id|
  project = Project.find(id)
  project.update(description: params[:description])
  redirect project_url(project) 
end

get '/projects/:id/edit' do |id|
  @project = Project.find(id)
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
  Project.find(id).destroy
  redirect "/projects"
end

get '/projects/:id' do |id|
  @project = Project.find(id)

  erb :'project/show'
end
