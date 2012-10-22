#!/usr/bin/env ruby

require 'securerandom'
require 'optparse'
require 'fileutils'

def install
  %w(base64 hex random_bytes random_number urlsafe_base64 uuid).each do |command|
    old = File.expand_path(__FILE__)
    new = File.join(File.dirname(old), command)
    FileUtils.symlink(old, new, { verbose: true })
  end
end

def main
  if ARGV.length == 2
    ARGV[0] = ARGV[0].to_s == "nil" ? nil : ARGV[0].to_i
    ARGV[1] = ARGV[1] == "true"
  elsif ARGV.length == 1
    ARGV[0] = ARGV[0].to_i
  end

  begin
    puts SecureRandom.send(File.basename($0), *ARGV)
  rescue => e
    puts <<USAGE
Usage: base64 #=> NMjfWn0qkgQ4CguQDiYLhA==
       hex 10 #=> 7155840f434385a266d00cc6ab4fcb09
       uuid   #=> 115a7b6a-9dea-436e-9658-9f1b5bf3d069
USAGE
  end
end

opts = OptionParser.new
opts.on('--install') { install() }
opts.parse!

main()
