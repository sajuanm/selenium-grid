import io
import time
import warnings
from io import BytesIO

from PIL import Image
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By

# Ignore PIL library warnings from image_reduce_to_jpg()
warnings.simplefilter('ignore', Image.DecompressionBombWarning)


def image_reduce_to_jpg(image, quality_reduction):
    original_image = Image.open(BytesIO(image))
    bytes_stream = BytesIO()
    original_image.convert(mode='RGB').save(bytes_stream, format='JPEG')
    return bytes_stream.getvalue()


def get_screenshot(body, driver, url):
    """

    :param url:
    :param body:
    :param driver:
    :return:
    """
    size = lambda property: driver.execute_script(f'return document.body.parentNode.scroll{property}')

    # First, set screen width as desired to take then its corresponding height
    width, height = size('Width'), size('Height')

    driver.set_window_size(width, height)
    screenshot = image_reduce_to_jpg(body.screenshot_as_png, None)

    dt_string = time.time() * 1000
    # saving the final output
    # as a jpg file
    image = Image.open(io.BytesIO(screenshot))
    name = url.rstrip() + str(dt_string)
    name_formatted = name.replace("/", "").replace(".", "").replace("https:", "")
    image.save(fp="screenshots/" + name_formatted + ".png", format="PNG")


def scrap_webpage(driver, url):
    """
    Function that scraps a web page and instantiates a ScrapedProduct object with the information obtained.

    :param driver:
    :param str url: The URL to scrap
    """
    scraped = False

    driver.get(url)
    # Make a GET request to fetch the raw HTML content
    body = driver.find_element(By.TAG_NAME, 'body')
    html = body.parent.page_source
    # Parse the html content
    soup = BeautifulSoup(html, "html.parser")
    get_screenshot(body, driver, url)

    scraped = True

    print("Content scrapped: " + str(scraped))
