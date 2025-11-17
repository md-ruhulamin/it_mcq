
// COMPUTER ARCHITECTURE QUESTIONS
const computerArchitectureQuestions = [
  {
    "id": "ca_q1",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "What is the primary function of the CPU?",
    "options": [
      "Store data permanently",
      "Execute instructions and perform calculations",
      "Display graphics",
      "Connect to the internet"
    ],
    "correctIndex": 1,
    "explanation": "The CPU (Central Processing Unit) is responsible for executing instructions and performing calculations, acting as the brain of the computer.",
    "difficulty": "easy",
    "tags": ["cpu", "basics", "computer organization"],
    "isActive": true,
    "reference": "Computer Organization and Design - Patterson & Hennessy"
  },
  {
    "id": "ca_q2",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "Which component of the CPU performs arithmetic and logical operations?",
    "options": [
      "Control Unit",
      "ALU (Arithmetic Logic Unit)",
      "Cache",
      "Registers"
    ],
    "correctIndex": 1,
    "explanation": "The ALU (Arithmetic Logic Unit) is responsible for performing arithmetic operations (addition, subtraction) and logical operations (AND, OR, NOT).",
    "difficulty": "easy",
    "tags": ["cpu", "ALU", "components"],
    "isActive": true,
    "reference": "Computer Architecture Fundamentals"
  },
  {
    "id": "ca_q3",
    "quizId": "comp_arch_quiz_1",
    "topicId": "memory_hierarchy",
    "subTopicId": "cache_memory",
    "question": "What is cache memory?",
    "options": [
      "Permanent storage",
      "Small, fast memory located close to the CPU",
      "Virtual memory on disk",
      "Network storage"
    ],
    "correctIndex": 1,
    "explanation": "Cache memory is a small, fast memory located close to the CPU that stores frequently accessed data and instructions to reduce access time.",
    "difficulty": "easy",
    "tags": ["memory", "cache", "memory hierarchy"],
    "isActive": true,
    "reference": "Computer Architecture - Hennessy & Patterson"
  },
  {
    "id": "ca_q4",
    "quizId": "comp_arch_quiz_1",
    "topicId": "memory_hierarchy",
    "subTopicId": "cache_memory",
    "question": "In the memory hierarchy, which is typically the fastest?",
    "options": ["Hard Disk", "RAM", "Cache", "SSD"],
    "correctIndex": 2,
    "explanation": "Cache memory is the fastest in the memory hierarchy, followed by RAM, SSD, and then hard disk. Speed decreases as capacity increases.",
    "difficulty": "easy",
    "tags": ["memory hierarchy", "cache", "performance"],
    "isActive": true,
    "reference": "Memory Hierarchy Design"
  },
  {
    "id": "ca_q5",
    "quizId": "comp_arch_quiz_1",
    "topicId": "instruction_set",
    "subTopicId": "isa_basics",
    "question": "What does ISA stand for?",
    "options": [
      "Internal System Architecture",
      "Instruction Set Architecture",
      "Integrated Software Application",
      "Internet Security Algorithm"
    ],
    "correctIndex": 1,
    "explanation": "ISA stands for Instruction Set Architecture, which defines the interface between software and hardware, including the set of instructions a processor can execute.",
    "difficulty": "easy",
    "tags": ["ISA", "instruction set", "architecture"],
    "isActive": true,
    "reference": "Computer Architecture Basics"
  },
  {
    "id": "ca_q6",
    "quizId": "comp_arch_quiz_1",
    "topicId": "instruction_set",
    "subTopicId": "risc_cisc",
    "question": "What is the main difference between RISC and CISC architectures?",
    "options": [
      "RISC has more complex instructions than CISC",
      "RISC uses simple instructions, CISC uses complex instructions",
      "RISC is slower than CISC",
      "There is no difference"
    ],
    "correctIndex": 1,
    "explanation": "RISC (Reduced Instruction Set Computer) uses simple, fixed-length instructions, while CISC (Complex Instruction Set Computer) uses complex, variable-length instructions.",
    "difficulty": "medium",
    "tags": ["RISC", "CISC", "instruction set"],
    "isActive": true,
    "reference": "RISC vs CISC Architecture"
  },
  {
    "id": "ca_q7",
    "quizId": "comp_arch_quiz_1",
    "topicId": "pipelining",
    "subTopicId": "pipeline_basics",
    "question": "What is instruction pipelining?",
    "options": [
      "Storing instructions in memory",
      "Executing multiple instructions simultaneously by overlapping their execution stages",
      "Compressing instructions",
      "Encrypting instructions"
    ],
    "correctIndex": 1,
    "explanation": "Instruction pipelining is a technique where multiple instructions are overlapped in execution, with different stages of different instructions being processed simultaneously.",
    "difficulty": "medium",
    "tags": ["pipelining", "performance", "instruction execution"],
    "isActive": true,
    "reference": "Computer Organization - Pipelining"
  },
  {
    "id": "ca_q8",
    "quizId": "comp_arch_quiz_1",
    "topicId": "pipelining",
    "subTopicId": "pipeline_hazards",
    "question": "What is a pipeline hazard?",
    "options": [
      "A physical damage to the CPU",
      "A situation that prevents the next instruction from executing in its designated clock cycle",
      "A security vulnerability",
      "A power failure"
    ],
    "correctIndex": 1,
    "explanation": "A pipeline hazard is a situation that prevents the next instruction from executing during its designated clock cycle, potentially causing pipeline stalls.",
    "difficulty": "medium",
    "tags": ["pipelining", "hazards", "performance"],
    "isActive": true,
    "reference": "Pipeline Hazards and Solutions"
  },
  {
    "id": "ca_q9",
    "quizId": "comp_arch_quiz_1",
    "topicId": "pipelining",
    "subTopicId": "pipeline_hazards",
    "question": "Which of the following is NOT a type of pipeline hazard?",
    "options": ["Structural hazard", "Data hazard", "Control hazard", "Memory hazard"],
    "correctIndex": 3,
    "explanation": "The three main types of pipeline hazards are structural hazards, data hazards, and control hazards. 'Memory hazard' is not a standard classification.",
    "difficulty": "hard",
    "tags": ["pipelining", "hazards", "classification"],
    "isActive": true,
    "reference": "Pipeline Hazard Types"
  },
  {
    "id": "ca_q10",
    "quizId": "comp_arch_quiz_1",
    "topicId": "memory_addressing",
    "subTopicId": "addressing_modes",
    "question": "In immediate addressing mode, where is the operand located?",
    "options": [
      "In memory",
      "In a register",
      "In the instruction itself",
      "On the stack"
    ],
    "correctIndex": 2,
    "explanation": "In immediate addressing mode, the operand is part of the instruction itself, providing the actual value to be used.",
    "difficulty": "medium",
    "tags": ["addressing modes", "immediate addressing", "instruction format"],
    "isActive": true,
    "reference": "Addressing Modes in Computer Architecture"
  },
  {
    "id": "ca_q11",
    "quizId": "comp_arch_quiz_1",
    "topicId": "memory_addressing",
    "subTopicId": "addressing_modes",
    "question": "What is indirect addressing?",
    "options": [
      "The address of the operand is given directly",
      "The instruction contains the address of the address of the operand",
      "The operand is in a register",
      "The operand is in the instruction"
    ],
    "correctIndex": 1,
    "explanation": "In indirect addressing, the instruction contains the address of a memory location that contains the actual address of the operand.",
    "difficulty": "medium",
    "tags": ["addressing modes", "indirect addressing", "memory"],
    "isActive": true,
    "reference": "Memory Addressing Techniques"
  },
  {
    "id": "ca_q12",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cache_organization",
    "subTopicId": "cache_mapping",
    "question": "In direct-mapped cache, how many possible locations can a memory block be placed?",
    "options": ["Any location", "One specific location", "Two locations", "Four locations"],
    "correctIndex": 1,
    "explanation": "In direct-mapped cache, each memory block can be placed in exactly one specific cache location, determined by the block's address.",
    "difficulty": "medium",
    "tags": ["cache", "direct mapping", "cache organization"],
    "isActive": true,
    "reference": "Cache Memory Organization"
  },
  {
    "id": "ca_q13",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cache_organization",
    "subTopicId": "cache_mapping",
    "question": "What is the main advantage of fully associative cache over direct-mapped cache?",
    "options": [
      "It's faster",
      "It's cheaper",
      "It has lower conflict misses",
      "It uses less power"
    ],
    "correctIndex": 2,
    "explanation": "Fully associative cache allows a memory block to be placed in any cache location, reducing conflict misses compared to direct-mapped cache.",
    "difficulty": "hard",
    "tags": ["cache", "associative cache", "cache performance"],
    "isActive": true,
    "reference": "Cache Mapping Techniques"
  },
  {
    "id": "ca_q14",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cache_organization",
    "subTopicId": "cache_replacement",
    "question": "What does LRU stand for in cache replacement policies?",
    "options": [
      "Last Recently Used",
      "Least Recently Used",
      "Last Requested Unit",
      "Least Required Unit"
    ],
    "correctIndex": 1,
    "explanation": "LRU stands for Least Recently Used, a cache replacement policy that replaces the cache line that has not been accessed for the longest time.",
    "difficulty": "easy",
    "tags": ["cache", "LRU", "replacement policy"],
    "isActive": true,
    "reference": "Cache Replacement Policies"
  },
  {
    "id": "ca_q15",
    "quizId": "comp_arch_quiz_1",
    "topicId": "virtual_memory",
    "subTopicId": "vm_basics",
    "question": "What is virtual memory?",
    "options": [
      "Physical RAM",
      "A memory management technique that uses disk space as an extension of RAM",
      "Cache memory",
      "ROM"
    ],
    "correctIndex": 1,
    "explanation": "Virtual memory is a memory management technique that uses disk space to extend the available RAM, allowing programs to use more memory than physically available.",
    "difficulty": "easy",
    "tags": ["virtual memory", "memory management", "operating systems"],
    "isActive": true,
    "reference": "Virtual Memory Concepts"
  },
  {
    "id": "ca_q16",
    "quizId": "comp_arch_quiz_1",
    "topicId": "virtual_memory",
    "subTopicId": "paging",
    "question": "What is a page fault?",
    "options": [
      "A hardware error",
      "When a program tries to access a page not currently in physical memory",
      "A programming error",
      "A network error"
    ],
    "correctIndex": 1,
    "explanation": "A page fault occurs when a program tries to access a page that is mapped in virtual memory but not loaded in physical memory, requiring the OS to load it from disk.",
    "difficulty": "medium",
    "tags": ["virtual memory", "page fault", "paging"],
    "isActive": true,
    "reference": "Paging and Page Faults"
  },
  {
    "id": "ca_q17",
    "quizId": "comp_arch_quiz_1",
    "topicId": "virtual_memory",
    "subTopicId": "tlb",
    "question": "What is a TLB (Translation Lookaside Buffer)?",
    "options": [
      "A type of RAM",
      "A cache for page table entries",
      "A disk buffer",
      "A network buffer"
    ],
    "correctIndex": 1,
    "explanation": "TLB is a cache that stores recent translations of virtual memory addresses to physical memory addresses, speeding up address translation.",
    "difficulty": "medium",
    "tags": ["TLB", "virtual memory", "address translation"],
    "isActive": true,
    "reference": "Translation Lookaside Buffer"
  },
  {
    "id": "ca_q18",
    "quizId": "comp_arch_quiz_1",
    "topicId": "parallel_processing",
    "subTopicId": "parallel_basics",
    "question": "What is parallel processing?",
    "options": [
      "Running one program at a time",
      "Executing multiple instructions or tasks simultaneously",
      "Sequential execution",
      "Single-threaded execution"
    ],
    "correctIndex": 1,
    "explanation": "Parallel processing involves executing multiple instructions or tasks simultaneously, using multiple processors or cores to improve performance.",
    "difficulty": "easy",
    "tags": ["parallel processing", "concurrency", "performance"],
    "isActive": true,
    "reference": "Parallel Computer Architecture"
  },
  {
    "id": "ca_q19",
    "quizId": "comp_arch_quiz_1",
    "topicId": "parallel_processing",
    "subTopicId": "multicore",
    "question": "What is a multi-core processor?",
    "options": [
      "A processor with multiple cache levels",
      "A processor with multiple independent processing units on a single chip",
      "A processor with multiple instruction sets",
      "A processor with multiple power supplies"
    ],
    "correctIndex": 1,
    "explanation": "A multi-core processor contains multiple independent processing units (cores) on a single chip, allowing true parallel execution of multiple threads.",
    "difficulty": "easy",
    "tags": ["multicore", "parallel processing", "cpu"],
    "isActive": true,
    "reference": "Multi-core Processor Architecture"
  },
  {
    "id": "ca_q20",
    "quizId": "comp_arch_quiz_1",
    "topicId": "bus_architecture",
    "subTopicId": "system_bus",
    "question": "What are the three main components of a system bus?",
    "options": [
      "CPU, RAM, ROM",
      "Data bus, Address bus, Control bus",
      "Input, Output, Storage",
      "Cache, Memory, Disk"
    ],
    "correctIndex": 1,
    "explanation": "The system bus consists of three main components: the data bus (transfers data), address bus (specifies memory locations), and control bus (carries control signals).",
    "difficulty": "easy",
    "tags": ["bus", "system bus", "computer organization"],
    "isActive": true,
    "reference": "System Bus Architecture"
  },
  {
    "id": "ca_q21",
    "quizId": "comp_arch_quiz_1",
    "topicId": "bus_architecture",
    "subTopicId": "bus_types",
    "question": "What determines the maximum memory addressable by a system?",
    "options": [
      "Data bus width",
      "Address bus width",
      "Control bus width",
      "Cache size"
    ],
    "correctIndex": 1,
    "explanation": "The address bus width determines the maximum memory addressable. For example, a 32-bit address bus can address 2^32 memory locations.",
    "difficulty": "medium",
    "tags": ["address bus", "memory addressing", "bus architecture"],
    "isActive": true,
    "reference": "Bus Architecture and Memory Addressing"
  },
  {
    "id": "ca_q22",
    "quizId": "comp_arch_quiz_1",
    "topicId": "io_systems",
    "subTopicId": "io_techniques",
    "question": "What is DMA (Direct Memory Access)?",
    "options": [
      "A type of RAM",
      "A technique allowing devices to transfer data directly to/from memory without CPU intervention",
      "A CPU instruction",
      "A type of cache"
    ],
    "correctIndex": 1,
    "explanation": "DMA allows hardware devices to transfer data directly to/from memory without continuous CPU involvement, freeing the CPU for other tasks.",
    "difficulty": "medium",
    "tags": ["DMA", "I/O", "memory access"],
    "isActive": true,
    "reference": "I/O Systems and DMA"
  },
  {
    "id": "ca_q23",
    "quizId": "comp_arch_quiz_1",
    "topicId": "io_systems",
    "subTopicId": "interrupts",
    "question": "What is an interrupt in computer architecture?",
    "options": [
      "A power failure",
      "A signal that temporarily stops the CPU to handle an event",
      "A programming error",
      "A memory error"
    ],
    "correctIndex": 1,
    "explanation": "An interrupt is a signal that temporarily stops the CPU's current execution to handle a specific event, such as I/O completion or hardware errors.",
    "difficulty": "easy",
    "tags": ["interrupts", "I/O", "cpu"],
    "isActive": true,
    "reference": "Interrupt Handling"
  },
  {
    "id": "ca_q24",
    "quizId": "comp_arch_quiz_1",
    "topicId": "performance_metrics",
    "subTopicId": "cpu_performance",
    "question": "What does CPI stand for in computer architecture?",
    "options": [
      "Computer Performance Index",
      "Cycles Per Instruction",
      "Cache Performance Indicator",
      "Central Processing Interface"
    ],
    "correctIndex": 1,
    "explanation": "CPI stands for Cycles Per Instruction, a metric that measures the average number of clock cycles required to execute an instruction.",
    "difficulty": "easy",
    "tags": ["performance", "CPI", "metrics"],
    "isActive": true,
    "reference": "CPU Performance Metrics"
  },
  {
    "id": "ca_q25",
    "quizId": "comp_arch_quiz_1",
    "topicId": "performance_metrics",
    "subTopicId": "speedup",
    "question": "What is Amdahl's Law used for?",
    "options": [
      "Calculating memory size",
      "Predicting the theoretical speedup of a program using multiple processors",
      "Measuring cache performance",
      "Calculating power consumption"
    ],
    "correctIndex": 1,
    "explanation": "Amdahl's Law is used to predict the theoretical maximum speedup of a program when using multiple processors, considering the portion of the program that can be parallelized.",
    "difficulty": "hard",
    "tags": ["Amdahl's Law", "performance", "parallel processing"],
    "isActive": true,
    "reference": "Amdahl's Law and Performance Analysis"
  }
];


