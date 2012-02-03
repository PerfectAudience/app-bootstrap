module Regex
  HEX_REGEX = /^([a-f]|[A-F]|[0-9]){6}$/
  URL_REGEX = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?([\/].*)?$)/ix
end
