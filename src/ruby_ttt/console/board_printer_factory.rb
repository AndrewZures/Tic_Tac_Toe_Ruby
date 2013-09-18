require_relative './board_printers/board_printer_two_dim'
require_relative './board_printers/board_printer_three_dim'

class BoardPrinterFactory

  def get_printer(printer_type)
    if printer_type == :three_dimensional then BoardPrinterThreeDim.new
    else BoardPrinterTwoDim.new end
  end
end