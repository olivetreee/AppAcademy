require 'rack'
require_relative '../lib/controller_base'

class MyController < ControllerBase
  def go
    if @req.path == "/cats"
      render_content("hello cats!", "text/html")
    else
      redirect_to("/cats")
    end
  end
end

#Define the app itself:
app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  # This creates a new instance of MyController, which inherits from ControllerBase
  # Hence, I'm passing req and res to ControllerBase #initialize
  MyController.new(req, res).go
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
