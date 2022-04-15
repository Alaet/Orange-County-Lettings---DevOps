from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path("", include("lettings_site.urls")),
    path("lettings/", include("lettings.urls")),
    path("profiles/", include("profiles.urls")),
    path("admin/", admin.site.urls),
]
