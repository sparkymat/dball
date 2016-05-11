require './dball/helpers'
require './dball/relation'
require './dball/model'
require './user'

puts User.find(5).to_sql