const programmingQuestions = [ {
    "id": "ca_q1",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "What is the primary function of the CPU?",
    "options": [
      "Store data permanently",
      "Execute instructions and perform calculations",
      "Display graphics",
      "Connect to the internet"
    ],
    "correctIndex": 1,
    "explanation": "The CPU (Central Processing Unit) is responsible for executing instructions and performing calculations, acting as the brain of the computer.",
    "difficulty": "easy",
    "tags": ["cpu", "basics", "computer organization"],
    "isActive": true,
    "reference": "Computer Organization and Design - Patterson & Hennessy"
  },{
    "id": "ca_q4",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "What is the primary function of the CPU?",
    "options": [
      "Store data permanently",
      "Execute instructions and perform calculations",
      "Display graphics",
      "Connect to the internet"
    ],
    "correctIndex": 1,
    "explanation": "The CPU (Central Processing Unit) is responsible for executing instructions and performing calculations, acting as the brain of the computer.",
    "difficulty": "easy",
    "tags": ["cpu", "basics", "computer organization"],
    "isActive": true,
    "reference": "Computer Organization and Design - Patterson & Hennessy"
  },
  {
    "id": "ca_q2",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "Which component of the CPU performs arithmetic and logical operations?",
    "options": [
      "Control Unit",
      "ALU (Arithmetic Logic Unit)",
      "Cache",
      "Registers"
    ],
    "correctIndex": 1,
    "explanation": "The ALU (Arithmetic Logic Unit) is responsible for performing arithmetic operations (addition, subtraction) and logical operations (AND, OR, NOT).",
    "difficulty": "easy",
    "tags": ["cpu", "ALU", "components"],
    "isActive": true,
    "reference": "Computer Architecture Fundamentals"
  },
  {
    "id": "ca_q3",
    "quizId": "comp_arch_quiz_1",
    "topicId": "memory_hierarchy",
    "subTopicId": "cache_memory",
    "question": "What is cache memory?",
    "options": [
      "Permanent storage",
      "Small, fast memory located close to the CPU",
      "Virtual memory on disk",
      "Network storage"
    ],
    "correctIndex": 1,
    "explanation": "Cache memory is a small, fast memory located close to the CPU that stores frequently accessed data and instructions to reduce access time.",
    "difficulty": "easy",
    "tags": ["memory", "cache", "memory hierarchy"],
    "isActive": true,
    "reference": "Computer Architecture - Hennessy & Patterson"
  }];

