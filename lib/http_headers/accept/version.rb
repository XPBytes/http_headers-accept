require 'delegate'

module HttpHeaders
  class Accept < DelegateClass(Array)
    VERSION = '0.2.2'
  end
end
