#!/usr/bin/env ruby

require 'open3'
require 'optparse'

module TX
    class DeleteBranch
        def delete_local(path)
            puts "🚀 local brach match(#{path}) delete start"
            gitCommand = "git branch -l |grep '#{path}' |xargs git branch -d"
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
        # def paraseArgs(args)
        #     v1 = args[0]
        #     if args.size == 2
        #         v2 = args[1]
        #         if v1 == '-l'
        #             delete_local(v2)
        #         elsif v1 == '-r'
        #             delete_remote(v2)
        #         elsif v1 == '-a'
        #             delete_local(v2)
        #             delete_remote(v2)
        #         else
        #             puts "only -r, -l or -a is valid"
        #         end
        #     else
        #         puts "-r remote , -l local, -a all"
        #     end
        # end
    end
end

options_parser = OptionParser.new do |opts| 
    opts.banner = 'help message'
    txdb = TX::DeleteBranch.new()
    opts.on('-l args', '--local args', 'local branch') do |value|
        txdb.delete_local(value)
    end

    opts.on('-r args', '--remote args', 'remote branch') do |value|
        txdb.delete_remote(value)
    end

    opts.on('-a args', '--all args', 'local & remote branch') do |value|
        txdb.delete_local(value)
        txdb.delete_remote(value)
    end
end.parse!

