# README

# Sample Bot Setup

This part documents the way to set up a linebot with basic echo function, with Django framework and Heroku platform.



1. Create a conda environment with **line-bot-sdk** and **django** installed, after that set up **requirements.txt** and **Procfile** for later Heroku usage.

```shell
# set up conda environment
conda create python==3.6 line-bot-sdk django --name line
# Create requirements.txt for future Heroku set-up
conda list --export requirements.txt
# create django project (linebot_first is the name of the project)
django-admin startproject linebot_first
cd linebot
# create django app (echo is the name)
python manage.py startapp echo
```

inside **Procfile**:

```shell
# the first "linebot_first" is the project name and second "linebot_first" is the directory inside the project where you store django settings.
web: gunicorn --pythonpath linebot_first linebot_first.wsgi
```

<br>

2. Inside Django original setting, something has to be added/revised, or the website would not come out correctly.

**project_name/project_name/settings.py**, revise the configuration to:

```python
.
.
ALLOWED_HOSTS = ['*']
.
.
# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/

PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))

STATIC_URL = '/static/'

STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static')

# line bot settings

CHANNEL_ACCESS_TOKEN = # include your linebot channel access token

CHANNEL_SECRET = # include your linebor channel secret token
```

<br>

3. revise **project_name/project_name/urls.py** file:

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('echo/', include('echo.urls')) # echo is your app name
]
```

<br>

4. Create **project_name/app_name/urls.py** and include code below inside:

```python
from django.urls import path
from .views import webhook


urlpatterns = [
    path('webhook/', webhook, name='webhook') # webhook is the function name you're using
]
```

<br>

5. Inside **project_name/app_name/views.py**,  include the code below:

**Reference:** https://github.com/jhanjhenyi/django-line-echobot

```python
from django.shortcuts import render

# Create your views here.
import logging

from django.conf import settings
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST
from django.http.request import HttpRequest
from django.http.response import HttpResponse, HttpResponseBadRequest
from linebot import LineBotApi, WebhookHandler
from linebot.exceptions import InvalidSignatureError
from linebot.models import MessageEvent, TextMessage, TextSendMessage

logger = logging.getLogger("django")

line_bot_api = LineBotApi(settings.CHANNEL_ACCESS_TOKEN)
handler = WebhookHandler(settings.CHANNEL_SECRET)


@csrf_exempt
@require_POST
def webhook(request: HttpRequest):
    signature = request.headers["X-Line-Signature"]
    body = request.body.decode()

    try:
        handler.handle(body, signature)
    except InvalidSignatureError:
        messages = (
            "Invalid signature. Please check your channel access token/channel secret."
        )
        logger.error(messages)
        return HttpResponseBadRequest(messages)
    return HttpResponse("OK")


@handler.add(event=MessageEvent, message=TextMessage)
def handl_message(event: MessageEvent):
    if event.source.user_id != "Udeadbeefdeadbeefdeadbeefdeadbeef":
        line_bot_api.reply_message(
            reply_token=event.reply_token,
            messages=TextSendMessage(text=event.message.text),
        )
```

6. Deploy the repository with Heroku and you're done!