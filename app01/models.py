from django.db import models

# Create your models here.
class Xinxi(models.Model):
    user =models.CharField(max_length=32)
    pwd = models.CharField(max_length=32)
