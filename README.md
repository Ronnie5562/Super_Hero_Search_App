# 🦸‍♂️ Super Hero App

The **Super Hero App** is a Flutter application that allows users to view and search for different superheroes using the [SuperHero API](https://superheroapi.com). With an intuitive and user-friendly interface, users can search for superheroes and view their images and other information in real time.

---

## ✨ Features

- **Search Superheroes:** Quickly search for superheroes by name.
- **View Superhero Photos:** See images and names of the superheroes.
- **User-Friendly UI:** Simple and intuitive design for easy navigation.

---

## 📦 Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/Ronnie5562/Super_Hero_Search_App.git
   cd Super_Hero_Search_App
   ```

2. **Install dependencies:**:

   ```bash
   flutter pub get
   ```

3. **Run the application:**:

   ```bash
   flutter run
   ```

## 🔧 Configuration
To use the app, you'll need an API key from the [SuperHero API](https://superheroapi.com).

1. Sign up and obtain your API key.
2. Add the API key in `lib/api/constants.dart`:

```bash
const String superHeroApikey = 'XXXXXXXXXXXXXXXXXXXXXXXXXX';
```



## 📂 Lib Files Descriptions
1. `api/api.dart`
Contains functions for fetching superhero data from the API.

2. `api/constants.dart`
Defines the base URL and other constants used in API requests.

3. `model/hero_model.dart`
Defines the HeroModel class, which represents a superhero object with properties like name, image, and other details.

4. `screens/home.dart`
Displays a list of popular superheroes on the home screen.

5. `screens/index.dart`
Serves as the main app layout, managing navigation to the home screen.

6. `screens/search.dart`
Provides a search interface for users to look up superheroes by name.

7. `main.dart`
The entry point of the application, initializing the app.



## 🚀 Future Enhancements
- Add a favorites feature to allow users to save their favorite superheroes.
- Implement a dark mode for better user experience.
- Display more detailed information, such as superhero powers, biographies, and stats

## 🛠️ Built With
- [Flutter](https://flutter.dev) - Cross-platform framework for building mobile applications
- [SuperHero API](https://superheroapi.com) - The API providing superhero data


# Author

## [`Abimbola Ronald`](https://www.linkedin.com/in/abimbola-ronald-977299224/)
