# Compiler Construction Lab Practicals

This repository contains a collection of laboratory practicals and assignments for the **Compiler Construction (Compiler Design)** course. The experiments cover various phases of compiler design, including Lexical Analysis and Syntax Analysis, implemented using **Lex (Flex)** and **Yacc (Bison)** tools.

## 🛠️ Tech Stack

* **C Language**
* **Lex** (Fast Lexical Analyzer Generator) / Flex
* **Yacc** (Yet Another Compiler Compiler) / Bison
* **GCC** (GNU Compiler Collection)

## 📂 List of Practicals

| # | Practical Name | Description | Tools Used |
|---|---|---|---|
| **1** | Sample Lex Program | Basic introduction to the structure of a Lex program. | Lex |
| **2** | Token Counter | Counts comments, keywords, identifiers, words, lines, and spaces in a file. | Lex |
| **3** | Word Filter | Counts the number of words starting with the letter 'A'. | Lex |
| **4** | Case Converter | Converts lowercase characters to uppercase and vice versa. | Lex |
| **5** | Number Converter | Converts decimal numbers found in a file to hexadecimal. | Lex |
| **6** | URL/Line Validator | Identifies and tests lines ending with ".com". | Lex |
| **7** | Postfix Evaluator | Evaluates mathematical expressions in postfix notation. | Lex & Yacc |
| **8** | Desk Calculator | A basic calculator implementation with error recovery mechanisms. | Lex & Yacc |
| **9** | Loop Parser | Syntax parser to validate 'FOR' loop statements. | Lex & Yacc |
| **10**| Intermediate Code Gen | Generates Intermediate Code (Three Address Code) for arithmetic expressions. | Lex & Yacc |

## 🚀 How to Run

### Prerequisites

Ensure you have `flex`, `bison`, and `gcc` installed on your system.

* **Linux (Ubuntu/Debian):**
  ```bash
  sudo apt-get update
  sudo apt-get install flex bison gcc
  ```

* **Windows:** Install MinGW or use WSL (Windows Subsystem for Linux).

* **macOS:**
  ```bash
  brew install flex bison gcc
  ```

### 1. Running Lex Programs (Practicals 1-6)

To compile and run a standalone Lex file (.l):

```bash
# Generate the C source file from Lex
lex filename.l

# Compile the C file (use -lfl for Flex or -ll for standard Lex)
gcc lex.yy.c -o output -lfl

# Run the program
./output
```

**Alternative using Flex:**
```bash
flex filename.l
gcc lex.yy.c -o output -lfl
./output
```

### 2. Running Yacc & Lex Programs (Practicals 7-10)

To compile and run programs that require both Lex (.l) and Yacc (.y):

```bash
# Step 1: Compile the Yacc file (generates y.tab.c and y.tab.h)
yacc -d filename.y

# Step 2: Compile the Lex file (generates lex.yy.c)
lex filename.l

# Step 3: Compile the generated C files together
gcc lex.yy.c y.tab.c -o output -ll -ly

# Step 4: Run the executable
./output
```

**Alternative using Bison and Flex:**
```bash
bison -d filename.y
flex filename.l
gcc lex.yy.c filename.tab.c -o output -lfl
./output
```

## 🔧 Troubleshooting

### Common Issues and Solutions

**Issue:** `y.tab.h: No such file or directory`

**Solution:** Use `-d` flag with yacc/bison to generate header file:
```bash
yacc -d filename.y
```

**Issue:** Command not found: `lex` or `yacc`

**Solution:** Use `flex` instead of `lex` and `bison` instead of `yacc`, or install the compatibility packages.

## 👤 Author

**Shreyas521032**

* GitHub: [@Shreyas521032](https://github.com/Shreyas521032)

---

**Note:** These practicals are for educational purposes and are part of academic coursework in Compiler Design.