const osQuestions = [ {
    "id": "ca_q1",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "What is the primary function of the CPU?",
    "options": [
      "Store data permanently",
      "Execute instructions and perform calculations",
      "Display graphics",
      "Connect to the internet"
    ],
    "correctIndex": 1,
    "explanation": "The CPU (Central Processing Unit) is responsible for executing instructions and performing calculations, acting as the brain of the computer.",
    "difficulty": "easy",
    "tags": ["cpu", "basics", "computer organization"],
    "isActive": true,
    "reference": "Computer Organization and Design - Patterson & Hennessy"
  },
  {
    "id": "ca_q2",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "Which component of the CPU performs arithmetic and logical operations?",
    "options": [
      "Control Unit",
      "ALU (Arithmetic Logic Unit)",
      "Cache",
      "Registers"
    ],
    "correctIndex": 1,
    "explanation": "The ALU (Arithmetic Logic Unit) is responsible for performing arithmetic operations (addition, subtraction) and logical operations (AND, OR, NOT).",
    "difficulty": "easy",
    "tags": ["cpu", "ALU", "components"],
    "isActive": true,
    "reference": "Computer Architecture Fundamentals"
  },
  {
    "id": "ca_q3",
    "quizId": "comp_arch_quiz_1",
    "topicId": "memory_hierarchy",
    "subTopicId": "cache_memory",
    "question": "What is cache memory?",
    "options": [
      "Permanent storage",
      "Small, fast memory located close to the CPU",
      "Virtual memory on disk",
      "Network storage"
    ],
    "correctIndex": 1,
    "explanation": "Cache memory is a small, fast memory located close to the CPU that stores frequently accessed data and instructions to reduce access time.",
    "difficulty": "easy",
    "tags": ["memory", "cache", "memory hierarchy"],
    "isActive": true,
    "reference": "Computer Architecture - Hennessy & Patterson"
  }];
