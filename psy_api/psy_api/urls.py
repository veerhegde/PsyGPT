"""
URL configuration for psy_api project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from .controller import user_controllers
from rest_framework_swagger.views import get_swagger_view

# schema_view = get_swagger_view(title='Pastebin API')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('psyapi/v1/users/auth/login', user_controllers.user_auth),
    path('psyapi/v1/users/auth/logout', user_controllers.user_auth),
    path('psyapi/v1/users/auth/register', user_controllers.user_auth),
    path('psyapi/v1/users/profile', user_controllers.user_profile),
    path('psyapi/v1/users/profile/update', user_controllers.user_profile),
    path('psyapi/v1/users/profile/delete', user_controllers.user_profile),
    path('accounts/', include('allauth.urls')),
    # path('psyapi/v1/swagger', schema_view)
]
