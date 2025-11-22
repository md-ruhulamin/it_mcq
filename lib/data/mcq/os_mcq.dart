const operatingSystemMCQQuestions = [
  {
    "id": "os_q1",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st001",
    "question": "What is the main purpose of process scheduling in an operating system?",
    "options": [
      "To manage memory allocation",
      "To determine which process runs on the CPU and when",
      "To handle file operations",
      "To manage network connections"
    ],
    "correctIndex": 1,
    "explanation": "Process scheduling determines the order and timing of process execution on the CPU to maximize system utilization and ensure fair resource sharing.",
    "difficulty": "easy",
    "tags": ["process", "scheduling", "cpu"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q2",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st001",
    "question": "Which of the following is NOT a process state?",
    "options": [
      "Running",
      "Waiting",
      "Ready",
      "Compiling"
    ],
    "correctIndex": 3,
    "explanation": "The standard process states are New, Ready, Running, Waiting, and Terminated. Compiling is not a process state.",
    "difficulty": "easy",
    "tags": ["process", "states", "management"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q3",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st001",
    "question": "What information is typically stored in a Process Control Block (PCB)?",
    "options": [
      "Only the process ID",
      "Process state, program counter, and CPU registers",
      "Only memory allocation details",
      "User login credentials"
    ],
    "correctIndex": 1,
    "explanation": "PCB contains all information needed to manage a process including process state, program counter, CPU registers, memory management information, and accounting information.",
    "difficulty": "medium",
    "tags": ["pcb", "process", "management"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q4",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st002",
    "question": "What is the purpose of virtual memory?",
    "options": [
      "To increase CPU speed",
      "To allow programs to use more memory than physically available",
      "To improve disk performance",
      "To enhance network connectivity"
    ],
    "correctIndex": 1,
    "explanation": "Virtual memory allows processes to use more memory than physically available by using disk space as an extension of RAM.",
    "difficulty": "easy",
    "tags": ["virtual memory", "memory management"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q5",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st002",
    "question": "Which page replacement algorithm suffers from Belady's Anomaly?",
    "options": [
      "Optimal Page Replacement",
      "Least Recently Used (LRU)",
      "First-In-First-Out (FIFO)",
      "Most Frequently Used (MFU)"
    ],
    "correctIndex": 2,
    "explanation": "FIFO page replacement algorithm can suffer from Belady's Anomaly where increasing the number of page frames can increase page faults.",
    "difficulty": "hard",
    "tags": ["paging", "algorithms", "belady"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q6",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st002",
    "question": "What is the main advantage of paging over segmentation?",
    "options": [
      "Easier to implement",
      "Eliminates external fragmentation",
      "Provides memory protection",
      "Supports dynamic linking"
    ],
    "correctIndex": 1,
    "explanation": "Paging eliminates external fragmentation because memory is divided into fixed-size pages, allowing any page to be placed in any available frame.",
    "difficulty": "medium",
    "tags": ["paging", "segmentation", "memory"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q7",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st003",
    "question": "What is the purpose of a file system in an operating system?",
    "options": [
      "To manage CPU scheduling",
      "To organize and store data on storage devices",
      "To handle network protocols",
      "To manage process synchronization"
    ],
    "correctIndex": 1,
    "explanation": "File systems provide methods for storing, organizing, and retrieving data from storage devices like hard drives and SSDs.",
    "difficulty": "easy",
    "tags": ["file system", "storage"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q8",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st003",
    "question": "Which file allocation method is best for random access?",
    "options": [
      "Contiguous Allocation",
      "Linked Allocation",
      "Indexed Allocation",
      "FAT Allocation"
    ],
    "correctIndex": 2,
    "explanation": "Indexed allocation allows efficient random access because all block pointers are stored in an index block, enabling direct access to any block.",
    "difficulty": "medium",
    "tags": ["file allocation", "indexed", "random access"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q9",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st004",
    "question": "Which scheduling algorithm can lead to starvation?",
    "options": [
      "Round Robin",
      "First-Come-First-Served (FCFS)",
      "Shortest Job First (SJF)",
      "Multilevel Queue"
    ],
    "correctIndex": 2,
    "explanation": "SJF can lead to starvation because long processes may never get CPU time if short processes keep arriving.",
    "difficulty": "medium",
    "tags": ["scheduling", "starvation", "algorithms"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q10",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st004",
    "question": "What is the time quantum in Round Robin scheduling?",
    "options": [
      "The time a process spends in ready queue",
      "The fixed time each process gets to execute",
      "The total execution time of a process",
      "The time between context switches"
    ],
    "correctIndex": 1,
    "explanation": "Time quantum is the fixed time slice that each process gets to execute before being preempted and moved back to the ready queue.",
    "difficulty": "easy",
    "tags": ["round robin", "scheduling", "time quantum"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q11",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st005",
    "question": "What are the four necessary conditions for deadlock?",
    "options": [
      "Mutual exclusion, hold and wait, no preemption, circular wait",
      "Mutual exclusion, priority inversion, aging, circular wait",
      "Hold and wait, preemption, aging, mutual exclusion",
      "Circular wait, priority inheritance, mutual exclusion, hold and wait"
    ],
    "correctIndex": 0,
    "explanation": "The four necessary conditions for deadlock are: Mutual Exclusion, Hold and Wait, No Preemption, and Circular Wait.",
    "difficulty": "medium",
    "tags": ["deadlock", "conditions", "synchronization"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q12",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st005",
    "question": "Which deadlock prevention technique violates the 'Hold and Wait' condition?",
    "options": [
      "Requiring processes to request all resources initially",
      "Allowing resource preemption",
      "Using a hierarchical ordering of resources",
      "Implementing timeouts"
    ],
    "correctIndex": 0,
    "explanation": "Requiring processes to request all resources initially before execution prevents the 'Hold and Wait' condition.",
    "difficulty": "hard",
    "tags": ["deadlock", "prevention", "hold and wait"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q13",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st006",
    "question": "What is the purpose of a Translation Lookaside Buffer (TLB)?",
    "options": [
      "To cache frequently used page table entries",
      "To store process control blocks",
      "To manage disk I/O operations",
      "To handle interrupt requests"
    ],
    "correctIndex": 0,
    "explanation": "TLB is a cache that stores recently used virtual-to-physical address translations to speed up memory access.",
    "difficulty": "medium",
    "tags": ["tlb", "virtual memory", "caching"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q14",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st006",
    "question": "What causes thrashing in virtual memory systems?",
    "options": [
      "Too many processes competing for too few page frames",
      "Insufficient disk space",
      "CPU running at maximum capacity",
      "Network congestion"
    ],
    "correctIndex": 0,
    "explanation": "Thrashing occurs when the system spends more time swapping pages between memory and disk than executing processes, usually due to insufficient physical memory for the working set.",
    "difficulty": "medium",
    "tags": ["thrashing", "virtual memory", "performance"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q15",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st007",
    "question": "What is the main advantage of DMA (Direct Memory Access)?",
    "options": [
      "It increases CPU clock speed",
      "It allows I/O devices to transfer data directly to memory without CPU intervention",
      "It provides better security for memory access",
      "It reduces the size of the operating system"
    ],
    "correctIndex": 1,
    "explanation": "DMA allows I/O devices to transfer data directly to/from memory without continuous CPU involvement, freeing the CPU for other tasks.",
    "difficulty": "medium",
    "tags": ["dma", "i/o", "memory"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q16",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st007",
    "question": "Which I/O scheduling algorithm services the request closest to the current head position?",
    "options": [
      "FCFS (First-Come-First-Served)",
      "SSTF (Shortest Seek Time First)",
      "SCAN (Elevator Algorithm)",
      "C-SCAN (Circular SCAN)"
    ],
    "correctIndex": 1,
    "explanation": "SSTF selects the request with the minimum seek time from the current head position.",
    "difficulty": "medium",
    "tags": ["i/o", "scheduling", "disk"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q17",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st008",
    "question": "What is the principle of least privilege in OS security?",
    "options": [
      "Users should have maximum access to all resources",
      "Processes should run with only the privileges they need",
      "The operating system should have access to all user data",
      "All users should have equal access rights"
    ],
    "correctIndex": 1,
    "explanation": "The principle of least privilege states that processes and users should be granted only the minimum privileges necessary to perform their tasks.",
    "difficulty": "easy",
    "tags": ["security", "privilege", "access control"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q18",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st008",
    "question": "What is the main purpose of access control lists (ACLs)?",
    "options": [
      "To manage CPU scheduling",
      "To control which users can access specific resources",
      "To optimize memory allocation",
      "To handle network packet routing"
    ],
    "correctIndex": 1,
    "explanation": "ACLs specify which users or system processes are granted access to objects, as well as what operations are allowed on given objects.",
    "difficulty": "medium",
    "tags": ["security", "acl", "access control"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q19",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st001",
    "question": "What is context switching?",
    "options": [
      "Switching between different user interfaces",
      "Saving the state of one process and loading the state of another",
      "Changing the system's security context",
      "Switching between different file systems"
    ],
    "correctIndex": 1,
    "explanation": "Context switching involves saving the state of the currently running process and restoring the state of the next process to run.",
    "difficulty": "easy",
    "tags": ["context switch", "process", "scheduling"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q20",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st002",
    "question": "What is the difference between internal and external fragmentation?",
    "options": [
      "Internal fragmentation occurs in paging, external in segmentation",
      "Internal fragmentation occurs in segmentation, external in paging",
      "Both occur only in paging systems",
      "Both occur only in segmentation systems"
    ],
    "correctIndex": 0,
    "explanation": "Internal fragmentation occurs in paging when a process doesn't use the entire page. External fragmentation occurs in segmentation when free memory is broken into small pieces.",
    "difficulty": "medium",
    "tags": ["fragmentation", "paging", "segmentation"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q21",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st003",
    "question": "What is an inode in Unix file systems?",
    "options": [
      "A data structure that stores file metadata",
      "A type of file compression",
      "A network protocol for file sharing",
      "A memory management technique"
    ],
    "correctIndex": 0,
    "explanation": "An inode is a data structure that stores metadata about a file, including ownership, permissions, and pointers to data blocks.",
    "difficulty": "medium",
    "tags": ["inode", "file system", "unix"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q22",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st004",
    "question": "Which scheduling algorithm is typically used in interactive systems?",
    "options": [
      "First-Come-First-Served (FCFS)",
      "Shortest Job First (SJF)",
      "Round Robin (RR)",
      "Priority Scheduling"
    ],
    "correctIndex": 2,
    "explanation": "Round Robin is commonly used in interactive systems because it provides fair CPU time sharing and good response time.",
    "difficulty": "easy",
    "tags": ["scheduling", "interactive", "round robin"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q23",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st005",
    "question": "What is the Banker's Algorithm used for?",
    "options": [
      "Memory allocation optimization",
      "Deadlock avoidance",
      "Process scheduling",
      "File system management"
    ],
    "correctIndex": 1,
    "explanation": "The Banker's Algorithm is used for deadlock avoidance by checking if granting a resource request could lead to an unsafe state.",
    "difficulty": "hard",
    "tags": ["banker", "deadlock", "avoidance"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q24",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st006",
    "question": "What is demand paging?",
    "options": [
      "Loading all pages of a process at startup",
      "Loading pages only when they are accessed",
      "Preloading pages based on prediction",
      "Swapping out unused pages immediately"
    ],
    "correctIndex": 1,
    "explanation": "Demand paging loads pages into memory only when they are referenced by the executing process.",
    "difficulty": "medium",
    "tags": ["demand paging", "virtual memory"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q25",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st007",
    "question": "What is spooling in operating systems?",
    "options": [
      "A memory management technique",
      "Simultaneous Peripheral Operations Online",
      "A process synchronization method",
      "A security protocol"
    ],
    "correctIndex": 1,
    "explanation": "Spooling (Simultaneous Peripheral Operations Online) is a technique where data is temporarily held to be used and executed by a device, program, or system.",
    "difficulty": "medium",
    "tags": ["spooling", "i/o", "printing"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q26",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st008",
    "question": "What is a buffer overflow vulnerability?",
    "options": [
      "When a program writes more data to a buffer than it can hold",
      "When memory allocation fails",
      "When disk space is exhausted",
      "When network buffers become full"
    ],
    "correctIndex": 0,
    "explanation": "Buffer overflow occurs when a program writes data beyond the boundaries of a fixed-length buffer, potentially allowing execution of malicious code.",
    "difficulty": "medium",
    "tags": ["security", "buffer overflow", "vulnerability"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q27",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st001",
    "question": "What is the difference between a process and a thread?",
    "options": [
      "Processes share memory, threads do not",
      "Threads are lighter weight and share memory within a process",
      "Processes are used only in Windows, threads in Unix",
      "There is no significant difference"
    ],
    "correctIndex": 1,
    "explanation": "Threads are lighter weight than processes and share the same memory space within a process, while processes have separate memory spaces.",
    "difficulty": "easy",
    "tags": ["process", "thread", "comparison"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q28",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st002",
    "question": "What is the working set of a process?",
    "options": [
      "The total memory allocated to the process",
      "The set of pages that have been recently referenced",
      "The maximum memory the process can use",
      "The shared libraries used by the process"
    ],
    "correctIndex": 1,
    "explanation": "The working set is the set of pages that have been accessed by a process within a certain time window, representing its active memory usage.",
    "difficulty": "hard",
    "tags": ["working set", "memory", "performance"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  },
  {
    "id": "os_q29",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st003",
    "question": "What is journaling in file systems?",
    "options": [
      "Keeping a log of all file operations for recovery",
      "Compressing files to save space",
      "Encrypting file contents for security",
      "Organizing files in chronological order"
    ],
    "correctIndex": 0,
    "explanation": "Journaling maintains a log of file system operations to ensure consistency and enable quick recovery after crashes.",
    "difficulty": "medium",
    "tags": ["journaling", "file system", "recovery"],
    "isActive": true,
    "reference": "Operating System Concepts - Silberschatz"
  },
  {
    "id": "os_q30",
    "quizId": "os_quiz_1",
    "topicId": "t005",
    "subTopicId": "t005-st004",
    "question": "What is priority inversion?",
    "options": [
      "When a high-priority process waits for a low-priority process",
      "When all processes have the same priority",
      "When priority values are reversed",
      "When system priorities are reset"
    ],
    "correctIndex": 0,
    "explanation": "Priority inversion occurs when a high-priority task is indirectly preempted by a medium-priority task effectively inverting the relative priorities.",
    "difficulty": "hard",
    "tags": ["priority inversion", "scheduling", "real-time"],
    "isActive": true,
    "reference": "Modern Operating Systems - Tanenbaum"
  }
];