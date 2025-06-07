# 📰 Flutter News App

A simple yet powerful news application built with **Flutter**, featuring multiple news categories, search functionality, dark mode, and article viewing via web view. State management is handled using **Cubit** and data is fetched from a RESTful API.

## ✨ Features

### 🏠 Home Screen
- Displays the latest news articles from general categories.

### ⚽ Sports Screen
- Shows news articles related to sports.

### 💼 Business Screen
- Dedicated screen for business news.

### 🔍 Search Screen
- Search news articles by keywords dynamically.

### 🌗 Dark Mode
- Toggle between light and dark themes for comfortable reading.

### 🌐 Web View
- View full news articles inside the app with an integrated web view.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK  
- Dart  
- Android Studio or VS Code  
- Emulator or physical device  

### Installation

```bash
git clone https://github.com/AmirKhairy/News-App-Flutter.git
cd News-App-Flutter
flutter pub get
flutter run
```

---

## 📁 Project Structure

```
lib/
│
├── main_screen.dart
├── sports_screen.dart
├── business_screen.dart
├── top_screen.dart
├── search_screen.dart
├── cache_helper.dart
├── cubit.dart         
├── states.dart         
├── web_view.dart         
├── bloc_observer.dart       
├── componentes.dart           
└── main.dart          
```

---

## 🌐 API Integration

- Fetches news articles using a RESTful API.
- Categories (general, sports, business) are queried separately.
- Search queries handled via API calls.
- Data management and UI state handled by Cubits for efficient performance.

---

## 🧾 License

This project is licensed under the **MIT License**.

---

## 🙋‍♂️ Author

**Amir Khairy Khalil**  
- 💼 LinkedIn: [Amir Khairy](https://www.linkedin.com/in/amir-khairy-35ba06291/)  
- 💻 GitHub: [AmirKhairy](https://github.com/AmirKhairy)
