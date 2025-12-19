# SwiftUI Deep Link Demo 

A clean and scalable **SwiftUI deep linking demo project** showcasing how to handle **custom URL schemes**, **tab-based navigation**, and **NavigationStack routing** using a centralized router pattern.

This project demonstrates how to correctly open specific screens and tabs when the app is launched via a deep link — without breaking navigation flow.

---

## 📱 Features

- ✅ Custom URL Scheme Deep Linking (`myapp://`)
- ✅ SwiftUI `NavigationStack`–based routing
- ✅ Tab-based navigation with deep link support
- ✅ Centralized `AppRouter` for navigation control
- ✅ Handles cold start & warm start deep links correctly
- ✅ Login / Logout safe navigation reset
- ✅ Scalable architecture for production apps

---

## 🔗 Supported Deep Links

| Deep Link URL | Behavior |
|--------------|----------|
| `deeplinkdemo://home` | Opens Home tab |
| `deeplinkdemo://products` | Opens Product List tab |
| `deeplinkdemo://product/123` | Opens Product Detail screen |
| `deeplinkdemo://profile` | Opens Profile screen |

---

## 🧭 Navigation Architecture

```

RootView
├── NavigationStack (router.path)
│    ├── MainTabView
│    │    ├── HomeView
│    │    └── ProductListView
│    ├── ProductDetailView
│    ├── ProfileView
│    └── LoginView

````

Navigation is managed via a **central AppRouter**, ensuring:
- No duplicate stacks
- Proper back navigation
- Deep link safe routing

---

## 🧠 Key Components

### `AppRouter`
- Manages `NavigationPath`
- Controls tab selection
- Handles login/logout resets
- Prevents deep link override on app launch

### `DeepLinkHandler`
- Parses incoming URLs
- Converts URLs into `AppRoute`
- Keeps deep linking logic isolated

### `RootView`
- Handles app entry
- Applies deep link routing
- Prevents `onAppear` from overriding deep links

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the repository
```bash
git clone https://github.com/your-username/deeplink-demo.git
cd deeplink-demo
````

### 2️⃣ Open in Xcode

```bash
open DeepLinkDemo.xcodeproj
```

### 3️⃣ Add URL Scheme

In **Xcode → Signing & Capabilities → URL Types**:

* URL Scheme: `deeplinkdemo`

---

## 🧪 Testing Deep Links

### iOS Simulator

```bash
xcrun simctl openurl booted "deeplinkdemo://home"
xcrun simctl openurl booted "deeplinkdemo://products"
xcrun simctl openurl booted "deeplinkdemo://product/1"
xcrun simctl openurl booted "deeplinkdemo://profile"
```

### Real Device

Open Safari and enter:

```
deeplinkdemo://products
```

---

## 🛑 Common Pitfall Solved

This project solves a **very common SwiftUI bug**:

> `onAppear` overriding deep link navigation on warm launch

Handled using:

* `didHandleDeepLink` flag in `AppRouter`
* Conditional initial navigation

---

## 🏗️ Tech Stack

* Swift
* SwiftUI
* Combine
* NavigationStack
* MVVM + Router pattern

---

## 🙌 Author

**Anukriti Jain**
