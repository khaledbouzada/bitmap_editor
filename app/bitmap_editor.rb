class BitmapEditor

  def run
    @running = true, @image = nil
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      case input
        when /^I ([1-9][0-9]*) ([1-9][0-9]*)$/
          create_image($1.to_i, $2.to_i)
        when 'C'
          clear_image
        when /^L ([1-9][0-9]*) ([1-9][0-9]*) ([A-Z])$/
          color_image($1.to_i, $2.to_i, $3)
        when 'S'
          show_image
        when '?'
          show_help
        when 'X'
          exit_console
        else
          puts 'unrecognized command :('
      end
    end
  end

  private

  def create_image(width, height)
    @image = Image.new(width, height)
    @image.fill_image
  end

  def clear_image
    @image.nil? ? show_error : @image.clear
  end

  def color_image(x, y, color)
    @image.nil? ? show_error : @image.color_image(x, y, color)
  end

  def show_image
    @image.nil? ? show_error : @image.show
  end

  def display_matrix
    @image ? ImageView.new(@image).display : error
  end

  def exit_console
    puts 'goodbye!'
    @running = false
  end

  def show_help
    puts "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"
  end

  def show_error
    puts "Please create an image first!"
  end


end
