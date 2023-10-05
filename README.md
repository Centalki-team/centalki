# Centalki
Capstone Project, Software Engineering Major, University of Science, VNU-HCM

## Description
This is a cross-platform mobile application, that served as a client of Centalki System. It allows users, specifically students, to practice and improve their English speaking skills through paid video call sessions with experienced teachers.

## Features
- Authentication and Authorization features.
- Friendly, modern, and easy-to-learn UI.
- Browse various pre-scripted speaking topics of multiple subjects and categories to find the most suitable one for your sessions.
- Connect with available teachers without booking or pre-scheduling.
- Interact with teachers in 30-minute 1-1 sessions right inside our app through the built-in high-quality video call service.
- View topic's content on the same video call screen.
- Receive feedbacks from teachers to improve yourselves.
- Give feedback and suggestions to teachers in order to improve your future experiences.
- Learn hard vocabularies with flash cards mode.
- Account management features: Change Information, Purchase Additional Sessions, View Session History, Notifications, etc.
- Supporting Vietnamese and Dark UI Mode.

## Download links
- Android (Google Play Store): [Centalki - Practice Speaking English](https://play.google.com/store/apps/details?id=com.centalki.student)
- iOS (App Store): [Centalki - Practice Speaking English](https://apps.apple.com/vn/app/centalki/id6449161684)

## Demo screenshots

- Sign In, Sign Up, Reset Password.

![centalki-mobile-demo-01](/demo/demo-image-01.jpg)

- Browse various speaking topics of different categories and difficulties.

![centalki-mobile-demo-02](/demo/demo-image-02.jpg)

- View detail information and contents of each topic.

![centalki-mobile-demo-03](/demo/demo-image-03.jpg)

- Connect with available teachers with high flexibility and **no pre-scheduling** required (payment required).

![centalki-mobile-demo-04](/demo/demo-image-04.jpg)

- Interact with teachers through high-quality video calls, as well as view your topic **on the same screen**.

![centalki-mobile-demo-05](/demo/demo-image-05.jpg)

- Give feedback to your teachers, or report your problems.

![centalki-mobile-demo-06](/demo/demo-image-06.jpg)

- Give feedbacks to topics, or suggest new ones to help gradually improve our contents.

![centalki-mobile-demo-07](/demo/demo-image-07.jpg)

- Add topics to favorite, and learn vocabularies with Flash Card mode.

![centalki-mobile-demo-08](/demo/demo-image-08.jpg)

- Improve at your own pace with feedbacks from teachers.

![centalki-mobile-demo-09](/demo/demo-image-09.jpg)

- Additional features: rejoin sessions on exit, receive push notifications, etc.

![centalki-mobile-demo-10](/demo/demo-image-10.jpg)

- Manage your accounts, personal information, and buy more sessions.

![centalki-mobile-demo-11](/demo/demo-image-11.jpg)

## How to run the project

- Generate SHA-1 for debug
```
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

- Keystore release
```
storePassword=123456
keyPassword=123456
keyAlias=upload
storeFile=upload-keystore.jks
```
- Generate keystore
```
keytool -genkeypair -v -storetype PKCS12 -keystore release.keystore -alias release -keyalg RSA -keysize 2048 -validity 10000
___pass=123456___
```

- Convert keystore file to base64
```
openssl base64 < release.keystore  | tr -d '\n' | tee release.keystore.base64.txt
```

- Convert mobileprovision file to base64 (Password 123456)
```
openssl base64 < Ripid_Staging_Profile.mobileprovision | tr -d '\n' | tee profile.base64.txt
```

- Env file to base64
```
openssl base64 < .env  | tr -d '\n' | tee .env.base64.txt
```

- Base64 to 
```
echo $ENV_BASE64 | base64 --decode >> .env.decode
```

## Android Configs 
- File key.properties
```
storePassword=123456
keyPassword=123456
keyAlias=upload
storeFile=upload-keystore.jks
```
- Build script
```
flutter build appbundle
```
