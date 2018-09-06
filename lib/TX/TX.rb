#!/usr/bin/env ruby

require 'open3'

class DeleteBranch

    def delete_local(path, isForce)
        puts "🚀 local brach match(#{path}) delete start"
        gitCommand = "git branch -l |grep '#{path}' |xargs git branch -#{isForce ? "D": "d"}"
        file = IO.popen(gitCommand)
        file.each_line { |s| p s}
        puts "👻 local brach match(#{path}) delete end"
    end
    
    def delete_remote(path)
        puts "🚀 remote brach match(#{path}) delete start"
        gitCommand = "git branch -r |grep '#{path}'"
        file = IO.popen(gitCommand)
        file.each_line { |s| removePreWords(s)}
        puts "👻 remote brach match(#{path}) delete end"
    end
    
    def removePreWords(str)
        sArray = str.split("/")
        sArray.delete_at(0)
        aStr = sArray.join("/")
        commandStr = "git push origin --delete #{aStr}" 
        file = IO.popen(commandStr)
        file.each_line {|s| printf s}
    end
end

