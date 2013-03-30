from django.db import models

from categories.models import CategoryBase
class MyModel(models.Model):
    name = models.CharField(max_length=100)