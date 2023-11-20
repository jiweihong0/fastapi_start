import uvicorn
from fastapi.security import OAuth2PasswordBearer
from jwt import PyJWTError
from sqlalchemy.orm import Session
from fastapi import Depends, FastAPI, HTTPException
from starlette import status
import crud
import models.models as models
import schemas.schemas as schemas
from app_utils import decode_access_token
from crud import get_user_by_username
from database import engine, SessionLocal
from schemas.schemas import UserInfo, TokenData, UserCreate, Token, UserAuthenticate
from fastapi.middleware.cors import CORSMiddleware
from app_utils import create_access_token
from datetime import timedelta
from fastapi.responses import JSONResponse
import json

models.Base.metadata.create_all(bind=engine)

ACCESS_TOKEN_EXPIRE_MINUTES = 10

app = FastAPI(debug=True)

origins = [
    "http://localhost:5173",
    "http://140.133.74.248:8500",
    "http://localhost",
    "http://localhost:8080",
    "http://localhost:8081",
    "http://140.133.74.248:5173"
    
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"], 
)


def get_db():
    db = None
    try:
        db = SessionLocal()
        yield db
    finally:
        db.close()


oauth2_scheme = OAuth2PasswordBearer(tokenUrl="authenticate")


async def get_current_user(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = decode_access_token(data=token)
        username: str = payload.get("sub")
        if username is None:
            raise credentials_exception
        token_data = TokenData(username=username)
    except PyJWTError:
        raise credentials_exception
    user = get_user_by_username(db, username=token_data.username)
    if user is None:
        raise credentials_exception
    return user


@app.post("/user", response_model=UserInfo)
def create_user(user: UserCreate, db: Session = Depends(get_db)):
    db_user = crud.get_user_by_username(db, username=user.username)
    if db_user:
        raise HTTPException(status_code=400, detail="Username already registered")
    return crud.create_user(db=db, user=user)


@app.post("/authenticate", response_model=Token)
def authenticate_user(user: schemas.UserAuthenticate, db: Session = Depends(get_db)):
    db_user = crud.get_user_by_username(db, username=user.username)
    print(db_user.type)
    
    if db_user is None:
        raise HTTPException(status_code=400, detail="Username not existed")
    else:
        is_password_correct = crud.check_username_password(db, user)
        if is_password_correct is False:
            raise HTTPException(status_code=400, detail="Password is not correct")
        else:
            access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
            access_token = create_access_token(
                data={"sub": user.username}, expires_delta=access_token_expires)
            return {"access_token": access_token, "token_type": "Bearer", "type": db_user.type, "auth": db_user.auth}




@app.get("/wordcloud/{word}")
async def get_wordcloud(word,current_user: UserInfo = Depends(get_current_user)
                         , db: Session = Depends(get_db)):
    return await crud.get_wordcloud(db=db,word=word)

@app.post("/user/change_password")
def change_password(user: UserAuthenticate, db: Session = Depends(get_db)):
    db_user = crud.get_user_by_username(db, username=user.username)
    if db_user:
        return crud.change_password(db=db, user=user)
    else:
        raise HTTPException(status_code=400, detail="Username not existed")
    
# do questionnaire
@app.post("/questionnaire", response_model=schemas.Questionnaire)
async def create_new_questionnaire(questionnaire: schemas.QuestionnaireBase, current_user: UserInfo = Depends(get_current_user)
                            , db: Session = Depends(get_db)):
        return crud.create_new_questionnaire(db=db, questionnaire=questionnaire)

# get questionnaire by decode token username
@app.get("/get/questionnaire")
async def get_questionnaire_by_username(current_user: UserInfo = Depends(get_current_user)
                            , db: Session = Depends(get_db)):
        return crud.get_questionnaire_by_username(db=db, username=current_user.username)

# record questionnaire
@app.post("/record/questionnaire", response_model=schemas.Record)
async def record_questionnaire(record: schemas.Record, current_user: UserInfo = Depends(get_current_user)
                            , db: Session = Depends(get_db)):
        return crud.record_questionnaire(db=db, record=record)

@app.post("/new/trailer", response_model=schemas.Tralier)
async def create_new_trailer(trailer: schemas.Tralier, current_user: UserInfo = Depends(get_current_user)
                            , db: Session = Depends(get_db)):
        return crud.create_new_trailer(db=db, trailer=trailer)

@app.post("/new/news", response_model=schemas.News)
async def create_new_news(news: schemas.News, current_user: UserInfo = Depends(get_current_user)
                            , db: Session = Depends(get_db)):
        return crud.create_new_news(db=db, news=news)

@app.post("/new/wordcloud", response_model=schemas.WordCloud)
async def create_new_wordcloud(wordcloud: schemas.WordCloud, current_user: UserInfo = Depends(get_current_user)
                            , db: Session = Depends(get_db)):
        return crud.create_new_wordcloud(db=db, wordcloud=wordcloud)

@app.post("/new/theme", response_model=schemas.Theme)
async def create_new_theme(theme: schemas.Theme, current_user: UserInfo = Depends(get_current_user)
                            , db: Session = Depends(get_db)):
        return crud.create_new_theme(db=db, theme=theme)


@app.get("/cal100_methods2")
async def get_cal():
    aa = "自然"
    result = await crud.get_wordcloud(aa)
    return JSONResponse(content={"async": {"Message": "Get all async..", "output": result}}, status_code=200)

@app.post("/cal100_methods2/{name}")
async def post_cal(name: str):
    result = await crud.get_wordcloud(name)
    
    return JSONResponse(content={"async": {"Message": "Post all async..", "output": result}}, status_code=200)

@app.get("/content/{name}")
async def get_content(name: str):
    return JSONResponse(content=await crud.async_url_20(name), status_code=200)

@app.post("/content/{name}")
async def post_content(name: str):
    return JSONResponse(content=await crud.async_wiki_result(name), status_code=200)

@app.post("/classifies/{nameprops}")
async def post_classify(nameprops: str):
    return JSONResponse(content=await crud.classifies(nameprops), status_code=200)

@app.get("/news")
async def get_news():
    return JSONResponse(content=await crud.get_news(), status_code=200)


if __name__ == "__main__":
    log_config = uvicorn.config.LOGGING_CONFIG
    log_config["formatters"]["access"]["fmt"] = "%(asctime)s - %(levelname)s - %(message)s"
    log_config["formatters"]["default"]["fmt"] = "%(asctime)s - %(levelname)s - %(message)s"
    uvicorn.run(app, log_config=log_config, host="0.0.0.0", port=8500)