const networkQuestions = [ {
    "id": "ca_q1",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "What is the primary function of the CPU?",
    "options": [
      "Store data permanently",
      "Execute instructions and perform calculations",
      "Display graphics",
      "Connect to the internet"
    ],
    "correctIndex": 1,
    "explanation": "The CPU (Central Processing Unit) is responsible for executing instructions and performing calculations, acting as the brain of the computer.",
    "difficulty": "easy",
    "tags": ["cpu", "basics", "computer organization"],
    "isActive": true,
    "reference": "Computer Organization and Design - Patterson & Hennessy"
  },
  {
    "id": "ca_q2",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "Which component of the CPU performs arithmetic and logical operations?",
    "options": [
      "Control Unit",
      "ALU (Arithmetic Logic Unit)",
      "Cache",
      "Registers"
    ],
    "correctIndex": 1,
    "explanation": "The ALU (Arithmetic Logic Unit) is responsible for performing arithmetic operations (addition, subtraction) and logical operations (AND, OR, NOT).",
    "difficulty": "easy",
    "tags": ["cpu", "ALU", "components"],
    "isActive": true,
    "reference": "Computer Architecture Fundamentals"
  },
  {
    "id": "ca_q3",
    "quizId": "comp_arch_quiz_1",
    "topicId": "memory_hierarchy",
    "subTopicId": "cache_memory",
    "question": "What is cache memory?",
    "options": [
      "Permanent storage",
      "Small, fast memory located close to the CPU",
      "Virtual memory on disk",
      "Network storage"
    ],
    "correctIndex": 1,
    "explanation": "Cache memory is a small, fast memory located close to the CPU that stores frequently accessed data and instructions to reduce access time.",
    "difficulty": "easy",
    "tags": ["memory", "cache", "memory hierarchy"],
    "isActive": true,
    "reference": "Computer Architecture - Hennessy & Patterson"
  }];

