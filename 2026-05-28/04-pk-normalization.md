# PK — Normalization (DBMS) — दिन 8

> **સૂચના (Gujarati):** DBMS માટે core topic. 1NF–3NF સુધી સોલિડ કરો.

**भाषा:** हिंदी · **समय:** 30 मिन

---

## भाग A — Concepts

Normalization = data redundancy कम करना + consistency बढ़ाना

### 1NF
- हर field atomic (single value)
- no repeating groups

### 2NF
- 1NF + partial dependency remove
- (composite key में non-key सिर्फ पूरे key पर depend करे)

### 3NF
- 2NF + transitive dependency remove
- non-key should depend only on key

### Example (simple)
Table: StudentID, StudentName, DeptID, DeptName  
- DeptName depends on DeptID, not StudentID → transitive dependency  
→ split into:
1) Student(StudentID, StudentName, DeptID)
2) Department(DeptID, DeptName)

---

## भाग B — 10 MCQ

1. Normalization mainly reduces:  
   a) Redundancy  b) CPU speed  c) Keyboard error  d) Color
2. 1NF requires:  
   a) Atomic values  b) Composite values only  c) No keys  d) No rows
3. 2NF removes:  
   a) Partial dependency  b) Transitive dependency  c) Duplicates only  d) Null values
4. 3NF removes:  
   a) Partial dependency  b) Transitive dependency  c) Primary key  d) Foreign key
5. In 3NF, non-key depends on:  
   a) Another non-key  b) Key only  c) Foreign table  d) CPU
6. DeptName depending on DeptID in student table indicates:  
   a) Proper 3NF  b) Transitive dependency  c) No dependency  d) Candidate key
7. Which is true?  
   a) 3NF implies 2NF  b) 1NF implies 3NF always  c) 2NF higher than 3NF  d) none
8. Normalization can improve:  
   a) Data consistency  b) Monitor size  c) Fan speed  d) Mouse DPI
9. Over-normalization may affect:  
   a) Joins / query complexity  b) Grammar  c) Network cable  d) UI color
10. First step before 2NF/3NF:  
   a) 1NF  b) 4NF  c) DCL  d) TCL

---

## भाग C — उत्तर

1-a, 2-a, 3-a, 4-b, 5-b, 6-b, 7-a, 8-a, 9-a, 10-a

**पूर्ण →** [00-TODAY-PLAN.md](./00-TODAY-PLAN.md)

