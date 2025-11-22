final List<Map<String, dynamic>> ds_topics = [
  {
    "id": "t001-st001",
    "name": "Arrays & Strings",
    "description": "Fundamental data structures for storing sequential data.",
    "concepts": [
      "Indexing",
      "Traversal",
      "Memory Allocation",
      "String Manipulation",
      "2D Arrays",
    ],
  },
  {
    "id": "t001-st002",
    "name": "Linked Lists",
    "description": "Dynamic data structure with nodes connected via pointers.",
    "concepts": [
      "Singly Linked",
      "Doubly Linked",
      "Circular Linked",
      "Node Structure",
      "Pointer Manipulation",
    ],
  },
  {
    "id": "t001-st003",
    "name": "Stacks & Queues",
    "description": "Linear data structures following LIFO and FIFO principles.",
    "concepts": [
      "LIFO",
      "FIFO",
      "Push/Pop",
      "Enqueue/Dequeue",
      "Implementation Methods",
    ],
  },
  {
    "id": "t001-st004",
    "name": "Trees & Binary Trees",
    "description": "Hierarchical data structures with root and child nodes.",
    "concepts": [
      "Root Node",
      "Child/Parent",
      "Traversal Methods",
      "Binary Search Trees",
      "Tree Properties",
    ],
  },
  {
    "id": "t001-st005",
    "name": "Graphs",
    "description": "Non-linear data structure with vertices and edges.",
    "concepts": [
      "Vertices & Edges",
      "Directed/Undirected",
      "Adjacency Matrix",
      "Graph Traversal",
      "Weighted Graphs",
    ],
  },
  {
    "id": "t001-st006",
    "name": "Hash Tables",
    "description":
        "Data structure for efficient key-value pair storage and retrieval.",
    "concepts": [
      "Hash Functions",
      "Collision Resolution",
      "Load Factor",
      "Buckets",
      "Time Complexity",
    ],
  },
  {
    "id": "t001-st007",
    "name": "Heaps & Priority Queues",
    "description":
        "Complete binary tree-based structures for priority-based access.",
    "concepts": [
      "Min-Heap",
      "Max-Heap",
      "Heapify",
      "Priority Ordering",
      "Complete Binary Tree",
    ],
  },
  {
    "id": "t001-st008",
    "name": "Tries & Advanced Structures",
    "description":
        "Specialized tree structures for efficient string operations and advanced data organization.",
    "concepts": [
      "Prefix Trees",
      "Radix Trees",
      "Segment Trees",
      "Fenwick Trees",
      "Suffix Trees",
    ],
  },
];
final List<Map<String, dynamic>> algorithm_topics = [
  {
    "id": "t002-st001",
    "name": "Sorting Algorithms",
    "description": "Methods for arranging data in specific order.",
    "concepts": ["Bubble Sort", "Quick Sort", "Merge Sort", "Time Complexity", "Stability"],
  },
  {
    "id": "t002-st002",
    "name": "Searching Algorithms",
    "description": "Techniques for finding elements in data structures.",
    "concepts": ["Linear Search", "Binary Search", "Hashing", "Interpolation Search", "Search Efficiency"],
  },
  {
    "id": "t002-st003",
    "name": "Dynamic Programming",
    "description": "Solving complex problems by breaking them into simpler subproblems.",
    "concepts": ["Memoization", "Tabulation", "Optimal Substructure", "Overlapping Subproblems", "State Transition"],
  },
  {
    "id": "t002-st004",
    "name": "Greedy Algorithms",
    "description": "Making locally optimal choices at each step for global optimization.",
    "concepts": ["Local Optimization", "Greedy Choice Property", "Huffman Coding", "Dijkstra's Algorithm", "Matroids"],
  },
  {
    "id": "t002-st005",
    "name": "Backtracking",
    "description": "Systematic trial and error approach to find solutions.",
    "concepts": ["State Space Tree", "Pruning", "Constraint Satisfaction", "N-Queens", "Sudoku Solver"],
  },
  {
    "id": "t002-st006",
    "name": "Divide & Conquer",
    "description": "Breaking problems into smaller subproblems and combining solutions.",
    "concepts": ["Recursion", "Problem Division", "Solution Combination", "Master Theorem", "Parallelism"],
  },
  {
    "id": "t002-st007",
    "name": "Graph Algorithms",
    "description": "Algorithms specifically designed for graph data structures.",
    "concepts": ["Shortest Path", "Minimum Spanning Tree", "Topological Sort", "Network Flow", "Connectivity"],
  },
  {
    "id": "t002-st008",
    "name": "Complexity Analysis",
    "description": "Evaluating algorithm efficiency in time and space.",
    "concepts": ["Big O Notation", "Time Complexity", "Space Complexity", "Asymptotic Analysis", "Best/Worst Case"],
  },
];
final List<Map<String, dynamic>> programming_topics = [
  {
    "id": "t003-st001",
    "name": "OOP Concepts",
    "description": "Programming paradigm based on objects and classes.",
    "concepts": ["Encapsulation", "Inheritance", "Polymorphism", "Abstraction", "Classes & Objects"],
  },
  {
    "id": "t003-st002",
    "name": "Functional Programming",
    "description": "Programming style that treats computation as mathematical functions.",
    "concepts": ["First-class Functions", "Immutability", "Pure Functions", "Higher-order Functions", "Recursion"],
  },
  {
    "id": "t003-st003",
    "name": "Memory Management",
    "description": "Techniques for efficient allocation and deallocation of memory.",
    "concepts": ["Stack vs Heap", "Garbage Collection", "Memory Leaks", "Pointers", "Reference Counting"],
  },
  {
    "id": "t003-st004",
    "name": "Concurrency & Multithreading",
    "description": "Managing multiple execution threads for parallel processing.",
    "concepts": ["Threads vs Processes", "Synchronization", "Deadlocks", "Race Conditions", "Thread Pools"],
  },
  {
    "id": "t003-st005",
    "name": "Error Handling",
    "description": "Strategies for detecting and responding to exceptional conditions.",
    "concepts": ["Exceptions", "Try-Catch Blocks", "Error Codes", "Assertions", "Graceful Degradation"],
  },
  {
    "id": "t003-st006",
    "name": "Design Patterns",
    "description": "Reusable solutions to common software design problems.",
    "concepts": ["Singleton", "Factory", "Observer", "MVC", "Dependency Injection"],
  },
  {
    "id": "t003-st007",
    "name": "Code Optimization",
    "description": "Techniques to improve program performance and efficiency.",
    "concepts": ["Algorithm Optimization", "Memory Access Patterns", "Compiler Optimizations", "Profiling", "Caching"],
  },
  {
    "id": "t003-st008",
    "name": "Testing & Debugging",
    "description": "Methods for verifying code correctness and fixing errors.",
    "concepts": ["Unit Testing", "Integration Testing", "Debugging Tools", "Test-driven Development", "Logging"],
  },
];
final List<Map<String, dynamic>> database_topics = [
  {
    "id": "t004-st001",
    "name": "SQL Basics",
    "description": "Introduction to relational databases and SQL queries.",
    "concepts": ["SELECT", "INSERT", "UPDATE", "DELETE", "WHERE Clause"],
  },
  {
    "id": "t004-st002",
    "name": "Database Design",
    "description": "Learn how to structure databases efficiently.",
    "concepts": ["Normalization", "ER Diagrams", "Primary Key", "Foreign Key", "Relationships"],
  },
  {
    "id": "t004-st003",
    "name": "Transactions & Indexing",
    "description": "Concepts related to ACID properties and database performance.",
    "concepts": ["ACID", "Commit", "Rollback", "Indexing", "Isolation Levels"],
  },
  {
    "id": "t004-st004",
    "name": "Normalization",
    "description": "Process of organizing data to reduce redundancy and improve integrity.",
    "concepts": ["1NF", "2NF", "3NF", "BCNF", "Functional Dependencies"],
  },
  {
    "id": "t004-st005",
    "name": "NoSQL Databases",
    "description": "Non-relational databases for unstructured and semi-structured data.",
    "concepts": ["Document Stores", "Key-Value Stores", "Column Families", "Graph Databases", "CAP Theorem"],
  },
  {
    "id": "t004-st006",
    "name": "Query Optimization",
    "description": "Techniques to improve database query performance.",
    "concepts": ["Query Plans", "Index Selection", "Join Strategies", "Statistics", "Cost-based Optimization"],
  },
  {
    "id": "t004-st007",
    "name": "ACID Properties",
    "description": "Fundamental properties guaranteeing reliable transaction processing.",
    "concepts": ["Atomicity", "Consistency", "Isolation", "Durability", "Transaction Management"],
  },
  {
    "id": "t004-st008",
    "name": "Database Security",
    "description": "Protecting database systems from unauthorized access and threats.",
    "concepts": ["Authentication", "Authorization", "Encryption", "Auditing", "SQL Injection"],
  },
];
final List<Map<String, dynamic>> os_topics = [
  {
    "id": "t005-st001",
    "name": "Process Management",
    "description": "Managing program execution and resource allocation.",
    "concepts": ["Process States", "PCB", "Context Switching", "Process Scheduling", "Inter-process Communication"],
  },
  {
    "id": "t005-st002",
    "name": "Memory Management",
    "description": "Techniques for efficient memory allocation and virtual memory.",
    "concepts": ["Paging", "Segmentation", "Virtual Memory", "Page Replacement", "Memory Protection"],
  },
  {
    "id": "t005-st003",
    "name": "File Systems",
    "description": "Organizing and storing data on storage devices.",
    "concepts": ["File Organization", "Directory Structure", "File Operations", "Disk Scheduling", "File Permissions"],
  },
  {
    "id": "t005-st004",
    "name": "Scheduling Algorithms",
    "description": "Methods for determining which process runs next on CPU.",
    "concepts": ["FCFS", "Round Robin", "Priority Scheduling", "Shortest Job First", "Multilevel Queues"],
  },
  {
    "id": "t005-st005",
    "name": "Deadlocks",
    "description": "Situation where processes are blocked waiting for each other.",
    "concepts": ["Deadlock Detection", "Prevention", "Avoidance", "Recovery", "Resource Allocation Graph"],
  },
  {
    "id": "t005-st006",
    "name": "Virtual Memory",
    "description": "Memory management technique that uses secondary storage.",
    "concepts": ["Demand Paging", "Page Tables", "TLB", "Working Set", "Thrashing"],
  },
  {
    "id": "t005-st007",
    "name": "I/O Systems",
    "description": "Managing input/output operations and device communication.",
    "concepts": ["Device Drivers", "I/O Scheduling", "Interrupts", "DMA", "Device Management"],
  },
  {
    "id": "t005-st008",
    "name": "OS Security",
    "description": "Protecting operating systems from threats and vulnerabilities.",
    "concepts": ["Access Control", "Authentication", "Malware Protection", "Security Policies", "Kernel Security"],
  },
];
final List<Map<String, dynamic>> netwroking_topics = [
  {
    "id": "t006-st001",
    "name": "Network Layers & Protocols",
    "description": "Understanding the OSI model and communication protocols.",
    "concepts": ["OSI Model", "TCP/IP Stack", "Protocol Headers", "Encapsulation", "Layer Functions"],
  },
  {
    "id": "t006-st002",
    "name": "TCP/IP Model",
    "description": "Practical networking model used in internet communications.",
    "concepts": ["Application Layer", "Transport Layer", "Internet Layer", "Network Interface", "Protocol Suite"],
  },
  {
    "id": "t006-st003",
    "name": "Routing Algorithms",
    "description": "Methods for determining optimal paths in network communication.",
    "concepts": ["Distance Vector", "Link State", "OSPF", "BGP", "Routing Tables"],
  },
  {
    "id": "t006-st004",
    "name": "Wireless Networks",
    "description": "Networking technologies without physical cables.",
    "concepts": ["Wi-Fi Standards", "Bluetooth", "Cellular Networks", "Wireless Security", "Signal Propagation"],
  },
  {
    "id": "t006-st005",
    "name": "Network Security",
    "description": "Protecting network infrastructure and data transmission.",
    "concepts": ["Firewalls", "VPN", "Intrusion Detection", "Cryptography", "Network Hardening"],
  },
  {
    "id": "t006-st006",
    "name": "DNS & HTTP",
    "description": "Fundamental internet services for naming and web communication.",
    "concepts": ["Domain Resolution", "HTTP Methods", "DNS Records", "HTTPS", "Web Protocols"],
  },
  {
    "id": "t006-st007",
    "name": "Socket Programming",
    "description": "Network communication using socket interface for data exchange.",
    "concepts": ["Client-Server Model", "Socket API", "Port Numbers", "Connection Establishment", "Data Transfer"],
  },
  {
    "id": "t006-st008",
    "name": "Cloud Networking",
    "description": "Networking in cloud computing environments and virtual networks.",
    "concepts": ["SDN", "Virtual Networks", "Load Balancers", "Cloud VPN", "Network-as-a-Service"],
  },
];
final List<Map<String, dynamic>> computer_architecture_topics = [
  {
    "id": "t007-st001",
    "name": "CPU Architecture",
    "description": "Design and organization of central processing units.",
    "concepts": ["ALU", "Control Unit", "Registers", "Instruction Cycle", "Microarchitecture"],
  },
  {
    "id": "t007-st002",
    "name": "Memory Hierarchy",
    "description": "Layered memory structure from registers to secondary storage.",
    "concepts": ["Cache Levels", "RAM", "Secondary Storage", "Access Times", "Memory Technologies"],
  },
  {
    "id": "t007-st003",
    "name": "Instruction Sets",
    "description": "Set of all commands that a processor can execute.",
    "concepts": ["RISC vs CISC", "Instruction Formats", "Addressing Modes", "Opcode", "Operands"],
  },
  {
    "id": "t007-st004",
    "name": "Pipelining",
    "description": "Technique to improve CPU throughput by parallel instruction processing.",
    "concepts": ["Pipeline Stages", "Hazards", "Forwarding", "Branch Prediction", "Superscalar"],
  },
  {
    "id": "t007-st005",
    "name": "Cache Memory",
    "description": "High-speed memory storing frequently accessed data.",
    "concepts": ["Cache Mapping", "Replacement Policies", "Write Policies", "Cache Coherence", "Hit/Miss Ratio"],
  },
  {
    "id": "t007-st006",
    "name": "I/O Interfaces",
    "description": "Communication between CPU and peripheral devices.",
    "concepts": ["I/O Ports", "Device Controllers", "Interrupts", "DMA", "Bus Architecture"],
  },
  {
    "id": "t007-st007",
    "name": "Parallel Processing",
    "description": "Using multiple processors to solve problems concurrently.",
    "concepts": ["Multiprocessors", "Multicore", "Vector Processing", "Parallel Algorithms", "Synchronization"],
  },
  {
    "id": "t007-st008",
    "name": "Microarchitecture",
    "description": "Detailed implementation of processor architecture.",
    "concepts": ["Datapath", "Control Signals", "Microoperations", "Pipeline Design", "Performance Metrics"],
  },
];
final List<Map<String, dynamic>> information_security_topics = [
  {
    "id": "t008-st001",
    "name": "Cryptography",
    "description": "Techniques for secure communication in presence of adversaries.",
    "concepts": ["Symmetric Encryption", "Asymmetric Encryption", "Hash Functions", "Digital Signatures", "PKI"],
  },
  {
    "id": "t008-st002",
    "name": "Network Security",
    "description": "Protecting network infrastructure and data in transit.",
    "concepts": ["Firewalls", "IDS/IPS", "VPN", "SSL/TLS", "Network Monitoring"],
  },
  {
    "id": "t008-st003",
    "name": "Web Security",
    "description": "Securing web applications and online services.",
    "concepts": ["XSS", "CSRF", "SQL Injection", "Session Management", "Web Application Firewalls"],
  },
  {
    "id": "t008-st004",
    "name": "Malware Analysis",
    "description": "Studying malicious software behavior and detection methods.",
    "concepts": ["Viruses", "Worms", "Trojans", "Ransomware", "Reverse Engineering"],
  },
  {
    "id": "t008-st005",
    "name": "Access Control",
    "description": "Regulating who can access what resources in a system.",
    "concepts": ["Authentication", "Authorization", "RBAC", "MAC/DAC", "Identity Management"],
  },
  {
    "id": "t008-st006",
    "name": "Security Protocols",
    "description": "Standardized methods for secure communications.",
    "concepts": ["SSL/TLS", "IPSec", "SSH", "Kerberos", "OAuth"],
  },
  {
    "id": "t008-st007",
    "name": "Ethical Hacking",
    "description": "Authorized penetration testing to identify vulnerabilities.",
    "concepts": ["Vulnerability Assessment", "Penetration Testing", "Social Engineering", "Security Auditing", "Bug Bounties"],
  },
  {
    "id": "t008-st008",
    "name": "Risk Management",
    "description": "Identifying and mitigating security risks in organizations.",
    "concepts": ["Risk Assessment", "Threat Modeling", "Security Policies", "Compliance", "Business Continuity"],
  },
];
final List<Map<String, dynamic>> computer_fundamental_topics = [
  {
    "id": "t009-st001",
    "name": "Number Systems",
    "description": "Different numeral systems used in computing.",
    "concepts": ["Binary", "Hexadecimal", "Octal", "Conversions", "Arithmetic Operations"],
  },
  {
    "id": "t009-st002",
    "name": "Boolean Algebra",
    "description": "Mathematical system for logical operations and digital circuits.",
    "concepts": ["Logic Gates", "Truth Tables", "Boolean Expressions", "De Morgan's Laws", "Karnaugh Maps"],
  },
  {
    "id": "t009-st003",
    "name": "Logic Gates",
    "description": "Fundamental building blocks of digital circuits.",
    "concepts": ["AND", "OR", "NOT", "XOR", "NAND", "NOR", "Universal Gates"],
  },
  {
    "id": "t009-st004",
    "name": "Computer History",
    "description": "Evolution of computing technology and key milestones.",
    "concepts": ["Generations of Computers", "Key Inventors", "Technological Advances", "Historical Context", "Future Trends"],
  },
  {
    "id": "t009-st005",
    "name": "Data Representation",
    "description": "How computers store and represent different types of data.",
    "concepts": ["Binary Representation", "Character Encoding", "Floating Point", "Signed Numbers", "Data Types"],
  },
  {
    "id": "t009-st006",
    "name": "Computer Organization",
    "description": "Physical components and their interconnections in computer systems.",
    "concepts": ["CPU Components", "Bus System", "I/O Devices", "Motherboard", "Peripheral Interfaces"],
  },
  {
    "id": "t009-st007",
    "name": "Input/Output Devices",
    "description": "Hardware for communicating with computer systems.",
    "concepts": ["Keyboards", "Mice", "Monitors", "Printers", "Storage Devices", "Network Interfaces"],
  },
  {
    "id": "t009-st008",
    "name": "Storage Devices",
    "description": "Hardware for storing data persistently.",
    "concepts": ["HDD", "SSD", "Optical Storage", "Flash Memory", "Storage Hierarchy", "RAID"],
  },
];
final List<Map<String, dynamic>> software_eng_topics = [
  {
    "id": "t010-st001",
    "name": "SDLC Models",
    "description": "Different methodologies for software development processes.",
    "concepts": ["Waterfall", "Agile", "Scrum", "Spiral", "V-Model", "Iterative Development"],
  },
  {
    "id": "t010-st002",
    "name": "Requirements Engineering",
    "description": "Process of defining, documenting, and maintaining requirements.",
    "concepts": ["User Stories", "Use Cases", "SRS", "Stakeholder Analysis", "Requirements Validation"],
  },
  {
    "id": "t010-st003",
    "name": "Software Design",
    "description": "Creating the architecture and detailed design of software systems.",
    "concepts": ["UML Diagrams", "Design Patterns", "Architecture Styles", "Modularity", "Coupling & Cohesion"],
  },
  {
    "id": "t010-st004",
    "name": "Software Testing",
    "description": "Process of verifying and validating software quality.",
    "concepts": ["Unit Testing", "Integration Testing", "System Testing", "Test Cases", "Automated Testing"],
  },
  {
    "id": "t010-st005",
    "name": "Project Management",
    "description": "Planning and controlling software development projects.",
    "concepts": ["Project Planning", "Risk Management", "Team Management", "Budgeting", "Timeline Management"],
  },
  {
    "id": "t010-st006",
    "name": "Quality Assurance",
    "description": "Processes to ensure software meets quality standards.",
    "concepts": ["Quality Metrics", "Code Reviews", "Standards Compliance", "Process Improvement", "CMMI"],
  },
  {
    "id": "t010-st007",
    "name": "Version Control",
    "description": "Managing changes to source code over time.",
    "concepts": ["Git", "Branching Strategies", "Merge Conflicts", "Code Repository", "Collaborative Development"],
  },
  {
    "id": "t010-st008",
    "name": "DevOps & CI/CD",
    "description": "Practices that combine software development and IT operations.",
    "concepts": ["Continuous Integration", "Continuous Deployment", "Infrastructure as Code", "Monitoring", "Automation"],
  },
];