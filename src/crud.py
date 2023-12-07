from sqlalchemy.orm import Session
import models.models as models, schemas.schemas as schemas
import bcrypt
from cal.cal100 import my_async_function
from cal.content import url_20,wiki_result,doc2vec
import asyncio
import json
from cal.classify import classify_func
import pandas as pd
from fastapi.responses import JSONResponse
import os
import random
# get_user_by_email return Uid
def get_user_by_email(db: Session, email: str):
    # return Uid
    return db.query(models.UserInfo).filter(models.UserInfo.email == email).first()

def create_user(db: Session, user: schemas.UserCreate):
    hashed_password = bcrypt.hashpw(user.password.encode('utf-8'), bcrypt.gensalt())
    db_user = models.UserInfo(username=user.username, password=hashed_password, age=user.age, email=user.email, department=user.department,type=user.type)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    # create questionnaire_to_user Qnid = 1 Qnid = 2
    db_questionnaire_to_user = models.QuestionnaireToUser(Qnid = 1, Uid = db_user.Uid)
    db.add(db_questionnaire_to_user)
    db.commit()
    db.refresh(db_questionnaire_to_user)
    db_questionnaire_to_user = models.QuestionnaireToUser(Qnid = 2, Uid = db_user.Uid)
    db.add(db_questionnaire_to_user)
    db.commit()
    db.refresh(db_questionnaire_to_user)
    return db_user

def check_email_password(db: Session, user: schemas.UserAuthenticate):
    db_user_info: models.UserInfo = get_user_by_email(db, email=user.email)
    return bcrypt.checkpw(user.password.encode('utf-8'), db_user_info.password.encode('utf-8'))

def change_password(db: Session, user: schemas.UserAuthenticate):
    db_user_info: models.UserInfo = get_user_by_email(db, email=user.email)
    hashed_password = bcrypt.hashpw(user.password.encode('utf-8'), bcrypt.gensalt())
    db_user_info.password = hashed_password
    db.commit()
    db.refresh(db_user_info)
    return db_user_info


async def get_wordcloud(word):
    result = await my_async_function(word)
    result.reset_index(inplace=True)
    #換成json

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

# get_questionnaire_by_email
def get_questionnaire_by_email(db: Session, email: str, Qnid:str):
    # email to Uid
    db_user_info: models.UserInfo = get_user_by_email(db, email=email)
    # Use Uid and Qnid to find SaveQn if not null return error
    db_saveqn = db.query(models.SaveQn).filter(models.SaveQn.Uid == db_user_info.Uid).filter(models.SaveQn.Qnid == Qnid).all()
    if db_saveqn != []:
        message = {"error": {"Message": "User have save this questionnaire"}}
        return JSONResponse(message, status_code= 400)
   
    # 用Qnid 去找 全部的Question 再用找到的 Qid 去找全部的 option
    ans = []
 
    db_questionnaire = db.query(models.Questionnaire).filter(models.Questionnaire.Qnid == Qnid).first()
    db_question = db.query(models.Question).filter(models.Question.Qnid == db_questionnaire.Qnid).all()
    # Question and option  to json
    question = []
    for j in db_question:
        option = []
        db_questooption = db.query(models.Questiontooption).filter(models.Questiontooption.Qid == j.Qid).all()
        for k in db_questooption:
            db_option = db.query(models.Options).filter(models.Options.Oid == k.Oid).first()
            option.append([db_option.option,db_option.Oid])
        # if Qnid == 3 dont random option else random option
        if Qnid == '3':
            option = option
        else:
            option = random.sample(option, len(option))
            
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

def create_new_trailer(db: Session, trailer: schemas.Tralier, email):
    user_id = db.query(models.UserInfo).filter(models.UserInfo.email == email).first()
    # find Uid in trailer > 0 return error
    db_trailer = db.query(models.Tralier).filter(models.Tralier.Uid == user_id.Uid).all()
    if db_trailer != []:
        message = {"error": {"Message": "User have save this questionnaire"}}
        return JSONResponse(message, status_code= 400)
    db_trailer = models.Trailer(Uid = user_id.Uid, Q1 = trailer.Q1, Q2 = trailer.Q2, Q3 = trailer.Q3, Q4 = trailer.Q4, Q5 = trailer.Q5, Q6 = trailer.Q6)
    db.add(db_trailer)
    db.commit()
    db.refresh(db_trailer)
    message_success = {"success":{"Message": "Save success"}}
    return JSONResponse(message_success, status_code= 200)

