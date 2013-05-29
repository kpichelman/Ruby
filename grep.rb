if ARGV.size != 2
  puts "Two arguments required, a file name and a string to search for"
  exit
end

termCount = 0
lineCount = 0

file = File.new(ARGV[0], "r")
while (line = file.gets)
  lineCount = lineCount + 1

  if line.match(ARGV[1])
    puts "Line: " + lineCount.to_s + " : " + line
    termCount = termCount + 1
  end
end

file.close

puts "The string " + ARGV[1].to_s + " was found " + termCount.to_s + " times."
