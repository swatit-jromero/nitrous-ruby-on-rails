require 'fileutils'
require 'json'

toast = Proc.new do
  puts '¡Aplausos!'
end

toast.call

# read json file
@json = File.read('user.json')
# parse json data to json object
@userJSONObj = JSON.parse(@json)
# print and format json object
puts JSON.pretty_generate(@userJSONObj)

puts '-------------------'

# add new users to json object
@userJSONObj['nmejia'] = 'Nelson Mejia'
@userJSONObj['arios'] = 'Andres Rios'
@userJSONObj['cgonzales'] = 'Carlos Henry Gonzales'

# print and format json object
@JSONObj = JSON.pretty_generate(@userJSONObj)

puts @JSONObj

# create new json file
File.open('new_user.json', 'w') do |file|
    
    file.write @JSONObj
    
end