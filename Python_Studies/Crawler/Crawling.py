# Environment Preparation =============================================================
'''
After install Anaconda
pip install jupyter
# Check environments
conda env list
# Creating a environment for web crawling
conda create --name crawler python=3
# Activate environment
conda activate crawler
# Installing required packages
pip install -r requirements.txt
(requests, beautifulsoup4, pyquery, selenium, numpy, pandas, ipykernel)
# Check Jupyker kernels
jupyter kernelspec list
# Connecting kernel with environment
python -m ipykernel install --user --name crawler --display-name "crawler"
'''

# Web Scraping Methods =============================================================
'''
## Web Scraping Methods
- Web API
    - `.json`
    - `requests`
- Non Web API
    - `.html`
    - `requests` + Parser(beautifulsoup4, pyquery)
- Browser Automation
    - `selenium`
'''

# Web API ===============================================================================
'''
## Web API Examples
- [data.nba.net](http://data.nba.net/prod/v1/today.json)
- [空氣品質指標(AQI)](https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json)
- [PCHome 線上購物](https://ecshweb.pchome.com.tw/search/v3.3/all/results?q=macbook&page=1&sort=sale/dc)
### Important attrs / methods
- `r = requests.get(URL)`
- `r.status_code`
- `r.json()`: `dict` / `list`
- `r.content`: `bytes`
- `r.text`: `str`
'''
# Basic Methods
import requests
r = requests.get("http://data.nba.net/prod/v1/20190514/scoreboard.json", verify=False) # get json data
r.status_code
r.json() # 自動換成dict
r.json().keys()
r.content # 若回傳資料非結構化資料(bytes)，較舊的解析器，如python2之前的版本
r.text # 若回傳資料非結構化資料(str)

# Examples
import requests
r = requests.get("https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json", verify=False)
aqi_data = r.json()
# How many sites in Taiwan?
len(aqi_data)
# How many sites in Taipei City?
ans = 0
for i in aqi_data:
    if i["County"] == "臺北市":
         ans += 1
print(ans)
# Highest PM2.5 site name? 
import numpy as np
site_names = [aqi_data[i]['SiteName'] for i in range(len(aqi_data))]
pm25 = np.zeros(len(site_names))
for i in range(len(aqi_data)):
    if aqi_data[i]['PM2.5'] == '' or aqi_data[i]['PM2.5'] == 'ND':
        pm25[i] = np.nan
    else:
        pm25[i] = float(aqi_data[i]['PM2.5'])
max_pm25 = pm25[~np.isnan(pm25)].max()
min_pm25 = pm25[~np.isnan(pm25)].min()
print(max_pm25)
print(min_pm25)
for idx, val in enumerate(pm25):
    if val == max_pm25:
        print(site_names[idx])
np.array(site_names)[pm25 == max_pm25]
# Lowest PM2.5 site name? 
for idx, val in enumerate(pm25):
    if val == min_pm25:
        print(site_names[idx])

# Non Web API ===============================================================================
'''
## Non Web API
- `requests` Getting data
- `beautifulsoup4` / `pyquery` Parsing data
### Examples
- [Avengers: Endgame (2019)](https://www.imdb.com/title/tt4154796)
- [Yahoo! 奇摩股市](https://tw.stock.yahoo.com/d/i/rank.php?t=pri&e=tse&n=100)
- [PTT 實業坊](https://www.ptt.cc/bbs/NBA/index.html)
'''
# Requests
import requests
r = requests.get("https://tw.stock.yahoo.com/d/i/rank.php?t=pri&e=otc", verify=False) # get nonWEBAPI data
print(r.status_code)
html_str = r.text
print(len(html_str))
# Requests With Cookies
cookie = {"over18":"1"}
r = requests.get("https://tw.stock.yahoo.com/d/i/rank.php?t=pri&e=otc", verify=False, cookies=cookie)
# BeautifulSoup
from bs4 import BeautifulSoup
soup = BeautifulSoup(html_str)
# Strip the text
name = []
for i in soup.select(".name a"):
    d = i.text.strip()
    name.append(d)
# Pandas Dataframe
import pandas as pd
Stock = pd.Dataframe()
Stock['Name'] = name
# Examples
tickers = [i.text.split()[0] for i in soup.select(".name a")]
companies = [i.text.split()[1] for i in soup.select(".name a")]

# 動態網頁 =========================================================================================
'''
## Selenium

<https://selenium-python.readthedocs.io/>

- `selenium` package
- Update Chrome / Firefox
- Download ChromeDriver / Geckodriver
    - ChromeDriver: <https://chromedriver.storage.googleapis.com/index.html?path=74.0.3729.6/>
    - Geckodriver: <https://github.com/mozilla/geckodriver/releases/tag/v0.24.0>
- Common driver method calls
    - `webdriver.BROWSER(executable_path="PATH_TO_YOUR_DRIVER")` to initiate driver: Chrome / Firefox
    - `driver.get(URL)` to get to specific URL
    - `driver.back()` to move backward
    - `driver.forward()` to move forward
    - `driver.close()` to close driver
    - `driver.find_element_by_XXX()` to select specific **element** by different locators
        - find_element_by_id
        - find_element_by_name
        - find_element_by_xpath
        - find_element_by_link_text
        - find_element_by_partial_link_text
        - find_element_by_tag_name
        - find_element_by_class_name
        - find_element_by_css_selector
    - `driver.find_elements_by_XXX()` to select specific **elements** by different locators
        - find_elements_by_name
        - find_elements_by_xpath
        - find_elements_by_link_text
        - find_elements_by_partial_link_text
        - find_elements_by_tag_name
        - find_elements_by_class_name
        - find_elements_by_css_selector
- Common element methods/attributes
    - `.send_keys()`
    - `.click()`
    - `.text`
'''
# Import Webdriver
from  selenium import webdriver
driver = webdriver.Firefox(executable_path = "geckodriver.exe")
# Basic Methods
driver.get("http://www.bbc.com/news")
driver.back()
driver.forward()
driver.close()
# Get Element by XPath
from selenium import webdriver
driver = webdriver.Firefox(executable_path = "geckodriver.exe")
driver.get("https://www.imdb.com/")
elem = driver.find_element_by_xpath("//input[@id='navbar-query']")
elem.send_keys("Avenger: Endgame (2019)")
elem.click()
elem = driver.find_elements_by_xpath("//div[@class='subtext']/a")
g = [i.text for i in elem]
elem = driver.find_element_by_xpath("//span[@itemprop='ratingValue']")
r = float(elem.text)






