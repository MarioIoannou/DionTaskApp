# DionTask

This is a Dion Mobile Engineer task for an iOS app that integrates the Marvel Comics API to create an engaging experience, 
showcasing Marvel characters and their comic appearances.

## What the App Does

- Shows a list of Marvel characters.
- You can tap on a Marvel character to see their details.
- In the details, you can see the Marvel character's comics.
- You can swipe right and left to see different characters from Marvel.
- Loads comic once you tap Marvel's character comic.

## Setup Instructions

1. Open Xcode.
2. Open the project by clicking: `File > Open` and select the `task2.xcodeproj` file.
3. Wait for Xcode to load everything.
4. Click the Play button to run the app.

## Project Structure

The app is organized in folders:

```
DionTask/
├── Views/                      # App screens
│   ├── Components/             # UI components
│   ├── CharactersListView/     # Main screen
│   |   └── Components/         # Main screen components
│   └── CharactersDetailsView/  # Details screen
|       └── Components/         # Details screen components
├── Models/                     # Data models
├── ViewModels/                 # Business logic
├── Services/                   # API call methods
└── Utils/                      # Constants
```

## Application Structure

1. **Views**: 
   - `CharactersListView`: The main screen with the character grid.
   - `CharacterCard`: Shows each character in the grid.
   - `CharacterDetailsView`: Shows character details and comics.
   - `ComicsVerticalScroll`: Shows comics in a horizontal scroll.
   - `ComicCard`: Shows each comic in the horizontal scroll.

2. **ViewModels**:
   - `CharactersViewModel`: Handles loading characters.
   - `CharacterComicsViewModel`: Handles loading comics.

3. **Models**:
   - `CharactersModel`: Represents a Marvel character.
   - `ComicsModel`: Represents a Marvel comic.

4. **Services**:
   - `MarvelAPIService`: Makes calls to the Marvel API.

## What was used

- SwiftUI for the user interface.
- Marvel API for the data.
- Async/await for loading data.
- No external libraries.
