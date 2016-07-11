# -*- encoding: utf-8 -*-
# stub: site_prism 2.9 ruby lib

Gem::Specification.new do |s|
  s.name = "site_prism"
  s.version = "2.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Nat Ritmeyer"]
  s.date = "2016-03-29"
  s.description = "SitePrism gives you a simple, clean and semantic DSL for describing your site using the Page Object Model pattern, for use with Capybara"
  s.email = "nat@natontesting.com"
  s.homepage = "http://github.com/natritmeyer/site_prism"
  s.licenses = ["BSD3"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.5.1"
  s.summary = "A Page Object Model DSL for Capybara"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capybara>, ["< 3.0", ">= 2.1"])
      s.add_runtime_dependency(%q<addressable>, ["< 3.0", ">= 2.3.3"])
      s.add_development_dependency(%q<rspec>, ["< 4.0"])
    else
      s.add_dependency(%q<capybara>, ["< 3.0", ">= 2.1"])
      s.add_dependency(%q<addressable>, ["< 3.0", ">= 2.3.3"])
      s.add_dependency(%q<rspec>, ["< 4.0"])
    end
  else
    s.add_dependency(%q<capybara>, ["< 3.0", ">= 2.1"])
    s.add_dependency(%q<addressable>, ["< 3.0", ">= 2.3.3"])
    s.add_dependency(%q<rspec>, ["< 4.0"])
  end
end
