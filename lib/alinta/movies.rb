require 'alinta/client'

module Alinta
  class Movies

    def initialize(movies)
      @movies ||= movies
    end

    def actors
      actors = Hash.new

      @movies.each do |m|
        m[:roles].map do |r|
          # Skip if the role doesn't contain a credited actor
          next if r[:actor].nil? || r[:actor].empty?
        
          actor = r[:actor]
    
          actors[actor] = Array.new unless actors.has_key?(actor)
    
          # Default to uncredited/untitled if the role is missing data
          actors[actor] << { role:  r.fetch(:name, 'uncredited'),
                              movie: m.fetch(:name, 'missing title') }
        end
      end

      actors.each do |actor, roles|
        actors[actor].uniq!
      end
    end

  end
end