from PIL import Image

def cequals(c1 : list, c2 : list):
    k = 20
    return abs(c1[0] -c2[0]) < k and abs(c1[1] -c2[1]) < k and abs(c1[2] -c2[2]) < k
# Open an image
image = Image.open("crab.jpg")
width, height = image.size
w_pixels = 24
h_pixels = 18
w_step = image.width / w_pixels
h_step = image.height / h_pixels
print("image height is " + str(height) + " width is " + str(width ))

colors = list()

for w in range(w_pixels):
    for h in range(h_pixels):
        current_pixel = image.getpixel((w_step / 2 + w_step * w, h_step / 2 + h_step * h))
        to_add = True
        for color in colors:
            if cequals(color, current_pixel):
                to_add = False
                break
        if to_add:
            colors.append(current_pixel)
    #  print(current_pixel)

for color in colors:
    print(str(color) + ":" )
    print("[",end="")
    first = True
    for w in range(w_pixels):
        for h in range(h_pixels):
            current_pixel = image.getpixel((w_step / 2 + w_step * w, h_step / 2 + h_step * h))
            if cequals(color, current_pixel):
                if first:
                    first = False 
                    print("(" + str(w) + ", " +str(h) +")", end="")
                else:
                    print(",(" + str(w) + ", " +str(h)+ ")", end="")

    print("]")

       
    #  colors.update(current_pixel)
        




# print(list(sorted(list(colors))))