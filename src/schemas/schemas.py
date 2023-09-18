from pydantic import BaseModel 

class UserInfoBase(BaseModel):
    username : str 

class UserCreate(UserInfoBase):
    age: int
    email: str
    department: str
    password: str



class UserAuthenticate(UserInfoBase):
    password: str


class UserInfo(UserInfoBase):
    id: int

    class Config:
        orm_mode = True


class Token(BaseModel):
    access_token: str
    token_type: str


class TokenData(BaseModel):
    username: str = None


class BlogBase(BaseModel):
    title: str
    content: str


class Blog(BlogBase):
    id: int

    class Config:
        orm_mode = True

# Questionnaire
class Questionnaire(BaseModel):
    title: str
    content: str

    class Config:
        orm_mode = True

# QuestionnaireBase
class QuestionnaireBase(BaseModel):
    title: str
    content: str
    
    class Config:
        orm_mode = True

# QuestionnaireToUser
class QuestionnaireToUser(BaseModel):
    Qnid: int
    Uid: int
    
    class Config:
        orm_mode = True

# form
class form(BaseModel):
    name: str
    email: str
    phone: str
    message: str
    
    class Config:
        orm_mode = True

# Question
class Question(BaseModel):
    question: str
    Qnid: int

    
    class Config:
        orm_mode = True

# Options
class Options(BaseModel):
    option: str
    Qid: int
    
    class Config:
        orm_mode = True
    
# Record
class Record(BaseModel):
    Qid: int
    Uid: int
    Oid: int
    
    class Config:
        orm_mode = True
