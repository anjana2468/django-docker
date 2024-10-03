from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return render(request, 'demo_site.html')

# Create your views here.
