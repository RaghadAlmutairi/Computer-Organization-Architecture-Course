# 🖥️ Computer Organization and Architecture Course

📚 **Course:** CCCS217 - Computer Organization and Architecture  
🏫 **University Project** 

---

## 📖 Overview
This repository contains my course project for **Computer Organization and Architecture (CCCS217)**.  
The project is divided into two parts:

1. **Cache Memory Mapping Experiments**
   - Direct Mapping
   - Fully Associative Mapping
   - 4-way Associative Mapping

2. **Assembly Language Program**
   - Converts an octal number to decimal
   - Ensures input validation (`0–7` only)
   - Uses loops, conditions, and functions

---

## 🔹 Part 1: Cache Mapping
Experiments were performed with different cache sizes to analyze **hit ratio** and **miss ratio**.

### Direct Mapping
- 64-size cache → **Hit ratio: 16%**, **Miss ratio: 84%**  
- 16-size cache → **Hit ratio: 8%**, **Miss ratio: 92%**

### Fully Associative Mapping
- 64-size cache → **Hit ratio: 13%**, **Miss ratio: 88%**  
- 16-size cache → **Hit ratio: 8%**, **Miss ratio: 92%**

### 4-way Associative Mapping
- 16-size cache → **Hit ratio: 13%**, **Miss ratio: 88%**  
- 4-size cache → **Hit ratio: 8%**, **Miss ratio: 92%**

✅ **Key Insight:** Increasing cache size improves hit ratio since more blocks from main memory can be accommodated.

---

## 🔹 Part 2: Assembly Program
The program:
- Accepts an octal input (`0–7`)
- Converts it to **decimal**
- Rejects invalid inputs

### Features
- Two loops  
- One conditional (`if`)  
- Two functions  

```asm
; Example program structure
MOV input, 7
CALL check_valid
CALL convert_octal_to_decimal
PRINT result
```

## 🛠️ Tools & Technologies

- Assembly Language (MASM/NASM style)

- Cache simulator (for experiments)


## ✨ Author

👩‍💻 **Raghad Almutairi**
