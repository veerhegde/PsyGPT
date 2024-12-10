import hmac
import hashlib

SECRET_KEY = 'your_secret_key'


def hash_password_hmac256(password, salt):
    return hmac.new(SECRET_KEY.encode('utf-8'), msg=(salt + password).encode('utf-8'),
                    digestmod=hashlib.sha256).hexdigest()


def generate_salt(username, any_str):
    # Concatenate username and user_id with a separator that's unlikely to be part of either
    user_specific_string = f"{username}:{any_str}".encode('utf-8')

    # Use SHA-256 to hash the combined string to get a fixed-size output
    salt = hashlib.sha256(user_specific_string).hexdigest()

    return salt