def create_new_news(db: Session, news: schemas.News, email):
    user_id = db.query(models.UserInfo).filter(models.UserInfo.email == email).first()
    # find Uid in  news > 0 return error
    db_news = db.query(models.News).filter(models.News.Uid == user_id.Uid).all()
    if db_news != []:
        message = {"error": {"Message": "User have save this questionnaire"}}
        return JSONResponse(message, status_code= 400)
    db_news = models.News(Uid = user_id.Uid, Q1 = news.Q1, Q2 = news.Q2, Q3 = news.Q3, Q4 = news.Q4)
    db.add(db_news)
    db.commit()
    db.refresh(db_news)
    message_success = {"success":{"Message": "Save success"}}
    return JSONResponse(message_success, status_code= 200)

def create_new_wordcloud(db: Session, wordcloud, email):
    user_id = db.query(models.UserInfo).filter(models.UserInfo.email == email).first()
    # find Uid in  wordcloud > 0 return error
    db_wordcloud = db.query(models.WordCloud).filter(models.WordCloud.Uid == user_id.Uid).all()
    if db_wordcloud != []:
        message = {"error": {"Message": "User have save this questionnaire"}}
        return JSONResponse(message, status_code= 400)
    db_wordcloud = models.WordCloud(Uid = user_id.Uid, Q1 = wordcloud.Q1, Q2 = wordcloud.Q2, Q3 = wordcloud.Q3, Q4 = wordcloud.Q4)
    db.add(db_wordcloud)
    db.commit()
    db.refresh(db_wordcloud)
    message_success = {"success":{"Message": "Save success"}}
    return JSONResponse(message_success, status_code= 200)

def create_new_theme(db: Session, theme: schemas.Theme, email):
    user_id = db.query(models.UserInfo).filter(models.UserInfo.email == email).first()
    # find Uid in  theme > 0 return error
    db_theme = db.query(models.Theme).filter(models.Theme.Uid == user_id.Uid).all()
    if db_theme != []:
        message = {"error": {"Message": "User have save this questionnaire"}}
        return JSONResponse(message, status_code= 400)
    db_theme = models.Theme(Uid = user_id.Uid, Q1 = theme.Q1, Q2 = theme.Q2, Q3 = theme.Q3, Q4 = theme.Q4)
    db.add(db_theme)
    db.commit()
    db.refresh(db_theme)
    message_success = {"success":{"Message": "Save success"}}
    return JSONResponse(message_success, status_code= 200)

async def async_url_20(aa):
    result = await url_20(aa)
    result.reset_index(inplace=True)
    distance = result.to_json(orient='records') 
    ans = json.loads(distance)
    return {"async": {"Message": "Get all async..", "url": ans}}

async def async_wiki_result(name):
    result = await doc2vec(name)
    result_wiki = await wiki_result(name)
    result.reset_index(inplace=True)
    result_rename = result.rename(columns={'title':'url','url':'title','module':'module'})
    result_rename = result_rename.drop(['index'],axis=1)
    distance = result_rename.to_json(orient='records')    
    ans = json.loads(distance)
    return {"async": {"Message": "Post all async..","wiki_url":"https://zh.wikipedia.org/wiki/"+name, "introduce":result_wiki[0:500],"output":ans}}

async def classifies(nameprops):
    result = await classify_func(nameprops)
    return result

async def get_news():
    path = os.getcwd()
    # Read global.xlsx
    df_newurl = pd.read_csv(path + '/cal/url.csv',encoding='utf-8')
    print(df_newurl)
    # to json by big5
    json_newurl = df_newurl.to_json(orient='records')
    ans = json.loads(json_newurl)
    return ans

