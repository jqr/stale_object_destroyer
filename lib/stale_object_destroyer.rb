class ActionController::CgiRequest
  attr_accessor :attempt, :last_attempt
  
  def last_attempt?
    last_attempt
  end
  
  def reraise_stale_object_errors(exception)
    if exception.is_a?(ActiveRecord::StaleObjectError) && !last_attempt?
      raise exception
    end
  end
end

class ActionController::Base
  class << self 
    def process_with_destroyer(request, response)
      max = 5
      (1..max).each do |attempt|
        begin
          request.attempt = attempt
          request.last_attempt = attempt == max
          
          return process_without_destroyer(request, response)
        rescue ActiveRecord::StaleObjectError => err
          logger.error "[StaleObjectDestroyer] #{err.message} on attempt #{attempt}"
        end
      end
    end
  
   alias_method_chain :process, :destroyer
 end
end
