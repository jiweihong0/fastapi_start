from sqlalchemy.orm import Session
import models.models as models, schemas.schemas as schemas
import bcrypt
from cal.cal100 import my_async_function
import asyncio
import json
# get_user_by_username return Uid
def get_user_by_username(db: Session, username: str):
    # return Uid
    return db.query(models.UserInfo).filter(models.UserInfo.username == username).first()

def create_user(db: Session, user: schemas.UserCreate):
    hashed_password = bcrypt.hashpw(user.password.encode('utf-8'), bcrypt.gensalt())
    db_user = models.UserInfo(username=user.username, password=hashed_password, age=user.age, email=user.email, department=user.department)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

def check_username_password(db: Session, user: schemas.UserAuthenticate):
    db_user_info: models.UserInfo = get_user_by_username(db, username=user.username)
    return bcrypt.checkpw(user.password.encode('utf-8'), db_user_info.password.encode('utf-8'))

def change_password(db: Session, user: schemas.UserAuthenticate):
    db_user_info: models.UserInfo = get_user_by_username(db, username=user.username)
    hashed_password = bcrypt.hashpw(user.password.encode('utf-8'), bcrypt.gensalt())
    db_user_info.password = hashed_password
    db.commit()
    db.refresh(db_user_info)
    return db_user_info

def create_new_blog(db: Session, blog: schemas.BlogBase):
    db_blog = models.Blog(title=blog.title, content=blog.content)
    db.add(db_blog)
    db.commit()
    db.refresh(db_blog)
    return db_blog

def get_all_blogs(db: Session):
    return db.query(models.Blog).all()

def get_blog_by_id(db: Session, blog_id: int):
    return db.query(models.Blog).filter(models.Blog.id == blog_id).first()

def delete_blog_by_id(db:Session, blog: schemas.Blog):
    db.delete(blog)
    db.commit()    

async def get_wordcloud(db: Session,word):
    result = await my_async_function(word)
    result.reset_index(inplace=True)
    #換成json
    print(result)
    result_rename = result.rename(columns={'label':'text','distance':'weight'})
    result_rename = result_rename.drop(['index'],axis=1)

    distance =  result_rename.to_json(orient='records') 
    ans = json.loads(distance)
    return ans

# create_new_questionnaire
def create_new_questionnaire(db: Session, questionnaire: schemas.QuestionnaireBase):
    print(questionnaire.title)
    db_questionnaire = models.Questionnaire(title=questionnaire.title, content=questionnaire.content)
    db.add(db_questionnaire)
    db.commit()
    db.refresh(db_questionnaire)
    return db_questionnaire

# get questionnaire by userid 
def get_questionnaire_by_userid(db: Session, userid: int):
    return db.query(models.Questionnaire).filter(models.Questionnaire.userid == userid).all()

# get_questionnaire_by_username
def get_questionnaire_by_username(db: Session, username: str):
    db_user_info: models.UserInfo = get_user_by_username(db, username=username)
    db_data = db.query(models.QuestionnaireToUser).filter(models.QuestionnaireToUser.Uid == db_user_info.Uid).all()
    # 用Qnid 去找 全部的Question 再用找到的 Qid 去找全部的 option
    ans = []
    for i in db_data:
        db_questionnaire = db.query(models.Questionnaire).filter(models.Questionnaire.Qnid == i.Qnid).first()
        db_question = db.query(models.Question).filter(models.Question.Qnid == db_questionnaire.Qnid).all()
       
       
        # Question and option  to json
        question = []
        for j in db_question:
            option = []
            db_option = db.query(models.Options).filter(models.Options.Qid == j.Qid).all()
            for k in db_option:
                print(j.Qid,k.Qid)
                if j.Qid == k.Qid:
                    option.append(k)
            question.append({'Qid':j.Qid,'Question':j.question,'Option':option})
        ans.append({'Qnid':db_questionnaire.Qnid,'title':db_questionnaire.title,'content':db_questionnaire.content,'Question':question})
    return ans

#record_questionnaire
def record_questionnaire(db: Session, record: schemas.Record):
    db_record = models.Record( Qid=record.Qid, Uid=record.Uid, Oid=record.Oid)
    db.add(db_record)
    db.commit()
    db.refresh(db_record)
    return db_record





