
// COMPUTER ARCHITECTURE QUESTIONS
const computerFundamentalQuestions =
[
  {
    "id": "cf_q1",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "computer_generations",
    "subTopicId": "first_generation",
    "question": "Which electronic component was primarily used in first-generation computers?",
    "options": [
      "Vacuum tubes",
      "Transistors",
      "Integrated circuits",
      "Microprocessors"
    ],
    "correctIndex": 0,
    "explanation": "First-generation computers (1940s-1950s) used vacuum tubes as their primary electronic component. These were large, generated significant heat, consumed substantial power, and were unreliable. Examples include ENIAC and UNIVAC. Transistors came in the second generation, integrated circuits in the third, and microprocessors in the fourth generation.",
    "difficulty": "easy",
    "tags": ["computer_generations", "vacuum_tubes", "history"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q2",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "cpu_components",
    "subTopicId": "control_unit",
    "question": "What is the primary function of the Control Unit (CU) in a CPU?",
    "options": [
      "Perform arithmetic calculations",
      "Direct and coordinate operations of the computer",
      "Store temporary data during processing",
      "Connect the CPU to external devices"
    ],
    "correctIndex": 1,
    "explanation": "The Control Unit (CU) is responsible for directing and coordinating all operations within the computer. It fetches instructions from memory, decodes them, and generates control signals to execute them. It manages the flow of data between the CPU, memory, and I/O devices. Arithmetic operations are performed by the ALU, not the CU.",
    "difficulty": "easy",
    "tags": ["cpu", "control_unit", "architecture"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q3",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "primary_memory",
    "subTopicId": "ram_types",
    "question": "Which type of RAM loses its contents when power is turned off?",
    "options": [
      "ROM",
      "PROM",
      "Volatile RAM",
      "EEPROM"
    ],
    "correctIndex": 2,
    "explanation": "RAM (Random Access Memory) is volatile memory, meaning it loses all stored data when power is removed. This is in contrast to ROM (Read-Only Memory) and its variants (PROM, EPROM, EEPROM), which are non-volatile and retain data even without power. The volatile nature of RAM makes it suitable for temporary storage during program execution.",
    "difficulty": "easy",
    "tags": ["memory", "ram", "volatile"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q4",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "computer_buses",
    "subTopicId": "data_bus",
    "question": "What does the width of a data bus determine?",
    "options": [
      "The maximum memory capacity",
      "The number of bits transferred simultaneously",
      "The speed of the processor clock",
      "The number of peripheral devices that can be connected"
    ],
    "correctIndex": 1,
    "explanation": "The width of a data bus determines how many bits can be transferred simultaneously between components. For example, a 64-bit data bus can transfer 64 bits of data at once, while a 32-bit bus transfers 32 bits. A wider data bus generally means faster data transfer rates and better system performance. The address bus width determines maximum memory capacity, not the data bus.",
    "difficulty": "medium",
    "tags": ["buses", "data_bus", "architecture"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q5",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "types_of_computers",
    "subTopicId": "supercomputer",
    "question": "Which type of computer is specifically designed for complex scientific calculations and simulations?",
    "options": [
      "Mainframe computer",
      "Supercomputer",
      "Workstation",
      "Minicomputer"
    ],
    "correctIndex": 1,
    "explanation": "Supercomputers are the most powerful computers designed specifically for complex scientific calculations, weather forecasting, nuclear simulations, and other computationally intensive tasks. They can perform trillions of calculations per second (measured in FLOPS). While mainframes handle large-scale transaction processing and workstations are powerful desktop computers, supercomputers are in a class of their own for raw computational power.",
    "difficulty": "easy",
    "tags": ["computer_types", "supercomputer", "classification"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q6",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "von_neumann_architecture",
    "subTopicId": "stored_program",
    "question": "What is the key concept of Von Neumann architecture?",
    "options": [
      "Separate storage for data and instructions",
      "Instructions and data stored in the same memory",
      "Multiple processors working simultaneously",
      "Direct execution from external storage"
    ],
    "correctIndex": 1,
    "explanation": "The fundamental concept of Von Neumann architecture is the stored program concept, where both instructions and data are stored in the same memory and treated identically. This allows programs to be easily modified and enables the computer to be general-purpose. The CPU fetches instructions sequentially from memory, decodes them, and executes them. This unified memory approach distinguishes it from Harvard architecture, which uses separate memory for instructions and data.",
    "difficulty": "medium",
    "tags": ["architecture", "von_neumann", "stored_program"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q7",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "registers",
    "subTopicId": "program_counter",
    "question": "What does the Program Counter (PC) register store?",
    "options": [
      "The current instruction being executed",
      "The address of the next instruction to be fetched",
      "The result of arithmetic operations",
      "The memory address being accessed"
    ],
    "correctIndex": 1,
    "explanation": "The Program Counter (PC) holds the memory address of the next instruction to be fetched and executed. After each instruction fetch, the PC is automatically incremented to point to the next sequential instruction. This allows the CPU to execute instructions in sequence. The Current Instruction Register (CIR) holds the current instruction, the Accumulator (ACC) stores arithmetic results, and the Memory Address Register (MAR) holds the address being accessed.",
    "difficulty": "medium",
    "tags": ["registers", "program_counter", "cpu"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q8",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "fetch_decode_execute",
    "subTopicId": "fetch_cycle",
    "question": "In the Fetch-Decode-Execute cycle, what happens during the Fetch stage?",
    "options": [
      "The instruction is interpreted and prepared for execution",
      "The instruction is retrieved from memory and loaded into the CPU",
      "The instruction is carried out and results are stored",
      "The next instruction address is calculated"
    ],
    "correctIndex": 1,
    "explanation": "During the Fetch stage, the CPU retrieves the instruction from memory at the address specified by the Program Counter (PC) and loads it into the Current Instruction Register (CIR). The PC is then incremented to point to the next instruction. The Decode stage interprets the instruction, and the Execute stage carries out the instruction's operation. This cycle repeats continuously during program execution.",
    "difficulty": "easy",
    "tags": ["fetch_decode_execute", "cpu_cycle", "instruction_processing"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q9",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "risc_vs_cisc",
    "subTopicId": "risc",
    "question": "Which characteristic is typical of RISC (Reduced Instruction Set Computer) architecture?",
    "options": [
      "Large number of complex instructions",
      "Variable-length instruction format",
      "Simple instructions executed in one clock cycle",
      "Heavy reliance on microcode"
    ],
    "correctIndex": 2,
    "explanation": "RISC architecture is characterized by a small set of simple instructions that can typically be executed in a single clock cycle. RISC processors use fixed-length instruction formats, have more registers, and rely on the compiler to optimize code. This contrasts with CISC (Complex Instruction Set Computer) architecture, which has many complex instructions of variable length that may take multiple clock cycles to execute. RISC emphasizes hardware simplicity and software complexity.",
    "difficulty": "medium",
    "tags": ["risc", "cisc", "architecture"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q10",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "primary_memory",
    "subTopicId": "cache_memory",
    "question": "Which cache level is typically the fastest but smallest in size?",
    "options": [
      "L3 Cache",
      "L2 Cache",
      "L1 Cache",
      "L4 Cache"
    ],
    "correctIndex": 2,
    "explanation": "L1 (Level 1) cache is the fastest cache memory but also the smallest, typically ranging from 32KB to 128KB per core. It is located closest to the CPU core and has the lowest latency. L2 cache is larger but slower than L1, and L3 cache is even larger but slower still. The cache hierarchy follows the principle that faster memory is more expensive and therefore smaller, while slower memory can be larger and less expensive.",
    "difficulty": "easy",
    "tags": ["cache", "memory_hierarchy", "performance"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q11",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "computer_generations",
    "subTopicId": "third_generation",
    "question": "What technological advancement characterized third-generation computers?",
    "options": [
      "Vacuum tubes",
      "Transistors",
      "Integrated Circuits (ICs)",
      "Artificial Intelligence"
    ],
    "correctIndex": 2,
    "explanation": "Third-generation computers (1960s-1970s) were characterized by the use of Integrated Circuits (ICs), which combined multiple transistors on a single silicon chip. This led to smaller, faster, more reliable, and more energy-efficient computers compared to previous generations. ICs dramatically reduced the size and cost of computers while increasing their capabilities. Examples include the IBM System/360 series.",
    "difficulty": "easy",
    "tags": ["computer_generations", "integrated_circuits", "history"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q12",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "sram_vs_dram",
    "subTopicId": "sram",
    "question": "What is a key advantage of SRAM over DRAM?",
    "options": [
      "Lower cost per bit",
      "Higher storage density",
      "Faster access speed",
      "Lower power consumption when idle"
    ],
    "correctIndex": 2,
    "explanation": "SRAM (Static RAM) is significantly faster than DRAM (Dynamic RAM) because it doesn't require constant refreshing. SRAM uses flip-flops to store each bit, allowing for immediate access. However, SRAM is more expensive, has lower storage density (requires more transistors per bit), and consumes more power. This is why SRAM is used for cache memory where speed is critical, while DRAM is used for main memory where capacity and cost are more important.",
    "difficulty": "medium",
    "tags": ["sram", "dram", "memory_types"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q13",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "rom_types",
    "subTopicId": "eprom",
    "question": "How is an EPROM (Erasable Programmable ROM) typically erased?",
    "options": [
      "By applying high voltage",
      "By exposing it to ultraviolet light",
      "By using electrical signals",
      "By heating it to high temperatures"
    ],
    "correctIndex": 1,
    "explanation": "EPROM (Erasable Programmable ROM) is erased by exposing it to strong ultraviolet (UV) light through a transparent quartz window on the chip. The UV light causes the stored charge to dissipate, erasing the data. This process typically takes 15-20 minutes. After erasure, the EPROM can be reprogrammed. This distinguishes it from EEPROM (Electrically Erasable Programmable ROM), which can be erased using electrical signals, and PROM, which can only be programmed once.",
    "difficulty": "medium",
    "tags": ["rom", "eprom", "memory_types"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q14",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "ssd_vs_hdd",
    "subTopicId": "ssd",
    "question": "Which advantage does an SSD have over a traditional HDD?",
    "options": [
      "Lower cost per gigabyte",
      "Larger storage capacity",
      "No moving parts, making it more durable",
      "Longer lifespan with unlimited write cycles"
    ],
    "correctIndex": 2,
    "explanation": "SSDs (Solid State Drives) have no moving parts, using flash memory instead of spinning magnetic platters. This makes them more durable, shock-resistant, faster, quieter, and more energy-efficient than HDDs. However, SSDs are more expensive per gigabyte and have limited write cycles (though modern SSDs have very high endurance). HDDs still offer advantages in cost per gigabyte and maximum capacity for bulk storage applications.",
    "difficulty": "easy",
    "tags": ["storage", "ssd", "hdd"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q15",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "cpu_components",
    "subTopicId": "alu",
    "question": "What is the primary function of the Arithmetic Logic Unit (ALU)?",
    "options": [
      "Store program instructions",
      "Control the flow of data between components",
      "Perform arithmetic and logical operations",
      "Manage input and output operations"
    ],
    "correctIndex": 2,
    "explanation": "The Arithmetic Logic Unit (ALU) is the component of the CPU that performs all arithmetic operations (addition, subtraction, multiplication, division) and logical operations (AND, OR, NOT, comparisons). It receives operands from registers, performs the requested operation, and stores the result back in a register (typically the Accumulator). The ALU is fundamental to all computational tasks performed by the processor.",
    "difficulty": "easy",
    "tags": ["cpu", "alu", "arithmetic"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q16",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "multicore_processors",
    "subTopicId": "multicore",
    "question": "What is the main advantage of a multi-core processor over a single-core processor?",
    "options": [
      "Higher clock speed per core",
      "Lower power consumption per core",
      "Ability to execute multiple threads simultaneously",
      "Simpler programming requirements"
    ],
    "correctIndex": 2,
    "explanation": "Multi-core processors contain multiple processing cores on a single chip, allowing them to execute multiple threads or processes simultaneously (true parallelism). This improves overall system performance, especially for multitasking and multi-threaded applications. While individual cores may run at lower clock speeds than single-core processors, the parallel processing capability provides better performance and efficiency. However, software must be designed to take advantage of multiple cores.",
    "difficulty": "medium",
    "tags": ["processors", "multicore", "performance"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q17",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "bios_and_post",
    "subTopicId": "post",
    "question": "What does POST stand for in computer systems?",
    "options": [
      "Program Operating System Test",
      "Power-On Self-Test",
      "Peripheral Output System Transfer",
      "Primary Operating System Toolkit"
    ],
    "correctIndex": 1,
    "explanation": "POST stands for Power-On Self-Test. It is a diagnostic testing sequence run by the BIOS/UEFI firmware when the computer is powered on. POST checks the functionality of essential hardware components including the CPU, RAM, keyboard, and storage devices. If POST detects a problem, it typically produces beep codes or displays error messages. Successful completion of POST allows the boot process to continue to loading the operating system.",
    "difficulty": "easy",
    "tags": ["bios", "post", "boot_process"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q18",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "computer_buses",
    "subTopicId": "address_bus",
    "question": "If a computer has a 32-bit address bus, what is the maximum amount of memory it can directly address?",
    "options": [
      "32 MB",
      "32 GB",
      "4 GB",
      "4 TB"
    ],
    "correctIndex": 2,
    "explanation": "A 32-bit address bus can address 2^32 different memory locations. Since each location typically represents one byte, this equals 4,294,967,296 bytes or 4 GB of memory. This is calculated as 2^32 = 4,294,967,296 bytes = 4 GB. This limitation is why 32-bit operating systems cannot utilize more than 4 GB of RAM effectively. Modern 64-bit systems with 64-bit address buses can theoretically address 2^64 bytes, though practical limits are much lower.",
    "difficulty": "hard",
    "tags": ["buses", "address_bus", "memory_addressing"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q19",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "types_of_computers",
    "subTopicId": "hybrid_computer",
    "question": "What is a hybrid computer?",
    "options": [
      "A computer that runs multiple operating systems",
      "A computer that combines features of analog and digital computers",
      "A computer with both HDD and SSD storage",
      "A computer that can switch between desktop and laptop modes"
    ],
    "correctIndex": 1,
    "explanation": "A hybrid computer combines the features of both analog and digital computers. It uses analog components to measure continuous physical quantities (like temperature, pressure, or voltage) and digital components to process and store the data. Hybrid computers are used in specialized applications like medical equipment (ICU monitors), industrial process control, and scientific research where real-time analog data needs to be processed digitally. They leverage the speed of analog computation with the precision and storage capabilities of digital systems.",
    "difficulty": "medium",
    "tags": ["computer_types", "hybrid", "analog_digital"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q20",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "von_neumann_architecture",
    "subTopicId": "bottleneck",
    "question": "What is the Von Neumann bottleneck?",
    "options": [
      "The limited speed of the CPU compared to memory",
      "The limitation caused by shared bus for instructions and data",
      "The maximum size of addressable memory",
      "The delay in the fetch-decode-execute cycle"
    ],
    "correctIndex": 1,
    "explanation": "The Von Neumann bottleneck refers to the limitation in throughput caused by the shared bus between the CPU and memory for both instructions and data. Since instructions and data must be fetched sequentially over the same bus, the CPU often has to wait for memory access, limiting overall system performance. This bottleneck becomes more significant as CPU speeds increase faster than memory speeds. Modern architectures use techniques like cache memory, pipelining, and separate instruction/data caches to mitigate this issue.",
    "difficulty": "hard",
    "tags": ["architecture", "von_neumann", "bottleneck"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q21",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "registers",
    "subTopicId": "mar",
    "question": "What is stored in the Memory Address Register (MAR)?",
    "options": [
      "The data being transferred to or from memory",
      "The address of the memory location being accessed",
      "The current instruction being executed",
      "The result of the last arithmetic operation"
    ],
    "correctIndex": 1,
    "explanation": "The Memory Address Register (MAR) holds the address of the memory location that is currently being accessed for reading or writing. When the CPU needs to access memory, it places the address in the MAR, which is then sent to memory via the address bus. The Memory Data Register (MDR) holds the actual data being transferred, the Current Instruction Register (CIR) holds the current instruction, and the Accumulator (ACC) stores arithmetic results.",
    "difficulty": "medium",
    "tags": ["registers", "mar", "memory_access"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q22",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "dram_types",
    "subTopicId": "ddr",
    "question": "What does DDR stand for in DDR RAM?",
    "options": [
      "Digital Data Rate",
      "Double Data Rate",
      "Dynamic Data Refresh",
      "Dual Density RAM"
    ],
    "correctIndex": 1,
    "explanation": "DDR stands for Double Data Rate. DDR RAM transfers data on both the rising and falling edges of the clock signal, effectively doubling the data transfer rate compared to SDR (Single Data Rate) RAM, which only transfers on the rising edge. This technology has evolved through several generations (DDR, DDR2, DDR3, DDR4, DDR5), with each generation offering improvements in speed, bandwidth, and power efficiency while maintaining backward compatibility in the naming convention.",
    "difficulty": "easy",
    "tags": ["memory", "ddr", "ram_types"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q23",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "motherboard",
    "subTopicId": "components",
    "question": "What is the primary function of a computer motherboard?",
    "options": [
      "Store the operating system",
      "Provide power to all components",
      "Connect and allow communication between all computer components",
      "Cool the processor and other components"
    ],
    "correctIndex": 2,
    "explanation": "The motherboard is the main circuit board that connects and allows communication between all computer components including the CPU, RAM, storage devices, and expansion cards. It contains the chipset, buses, slots, and connectors that enable these components to work together. While the power supply provides power and the motherboard distributes it, the motherboard's primary function is facilitating communication and data transfer between components through its various buses and interfaces.",
    "difficulty": "easy",
    "tags": ["motherboard", "hardware", "system_board"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q24",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "computer_generations",
    "subTopicId": "fourth_generation",
    "question": "Which component defines fourth-generation computers?",
    "options": [
      "Integrated Circuits",
      "Microprocessors",
      "Transistors",
      "Quantum processors"
    ],
    "correctIndex": 1,
    "explanation": "Fourth-generation computers (1970s-1980s) are characterized by the use of microprocessors, which integrate the entire CPU on a single chip. The Intel 4004, released in 1971, was the first commercial microprocessor. This generation saw the development of personal computers (PCs) like the Apple II, IBM PC, and Commodore 64. Microprocessors made computers smaller, more affordable, and accessible to individuals and small businesses, revolutionizing the computer industry.",
    "difficulty": "easy",
    "tags": ["computer_generations", "microprocessors", "history"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q25",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "booting_sequence",
    "subTopicId": "boot_process",
    "question": "What is the correct order of the boot sequence?",
    "options": [
      "POST → Load OS → BIOS → User Login",
      "BIOS → Load OS → POST → User Login",
      "BIOS → POST → Load OS → User Login",
      "Load OS → BIOS → POST → User Login"
    ],
    "correctIndex": 2,
    "explanation": "The correct boot sequence is: 1) BIOS/UEFI firmware initializes when power is applied, 2) POST (Power-On Self-Test) checks hardware components, 3) BIOS locates and loads the bootloader from the boot device, 4) Bootloader loads the operating system into memory, 5) OS initializes and presents the user login screen. This sequence ensures that hardware is functioning properly before attempting to load the operating system.",
    "difficulty": "medium",
    "tags": ["booting", "boot_sequence", "startup"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q26",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "firmware_vs_software",
    "subTopicId": "firmware",
    "question": "What is firmware?",
    "options": [
      "Software that can be easily modified by users",
      "Software permanently stored in hardware devices",
      "Temporary software loaded into RAM",
      "Software used only for gaming"
    ],
    "correctIndex": 1,
    "explanation": "Firmware is software that is permanently or semi-permanently stored in hardware devices, typically in ROM, EPROM, or flash memory. It provides low-level control for the device's specific hardware and is essential for the device to function. Examples include BIOS/UEFI, router firmware, and embedded system software. Unlike regular software, firmware is not easily modified by users and sits between hardware and software, providing the interface between them. It can be updated but requires special procedures.",
    "difficulty": "medium",
    "tags": ["firmware", "software", "hardware"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q27",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "io_devices",
    "subTopicId": "usb",
    "question": "What does USB stand for?",
    "options": [
      "Universal System Bus",
      "Universal Serial Bus",
      "Unified Storage Bus",
      "Universal Signal Bridge"
    ],
    "correctIndex": 1,
    "explanation": "USB stands for Universal Serial Bus. It is a standard interface for connecting peripheral devices to computers, allowing for data transfer and power delivery through a single cable. USB has evolved through several versions (USB 1.0, 2.0, 3.0, 3.1, 3.2, 4.0) with increasing data transfer speeds. USB supports hot-swapping (connecting/disconnecting without powering down) and can connect various devices including keyboards, mice, storage devices, printers, and smartphones.",
    "difficulty": "easy",
    "tags": ["io_devices", "usb", "ports"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q28",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "character_representation",
    "subTopicId": "ascii",
    "question": "How many bits does standard ASCII use to represent a character?",
    "options": [
      "4 bits",
      "7 bits",
      "8 bits",
      "16 bits"
    ],
    "correctIndex": 1,
    "explanation": "Standard ASCII (American Standard Code for Information Interchange) uses 7 bits to represent characters, allowing for 128 different characters (2^7 = 128). These include uppercase and lowercase letters, digits, punctuation marks, and control characters. Extended ASCII uses 8 bits (1 byte) for 256 characters. Unicode, which includes ASCII as a subset, uses 16 or more bits to represent characters from multiple languages and symbol sets worldwide.",
    "difficulty": "medium",
    "tags": ["character_encoding", "ascii", "data_representation"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q29",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "memory_sizes",
    "subTopicId": "units",
    "question": "How many bytes are in 1 Kilobyte (KB)?",
    "options": [
      "1000 bytes",
      "1024 bytes",
      "1048 bytes",
      "1000000 bytes"
    ],
    "correctIndex": 1,
    "explanation": "In computing, 1 Kilobyte (KB) equals 1024 bytes, not 1000. This is because computers use binary (base-2) arithmetic, and 1024 is 2^10. Similarly, 1 Megabyte (MB) = 1024 KB, 1 Gigabyte (GB) = 1024 MB, and 1 Terabyte (TB) = 1024 GB. However, storage manufacturers sometimes use decimal (base-10) measurements where 1 KB = 1000 bytes, which can cause confusion. The binary standard uses KiB (Kibibyte) for 1024 bytes to distinguish from the decimal KB.",
    "difficulty": "easy",
    "tags": ["memory", "units", "data_measurement"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q30",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "types_of_computers",
    "subTopicId": "mainframe",
    "question": "What is a mainframe computer primarily used for?",
    "options": [
      "Personal computing and gaming",
      "Large-scale transaction processing and data management",
      "Scientific simulations and weather forecasting",
      "Graphic design and video editing"
    ],
    "correctIndex": 1,
    "explanation": "Mainframe computers are large, powerful systems designed for large-scale transaction processing, bulk data processing, and managing databases for large organizations. They can handle thousands of concurrent users and process millions of transactions per day. Banks, insurance companies, airlines, and government agencies use mainframes for critical applications requiring high reliability, security, and availability. While supercomputers focus on computational speed, mainframes emphasize throughput, reliability, and the ability to run multiple applications simultaneously.",
    "difficulty": "easy",
    "tags": ["computer_types", "mainframe", "enterprise"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q31",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "risc_vs_cisc",
    "subTopicId": "cisc",
    "question": "Which of the following is a characteristic of CISC architecture?",
    "options": [
      "Fixed-length instruction format",
      "Large number of general-purpose registers",
      "Complex instructions that can perform multiple operations",
      "All instructions execute in one clock cycle"
    ],
    "correctIndex": 2,
    "explanation": "CISC (Complex Instruction Set Computer) architecture features a large set of complex instructions that can perform multiple low-level operations (like load, arithmetic operation, and store) in a single instruction. CISC uses variable-length instruction formats, has fewer registers than RISC, and instructions may take multiple clock cycles to execute. Examples include x86 processors. The philosophy is to reduce the number of instructions per program by making each instruction more powerful, though this increases hardware complexity.",
    "difficulty": "medium",
    "tags": ["cisc", "risc", "architecture"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q32",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "primary_vs_secondary",
    "subTopicId": "comparison",
    "question": "Which statement correctly distinguishes primary memory from secondary memory?",
    "options": [
      "Primary memory is slower but has larger capacity",
      "Primary memory is volatile and directly accessible by the CPU",
      "Primary memory is non-volatile and used for long-term storage",
      "Primary memory is cheaper per gigabyte than secondary memory"
    ],
    "correctIndex": 1,
    "explanation": "Primary memory (RAM) is volatile, meaning it loses data when power is off, and is directly accessible by the CPU for fast read/write operations. It has limited capacity and is more expensive per gigabyte. Secondary memory (HDD, SSD) is non-volatile, retains data without power, has much larger capacity, and is cheaper per gigabyte, but is slower and not directly accessible by the CPU. Data must be loaded from secondary to primary memory before the CPU can process it.",
    "difficulty": "medium",
    "tags": ["memory", "primary_memory", "secondary_memory"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q33",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "registers",
    "subTopicId": "accumulator",
    "question": "What is the primary purpose of the Accumulator (ACC) register?",
    "options": [
      "Store the address of the next instruction",
      "Hold the current instruction being decoded",
      "Store intermediate arithmetic and logic results",
      "Control the sequence of operations"
    ],
    "correctIndex": 2,
    "explanation": "The Accumulator (ACC) is a register that stores intermediate results of arithmetic and logical operations performed by the ALU. It acts as a temporary storage location for operands and results during calculations. For example, when adding two numbers, one operand comes from the accumulator, the other from memory or another register, and the result is stored back in the accumulator. This makes the accumulator central to most computational operations in the CPU.",
    "difficulty": "medium",
    "tags": ["registers", "accumulator", "cpu"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q34",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "computer_generations",
    "subTopicId": "fifth_generation",
    "question": "What technology characterizes fifth-generation computers?",
    "options": [
      "Microprocessors",
      "Integrated circuits",
      "Artificial Intelligence and parallel processing",
      "Transistors"
    ],
    "correctIndex": 2,
    "explanation": "Fifth-generation computers (1980s-present) are characterized by artificial intelligence, machine learning, natural language processing, and parallel processing capabilities. These systems aim to mimic human intelligence and reasoning. Technologies include expert systems, neural networks, and quantum computing research. Fifth-generation computers use VLSI (Very Large Scale Integration) and ULSI (Ultra Large Scale Integration) technology, with millions of transistors on a single chip. The focus is on making computers that can learn, reason, and interact naturally with humans.",
    "difficulty": "medium",
    "tags": ["computer_generations", "ai", "modern_computing"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q35",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "computer_buses",
    "subTopicId": "control_bus",
    "question": "What type of signals does the control bus carry?",
    "options": [
      "Memory addresses",
      "Data being transferred",
      "Control and timing signals",
      "Power supply voltages"
    ],
    "correctIndex": 2,
    "explanation": "The control bus carries control and timing signals that coordinate and manage the operations of the computer system. These signals include read/write commands, clock signals, interrupt requests, bus request/grant signals, and reset signals. The control bus is bidirectional and ensures that data transfers occur at the right time and in the right direction. It works in conjunction with the address bus (which carries addresses) and data bus (which carries data) to enable proper system operation.",
    "difficulty": "medium",
    "tags": ["buses", "control_bus", "signals"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q36",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "types_of_computers",
    "subTopicId": "workstation",
    "question": "What distinguishes a workstation from a regular personal computer?",
    "options": [
      "Workstations are portable and battery-powered",
      "Workstations have higher performance for specialized professional tasks",
      "Workstations can only run server operating systems",
      "Workstations are less expensive than personal computers"
    ],
    "correctIndex": 1,
    "explanation": "Workstations are high-performance computers designed for specialized professional tasks such as CAD (Computer-Aided Design), 3D modeling, video editing, scientific computing, and software development. They typically feature more powerful processors, larger amounts of RAM, professional-grade graphics cards, and enhanced reliability compared to standard personal computers. Workstations are more expensive but provide the performance needed for demanding applications. They run desktop operating systems but with professional-grade hardware.",
    "difficulty": "easy",
    "tags": ["computer_types", "workstation", "professional"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q37",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "dram_types",
    "subTopicId": "sdram",
    "question": "What does the 'S' in SDRAM stand for?",
    "options": [
      "Static",
      "Synchronous",
      "Sequential",
      "Secure"
    ],
    "correctIndex": 1,
    "explanation": "SDRAM stands for Synchronous Dynamic RAM. The 'synchronous' means that the RAM is synchronized with the system clock, allowing the memory controller to know exactly when requested data will be ready. This synchronization improves performance compared to asynchronous DRAM. SDRAM operates in sync with the CPU's bus clock, enabling faster and more efficient data transfers. DDR (Double Data Rate) SDRAM is an evolution that transfers data on both clock edges.",
    "difficulty": "medium",
    "tags": ["memory", "sdram", "ram_types"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q38",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "rom_types",
    "subTopicId": "eeprom",
    "question": "What is a key advantage of EEPROM over EPROM?",
    "options": [
      "EEPROM is faster to read",
      "EEPROM can be erased electrically without removal from the circuit",
      "EEPROM has larger storage capacity",
      "EEPROM is less expensive"
    ],
    "correctIndex": 1,
    "explanation": "EEPROM (Electrically Erasable Programmable ROM) can be erased and reprogrammed electrically while still installed in the circuit, without requiring UV light exposure or physical removal. This makes it much more convenient for updates and modifications. EEPROM can also be erased byte-by-byte rather than erasing the entire chip at once. Flash memory, used in USB drives and SSDs, is a type of EEPROM that can be erased in blocks, offering a good balance between flexibility and cost.",
    "difficulty": "medium",
    "tags": ["rom", "eeprom", "memory_types"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q39",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "fetch_decode_execute",
    "subTopicId": "decode_stage",
    "question": "What happens during the Decode stage of the instruction cycle?",
    "options": [
      "The instruction is retrieved from memory",
      "The instruction is interpreted to determine what operation to perform",
      "The operation specified by the instruction is carried out",
      "The results are written back to memory"
    ],
    "correctIndex": 1,
    "explanation": "During the Decode stage, the Control Unit interprets the instruction that was fetched and loaded into the Current Instruction Register (CIR). The CU determines what operation needs to be performed, what operands are required, and which components of the CPU need to be activated. It breaks down the instruction into signals that control the various parts of the CPU. After decoding, the Execute stage carries out the actual operation specified by the instruction.",
    "difficulty": "easy",
    "tags": ["fetch_decode_execute", "decode", "instruction_processing"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q40",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "io_devices",
    "subTopicId": "hdmi",
    "question": "What type of signals does HDMI transmit?",
    "options": [
      "Only video signals",
      "Only audio signals",
      "Both audio and video signals digitally",
      "Analog audio and video signals"
    ],
    "correctIndex": 2,
    "explanation": "HDMI (High-Definition Multimedia Interface) transmits both high-definition video and audio signals digitally through a single cable. This eliminates the need for separate audio and video cables. HDMI supports various video resolutions including 4K and 8K, multiple audio channels, and additional features like Ethernet connectivity and device control. It has largely replaced older analog connections like VGA (video only) and composite cables in modern devices.",
    "difficulty": "easy",
    "tags": ["io_devices", "hdmi", "ports"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q41",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "character_representation",
    "subTopicId": "unicode",
    "question": "Why was Unicode developed?",
    "options": [
      "To replace binary code with decimal code",
      "To represent characters from multiple languages and symbol sets",
      "To compress text files more efficiently",
      "To increase the speed of text processing"
    ],
    "correctIndex": 1,
    "explanation": "Unicode was developed to provide a universal character encoding system that can represent characters from all writing systems and languages worldwide, not just English. ASCII's 128 characters were insufficient for international use. Unicode can represent over 1 million characters, including letters from various alphabets, mathematical symbols, emojis, and historical scripts. UTF-8, UTF-16, and UTF-32 are different encoding schemes for Unicode, with UTF-8 being the most common on the web as it's backward compatible with ASCII.",
    "difficulty": "medium",
    "tags": ["character_encoding", "unicode", "internationalization"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q42",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "memory_sizes",
    "subTopicId": "calculations",
    "question": "How many Megabytes (MB) are in 1 Gigabyte (GB)?",
    "options": [
      "100 MB",
      "1000 MB",
      "1024 MB",
      "1048 MB"
    ],
    "correctIndex": 2,
    "explanation": "In binary measurement (which computers use), 1 Gigabyte (GB) equals 1024 Megabytes (MB). This follows the pattern where each unit is 1024 times the previous unit: 1 KB = 1024 bytes, 1 MB = 1024 KB, 1 GB = 1024 MB, 1 TB = 1024 GB. The number 1024 comes from 2^10. While storage manufacturers sometimes use decimal (1000) for marketing purposes, the binary standard (1024) is the technically correct measurement in computing.",
    "difficulty": "easy",
    "tags": ["memory", "units", "conversions"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q43",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "types_of_computers",
    "subTopicId": "analog_computer",
    "question": "What type of data do analog computers process?",
    "options": [
      "Discrete binary data",
      "Continuous physical quantities",
      "Text and character data",
      "Compressed digital files"
    ],
    "correctIndex": 1,
    "explanation": "Analog computers process continuous physical quantities such as voltage, current, temperature, pressure, or speed. They represent data as continuously variable physical quantities rather than discrete numbers. Analog computers were historically used for solving differential equations, flight simulation, and scientific research. They can provide real-time solutions but lack the precision and programmability of digital computers. Most modern computing is digital, but analog components are still used in specialized applications and hybrid systems.",
    "difficulty": "medium",
    "tags": ["computer_types", "analog", "data_types"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q44",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "cache_memory",
    "subTopicId": "cache_hierarchy",
    "question": "Why is cache memory organized in multiple levels (L1, L2, L3)?",
    "options": [
      "To provide backup in case one level fails",
      "To balance speed, size, and cost effectively",
      "To support different types of data",
      "To allow multiple programs to run simultaneously"
    ],
    "correctIndex": 1,
    "explanation": "Cache memory is organized in multiple levels to balance speed, size, and cost. L1 cache is smallest but fastest and most expensive, located closest to the CPU cores. L2 is larger but slightly slower, and L3 is even larger but slower still. This hierarchy exploits the principle of locality - frequently accessed data is kept in faster, smaller caches, while less frequently accessed data moves to larger, slower caches. This provides better overall performance than having a single large fast cache (too expensive) or single small fast cache (too many misses).",
    "difficulty": "hard",
    "tags": ["cache", "memory_hierarchy", "performance"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q45",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "bios_and_post",
    "subTopicId": "bios",
    "question": "Where is the BIOS typically stored?",
    "options": [
      "On the hard drive",
      "In RAM",
      "On a ROM chip on the motherboard",
      "On a removable USB drive"
    ],
    "correctIndex": 2,
    "explanation": "The BIOS (Basic Input/Output System) is firmware stored on a ROM chip (typically flash memory) on the motherboard. This non-volatile storage ensures the BIOS is available immediately when the computer is powered on, before any other storage devices are accessed. Modern systems use UEFI (Unified Extensible Firmware Interface) instead of traditional BIOS, but it's still stored in flash memory on the motherboard. The BIOS/UEFI can be updated (flashed) to fix bugs or add features, but it remains permanently stored on the motherboard.",
    "difficulty": "easy",
    "tags": ["bios", "firmware", "motherboard"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q46",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "registers",
    "subTopicId": "mdr",
    "question": "What is the function of the Memory Data Register (MDR)?",
    "options": [
      "Store the address of data in memory",
      "Hold data being transferred to or from memory",
      "Store the next instruction to be executed",
      "Count the number of memory accesses"
    ],
    "correctIndex": 1,
    "explanation": "The Memory Data Register (MDR), also called the Memory Buffer Register (MBR), temporarily holds data that is being transferred to or from memory. When reading from memory, data is placed in the MDR before being used by the CPU. When writing to memory, data is placed in the MDR before being sent to memory. The MDR works in conjunction with the MAR (which holds the address) to facilitate memory operations. This buffering allows the CPU to continue processing while memory operations complete.",
    "difficulty": "medium",
    "tags": ["registers", "mdr", "memory_access"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q47",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "ssd_vs_hdd",
    "subTopicId": "hdd",
    "question": "What is a key disadvantage of HDDs compared to SSDs?",
    "options": [
      "HDDs have lower storage capacity",
      "HDDs have moving parts that can fail mechanically",
      "HDDs consume less power",
      "HDDs are more expensive per gigabyte"
    ],
    "correctIndex": 1,
    "explanation": "HDDs (Hard Disk Drives) contain moving mechanical parts including spinning platters and read/write heads, making them susceptible to mechanical failure, especially from physical shock or drops. They are also slower, noisier, and consume more power than SSDs. However, HDDs offer advantages in cost per gigabyte and maximum capacity, making them suitable for bulk storage where speed is less critical. SSDs have no moving parts, making them more durable and reliable, though they have limited write cycles and are more expensive.",
    "difficulty": "easy",
    "tags": ["storage", "hdd", "reliability"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q48",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "character_representation",
    "subTopicId": "bcd",
    "question": "What does BCD stand for in data representation?",
    "options": [
      "Basic Computer Data",
      "Binary Coded Decimal",
      "Byte Compression Device",
      "Binary Character Definition"
    ],
    "correctIndex": 1,
    "explanation": "BCD stands for Binary Coded Decimal. It is a method of encoding decimal numbers where each decimal digit (0-9) is represented by a fixed number of binary bits, typically 4 bits (one nibble). For example, the decimal number 25 would be represented as 0010 0101 in BCD (2 = 0010, 5 = 0101). BCD is used in applications where decimal precision is important, such as financial calculations and digital displays, though it's less space-efficient than pure binary representation.",
    "difficulty": "medium",
    "tags": ["character_encoding", "bcd", "data_representation"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q49",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "computer_generations",
    "subTopicId": "second_generation",
    "question": "What was the main advantage of transistors over vacuum tubes in second-generation computers?",
    "options": [
      "Transistors were larger and easier to replace",
      "Transistors were smaller, more reliable, and generated less heat",
      "Transistors could store more data",
      "Transistors were cheaper to manufacture initially"
    ],
    "correctIndex": 1,
    "explanation": "Second-generation computers (1950s-1960s) used transistors instead of vacuum tubes. Transistors were much smaller, more reliable, generated significantly less heat, consumed less power, and were faster than vacuum tubes. This led to computers that were smaller, more efficient, and more reliable. Transistors also had longer lifespans and lower failure rates. Examples of second-generation computers include the IBM 1401 and CDC 1604. The transition to transistors was a major breakthrough in computer technology.",
    "difficulty": "easy",
    "tags": ["computer_generations", "transistors", "history"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  },
  {
    "id": "cf_q50",
    "quizId": "comp_fundamentals_quiz_1",
    "topicId": "multicore_processors",
    "subTopicId": "performance",
    "question": "Which scenario would benefit MOST from a multi-core processor?",
    "options": [
      "Running a single-threaded legacy application",
      "Browsing a simple text-only website",
      "Video rendering with parallel processing support",
      "Running a basic calculator program"
    ],
    "correctIndex": 2,
    "explanation": "Video rendering with parallel processing support would benefit most from a multi-core processor because it can divide the rendering task across multiple cores, with each core processing different frames or portions of the video simultaneously. This type of workload is highly parallelizable. Single-threaded applications, simple websites, and basic programs cannot take advantage of multiple cores effectively as they execute sequentially on a single core. Multi-core processors excel at multitasking and applications specifically designed for parallel processing.",
    "difficulty": "hard",
    "tags": ["processors", "multicore", "parallel_processing"],
    "isActive": true,
    "reference": "Computer Fundamentals Notes"
  }
];
