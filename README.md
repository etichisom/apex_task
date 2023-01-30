## Getting Started 🚀

This project contains 3 flavors:

- development
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart
# Production
$ flutter run --flavor production --target lib/main_production.dart
```

## Navigation
Navigator 2.0 with *go_router:*

## Test
integration test

## Architecture Pattern : 
### Model — View — ViewModel (MVVM)
- Model: This layer is responsible for the abstraction of the data sources. Model and ViewModel work together to get and save the data.
- View: The purpose of this layer is to inform the ViewModel about the user’s action. This layer observes the ViewModel and does not contain any kind of     application logic.
- ViewModel: It exposes those data streams which are relevant to the View. Moreover, it serves as a link between the Model and the View.


## Local Database
- [x] get_storage

## State Management
- [x] Provider

## plugins/package used
-  provider:
-  get_it (dependency injection)
-  http:  (Network calls)
-  fluttertoast:
-  flutter_screenutil 
-  smooth_page_indicator:
-  otp_pin_field:
-  custom_timer:
-  elegant_notification:
-  dotenv 
-  go_router

<img width="343" alt="Screenshot 2023-01-15 at 19 21 13" src="https://user-images.githubusercontent.com/65232750/212559477-c4c3e839-7519-489f-a661-a967696a237f.png">
<img width="343" alt="Screenshot 2023-01-15 at 19 21 31" src="https://user-images.githubusercontent.com/65232750/212559495-1507d9f1-ffd3-40cd-a9ea-af6717a4eb47.png">
<img width="343" alt="Screenshot 2023-01-15 at 19 22 11" src="https://user-images.githubusercontent.com/65232750/212559541-9019524b-6ec2-4138-b1c5-b7e3a10b56e2.png">

apk [here]([linked-file.md](https://drive.google.com/file/d/19RTWEUla9cBIuO2CAJO-GDaBSD3A2Q2T/view?usp=sharing))
# apk [https://drive.google.com/file/d/19RTWEUla9cBIuO2CAJO-GDaBSD3A2Q2T/view?usp=sharing]
# apptetize [https://appetize.io/app/vgzpaj6kazs545rzmqcq46newu?device=pixel4&osVersion=11.0&scale=75]
