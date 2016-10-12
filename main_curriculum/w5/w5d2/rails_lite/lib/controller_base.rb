require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require_relative './session'
require 'byebug'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, route={})
    @req = req
    @res = res
    @already_built_response = false #So I don't deal with nil
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "Already did that, dumbass" if already_built_response?

    # Build response header as a redirect (no body). Include:
      #location
      #status code
    @res.header["location"] = url #Isn't this readonly?
    @res.status = 302 #Set to temporary redirect

    # Set flag to avoid double redirecting
    @already_built_response = true

    # Set the cookie value on the response
    session.store_session(@res)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "Already did that, dumbass" if already_built_response?

    # Build response:
    @res["Content-Type"] = content_type
    @res.write(content)

    # Set flag to avoid double rendering
    @already_built_response = true

    # Set the cookie value on the response. Check file p04 for more info
    session.store_session(@res)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    #the tpl_name is :show or :new or whatever
    #need to find the controller name. Call self.class?

    # building the controller part of path
    controller_name = self.class.to_s
    snake_controller_name = controller_name.underscore

    template_folder = "views"
    template_path = "#{template_folder}/#{snake_controller_name}/#{template_name}.html.erb"

    # Reading from template file
    template_content = File.read(template_path)

    # Remember: this is a superclass. Whoever calls, will have @vars set up.
    # When we call binding, we interpolate whatever's on the tpl with the matching
    # @vars from the inheriting class' instance
    content = ERB.new(template_content).result(binding)
    content_type = "text/html"
    render_content(content, content_type)
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    # A controller inherits from this class. A controller will have methods like
    # #new, #create, #edit etc. The var "name" is exactly that method. Hence,
    # we call send on self (instance of a controller) and send it the method "name"
    self.send(name)

    # If no response has been built, we'll call render and pass in the template name,
    # which is the name of the method itself
    render(name) unless @already_built_response
  end
end
