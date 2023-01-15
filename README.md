## Architecture Pattern : 
# Model — View — ViewModel (MVVM)
- Model: This layer is responsible for the abstraction of the data sources. Model and ViewModel work together to get and save the data.
- View: The purpose of this layer is to inform the ViewModel about the user’s action. This layer observes the ViewModel and does not contain any kind of     application logic.
- ViewModel: It exposes those data streams which are relevant to the View. Moreover, it serves as a link between the Model and the View.

## Folder Structure
- Assets:  Static assets for the app.
- common:  Resusable class.
- Features: Screen /UI and features of the app (e.g authentication feature).
- Resource/ contains the theme of the app and colors.
- ViewModel/Providers: Interactions outside the app.
- Utilities: Function or logic used in the app.
- Widgets: Widgets / Layouts used in the app.
- Models: Collection of data.
- domain:  contains the abstract class.
- data:  network call and Local storage
- package: in app package
- config : App configuration 



## Local Database
- [x] get_storage

## State Management
- [x] Provider

## plugins/package usedbv
-  provider:
-  get_it (dependency injection)
-  http:  (Network calls)
-  fluttertoast:
-  flutter_screenutil 
-  smooth_page_indicator:
-  otp_pin_field:
-  custom_timer:
-  elegant_notification:

<img width="343" alt="Screenshot 2023-01-15 at 19 21 13" src="https://user-images.githubusercontent.com/65232750/212559477-c4c3e839-7519-489f-a661-a967696a237f.png">
<img width="343" alt="Screenshot 2023-01-15 at 19 21 31" src="https://user-images.githubusercontent.com/65232750/212559495-1507d9f1-ffd3-40cd-a9ea-af6717a4eb47.png">
<img width="343" alt="Screenshot 2023-01-15 at 19 22 11" src="https://user-images.githubusercontent.com/65232750/212559541-9019524b-6ec2-4138-b1c5-b7e3a10b56e2.png">
