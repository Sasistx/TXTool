#!/usr/bin/env ruby

require '../lib/mygem/TX'

txdb = TX::DeleteBranch.new()
txdb.paraseArgs(ARGV)


