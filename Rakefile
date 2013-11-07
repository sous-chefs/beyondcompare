require 'tailor/rake_task'
require 'foodcritic'
require 'daptiv-chef-ci/vagrant_task'

@provider = (ENV['PROVIDER'] || :virtualbox).to_sym

desc 'Lint Chef cookbooks and check style'
task :default => [:tailor, :foodcritic]

FoodCritic::Rake::LintTask.new do |t|
  t.options = {
    :cookbook_paths => '.',
    :search_gems => true }
end

Tailor::RakeTask.new

Vagrant::RakeTask.new :vagrant, 'Run Vagrant with the specifed provider' do |t|
  t.provider = @provider
end
