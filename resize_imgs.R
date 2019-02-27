

# Resize images -----------------------------------------------------------

library(magick)


imgs <- list.files(path = "www/hex/", pattern = "png$", full.names = TRUE)
for (i in imgs) {
  img <- image_read(i)
  img <- image_scale(img, "120x139")
  image_write(image = img, path = i)
}


img <- image_read("www/rstats-hex.png")
img <- image_scale(img, "120x139")
image_write(image = img, path = "www/rstats-hex.png")

