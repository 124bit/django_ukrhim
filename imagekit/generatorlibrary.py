from .registry import register
from .processors import Thumbnail as ThumbnailProcessor
from .processors import TrimBorderColor, ResizeToFit
from .specs import ImageSpec


class Thumbnail(ImageSpec):
    def __init__(self, width=None, height=None, anchor=None, crop=False, upscale=None, **kwargs):
        
            
        self.processors = []
        if crop:
            self.processors.append(TrimBorderColor(color=None, tolerance=0.1))
        self.processors.append(ResizeToFit(width,height))
        super(Thumbnail, self).__init__(**kwargs)


register.generator('imagekit:thumbnail', Thumbnail)
