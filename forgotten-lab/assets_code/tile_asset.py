from PIL import Image

# Create a 64x32 image (two 32x32 tiles side by side)
image = Image.new('RGB', (64, 32))

# Left time = floor (warm beige)
for x in range(32):
    for y in range(32):
        image.putpixel((x,y), (210, 195, 160))

# Right tile = wall (dark blue-grey)
for x in range(32, 64):
    for y in range(32):
        image.putpixel((x,y), (70, 80,100))

image.save('tileset.png')
print("tileset.png is created!")