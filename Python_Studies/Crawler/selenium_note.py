#  -*- coding: utf8 -*-
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

# selenium option setup
chrome_options = Options()
chrome_options.add_argument('--headless')
chrome_options.add_experimental_option("prefs", {
    "download.default_directory": current_directory,
    "download.prompt_for_download": False,
})
driver = webdriver.Chrome(executable_path=current_directory + '\\chromedriver.exe', chrome_options=chrome_options)
driver.command_executor._commands["send_command"] = (
    "POST", '/session/$sessionId/chromium/send_command')
params = {'cmd': 'Page.setDownloadBehavior',
          'params': {'behavior': 'allow', 'downloadPath': current_directory}}
command_result = driver.execute("send_command", params)

# switch to frame 
driver.switch_to.frame(driver.find_element_by_name('siteframe'))

# switch back to original frame
driver.switch_to.default_content()