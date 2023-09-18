from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
## load DB_URL from .env file
from dotenv import load_dotenv
import os
load_dotenv()

SQLALCHEMY_DATABASE_URL = os.getenv("DB_URL")




# SQLALCHEMY_DATABASE_URL = "mysql+mysqlconnector://root:password@mysql:3306/restapi"

engine = create_engine(SQLALCHEMY_DATABASE_URL)



SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

print(SessionLocal) 
print(Base)
