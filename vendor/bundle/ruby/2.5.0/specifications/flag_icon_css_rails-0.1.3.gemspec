# -*- encoding: utf-8 -*-
# stub: flag_icon_css_rails 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "flag_icon_css_rails".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Justin Nguyen (Flags by Flag Icon Css)".freeze]
  s.date = "2014-09-14"
  s.description = "Flag Icon Css".freeze
  s.email = ["justin.ntt@gmail.com".freeze]
  s.homepage = "http://github.com/thethanghn/flag_icon_css_rails".freeze
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Flag Icon Css packaged for Rails 3.1+ asset pipeline".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 3.1.0"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 3.1.0"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 3.1.0"])
  end
end
