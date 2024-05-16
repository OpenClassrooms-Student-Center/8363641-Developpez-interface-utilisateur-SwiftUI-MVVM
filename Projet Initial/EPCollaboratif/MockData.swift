import Foundation

let mockData = [
    Project(
        id: 1,
        name: "Redesign du Projet",
        description: "Refonte complète du cadre client.",
        startDate: "2023-01-10",
        endDate: "2023-07-15",
        tasks: [
            Task(
                id: 1,
                title: "Réunion de lancement",
                description: "Présenter le plan de projet et le calendrier aux clients et recueillir les premiers retours.",
                dueDate: "2023-01-15",
                isCompleted: true
            ),
            Task(
                id: 2,
                title: "Prototypes UI/UX",
                description: "Développer et examiner les prototypes d'interface utilisateur et d'expérience utilisateur avec les parties prenantes.",
                dueDate: "2023-02-28",
                isCompleted: false
            ),
            Task(
                id: 3,
                title: "Phase de développement 1",
                description: "Mettre en œuvre les fonctionnalités principales avec les premières intégrations UI.",
                dueDate: "2023-04-15",
                isCompleted: false
            ),
            Task(
                id: 4,
                title: "Tests et retours",
                description: "Réaliser le premier tour de tests utilisateurs et intégrer les retours dans le développement.",
                dueDate: "2023-05-10",
                isCompleted: false
            ),
            Task(
                id: 5,
                title: "Revue finale",
                description: "Revue finale avec les parties prenantes et préparation au déploiement.",
                dueDate: "2023-07-05",
                isCompleted: false
            ),
        ]
    ),
    Project(
        id: 2,
        name: "Lancement de nouveau produit",
        description: "Lancer la nouvelle gamme de produits au deuxième trimestre.",
        startDate: "2023-02-01",
        endDate: "2023-06-30",
        tasks: [
            Task(
                id: 1,
                title: "Réunion de stratégie produit",
                description: "Définir la vision du produit, les caractéristiques clés et la stratégie de marché.",
                dueDate: "2023-02-15",
                isCompleted: true
            ),
            Task(
                id: 2,
                title: "Étude de marché",
                description: "Réaliser une étude de marché détaillée pour identifier la clientèle potentielle et les préférences.",
                dueDate: "2023-03-10",
                isCompleted: false
            ),
            Task(
                id: 3,
                title: "Développement de prototype",
                description: "Développer un prototype fonctionnel pour les premiers tests et la collecte de retours.",
                dueDate: "2023-04-20",
                isCompleted: false
            ),
            Task(
                id: 4,
                title: "Préparation au lancement et marketing",
                description: "Préparer le lancement avec les derniers ajustements de produit et les campagnes marketing.",
                dueDate: "2023-06-10",
                isCompleted: false
            ),
        ]
    ),
    Project(
        id: 3,
        name: "Mise à niveau du système",
        description: "Mettre à niveau le système pour prendre en charge les nouveaux services.",
        startDate: "2023-03-01",
        endDate: "2023-08-30",
        tasks: [
            Task(
                id: 1,
                title: "Revue initiale du système",
                description: "Évaluer les capacités actuelles du système et définir la portée de la mise à niveau.",
                dueDate: "2023-03-15",
                isCompleted: true
            ),
            Task(
                id: 2,
                title: "Mises à niveau matérielles",
                description: "Mettre à niveau le matériel serveur physique pour répondre aux nouvelles exigences logicielles.",
                dueDate: "2023-04-05",
                isCompleted: false
            ),
            Task(
                id: 3,
                title: "Mises à jour logicielles",
                description: "Mettre à jour le logiciel système, y compris tous les correctifs de sécurité critiques.",
                dueDate: "2023-05-25",
                isCompleted: false
            ),
            Task(
                id: 4,
                title: "Tests finaux et déploiement",
                description: "Effectuer les derniers tours de tests et déployer le système en production.",
                dueDate: "2023-08-20",
                isCompleted: false
            ),
        ]
    ),
]

let mockStore = ProjectStore(projects: mockData)
