# Centalki

# Generate SHA-1 for debug
```
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

# Keystore release
```
storePassword=123456
keyPassword=123456
keyAlias=upload
storeFile=upload-keystore.jks
```