# -*- encoding: utf-8 -*-
# stub: png_quantizator 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "png_quantizator".freeze
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Roger Campos".freeze]
  s.date = "2015-08-04"
  s.description = "Small wrapper around pngquant".freeze
  s.email = ["roger@itnig.net".freeze]
  s.homepage = "".freeze
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Small wrapper around pngquant".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
