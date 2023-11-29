from datetime import timedelta, datetime
import jwt

# env 
from dotenv import load_dotenv
import os
load_dotenv()
secret_key = os.getenv("secret_key")
algorithm = os.getenv("algorithm")


def create_access_token(*, data: dict, expires_delta: timedelta = None):
    to_encode = data.copy()
    print(to_encode)
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(minutes=15)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, secret_key, algorithm=algorithm)
    return encoded_jwt


def decode_access_token(*, data: str):
    to_decode = data
    return jwt.decode(to_decode, secret_key, algorithms=[algorithm])

