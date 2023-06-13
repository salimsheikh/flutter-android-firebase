# Flutter Firebase

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Dependencies

firebase_core: ^1.23.0
firebase_storage: ^10.3.9
firebase_auth: ^3.10.0
cloud_firestore: ^3.4.9
fluttertoast: ^8.0.9

# Tutorials

Part - 10 | Flutter Firebase Phone Authentication
[Part-10](https://www.youtube.com/watch?v=0XtvU90Lfh0&list=PLFyjjoCMAPtxS6Cx1XSjCfxOxHQ4_e0sL&index=10)

# Go to the project folder in the terminal.

Mac command: keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android

Windows command: keytool -list -v -keystore "C:\Users\bilal\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

Linux keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android

[Getting SHA1 key for a Windows System](https://teamtreehouse.com/community/guide-getting-sha1-key-for-a-windows-system)

1. Open Command Prompt by pressing Start+R and typing cmd.exe.

2. Using Windows Explorer, find where your JDK directory is located (Usually Program Files >> Java) and copy the path.

3. In Command Prompt, type cd followed by the directory of your JDK’s bin directory. e.g: cd C:\Program Files\Java\jdk1.8.0_25\bin is the command I use (Yours may vary).

4. Using Windows Explorer, find where your .android directory is located (Usually under Users >> [YOUR WINDOWS USERNAME]) and copy the path.

5. Now, use this command below:

Windows command: keytool -list -v -keystore "C:\Users\bilal\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
