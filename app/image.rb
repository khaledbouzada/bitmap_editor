class Image

  BACKGROUND = 0
  attr_reader :width, :height, :bitmap

  def initialize(width, height)
    @width = width < 1 ? raise : width
    @height = height < 1 ? raise : height
    @bitmap = Hash.new
  end

  def clear
    fill_image
  end

  def show
    image_array = ''
    1.upto(@height) do |y|
      1.upto(@width) do |x|
        image_array += @bitmap[[x, y]].to_s
      end
      image_array += "\n"
    end
    image_array
  end

  def fill_image
      1.upto(@height) do |y|
        1.upto(@width) do |x|
          @bitmap[[x, y]] = BACKGROUND
        end
      end
  end

  def color_image(x, y, color)
    @bitmap[[x, y]] = @bitmap.key?([x, y]) ? color : raise
  end

  def vertical_color(x, y1, y2, color)
    y1.upto(y2) do |y|
      @bitmap[[x, y]] = @bitmap.key?([x, y]) ? color : raise
    end
  end



end