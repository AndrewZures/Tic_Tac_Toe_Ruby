require_relative '../../../src/ruby_ttt/console/board_printers/board_printer_two_dim'

describe BoardPrinterTwoDim do

  let(:io) { StringIO.new }
  let(:printer) { BoardPrinterTwoDim.new io }


  it 'prints 3x3 board' do
    print_results = []
    print_results[0] = Array.new(9, :o)
    print_results[1] = 3
    printer.print(print_results)
    io.string.should match "O  O  O\n"


  end

  it 'prints 4x4 board' do
    print_results = []
    print_results[0] =Array.new(16, :x)
    print_results[1] = 4
    printer.print(print_results)
    io.string.should match "X  X  X  X\n"
  end

  it 'print 5x5 board' do
    print_results = []
    print_results[0] =Array.new(25, :x)
    print_results[1] = 5
    printer.print(print_results)
    io.string.should match "X  X  X  X  X\n"
  end



end