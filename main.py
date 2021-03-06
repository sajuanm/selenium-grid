import time
from multiprocessing import Process
from selenium import webdriver

import Helpers
import hub

BatchSize = 23


def func1(_firefox_options, _line):
    driver = webdriver.Remote(command_executor=hub.hub_address,
                              options=_firefox_options)
    driver.delete_all_cookies()
    Helpers.scrap_webpage(driver, _line)
    driver.quit()


def batch(_filepath, _init, _end):
    procs = []

    print("batch: " + str(init) + " - " + str(_end))
    with open(_filepath) as fp:
        for i, line in enumerate(fp):
            if _init <= i <= _end:
                proc = Process(target=func1, args=(firefox_options, line))
                procs.append(proc)
                proc.start()

        while len(procs) > 0:
            procs = [job for job in procs if job.is_alive()]
            time.sleep(1)

    fp.close()


if __name__ == '__main__':
    start_time = time.time()
    firefox_options = webdriver.FirefoxOptions()
    filepath = 'webpages/URLS.txt'

    size = len(open(filepath).readlines())

    init = 0
    end = BatchSize

    while BatchSize <= end <= size:
        batch(filepath, init, end)
        init = end + 1
        if end == size:
            break
        elif end + BatchSize + 1 > size:
            end += size - end
        else:
            end += BatchSize + 1

    print("--Process time: - %s seconds ---" % (time.time() - start_time))
