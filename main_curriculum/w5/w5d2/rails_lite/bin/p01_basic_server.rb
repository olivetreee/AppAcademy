require 'rack'

# For a barebone rack app:
=begin
Rack::Server.start( #This is what happens when you run "rails s"
  app: Proc.new do |env|
    ['200',
      {
        'Content-Type' => 'text/html', #or 'json'
        'Content-Length' => '6'  #This will truncate the body to 6 chars
      },
      ["bla bla"]
    ]
  end,
  Port: 3000
)
=end

#Expanding the app to allow for a more complex body
my_app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res["Content-Type"] = "text/html"
  res.write("#{req.env["REQUEST_PATH"]}") #Will print out the requested path, as per:
  # http://www.rubydoc.info/gems/rack/Rack/Request/Env#env-instance_method
  # res["Content-Length"] = '20' #This has to come after the #write
  res.finish
end

Rack::Server.start( #Careful with the freaking space between "start" and "(". It can't exist!!
  app: my_app,
  Port: 3000
)
