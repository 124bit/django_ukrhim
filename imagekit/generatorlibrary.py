from .registry import register
from .processors import Thumbnail as ThumbnailProcessor
from .processors import TrimBorderColor, ResizeToFit
from .specs import ImageSpec
from PIL import ImageMath
class TransparentBg(object):
    def __init__(self,color, threshold=0.3):
        self.thresh2=threshold * 195075/1000
        self.color=color

    @staticmethod
    def distance2(a, b):
        return (a[0] - b[0])**2 + (a[1] - b[1])**2 + (a[2] - b[2])**2

    def process(self, image):
        image = image.convert("RGBA")
        red, green, blue, alpha = image.split()
        image.putalpha(ImageMath.eval("""convert(((((t - d(c, (r, g, b))) >> 31) + 1) ^ 1) * a, 'L')""",
            t=self.thresh2, d=self.distance2, c=self.color, r=red, g=green, b=blue, a=alpha))
        return image


class Thumbnail(ImageSpec):
    def __init__(self, width=None, height=None, anchor=None, crop=False, upscale=False, png=0, **kwargs):
        
            
        self.processors = []
        if crop:
            self.processors.append(TrimBorderColor(color=None, tolerance=0.1))
        if png:
            self.processors.append(TransparentBg((255,255,255),1))
            self.format="PNG"
        self.options = { "progressive": 1 , "optimize": 1, "quality": 90 }
        self.processors.append(ResizeToFit(width,height,upscale=upscale))
        super(Thumbnail, self).__init__(**kwargs)


register.generator('imagekit:thumbnail', Thumbnail)
