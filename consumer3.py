import time

from selenium import webdriver

import Helpers

if __name__ == '__main__':
    start_time = time.time()
    firefox_options = webdriver.FirefoxOptions()
    filepath = 'webpages/URLS3.txt'
    file1 = open(filepath)
    for line in file1:
        driver = webdriver.Remote(command_executor='http://localhost:4444',
                                  options=firefox_options)
        Helpers.scrap_webpage(driver, line)
        driver.quit()
    file1.close()
    print("--Consumer 3- %s seconds ---" % (time.time() - start_time))
