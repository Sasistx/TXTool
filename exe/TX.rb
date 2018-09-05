#!/usr/bin/env ruby

require 'TX'
require 'optparse'

options_parser = OptionParser.new do |opts| 
    opts.banner = 'help message'
    txdb = DeleteBranch.new()
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
#txdb = TX::DeleteBranch.new()


