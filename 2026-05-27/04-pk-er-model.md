# PK — ER मॉडल (Entity–Relationship) — दिन 7

> **સૂચના (Gujarati):** DBMS દિવસ 6 પછી — ટેબલ ડિઝાઇનની શરૂઆત.

**भाषा (सामग्री):** हिंदी · **समय:** 30 मिन

---

## भाग A — पाठ

### ER model क्या है?
Database **design** का diagram — **entities** (objects) + **relationships** (links) + **attributes** (properties)

### Entity (इकाई)
Real-world object जिस पर data store हो  
**उदा:** Customer, Account, Employee, Loan

### Attribute (गुण)
Entity की property  
| प्रकार | उदाहरण |
|--------|---------|
| **Simple** | age, name |
| **Composite** | address = street+city+pin |
| **Key** | unique ID (account_no) |
| **Derived** | age from DOB |

### Relationship (संबंध)
Entities के बीच association

| Cardinality | अर्थ |
|-------------|--------|
| **1:1** | एक customer — एक PAN (example style) |
| **1:N** | एक customer — many accounts |
| **M:N** | students — courses (junction table) |

### Symbols (परीक्षा)
- **Rectangle** — Entity  
- **Ellipse** — Attribute  
- **Diamond** — Relationship  
- **Lines** — connect

### Keys in ER → tables
- **Primary key** — unique row  
- **Foreign key** — दूसरी table का reference

### Weak entity
खुद unique ID नहीं — parent पर depend (**OrderItem** needs **Order**)

### बैंक उदाहरण
```
Customer ----<has>---- Account
   |                      |
  (cust_id)            (acc_no, balance)
```

One customer → many accounts = **1:N**

---

## भाग B — 10 MCQ

1. ER model used for:  
   a) Database design  b) Paint  c) CPU speed  d) Email only  

2. Rectangle in ER represents:  
   a) Entity  b) Attribute only  c) Report  d) Virus  

3. 1:N means:  
   a) One to many  b) Many to many only  c) One to one only  d) None  

4. Diamond shape is:  
   a) Relationship  b) Entity  c) Key  d) Printer  

5. Primary key is:  
   a) Unique identifier  b) Duplicate always  c) Optional always  d) Password  

6. Customer–Account in bank usually:  
   a) 1:1 only  b) 1:N  c) N:N only  d) No relation  

7. Composite attribute example:  
   a) Address with parts  b) Single age  c) One flag  d) CPU  

8. Foreign key:  
   a) References another table  b) Deletes OS  c) RAM  d) Monitor  

9. M:N relationship needs:  
   a) Junction/bridge table often  b) No table  c) One column  d) BIOS  

10. Derived attribute:  
    a) Calculated from others  b) Manual only  c) Hardware  d) Cable  

---

## भाग C — उत्तर

| Q | Ans |
|---|-----|
| 1 | a |
| 2 | a |
| 3 | a |
| 4 | a |
| 5 | a |
| 6 | b |
| 7 | a |
| 8 | a |
| 9 | a |
| 10 | a |

**પૂર્ણ →** [00-TODAY-PLAN.md](./00-TODAY-PLAN.md)
