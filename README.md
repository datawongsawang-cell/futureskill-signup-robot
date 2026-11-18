# Future Skill Sign-up Test – Robot Framework + Selenium

Class Project: an automated UI test for the sign-up flow on [futureskill.co](https://futureskill.co), written with Robot Framework and SeleniumLibrary, then refactored to the Page Object pattern.

## Test case

| Step | Action | Page object keyword |
|------|--------|---------------------|
| 1 | Open https://futureskill.co | `user open future skill website` |
| 2 | Click **สมัครสมาชิก** | `user click signup button on home page` |
| 3 | Fill in email, first name, last name, phone, password, confirm password, accept terms | `user fill signup form` |
| 4 | Click **สมัครสมาชิก** to submit | `user click signup submit button` |
| 5 | Check the OTP page shows **"ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์"** | `future skill should display OTP page with message "..."` |

A new email is generated on every run (`email_user+<timestamp>@email_domain`) so the test can be repeated.

## Project structure

```
basic/
  SignupBasic.robot          first version: steps and locators inside the test case
testcases/
  SignupTestcases.robot      Page Object version (Given / When / Then)
keywords/                    one file per page
  CommonKeywords.robot       wait-and-retry helpers shared by every page
  HomePageKeywords.robot     home page: locators + actions
  SignupPageKeywords.robot   sign-up page: locators + actions
  OtpPageKeywords.robot      OTP page: verification
resources/
  config/config.yaml         baseUrl, browser
  testdata/testdata.yaml     sign-up data and expected OTP message
run_tests.bat                one-click run on Windows
```

## Setup (Windows)

1. Install Python 3.x (tick **Add python.exe to PATH**) and Google Chrome.
2. `pip install -r requirements.txt` (robotframework, robotframework-seleniumlibrary, PyYAML)
3. ChromeDriver: Selenium 4.6+ downloads the matching driver automatically. If your network blocks that, download it from the Chrome for Testing dashboard and put `chromedriver.exe` in `Python3X\Scripts`.

## Run

The OTP SMS is sent to the phone number you pass in, so use your own number.

```bat
run_tests.bat 0812345678
```

or

```bat
robot -d results -v phone:0812345678 testcases
robot -d results -v phone:0812345678 basic
```

Results are written to `results/` (`report.html`, `log.html`, `otp_page.png`).
