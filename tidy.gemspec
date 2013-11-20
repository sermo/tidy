# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tidy'

Gem::Specification.new do |spec|
  spec.name = 'tidy'
  spec.version = Tidy::VERSION
  spec.authors = ['Kevin Howe', 'Jonathan W. Zaleski']
  spec.email = ['kh@newclear.ca', 'jonathan.zaleski@worldone.com']
  spec.description = 'Ruby interface to HTML Tidy Library Project'
  spec.summary = s.summary + ', updated to avoid to avoid seg faults (see http://rubyforge.org/tracker/index.php?func=detail&aid=10007&group_id=435&atid=1744)'
  spec.license = 'MIT'
  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
