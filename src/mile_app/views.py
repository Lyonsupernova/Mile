from django.http import HttpResponse


def index(request):
    return HttpResponse("Hello, world. Welcome to Mile Apps.")


def healthcheck(request):
    return HttpResponse("OK", status=200)