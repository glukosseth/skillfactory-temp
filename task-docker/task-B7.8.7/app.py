import requests

url = "https://mail.ru/"

response = requests.get(url + "/favicon.ico")
if response.status_code == 200:
    with open("/app/favicon.ico", "wb") as f:
        f.write(response.content)
        print("Favicon downloaded successfully")
else:
    print("Failed to download favicon")
