# EPCManager

EPCManager is a comprehensive SwiftUI app designed to facilitate efficient project and task management. It allows users to create, edit, and track progress on various projects and their associated tasks.

## Features
- **Project Management**: Users can add, delete, and view projects with detailed descriptions and timelines.
- **Task Management**: Each project can contain multiple tasks that users can add, delete, and mark as completed.
- **Progress Tracking**: The app dynamically tracks and displays the progress of each project based on completed tasks.

## Installation
To run EPCManager, clone the repo, and open EPCManager.xcodeproj in Xcode. Ensure you have the latest version of Xcode installed to handle SwiftUI efficiently.

```bash
git clone https://github.com/OpenClassrooms-Student-Center/8363641-Developpez-interface-utilisateur-SwiftUI-MVVM
cd EPCManager
open EPCManager.xcodeproj
```

## Usage
- **Home Screen**: Start at the Home screen where all projects are listed. You can add a new project using the "+" button on the navigation bar.
- **Project Details**: Tap on any project to view its details, including tasks and overall progress.
- **Add Tasks**: Within the Project Details view, add tasks to projects by tapping the "+" icon in the navigation bar.

## Components
- **HomeScreenView**: Manages the display of all projects and includes functionality to add new projects.
- **ProjectDetailsView**: Displays details of a selected project, lists tasks, and tracks progress.
- **AddProjectView**: Provides a form to input new project details.
- **AddTaskView**: Provides a form to add tasks to the selected project.
- **ProjectStore**: A model to handle the storage of projects.
- **Project**: Model representing a project, contains details like name, description, and tasks.
- **Task**: Model representing a task within a project.


## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
