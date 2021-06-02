# CryptoSpace

Cryptocurrency Tracker

[Slides and Assets](https://drive.google.com/drive/folders/1URk9h1hyBR1w9rNcyUesPKCHVcq_R-l3?usp=sharing)
<br/>
[Attendance](https://docs.google.com/spreadsheets/d/16qDvB8YZbs1CJi6l2qRJsTaFQSNEotjP1Z3H4EgcXAQ/edit#gid=349935256)

### Create new project

```bash
$ flutter create cryptospace
$ cd cryptospace
```

### Add the necessary dependencies and configure launcher icon and splash screen

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^4.0.0

dev_dependencies:
  flutter_launcher_icons: ^0.9.0
  flutter_native_splash: ^1.1.8+4
  flutter_test:
    sdk: flutter
  lint: ^1.0.0
 
flutter_icons:
  android: "launcher_icon"
  ios: true
  remove_alpha_ios: true
  image_path: "assets/images/logo.png"
  adaptive_icon_background: "assets/images/logo.png"
  adaptive_icon_foreground: "assets/images/logo.png"

flutter_native_splash:
  color: "#EC4561"
  image: "assets/images/logo.png"
  android: true
  ios: true
```

### Create the file `analysis_options.yaml` in the root directory and add the following line

```yaml
include: package:lint/analysis_options.yaml
```

### Add asset and font directories to `pubspec.yaml`

```yaml
  assets:
    - assets/images/
```
