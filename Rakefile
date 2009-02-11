require 'spec/rake/spectask'

require 'echoe'
Echoe.new 'stale_object_destroyer' do |p|
  p.description     = "An easy way to handle stale object errors in Rails by retrying the entire request."
  p.url             = "http://github.com/jqr/stale_object_destroyer"
  p.author          = "Elijah Miller"
  p.email           = "elijah.miller@gmail.com"
  p.retain_gemspec  = true
  p.need_tar_gz     = false
  p.extra_deps      = [
  ]
end

desc 'Default: run specs'
task :default => :spec
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList["spec/**/*_spec.rb"]
end

task :test => :spec
