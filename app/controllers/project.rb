# Index

get '/projects' do
  @projects = Project.all

  erb :'project/index'
end

# Update routes

put '/projects/:id' do |id|

end

get '/projects/:id/edit' do |id|

end

# Create routes

get '/projects/new' do
  erb :'project/new'
end

post '/projects' do
  project = Project.create(description: params[:description])
  redirect "/projects/#{project.id}"
end

# Delete and Read

delete '/projects/:id' do |id|

end

get '/projects/:id' do |id|
  @project = Project.find(id)

  erb :'project/show'
end
