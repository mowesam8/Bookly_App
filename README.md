<div align="center">

# 📚 Bookly App

**A feature-first book browsing & searching application built with Flutter, the Google Books API, and the BLoC/Cubit pattern.**

![Flutter](https://img.shields.io/badge/Flutter-%2302569B?style=flat-square&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2?style=flat-square&logo=dart&logoColor=white)
![Cubit](https://img.shields.io/badge/State%20Management-Cubit-%237B1FA2?style=flat-square&logo=flutter&logoColor=white)
![Dio](https://img.shields.io/badge/Networking-Dio-%234a6cf7?style=flat-square)
![Google Books API](https://img.shields.io/badge/API-Google%20Books-%23e37400?style=flat-square)

<!--
  🏷️ Tech Badges (placeholders — replace with your own badges/links):
  - Flutter      | logo=flutter
  - Dart         | logo=dart
  - State        | Cubit / BLoC
  - Networking   | Dio
  - API          | Google Books API
  - Navigation   | GoRouter
-->

</div>

---

## 📱 App Screenshots

<p align="center">
  <img src="assets/images/bookly.gif" width="280" alt="App Preview GIF" />
</p>

<p align="center">
  <img src="assets/images/splash.png" width="220" alt="Splash Screen" />
  <img src="assets/images/home.png" width="220" alt="Home Screen" />
  <img src="assets/images/bookDetails.png" width="220" alt="Book Details Screen" />
  <img src="assets/images/search.png" width="220" alt="Search Screen" />
  <img src="assets/images/searchResult.png" width="220" alt="Search Result Screen" />
</p>

---

## 📖 About the Project

**Bookly** is a mobile book browsing and searching application that lets users discover books, browse featured and newest releases, explore similar titles, and dive into rich book details — all powered by the **Google Books API**.

The application was built **entirely from scratch** as part of an advanced Flutter & BLoC course. Every layer — from the data layer and repositories, to the state management Cubits and the entire UI — was designed and implemented by hand, with **no starter template or copied boilerplate**.

> 🏆 **Highlight:** The **Search Feature** was designed and implemented **completely independently** 🚀 — no tutorial, no guided walkthrough, no reference solution. From the `SearchedBooksCubit` and `SearchRepo`, to the debounced search field and the full `Initial → Loading → Success → Failure` state lifecycle, every decision was made from first principles.

---

## ✨ Key Features

- 🔍 **Independent Search Feature** — debounced real-time search with a **custom `Debouncer` utility** that prevents unnecessary API calls while typing.
- 🏗️ **Feature-First Architecture** — each feature (`splash`, `home`, `search`) is fully self-contained with its own data, manager, and presentation layers.
- 🧠 **Robust State Management** — every screen consumes a sealed Cubit state with a predictable lifecycle: `Initial → Loading → Success → Failure`.
- 📡 **Clean Networking with Dio** — a single `ApiService` wrapper centralizes all HTTP/JSON handling against the Google Books API.
- 🧩 **Separation of Concerns** — `Models` (JSON mapping) ⟷ `Repositories` (data access) ⟷ `Cubits` (business logic) ⟷ `Views` (UI) are strictly decoupled.
- 🗺️ **Deep Navigation with GoRouter** — route-scoped `BlocProvider`s keep Cubit lifecycles tied to their screens.
- 💉 **Dependency Injection with GetIt** — repositories and services are registered once in the service locator.
- 🎨 **Polished Dark UI** — custom widgets, Google Fonts, and a consistent dark theme throughout.

---

## 🗂️ Project Structure

```text
lib/
├─ main.dart                                # App entry: DI setup + dotenv load + MultiBlocProvider
├─ simple_bloc_observer.dart                # Bloc observer for logging state transitions
│
├─ core/                                    # 🔧 Shared, feature-agnostic layer
│  ├─ errors/
│  │  └─ failures.dart                      # Unified Failure model (ServerFailure, fromDioError)
│  ├─ models/
│  │  └─ book_model/                        # Google Books API JSON models (BookModel, VolumeInfo, ImageLinks...)
│  ├─ utils/
│  │  ├─ api_service.dart                   # Dio wrapper — all network requests pass through here
│  │  ├─ app_router.dart                    # GoRouter config + route-scoped BlocProviders
│  │  ├─ service_locator.dart               # GetIt registrations (ApiService, HomeRepo, SearchRepo)
│  │  ├─ debouncer.dart                     # ⏱️ Custom Debouncer — delays search until user pauses typing
│  │  ├─ assets_data.dart                   # Centralized asset paths
│  │  └─ styles.dart                        # Reusable text styles (Google Fonts)
│  └─ widgets/                              # Shared UI pieces (loading indicator, error widget, button)
│
└─ features/                                # 🧩 Feature-first modules
   ├─ splash/                               # Animated splash screen → auto-routes to Home
   │  └─ presentation/views/
   │
   ├─ home/                                 # Browse: featured, newest & similar books + details
   │  ├─ data/
   │  │  └─ repos/
   │  │     ├─ home_repo.dart               # Abstract contract for fetching books
   │  │     └─ home_repo_impl.dart          # Dio-backed implementation using ApiService
   │  └─ presentation/
   │     ├─ manager/
   │     │  ├─ featured_books_cubit/        # Cubit + sealed state (Featured books carousel)
   │     │  ├─ newset_books_cubit/          # Cubit + sealed state (Newest books list)
   │     │  └─ similar_books_cubit/         # Cubit + sealed state (Similar books on details)
   │     └─ views/                          # HomeView, BookDetailsView + their widgets
   │
   └─ search/                               # 🔍 Independently-built search feature
      ├─ data/
      │  └─ repos/
      │     ├─ search_repo.dart             # Abstract search contract
      │     └─ search_repo_impl.dart        # Fetches results by term from Google Books API
      └─ presentation/
         ├─ manager/
         │  └─ searched_books_cubit/        # SearchedBooks Cubit + sealed state
         └─ views/                          # SearchView + debounced search field & results list
```

### 🔄 State-Management Lifecycle

Every Cubit follows the same sealed-state contract, giving the UI a single, predictable way to react:

```text
Initial ──▶ Loading ──▶ (Success | Failure)
```

- **`Initial`** — nothing has been fetched yet (e.g., empty search screen).
- **`Loading`** — request in flight; the UI shows a loading indicator.
- **`Success`** — data arrived; the UI renders the book list.
- **`Failure`** — error occurred; the UI shows a friendly error widget.

### ⏱️ The Debouncer

```dart
final _debouncer = Debouncer(milliseconds: 500);

onChanged: (value) =>
    _debouncer.run(() => context.read<SearchedBooksCubit>().fetchSearchedBooks(term: value));
```

The custom `Debouncer` cancels any pending timer and only fires the search **500ms after the user stops typing** — a critical optimization that prevents a network request on every single keystroke.

---

## 🚀 Getting Started

1. **Clone** the repository and open it in your favorite editor.
2. **Add your Google Books API key** — create a `.env` file in the project root:

   ```env
   kApiKey=YOUR_GOOGLE_BOOKS_API_KEY
   ```

   > ⚠️ The key lives in the `.env` file, which is already declared as an asset in `pubspec.yaml`. Never commit a real key to version control.
3. **Run** the app:

   ```bash
   flutter pub get
   flutter run
   ```

---

> 🏆 **Note:** The **Search Feature** was designed and implemented **completely independently**, without any tutorial or guided walkthrough.

<div align="center">

*Developed as part of the **Flutter Advanced Course (BLoC & MVVM)** by **Eng. Tharwat Samy**.*

</div>