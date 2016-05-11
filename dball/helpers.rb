require 'active_support/inflector'

class String
  def squish
    self.split(" ").join(" ")
  end
end

class Object
  def present?
    !self.nil?
  end
end
