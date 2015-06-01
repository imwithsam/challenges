class Fibber
  attr_accessor :output,
                :printer

  def initialize(printer)
    self.output = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377]
    self.printer = printer
  end

  def print(number_of_numbers_to_print)
    self.printer.print(output[0..(number_of_numbers_to_print - 1)].join(" "))
  end
end

class ScreenPrinter
  def print(output)
    puts output
  end
end

class FilePrinter
  attr_accessor :filename

  def initialize(filename)
    self.filename = filename
  end

  def print(output)
    File.open(self.filename, "w") do |file|
      file.write(output)
    end
  end
end

screen_printer = ScreenPrinter.new
fibber = Fibber.new(screen_printer)
fibber.print(10) # => prints the first 10 numbers of the fibonacci sequence to
#    the screen separated by a single space
file_printer = FilePrinter.new("output.txt")
fibber = Fibber.new(file_printer)
fibber.print(10) # => prints the first 10 number of the fibonacci sequence to
#    a file named 'output.txt' separated by a single space