const securityQuestions = [ {
    "id": "ca_q1",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "What is the primary function of the CPU?",
    "options": [
      "Store data permanently",
      "Execute instructions and perform calculations",
      "Display graphics",
      "Connect to the internet"
    ],
    "correctIndex": 1,
    "explanation": "The CPU (Central Processing Unit) is responsible for executing instructions and performing calculations, acting as the brain of the computer.",
    "difficulty": "easy",
    "tags": ["cpu", "basics", "computer organization"],
    "isActive": true,
    "reference": "Computer Organization and Design - Patterson & Hennessy"
  },
  {
    "id": "ca_q2",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "Which component of the CPU performs arithmetic and logical operations?",
    "options": [
      "Control Unit",
      "ALU (Arithmetic Logic Unit)",
      "Cache",
      "Registers"
    ],
    "correctIndex": 1,
    "explanation": "The ALU (Arithmetic Logic Unit) is responsible for performing arithmetic operations (addition, subtraction) and logical operations (AND, OR, NOT).",
    "difficulty": "easy",
    "tags": ["cpu", "ALU", "components"],
    "isActive": true,
    "reference": "Computer Architecture Fundamentals"
  },
  {
    "id": "ca_q3",
    "quizId": "comp_arch_quiz_1",
    "topicId": "memory_hierarchy",
    "subTopicId": "cache_memory",
    "question": "What is cache memory?",
    "options": [
      "Permanent storage",
      "Small, fast memory located close to the CPU",
      "Virtual memory on disk",
      "Network storage"
    ],
    "correctIndex": 1,
    "explanation": "Cache memory is a small, fast memory located close to the CPU that stores frequently accessed data and instructions to reduce access time.",
    "difficulty": "easy",
    "tags": ["memory", "cache", "memory hierarchy"],
    "isActive": true,
    "reference": "Computer Architecture - Hennessy & Patterson"
  }];
