Internship
# Project Structure 

```
lib/
│
├── core/                 
│   ├── constants/        
│   ├── routes/         
│   └── widgets/         
│
├── data/             
│   ├── datasources/    # Local cache with hive
│   ├── models/          
│   └── repositories/  
│
├── domain/              
│   ├── entities/        
│   └── repositories/  
│
├── presentation/        
│   ├── providers/    
│   └── screens/         
│       ├── splash/       
│       ├── customers/  
│       ├── admin/       
│       └── auth/
│
├── services/             
│   └── firebase_options.dart  
│
└── main.dart
```

# Features

1. Firebase Authentication (Email/Password, Google)
2. Firestore for menu, orders, users
3. Clean Architecture
4. Provider for state management
5. Auth Session storage using hive
6. Admin Panel inside the app to manage customers for now   ( can be updated to add/edit menu and orders )
7. Customer Panel to browse menu and place orders

# SETUP
```
git clone https://github.com/Mms2404/Task.git
cd task
flutter pub get
```


