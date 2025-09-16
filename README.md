# Yaldi Flutter Task – Registration & Login

## 📦 Setup Instructions

1. Clone this repository or unzip the project folder.
   ```bash
   git clone <your_repo_url>
   cd yaldi_flutter_task
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

---

## 🚀 Features
- **Registration Screen** with form validation (first name, last name, email, username, password).
- **Login Screen** with username and password authentication.
- **Welcome Screen** that displays user info from API after login.
- **Logout** functionality that clears token and returns to login.
- **Error handling & loading states** for all API calls.

---

## 🔌 API Endpoints
- **Register:** `POST https://dummyjson.com/users/add`
- **Login:** `POST https://dummyjson.com/auth/login`
- **Get User Info:** `GET https://dummyjson.com/auth/me` (Bearer token required)

---

## 🛠️ Tech Stack
- **Flutter** (latest stable version)
- **State Management:** Riverpod
- **HTTP Client:** http package
- **Form Validation:** `TextFormField` validators
- **Navigation:** Flutter Navigator

---

## ✨ Design Decisions
- **Riverpod for state management** → clean architecture, testability, scalability.
- **http package for API calls** → lightweight, built-in to Flutter ecosystem, simple for small projects.
- **Form validation** → inline validators on fields for better user feedback.
- **Clean folder structure** → separated features (`/features/auth/`) for maintainability.
- **User experience** → loading indicators and clear success/error messages.

---
