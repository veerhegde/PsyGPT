import json
from datetime import datetime, timedelta

import jwt
from django.http import JsonResponse

from psy_api.settings import db_service
from psy_api.utils.crypto_utils import hash_password_hmac256, generate_salt


class UserServices:

    def get_profile(self, user_id):
        try:
            pass
        except Exception as e:
            return None

    def user_login(self, username, password):
        login_dict = {}
        try:
            user = db_service.find_documents('auth_user', {'user_name': username})
            if not user:
                return False
            stored_password_with_salt = user[0]['password']
            salt, stored_hash = stored_password_with_salt.split(':')
            input_hash = hash_password_hmac256(password, salt)
            access_token = jwt.encode({
                'username': username,
                'exp': datetime.utcnow() + timedelta(minutes=15)  # Access token expires in 15 minutes
            })

            refresh_token = jwt.encode({
                'username': username,
                'exp': datetime.utcnow() + timedelta(days=7)  # Refresh token expires in 7 days
            })
            login_dict['access_token'] = access_token
            login_dict['refresh_token'] = refresh_token
            login_dict['user_id'] = user[0]['user_id']

            return login_dict, stored_hash == input_hash
        except Exception as e:
            return False

    def user_logout(self, user_id):
        try:
            pass
        except Exception as e:
            return False

    def user_register(self, data):
        reg_dict = {}
        data = json.loads(data)
        required_fields = ['username', 'password', 'email', 'phone', 'full_name', 'emergency_contact', 'name_emergency_constant']
        if not all(field in data for field in required_fields):
            return JsonResponse({'error': 'Missing required user information'}, status=400)
        try:
            user_data = {
                'user_name': data['username'],
                'full_name': data['fullName'],
                'email': data['email'],
                'phone_no': data['phone'],
                'emergency_contact': data['emergency_contact'],
                'name_emergency_constant':data['name_emergency_constant'],
                'createdAt': datetime.now(),
                'updatedAt': datetime.now()
            }
            user = db_service.insert_document('users', user_data)
            salt = generate_salt(data['username'], user)
            password_hash = hash_password_hmac256(data['password'], salt)
            auth_user_data = {
                'user_id': user['id'],
                'username': data['username'],
                'password': f"{salt}:{password_hash}",
                'created_at': datetime.now(),
                'updated_at': datetime.now()
            }
            db_service.insert_document('user_token', auth_user_data)
            access_token = jwt.encode({
                'username': data['username'],
                'exp': datetime.utcnow() + timedelta(minutes=15)  # Access token expires in 15 minutes
            })

            refresh_token = jwt.encode({
                'username': data['username'],
                'exp': datetime.utcnow() + timedelta(days=7)  # Refresh token expires in 7 days
            })
            auth_user = db_service.insert_document('auth_user', auth_user_data)
            reg_dict['access_token'] = access_token
            reg_dict['refresh_token'] = refresh_token
            reg_dict['user_id'] = user['id']
            reg_db = db_service.insert_document('user_token', reg_dict)
            return reg_db, reg_dict
        except Exception as e:
            return False
