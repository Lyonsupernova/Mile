from django.http import HttpResponse
import os

def index(request):
    return HttpResponse("Hello, world. Welcome to Mile Apps.")

def healthcheck(request):
    return HttpResponse(os.getenv('ALLOWED_HOSTS'), status=200)
