require 'addressable/uri'
require 'rest-client'

def index_users
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.json'
    ).to_s

    puts RestClient.get(url)
end

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  begin
  puts RestClient.post(
    url,
    { user: { name: name, email: email } }
  )
  rescue RestClient::Exception
    p 'Invalid!'
  end
end

create_user("Gizmo", "gizmo@gizmo.gizmo")

# index_users
