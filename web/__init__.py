

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options

from PySide2 import QtCore



class SyncSketchInstance(QtCore.QObject):
    IncorrectLogin = QtCore.Signal()

    def __init__(self):
        super().__init__()
        self.driver = webdriver.Chrome()
        self.driver.get(r"https://syncsketch.com/login")

    def login(self, email, password):
        _email_element = self.driver.find_element(By.NAME, "email")
        _get_started_button = self.driver.find_element(By.ID, "getStartedButton")
        _social_logon_elements = self.driver.find_element(By.ID, "social_login")

        _email_element.send_keys(email)
        _get_started_button.click()

        self.wait()
        _password_element = self.driver.find_element(By.NAME, "password")

        _password_element.send_keys(password)
        _get_started_button.submit()

        self.check_for_login_errors()

    def wait(self):
        self.driver.implicitly_wait(10)
        # WebDriverWait(driver=self.driver, timeout=10)

    def check_for_login_errors(self):
        self.wait()

        error_message = "Your Email or Password are not correct. Please try again!"
        errors = self.driver.find_elements(By.CLASS_NAME, "errorlist")

        # When errors are found, the login will fail.
        if any(error_message in e.text for e in errors):
            print("[!] Login failed")
            self.IncorrectLogin.emit()
        else:
            print("[+] Login successful")



if __name__ == "__main__":
    _sy = SyncSketchInstance()

    _sy.login("basemail@ggg.com", "password")
