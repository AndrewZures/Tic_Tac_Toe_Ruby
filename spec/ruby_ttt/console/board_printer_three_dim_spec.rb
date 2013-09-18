require_relative '../../../src/ruby_ttt/console/board_printers/board_printer_three_dim'

describe BoardPrinterThreeDim do

  let(:io) { StringIO.new }
  let(:printer) { BoardPrinterThreeDim.new io }

  it 'prints three dimensional board' do
    array = Array.new(27, :o)
    print_results = []
    print_results[0] = array
    print_results[1] = 3
    printer.print(print_results)
    io.string.should match " O   O   O "
    io.string.should match "O   O   O      O   O   O      O   O   O    \n"
  end

  it 'gets correct character for symbol' do
      array = Array.new(3, :x)
      result = printer.get_element_symbol array, 1
      result.should == "X"
  end

end