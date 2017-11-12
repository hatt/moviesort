$: << File.expand_path('../lib', __FILE__)

require 'rspec/core/rake_task'

require 'alinta/client'
require 'alinta/movies'

ENDPOINT = 'http://alintacodingtest.azurewebsites.net/api/'

client = Alinta::Client.new(ENDPOINT)

desc 'List of characters played in films, grouped by actor, and sorted by film.'
task :actors do
  movies  = client.movies
  credits = Alinta::Movies.new(movies)

  credits.actors.each do |actor, roles|
    puts actor
    roles.sort_by { |r| r[:movie] }.each do |r|
      puts "  \u2022 #{r[:role]}"
    end

    puts
  end
end

RSpec::Core::RakeTask.new(:spec)

task default: [:spec, :actors]