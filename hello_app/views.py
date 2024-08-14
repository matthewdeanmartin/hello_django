from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Greeting
from .serializers import GreetingSerializer

class GreetAPIView(APIView):
    def get(self, request):
        name = request.query_params.get('name', 'World')
        language = request.query_params.get('language', 'en')

        greetings = {
            'en': f'Hello, {name}!',
            'es': f'Hola, {name}!',
            'fr': f'Bonjour, {name}!'
        }

        greeting_message = greetings.get(language, greetings['en'])

        # Record the greeting event in the database
        greeting = Greeting.objects.create(name=name, language=language)

        # Serialize the data
        serializer = GreetingSerializer(greeting)

        return Response({
            'message': greeting_message,
            'greeting': serializer.data
        }, status=status.HTTP_200_OK)
