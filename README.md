
# Flutter Proof of Concept Application

## Overview

This is a simple Flutter mobile application built as a Proof of Concept to demonstrate practical Flutter development skills including:

- Working with remote REST APIs  
- Data modeling  
- State management  
- Filtering functionality  
- Local persistence  
- Clean and maintainable architecture  

The application fetches data from public APIs and displays posts with their corresponding authors.

---

## Flutter Version

This project is developed using:

Flutter 3.35.5 (stable channel)

---

## How to Run the App

Follow the steps below to run the project locally:

1. Clone the repository:
git clone <repository-url>

2. Navigate to the project directory:
cd project_name

3. Install required dependencies:
flutter pub get

4. Run the application:
flutter run

---

## Project Structure
The project follows a clean layered architecture with proper separation of concerns:

lib/
 ├── data/
 │    ├── models/        -> Data models (Post, User)
 │    └── repositories/  -> API communication logic
 │
 ├── presentation/
 │    ├── controllers/   -> Business logic & state management
 │    ├── screens/       -> UI screens
 │    └── widgets/       -> Reusable UI components
 │
 └── core/
      ├── network/       -> Dio client configuration
      └── di/            -> Dependency injection setup


This structure ensures:
- Maintainable code  
- Clear responsibility separation  
- Easy scalability  
- Testable components  

---

## State Management

This project uses GetX for state management and dependency injection.

Why GetX?
- Simple and reactive state handling  
- Minimal boilerplate  
- Built-in dependency injection  
- Easy to manage controllers and app state  

Controllers handle all business logic while UI remains clean and reactive using `Obx`.


## APIs Used
The application consumes the following public APIs:

Posts API:  
https://jsonplaceholder.typicode.com/posts

Users API:  
https://jsonplaceholder.typicode.com/users

Each post contains a `userId`, which is mapped with the users list to display the author name.

---

## Features Covered

### Data Fetching
- Fetches posts from /posts endpoint  
- Fetches users from /users endpoint  
- Combines posts and users using userId  
- Displays posts in a scrollable list  

Each post item displays:
- Post title  
- Author name  

---

### Filtering
- A text input field allows users to filter posts by title  
- Filtering works in real time as the user types  

---

### Bookmarks / Favorites
- Users can bookmark posts  
- Bookmarked posts are stored locally  
- Bookmarks persist even after app restart  
- Bookmarked items are clearly marked in the UI  
- Option to view only bookmarked posts  

---

## API Handling
- All network requests are handled using Dio 
- Repository layer manages API communication  
- Controllers consume repositories  
- Proper loading and error handling is implemented  

---

## Persistence
Bookmarked posts are saved locally using lightweight local storage.

This ensures:
- Data remains available offline  
- No need for external database  
- Simple and efficient persistence  

---

## Conclusion

This Proof of Concept project demonstrates:

- Real-world API integration  
- Clean Flutter architecture  
- Proper state management  
- Local data persistence  
- Practical filtering functionality  

The main focus of this assignment is clean, readable, and maintainable code rather than complex UI design.



Thank you for reviewing this assignment.
