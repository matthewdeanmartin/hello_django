from django.db import models

class Greeting(models.Model):
    name = models.CharField(max_length=100)
    language = models.CharField(max_length=20)
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Greeting {self.name} in {self.language} at {self.timestamp}"
