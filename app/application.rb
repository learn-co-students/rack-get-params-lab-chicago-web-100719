class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
@@ -13,8 +14,22 @@ def call(env)
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    else
      resp.write "Path Not Found"
    elsif req.path.match(/cart/)
      if @@cart.empty?
        resp.write "Your cart is empty"
      else 
        @@cart.each {|item| resp.write "#{item}\n"}
      end
    elsif req.path.match(/add/)
      item = req.params["item"]
      if @@items.include? item
        @@cart << item
        resp.write "added #{item}"
      else 
        resp.write "We don't have that item!"
      end
    else  
     resp.write "Path Not Found"
    end

    resp.finish
      return "Couldn't find #{search_term}"
    end
  end
end
end 