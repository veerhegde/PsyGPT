import json
from django.http import JsonResponse
from django.views.decorators.http import require_http_methods
from psy_api.services.user_services import UserServices



user_service = UserServices()


@require_http_methods(["POST"])
def user_auth(request):
    try:
        data = json.loads(request.body)
        auth_type = data['auth_type']
        if auth_type == 'login':
            username = data['username']
            password = data['password']
            login_dict, is_auth = user_service.user_login(username, password)
            if is_auth:
                return JsonResponse({'user_id': login_dict['user_id'], 'access_token': login_dict['access_token'], 'refresh_token': login_dict['refresh_token']}, status=200)
            else:
                return JsonResponse({'error': 'Wrong username or password'}, status=400)
        if auth_type == 'register':
            reg_db, reg_dict = user_service.user_register(data)
            if reg_db:
                return JsonResponse(reg_dict, status=200)
        if auth_type == 'logout':
            user_id = data['user_id']
            user_service.user_logout(user_id)
    except Exception as e:
        print(e)
