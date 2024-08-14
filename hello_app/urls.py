from django.urls import path
from .views import GreetAPIView

urlpatterns = [
    path('greet/', GreetAPIView.as_view(), name='greet'),
]