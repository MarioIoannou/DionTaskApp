# Marvel Characters App

A simple iOS app that shows Marvel characters and their comics using the Marvel API.

## 📱 What the App Does

- Shows a list of Marvel characters
- You can tap on a character to see their details
- In the details, you can see the character's comics
- You can swipe up/down to see different characters
- Loads more characters as you scroll

## 🛠 Setup Instructions

1. Open Xcode
2. Open the project by clicking: `File > Open` and select the `task2.xcodeproj` file
3. Wait for Xcode to load everything
4. Click the Play ▶️ button to run the app

## 📂 Project Structure

The app is organized in folders:

```
task2/
├── Views/                  # All the app screens
│   ├── Components/         # Reusable UI components
│   ├── MarvelCharactersList/    # Main screen
│   └── MarvelCharacterDetails/  # Details screen
├── Models/                # Data models
├── ViewModels/           # Business logic
├── Services/             # API calls
└── Utils/               # Helper stuff
```

## 🏗 How It Works

1. **Views**: 
   - `MarvelCharactersListView`: The main screen with the character grid
   - `MarvelCharacterDetailsView`: Shows character details and comics
   - `CharacterCard`: Shows each character in the grid
   - `ComicsVerticalScroll`: Shows comics in a horizontal scroll

2. **ViewModels**:
   - `MarvelCharactersViewModel`: Handles loading characters
   - `MarvelCharacterComicsViewModel`: Handles loading comics

3. **Models**:
   - `Character`: Represents a Marvel character
   - `Comic`: Represents a Marvel comic

4. **Services**:
   - `MarvelAPIService`: Makes calls to the Marvel API

## 📚 What We Used

- SwiftUI for the user interface
- Marvel API for the data
- Async/await for loading data
- No external libraries - just pure Swift!

## 🔑 API Keys

The app uses the Marvel API. The keys are already in the project in `Constants.swift`.

## 💡 Cool Features

- Loads more characters as you scroll
- Shows loading indicators
- Handles errors nicely
- Swipe between characters
- Shows comics for each character

## 🤔 Need Help?

If something's not working:
1. Make sure Xcode is updated
2. Clean the build folder: `Product > Clean Build Folder`
3. Try building and running again

That's it! Have fun exploring Marvel characters! 🦸‍♂️ 