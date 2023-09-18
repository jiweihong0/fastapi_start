from enum import unique
from sqlalchemy import Column, String, Integer, ForeignKey
from database import Base 

class UserInfo(Base):
    __tablename__ = 'user_info'

    Uid = Column(Integer, primary_key=True, index = True)
    age = Column(Integer)
    email = Column(String(50), unique=True)
    department = Column(String(50))
    username = Column(String(50))
    password = Column(String(300))
    # fullname = Column(String(50), unique=True)

class Blog(Base):
    __tablename__ = 'blog'

    id = Column(Integer, primary_key=True, index = True)
    title = Column(String(100))
    content = Column(String(200))
 


class Question(Base):
    __tablename__ = 'question'

    Qid = Column(Integer, primary_key=True, index = True)
    question = Column(String(100))
    Qnid = Column(Integer, ForeignKey('questionnaire.Qnid'))
    # fullname = Column(String(50), unique=True)

class Options(Base):
    __tablename__ = 'options'

    Oid = Column(Integer, primary_key=True, index = True)
    option = Column(String(100))
    Qid = Column(Integer, ForeignKey('question.Qid'))
    # fullname = Column(String(50), unique=True)

class Record(Base):
    __tablename__ = 'record'

    Rid = Column(Integer, primary_key=True, index = True)
    Uid = Column(Integer, ForeignKey('user_info.Uid'))
    Qid = Column(Integer, ForeignKey('question.Qid'))
    Oid = Column(Integer, ForeignKey('options.Oid'))
    # fullname = Column(String(50), unique=True)

# Questionnaire
class Questionnaire(Base):
    __tablename__ = 'questionnaire'

    Qnid = Column(Integer, primary_key=True, index = True)
    title = Column(String(100))
    content = Column(String(200))
    # fullname = Column(String(50), unique=True)

# QuestionnaireToUser
class QuestionnaireToUser(Base):
    __tablename__ = 'questionnaire_to_user'

    id = Column(Integer, primary_key=True, index = True)
    Qnid = Column(Integer, ForeignKey('questionnaire.Qnid'))
    Uid = Column(Integer, ForeignKey('user_info.Uid'))
