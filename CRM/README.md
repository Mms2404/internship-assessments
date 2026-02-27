Internship
# CRM
A Flutter-based Customer Relationship Management (CRM) application designed to manage customers and their orders with offline-first support. This project integrates Firebase Firestore for cloud storage, Firebase Authentication for login/signup, and local storage for offline operations. Additionally, it can fetch random company data via a free API for quick customer addition.

STRUCTURE :
```
lib/
│
├── core/
│   ├── constants/       # button styles , colors , notifications
│   ├── errors/          # error handling utilities
│   ├── routes/          # named route definitions
│   ├── storage/         # local database
│   ├── usecase/        
│   └── widgets/         # reusable UI widgets
│
├── features/
│   ├── auth/            # Firebase Authentication for login and signup
│   ├── customers/       # authenticated customer's screen 
│   │   └── firestore_service.dart  # Sync logic for customers & orders
│   ├── splash/          # Splash screen
│   └── view-only/       # Random Company API integration
│
├── firebase_options.dart  # Firebase configuration
└── main.dart              # App entry point
```

# Features

1. Add, update, delete customers
2. Delete orders associated with a customer
3. Offline-first support: changes are stored locally and synced when online
4. Delete existing orders (offline-first support)
5. Login and signup via Firebase Authentication
6. Fetches random company data from a free API
7. Allows adding companies as customers in the app

# Sync Logic

Implemented in features/customers/firestore_service.dart :

Online: Operations are performed directly on Firestore
Offline: Operations are saved locally and synced to Firestore when internet is available

Sync applies to:

1. Add / Update / Delete Customers
2. Delete Orders

# SET UP

```
git clone https://github.com/Mms2404/CRM
cd crm_app
flutter pub get
```
-> Add your Firebase project for Android
-> Download google-services.json and place them inside project/android/app
-> Genearte firebase_options.dart via flutterfire configure

```
flutter run   (In emulator/mobile)
```
