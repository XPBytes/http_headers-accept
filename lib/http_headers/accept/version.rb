require 'delegate'

module HttpHeaders
  class Accept < DelegateClass(Array)
    VERSION = '0.2.1'
  end
end
