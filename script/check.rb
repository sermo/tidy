#!/usr/bin/env ruby

# before doing anything, ensure that "TIDY_LIB" has been specified and valid
tidy_lib = ENV['TIDY_LIB']
abort 'Must specify the fully-qualified path to your compiled "Tidy" library' \
  if tidy_lib.nil? || !File.exist?(tidy_lib)
$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))

# load the gem
require 'tidy'

# set the path and test the DL/Fiddle interface
Tidy.path = tidy_lib
xml = Tidy.open(:show_warnings => true) do |tidy|
  tidy.options.output_xml = true
  puts tidy.options.show_warnings
  xml = tidy.clean('<html><title>title</title>Body</html>')
  puts tidy.errors
  puts tidy.diagnostics
  xml
end

# if we've made it this far it's a success
puts "#{xml}\nSUCCESS!"
