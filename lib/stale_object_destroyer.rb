module StaleObjectDestroyer
  module Request
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
end

ActionController::CgiRequest.send :include, StaleObjectDestroyer::Request
# Needed for cucumber
ActionController::RackRequest.send :include, StaleObjectDestroyer::Request

class ActionController::Base
  class << self 
    def process_with_destroyer(request, response)
      (1..retry_attempts).each do |attempt|
        begin
          request.attempt = attempt
          request.last_attempt = attempt == retry_attempts
          
          return process_without_destroyer(request, response)
        rescue ActiveRecord::StaleObjectError => err
          logger.error "[StaleObjectDestroyer] #{err.message} on attempt #{attempt}"
        end
      end
    end
  
   alias_method_chain :process, :destroyer

   # TODO: evaluate possibility of moving this to an instnace method
   def retry_attempts
     1
   end
 end
 
end

class ActiveRecord::Base
  define_callbacks :after_stale_object_error
  
  def update_with_destroyer(*args)
    begin
      update_without_destroyer(*args)
    rescue ActiveRecord::StaleObjectError => err
      run_callbacks(:after_stale_object_error)
      raise err
    end
  end
  alias_method_chain :update, :destroyer
end