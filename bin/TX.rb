#!/usr/bin/env ruby

require '../lib/mygem/TX.rb'

txdb = TX::DeleteBranch.new()
txdb.paraseArgs(ARGV)


