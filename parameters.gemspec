# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{parameters}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Postmodern"]
  s.date = %q{2010-10-10}
  s.description = %q{Parameters allows you to add annotated variables to your classes which may have configurable default values.}
  s.email = %q{postmodern.mod3@gmail.com}
  s.extra_rdoc_files = [
    "ChangeLog.md",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".gitignore",
    ".rspec",
    ".yardopts",
    "ChangeLog.md",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "lib/parameters.rb",
    "lib/parameters/class_methods.rb",
    "lib/parameters/class_param.rb",
    "lib/parameters/exceptions.rb",
    "lib/parameters/exceptions/missing_param.rb",
    "lib/parameters/exceptions/param_not_found.rb",
    "lib/parameters/extensions.rb",
    "lib/parameters/extensions/meta.rb",
    "lib/parameters/extensions/meta/object.rb",
    "lib/parameters/instance_param.rb",
    "lib/parameters/param.rb",
    "lib/parameters/parameters.rb",
    "lib/parameters/version.rb",
    "parameters.gemspec",
    "spec/class_param_spec.rb",
    "spec/classes/custom_parameters.rb",
    "spec/classes/custom_type.rb",
    "spec/classes/inherited_parameters.rb",
    "spec/classes/module_parameters.rb",
    "spec/classes/other_parameters.rb",
    "spec/classes/test_parameters.rb",
    "spec/instance_param_spec.rb",
    "spec/parameters_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{http://github.com/postmodern/parameters}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Allows you to add annotated variables to your classes}
  s.test_files = [
    "spec/class_param_spec.rb",
    "spec/classes/custom_parameters.rb",
    "spec/classes/custom_type.rb",
    "spec/classes/inherited_parameters.rb",
    "spec/classes/module_parameters.rb",
    "spec/classes/other_parameters.rb",
    "spec/classes/test_parameters.rb",
    "spec/instance_param_spec.rb",
    "spec/parameters_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
  end
end