def save_answer(db: Session, json_body,email):
    # json to pd 
    df = pd.DataFrame(json_body['Question'])
    db_user_info: models.UserInfo = get_user_by_email(db, email=email)
    # find Uid db_user_info.Uid in saveqn
    db_saveqn_user = db.query(models.SaveQn).filter(models.SaveQn.Uid == db_user_info.Uid).filter(models.SaveQn.Qnid == int(json_body["Qnid"])).all()

    # db_saveqn_user db_saveqn_qnid not null return error
    if db_saveqn_user != [] :
        message = {"error": {"Message": "User have save this questionnaire"}}
        return JSONResponse(message, status_code= 400)
    for i in range(len(df)):
        # Qid Oid
        Qid = int(df.iloc[i]['Qid'])
        Oid = int(df.iloc[i]['Option'][0][1])
        db_saveqn = models.SaveQn( Uid = int(db_user_info.Uid),Qnid = int(json_body["Qnid"]),Qid = Qid, Oid = Oid)
        db.add(db_saveqn)
        db.commit() 
        db.refresh(db_saveqn)
    print(json_body["Qnid"])
    if int(json_body["Qnid"]) == 3:
    #     # read df Qid 87-134  learning_style
    #     learning_style = df[df['Qid'].between(87, 134)]
    #     # read Qid 135-194 others
    #     others = df[df['Qid'].between(135, 194)]
    #    # learning_style Qid 87-134 option index 144-147 to point 1-4 to array
    #     learning_style = learning_style['Option'].tolist()
    #     learning_style = [i[0][1] for i in learning_style]

    #     # learning_style 144 = 1, 145 = 2, 146 = 3, 147 = 4
    #     score_learning_style = sum({144: 1, 145: 2, 146: 3, 147: 4}.get(i, 0) for i in learning_style)

    #     # others Qid 135-194 option index 144-147 to point 1-5 to array
    #     others = others['Option'].tolist()
    #     others = [i[0][1] for i in others]
  
    #     # Map others to scores and update the total score
    #     score_others = sum({148: 1, 149: 2, 150: 3, 151: 4, 152: 5}.get(i, 0) for i in others)
       
    #     # score
    #     score = score_learning_style + score_others
        message_success = {"success":{"Message": "Save success"}}
        return JSONResponse(message_success, status_code= 200)
    # read correct from db
    db_correct = db.query(models.correct).filter(models.correct.Qnid == int(json_body["Qnid"])).all()
    # correct to json
    correct = []
    # df oid = df option[0][1]
    df['Oid'] = df['Option'].apply(lambda x: x[0][1])
    for i in db_correct:
        correct.append({'Qid':i.Qid,'Oid':i.Oid})
    # correct to pd
    df_correct = pd.DataFrame(correct)
    # 答對哪幾題
    df_correct = pd.merge(df,df_correct,how='inner',on=['Qid','Oid'])
    # 答對幾題
    correct_count = len(df_correct)
    # 答對哪幾題
    correct = df_correct['Qid'].tolist()
    # 答對率
    correct_rate = correct_count/len(df)

    message_success = {"success": {"Message": "Save success", "correct_count": correct_count, "correct": correct, "correct_rate": correct_rate}}
    return JSONResponse(message_success, status_code= 200)

def correct (db: Session,json_body, email):
    db_user_info: models.UserInfo = get_user_by_email(db, email=email)
    # find Uid db_user_info.Uid in saveqn
    df_data = db.query(models.SaveQn).filter(models.SaveQn.Uid == db_user_info.Uid).all()
    # get correct answer
    db_correct = db.query(models.correct).filter(models.correct.Qnid == int(json_body["Qnid"])).all()
    # compare correct answer and user answer
    correct = []
    for i in db_correct:
        correct.append({'Qid':i.Qid,'Oid':i.Oid})
    # correct to pd
    df_correct = pd.DataFrame(correct)
    # user answer
    user_answer = []
    for i in df_data:
        user_answer.append({'Qid':i.Qid,'Oid':i.Oid})
    # user answer to pd
    df_user_answer = pd.DataFrame(user_answer)
    # 答對哪幾題
    df_correct = pd.merge(df_user_answer,df_correct,how='inner',on=['Qid','Oid'])
    # 答對幾題
    correct_count = len(df_correct)
    # 答對哪幾題
    correct = df_correct['Qid'].tolist()
    # 答對率
    correct_rate = correct_count/len(df_data)
    message_success = {"success": {"Message": "Save success", "correct_count": correct_count, "correct": correct, "correct_rate": correct_rate}}
    return JSONResponse(message_success, status_code= 200)