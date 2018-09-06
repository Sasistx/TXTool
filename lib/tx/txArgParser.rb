#!/usr/bin/env ruby

module TXArgParser
    def TXArgParser.gitBrIsValid(path)
        if path.length >=3 && path != "dev"
            return true
        else 
            return false
        end
    end

    def TXArgParser.gitBrInvalidMessage(path)
        puts "🚫 git branch named #{path} is invalid: too short or contain 'dev',you can try it manually."
    end
end


