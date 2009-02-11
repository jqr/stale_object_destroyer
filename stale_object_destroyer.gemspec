# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{stale_object_destroyer}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Elijah Miller"]
  s.date = %q{2009-02-10}
  s.description = %q{An easy way to handle stale object errors by retrying the entire request.}
  s.email = %q{elijah.miller@gmail.com}
  s.extra_rdoc_files = ["CHANGELOG", "lib/stale_object_destroyer.rb", "README.rdoc"]
  s.files = ["CHANGELOG", "init.rb", "lib/stale_object_destroyer.rb", "Manifest", "Rakefile", "README.rdoc", "spec/spec_helper.rb", "stale_object_destroyer.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jqr/stale_object_destroyer}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Stale_object_destroyer", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{stale_object_destroyer}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{An easy way to handle stale object errors by retrying the entire request.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
