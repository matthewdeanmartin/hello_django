from rest_framework import serializers
from .models import Greeting

class GreetingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Greeting
        fields = ['id', 'name', 'language', 'timestamp']