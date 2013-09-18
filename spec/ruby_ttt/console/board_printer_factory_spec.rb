require_relative '../../../src/ruby_ttt/console/board_printer_factory'

describe BoardPrinterFactory do

  let (:printer_factory) {BoardPrinterFactory.new }

  it 'creates two dim board printer' do
      printer = printer_factory.get_printer(:two_dimensional)
      printer.should be_an_instance_of BoardPrinterTwoDim
  end

  it 'creates three dim board printer' do
    printer = printer_factory.get_printer(:three_dimensional)
    printer.should be_an_instance_of BoardPrinterThreeDim
  end


end