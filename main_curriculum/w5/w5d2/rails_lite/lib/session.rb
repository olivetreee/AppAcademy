require 'json'
require 'byebug'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    # byebug
    @req = req
    # First we check if the cookies' key we're looking for has a value
    # If so, we deserialize it and store it in @ivar
    # If not, we initialize it as an empty hash and store it in @ivar
    unless @req.cookies["_rails_lite_app"].nil?
      @_rails_lite_app = JSON.parse(@req.cookies["_rails_lite_app"])
    else
      @_rails_lite_app = {}
    end
  end

  def [](key)
    @_rails_lite_app[key.to_s]
  end

  def []=(key, val)
    @_rails_lite_app[key.to_s] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    # Serialize the cookie content...
    cookie_content = @_rails_lite_app.to_json
    # ... and store it in the response.
    # Path is root so we can access it from anywhere in the domain
    res.set_cookie("_rails_lite_app", {path: "/", value: cookie_content})
  end
end
