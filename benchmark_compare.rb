#a benchmark between symbols and strings
require 'benchmark'
10.times do |m|

    iterator = 100_000_000

    str = Benchmark.measure do
        iterator.times do
            "test" == "test"
        end
    end.total

    sym = Benchmark.measure do
        iterator.times do
            :test == :test
        end
    end.total

    puts "String: " + str.to_s
    puts "Symbol: " + sym.to_s
end
