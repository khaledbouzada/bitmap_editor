require './app/image'

RSpec.describe(Image) do
  let(:image) { Image.new(7, 5) }

  it 'Image not created if unvalid width or height is given' do
    expect{ Image.new(0, 5) }.to raise_error(RuntimeError)
    expect{ Image.new(7, 0) }.to raise_error(RuntimeError)
  end

  it 'width and height must be define, bitmap must be empty when image is created' do
    expect(image.width).to eq(7)
    expect(image.height).to eq(5)
    expect(image.bitmap.empty?).to eq(true)
  end

end