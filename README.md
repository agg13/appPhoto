# app_photo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## For android
 Change the minimum Android sdk version to 21 (or higher) in your android/app/build.gradle file :
  - minSdkVersion 21

  Add permissions in your android/app/src/main/AdroidManifest.xml:
  - ``<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>``
  - ``<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>``
  - ``<uses-permission android:name="androidpermission.CAMERA"/>``