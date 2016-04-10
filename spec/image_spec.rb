require './app/image'

RSpec.describe(Image) do
  let(:image) { Image.new(7, 5) }

  it 'Image not created if unvalid width or height is given' do
    expect { Image.new(0, 5) }.to raise_error(RuntimeError)
    expect { Image.new(7, 0) }.to raise_error(RuntimeError)
  end

  it 'width and height must be define, bitmap must be empty when image is created' do
    expect(image.width).to eq(7)
    expect(image.height).to eq(5)
    expect(image.bitmap.empty?).to eq(true)
  end

  it 'should fill array image' do
    image.fill_image
    expect(image.bitmap.empty?).to eq(false)
    expect(image.bitmap).to eq({[1, 1] => 0, [2, 1] => 0, [3, 1] => 0, [4, 1] => 0, [5, 1] => 0, [6, 1] => 0, [7, 1] => 0, [1, 2] => 0, [2, 2] => 0, [3, 2] => 0, [4, 2] => 0, [5, 2] => 0, [6, 2] => 0, [7, 2] => 0, [1, 3] => 0, [2, 3] => 0, [3, 3] => 0, [4, 3] => 0, [5, 3] => 0, [6, 3] => 0, [7, 3] => 0, [1, 4] => 0, [2, 4] => 0, [3, 4] => 0, [4, 4] => 0, [5, 4] => 0, [6, 4] => 0, [7, 4] => 0, [1, 5] => 0, [2, 5] => 0, [3, 5] => 0, [4, 5] => 0, [5, 5] => 0, [6, 5] => 0, [7, 5] => 0})
  end

  it 'should render image' do
    image.fill_image
    expect(image.show).to eq("0000000\n0000000\n0000000\n0000000\n0000000\n")
  end

  it 'should add color to array image' do
    image.clear
    image.color_image(3, 3, 'Y')
    expect(image.bitmap).to eq({[1, 1] => 0, [2, 1] => 0, [3, 1] => 0, [4, 1] => 0, [5, 1] => 0, [6, 1] => 0, [7, 1] => 0, [1, 2] => 0, [2, 2] => 0, [3, 2] => 0, [4, 2] => 0, [5, 2] => 0, [6, 2] => 0, [7, 2] => 0, [1, 3] => 0, [2, 3] => 0, [3, 3] => 'Y', [4, 3] => 0, [5, 3] => 0, [6, 3] => 0, [7, 3] => 0, [1, 4] => 0, [2, 4] => 0, [3, 4] => 0, [4, 4] => 0, [5, 4] => 0, [6, 4] => 0, [7, 4] => 0, [1, 5] => 0, [2, 5] => 0, [3, 5] => 0, [4, 5] => 0, [5, 5] => 0, [6, 5] => 0, [7, 5] => 0})
  end

  it 'should vertical add color to array image' do
    image.clear
    image.vertical_color(1, 1, 5, 'G')
    expect(image.bitmap).to eq({[1, 1] => "G", [2, 1] => 0, [3, 1] => 0, [4, 1] => 0, [5, 1] => 0, [6, 1] => 0, [7, 1] => 0, [1, 2] => "G", [2, 2] => 0, [3, 2] => 0, [4, 2] => 0, [5, 2] => 0, [6, 2] => 0, [7, 2] => 0, [1, 3] => "G", [2, 3] => 0, [3, 3] => 0, [4, 3] => 0, [5, 3] => 0, [6, 3] => 0, [7, 3] => 0, [1, 4] => "G", [2, 4] => 0, [3, 4] => 0, [4, 4] => 0, [5, 4] => 0, [6, 4] => 0, [7, 4] => 0, [1, 5] => "G", [2, 5] => 0, [3, 5] => 0, [4, 5] => 0, [5, 5] => 0, [6, 5] => 0, [7, 5] => 0})
  end

end