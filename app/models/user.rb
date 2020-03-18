require 'octokit'

class User < ApplicationRecord
    validates :username, :favourite_language, presence: true
    validates :username, format: { without: /\s/ }

    def favourite_programming_language(username)
        lang = {}
        repositories = Octokit.repositories(username)

        fpl = repositories.select { |repo| repo["fork"] == false }

        fpl.each{ |repo|
                lang[repo.language] ||= 0
                lang[repo.language] += 1
        }

        if fpl != {}
            lang.max_by { |language, size| size }.first
        else 
            "unknown. Please check if user exists and is spelt correctly."
        end
    end

end
