Internship
# Flutter biometric_auth

This Flutter app demonstrates secure biometric and device credential authentication using fingerprint, face recognition, or PIN/password. It uses `local_auth` package for authentication and `flutter_secure_storage` to store tokens securely .

---

## 🧠 Features

- ✅ Biometric authentication (Fingerprint / Face ID)
- ✅ Device credential fallback (PIN / Pattern / Password)
- ✅ Token storage using secure storage
- ✅ Conditional routing based on auth token
- ✅ Logout with token clearence

---

## 🛠️ Tech Stack

| Layer        | Technology            |
|--------------|------------------------|
| UI           | Flutter, Dart          |
| Auth         | local_auth plugin      |
| Secure Store | flutter_secure_storage |
| Routing      | Named routes           |

---

## 🧪 How it Works

1. **Launch App**  
   → Checks for stored token  
   → Navigates to Login or HomePage

2. **Login Page**  
   → User taps "Use Biometrics" or "Use PIN"  
   → Calls native biometric or system screen lock

3. **Successful Auth**  
   → Stores token securely  
   → Navigates to HomePage

4. **Home Page**  
   → Shows a welcome lottie  
   → Logout FAB button clears token and returns to LoginPage


https://github.com/user-attachments/assets/fcc55a7c-e53a-4356-a2b1-9edeac53632a 

( The screens that were not shown while the screen recording are given as pictures )

<img src="https://github.com/user-attachments/assets/6ce61b95-5971-4e58-901a-5965f27194e4" height="600" width="300" /> <img src="https://github.com/user-attachments/assets/b1ee57dc-3dc9-455c-bb70-e207ec10968e" height="600" width="300" /> 





---
## 📦 Packages Used

```yaml
dependencies:
  flutter:
    sdk: flutter
  local_auth: ^2.3.0  # for biometric authentication
  flutter_secure_storage: ^9.2.4 # for storing tokens and fallback credentials
  lottie: ^3.3.1
