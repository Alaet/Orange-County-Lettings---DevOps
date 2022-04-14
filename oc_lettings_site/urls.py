from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('', include('lettings_site.urls')),
    path('lettings/', include('lettings.urls')),
    path('profiles/', include('profiles.urls')),
    path('admin/', admin.site.urls),
]
