require 'octokit'

class User < ApplicationRecord
    validates :username, :favourite_language, presence: true
    validates :username, format: { without: /\s/ }

    def favourite_programming_language(username)
        repositories = Octokit.repositories(username)

        fpl = repositories.inject(Hash.new(0)) do |languages, repository|
                languages[repository.language] += repository.size
                languages
              end

        if fpl != {}
            fpl.max_by { |language, total_size| total_size }.first
        else 
            "unknown. Please check if user exists and is spelt correctly."
        end
    end

end
