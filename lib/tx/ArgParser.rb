#!/usr/bin/env ruby

module ArgParser
    def gitBrIsValid(path)
        if path.length >=3 && path != "dev"
            return true
        else 
            return false
        end
    end

    def gitBrInvalidMessage(path)
        puts "🚫 git br named #{path} is inValid, you can try it manually"
    end
end