const algorithmQuestions=[ {
    "id": "ca_q1",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "What is the primary function of the CPU?",
    "options": [
      "Store data permanently",
      "Execute instructions and perform calculations",
      "Display graphics",
      "Connect to the internet"
    ],
    "correctIndex": 1,
    "explanation": "The CPU (Central Processing Unit) is responsible for executing instructions and performing calculations, acting as the brain of the computer.",
    "difficulty": "easy",
    "tags": ["cpu", "basics", "computer organization"],
    "isActive": true,
    "reference": "Computer Organization and Design - Patterson & Hennessy"
  },
  {
    "id": "ca_q2",
    "quizId": "comp_arch_quiz_1",
    "topicId": "cpu_basics",
    "subTopicId": "cpu_components",
    "question": "Which component of the CPU performs arithmetic and logical operations?",
    "options": [
      "Control Unit",
      "ALU (Arithmetic Logic Unit)",
      "Cache",
      "Registers"
    ],
    "correctIndex": 1,
    "explanation": "The ALU (Arithmetic Logic Unit) is responsible for performing arithmetic operations (addition, subtraction) and logical operations (AND, OR, NOT).",
    "difficulty": "easy",
    "tags": ["cpu", "ALU", "components"],
    "isActive": true,
    "reference": "Computer Architecture Fundamentals"
  },
  {
    "id": "ca_q3",
    "quizId": "comp_arch_quiz_1",
    "topicId": "memory_hierarchy",
    "subTopicId": "cache_memory",
    "question": "What is cache memory?",
    "options": [
      "Permanent storage",
      "Small, fast memory located close to the CPU",
      "Virtual memory on disk",
      "Network storage"
    ],
    "correctIndex": 1,
    "explanation": "Cache memory is a small, fast memory located close to the CPU that stores frequently accessed data and instructions to reduce access time.",
    "difficulty": "easy",
    "tags": ["memory", "cache", "memory hierarchy"],
    "isActive": true,
    "reference": "Computer Architecture - Hennessy & Patterson"
  }];