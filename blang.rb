# The Awesome language!
# 
# usage:
#   ./awesome example.awm # to eval a file
#   ./awesome             # to start the REPL
#
# on Windows run with: ruby -I. awesome [options]

require "interpreter"
require "readline"

interpreter = Interpreter.new

if file = ARGV.first
  interpreter.eval File.read(file)
else
  puts "Awesome REPL, CTRL+C to quit"
  loop do
    line = Readline::readline(">> ")       # 1. Read
    Readline::HISTORY.push(line)
    value = interpreter.eval(line)         # 2. Eval
    puts "=> #{value.ruby_value.inspect}"  # 3. Print
  end                                      # 4. Loop
  
end
