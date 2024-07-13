simple method to reduce noise in quantized audio.

works similar to floyd-steinberg or atkinson dither for images in that it spreads the error due to quantization to the next "pixel" (in this case to the next sample)

best values for the error spreading are unclear. This adds one quarter of the error to the next sample and one eighth to the one after that.
