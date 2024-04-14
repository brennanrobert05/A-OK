import requests
from pynput import keyboard
aok_id = "45bee526-fe6c-4cee-8bd2-22db4fc8la62"

rest_api_key = "ZmY2YTZhY2YtOTQ3Ni00YjA1LWJkMmUtYjViMmM0YWUzZDJi"
api_url = "https://onesignal.com/api/v1/notifications"

def send_notification(message):
  headers = {
    "Content-Type": "application/json",
    "Authorization": f"Basic {rest_api_key}"
  }

  payload = {
  "app_id": aok_id,
  "contents": {"en": message},
  "included_segments": ["All"]
  }

  print("Sending payload:", payload)

  response = requests.post(api_url, headers=headers, json=payload)

  print("Response status code:", response.status_code)
  print("Response content:", response.content)

  if reponse.status_code == 200:
    print("Notification sent successfully")
  else:
    print(f"Failed to send notification. Status code: {response.status_code}")

def on_returnkey(key):
  if key == keyboard.Key.enter:
    print("Button pressed. Sending notification to Onesignal..")
    send_notification("Robert is feeling overwhelmed")

with keyboard.listener(on_press=on_returnkey) as listener:
  print("Listener activated")
  try:
    listener.join()
