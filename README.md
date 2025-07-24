# Tic-Tac-Toe Pro Tic-Tac-Toe Game in Flutter

This is a modern and stylish Tic-Tac-Toe game built with Flutter. The project demonstrates the use of the BLoC (Business Logic Component) pattern for state management, features a clean user interface, and supports persistent scoring.

##  Screenshots

Here are screenshots of the application, showcasing its clean and modern design.

---

### **1. Login Screen**
*A clean, modern login screen to welcome the player.*

<img width="1290" height="2796" alt="login" src="https://github.com/user-attachments/assets/dea57967-1b23-4e63-a821-96d4a48a429c" />


---

### **2. Game Screen**
*The main game board with a stylish design, custom fonts, and a clear scoreboard during gameplay.*

<img width="1290" height="2796" alt="game screen" src="https://github.com/user-attachments/assets/16c424ce-2e42-40d2-a599-62829888a3e5" />


---

### **3. Winner State**
*An example of the game's end state, declaring "O" as the winner.*

<img width="1290" height="2796" alt="winner o" src="https://github.com/user-attachments/assets/acacc401-f623-47cd-8451-b2657b5c8985" />


---

### **4. Draw State**
*An example of the game ending in a draw.*

<img width="1290" height="2796" alt="draw" src="https://github.com/user-attachments/assets/688cfcbe-c404-43f3-9521-79496cce704b" />


---

##  Features

* **Player Login**: A simple and stylish login screen to enter a player's name.
* **Modern UI/UX**: The app features a custom dark theme with a vibrant purple accent color, rounded UI elements, and the Poppins font for a polished user experience.
* **BLoC State Management**: All game logic is handled efficiently and predictably using the `flutter_bloc` package, which separates the UI from the business logic.
* **Win/Draw Detection**: The game automatically detects all winning combinations and draw conditions.
* **Persistent Scoring**: The score between Player X and Player O is automatically saved to the device's local storage using `shared_preferences`, so it's remembered even after the app is closed.
* **Responsive Layout**: The UI is designed to work well on different screen sizes.

##  Built With

* **[Flutter](https://flutter.dev/)** - The UI toolkit for building natively compiled applications from a single codebase.
* **[Dart](https://dart.dev/)** - The programming language used by Flutter.
* **[flutter_bloc](https://pub.dev/packages/flutter_bloc)** - For predictable and scalable state management.
* **[shared_preferences](https://pub.dev/packages/shared_preferences)** - For persisting simple data locally on the device.
* **[google_fonts](https://pub.dev/packages/google_fonts)** - For easily using custom fonts from Google Fonts.

##  Getting Started (Instructions to Run)

To get a local copy up and running, please follow these steps.

### Prerequisites

* You must have a complete Flutter development environment set up. For instructions, see the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation & Setup

1.  **Clone the repository**
    ```sh
    git clone [https://github.com/your_username/your_repository_name.git](https://github.com/your_username/your_repository_name.git)
    ```
2.  **Navigate to the project directory**
    ```sh
    cd your_repository_name
    ```
3.  **Install the required dependencies**
    ```sh
    flutter pub get
    ```
4.  **Run the application**
    ```sh
    flutter run
    ```
