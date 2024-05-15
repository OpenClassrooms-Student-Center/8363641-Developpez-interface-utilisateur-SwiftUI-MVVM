import Foundation

let mockData = [
    Project(
        id: 1,
        name: "Project Redesign",
        description: "Complete overhaul of client framework.",
        startDate: "2023-01-10",
        endDate: "2023-07-15",
        tasks: [
            Task(
                id: 1,
                title: "Kickoff Meeting",
                description: "Present the project plan and timeline to clients and gather initial feedback.",
                dueDate: "2023-01-15",
                isCompleted: true
            ),
            Task(
                id: 2,
                title: "UI/UX Prototypes",
                description: "Develop and review user interface and user experience prototypes with stakeholders.",
                dueDate: "2023-02-28",
                isCompleted: false
            ),
            Task(
                id: 3,
                title: "Development Phase 1",
                description: "Implement core functionalities with initial UI integrations.",
                dueDate: "2023-04-15",
                isCompleted: false
            ),
            Task(
                id: 4,
                title: "Testing & Feedback",
                description: "Conduct first round of user testing and incorporate feedback into the development.",
                dueDate: "2023-05-10",
                isCompleted: false
            ),
            Task(
                id: 5,
                title: "Final Review",
                description: "Final review with stakeholders and prepare for deployment.",
                dueDate: "2023-07-05",
                isCompleted: false
            ),
        ]
    ),
    Project(
        id: 2,
        name: "New Product Launch",
        description: "Launch new product line in Q2.",
        startDate: "2023-02-01",
        endDate: "2023-06-30",
        tasks: [
            Task(
                id: 1,
                title: "Product Strategy Meeting",
                description: "Outline product vision, key features, and market strategy.",
                dueDate: "2023-02-15",
                isCompleted: true
            ),
            Task(
                id: 2,
                title: "Market Research",
                description: "Conduct detailed market research to identify potential customer base and preferences.",
                dueDate: "2023-03-10",
                isCompleted: false
            ),
            Task(
                id: 3,
                title: "Prototype Development",
                description: "Develop a working prototype for early testing and feedback gathering.",
                dueDate: "2023-04-20",
                isCompleted: false
            ),
            Task(
                id: 4,
                title: "Launch Prep and Marketing",
                description: "Prepare for launch with final product adjustments and marketing campaigns.",
                dueDate: "2023-06-10",
                isCompleted: false
            ),
        ]
    ),
    Project(
        id: 3,
        name: "System Upgrade",
        description: "Upgrade system to support new services.",
        startDate: "2023-03-01",
        endDate: "2023-08-30",
        tasks: [
            Task(
                id: 1,
                title: "Initial System Review",
                description: "Assess current system capabilities and define the scope for the upgrade.",
                dueDate: "2023-03-15",
                isCompleted: true
            ),
            Task(
                id: 2,
                title: "Hardware Upgrades",
                description: "Upgrade physical server hardware to meet new software requirements.",
                dueDate: "2023-04-05",
                isCompleted: false
            ),
            Task(
                id: 3,
                title: "Software Updates",
                description: "Update system software, including all critical security patches.",
                dueDate: "2023-05-25",
                isCompleted: false
            ),
            Task(
                id: 4,
                title: "Final Testing & Deployment",
                description: "Perform final testing rounds and deploy the system to production.",
                dueDate: "2023-08-20",
                isCompleted: false
            ),
        ]
    ),
]

let mockStore = ProjectStore(projects: mockData)
