# EPCollaboratif

EPCollaboratif est une application complète SwiftUI conçue pour faciliter la gestion efficace des projets et des tâches. Elle permet aux utilisateurs de créer, modifier et suivre la progression de divers projets et des tâches associées.

## Fonctionnalités
- **Gestion de Projet**: Les utilisateurs peuvent ajouter, supprimer et visualiser des projets avec des descriptions détaillées et des calendriers.
- **Gestion des Tâches**: Chaque projet peut contenir plusieurs tâches que les utilisateurs peuvent ajouter, supprimer et marquer comme complétées.
- **Suivi de Progression**: L'application suit et affiche dynamiquement la progression de chaque projet en fonction des tâches complétées.

| Accueil | Ajout d'un projet |  Détails d'un projet |  Ajout d'une tâche   |
| -------- | -------- | -------- | --- |
|   ![Screenshot 2024-05-21 at 15.40.58](https://github.com/OpenClassrooms-Student-Center/8363641-Developpez-interface-utilisateur-SwiftUI-MVVM/blob/main/Screenshots/Screenshot%202024-05-21%20at%2015.40.58.png)|   ![Screenshot 2024-05-21 at 15.41.08](https://github.com/OpenClassrooms-Student-Center/8363641-Developpez-interface-utilisateur-SwiftUI-MVVM/blob/main/Screenshots/Screenshot%202024-05-21%20at%2015.41.08.png)|  ![Screenshot 2024-05-21 at 15.41.02](https://github.com/OpenClassrooms-Student-Center/8363641-Developpez-interface-utilisateur-SwiftUI-MVVM/blob/main/Screenshots/Screenshot%202024-05-21%20at%2015.41.02.png)| ![Screenshot 2024-05-21 at 15.41.15](https://github.com/OpenClassrooms-Student-Center/8363641-Developpez-interface-utilisateur-SwiftUI-MVVM/blob/main/Screenshots/Screenshot%202024-05-21%20at%2015.41.15.png)|


## Installation
Pour exécuter EPCollaboratif, clonez le dépôt, et ouvrez EPCollaboratif.xcodeproj dans Xcode. Assurez-vous d'avoir la dernière version de Xcode installée pour gérer efficacement SwiftUI.

```bash
git clone https://github.com/OpenClassrooms-Student-Center/8363641-Developpez-interface-utilisateur-SwiftUI-MVVM
cd EPCollaboratif
open EPCollaboratif.xcodeproj

```

## Usage
- **Home Screen**: Commencez par l'écran d'accueil où tous les projets sont listés. Vous pouvez ajouter un nouveau projet en utilisant le bouton "+" sur la barre de navigation.
- **Project Details**: Appuyez sur un projet pour voir ses détails, y compris les tâches et la progression globale.
- **Add Tasks**: Dans la vue des Détails du Projet, ajoutez des tâches aux projets en appuyant sur l'icône "+" dans la barre de navigation.

## Components
- **HomeScreenView**: Gère l'affichage de tous les projets et inclut la fonctionnalité pour ajouter de nouveaux projets.
- **ProjectDetailsView**: Affiche les détails d'un projet sélectionné, liste les tâches et suit la progression.
- **AddProjectView**: Fournit un formulaire pour saisir les détails d'un nouveau projet.
- **AddTaskView**: Fournit un formulaire pour ajouter des tâches au projet sélectionné.
- **ProjectStore**: Un modèle pour gérer le stockage des projets.
- **Project**: Modèle représentant un projet, contient des détails comme le nom, la description et les tâches.
- **Task**: Modèle représentant une tâche au sein d'un projet.
