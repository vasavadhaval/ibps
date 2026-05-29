# PK — SQL JOIN — दिन 9

> **સૂચના (Gujarati):** DBMS પછી SQL — tables કેવી રીતે જોડાય.

**भाषा (सामग्री):** हिंदी · **समय:** 30 मिन

---

## भाग A — पाठ

### JOIN क्यों?
एक table में सब data नहीं — **Customer** और **Account** अलग tables, **JOIN** से एक query में मिलाएँ

### Keys (revision)
- **Primary Key (PK)** — unique row  
- **Foreign Key (FK)** — दूसरी table का reference

### JOIN types

| JOIN | परिणाम |
|------|---------|
| **INNER JOIN** | केवल matching rows दोनों tables में |
| **LEFT JOIN** | बाएँ table की सभी rows + match दाएँ से |
| **RIGHT JOIN** | दाएँ की सभी + match बाएँ से |
| **FULL OUTER** | दोनों की सभी (match न हो तो NULL) |

### उदाहरण
```sql
SELECT c.name, a.balance
FROM Customer c
INNER JOIN Account a ON c.cust_id = a.cust_id;
```
→ जिन customers के accounts हैं वही

```sql
SELECT c.name, a.balance
FROM Customer c
LEFT JOIN Account a ON c.cust_id = a.cust_id;
```
→ **सभी** customers, account नहीं तो balance **NULL**

### ON vs WHERE
- **ON** — join condition (कौन rows match)  
- **WHERE** — join के **बाद** filter

### Banking
Customer–Account–Transaction tables — reports के लिए JOIN daily use

---

## भाग B — 10 MCQ

1. INNER JOIN returns:  
   a) Only matching rows  b) All left rows  c) All rows both sides always  d) No rows

2. LEFT JOIN keeps all rows from:  
   a) Right table  b) Left table  c) Both  d) Neither

3. JOIN condition usually uses:  
   a) Primary–Foreign key  b) Random column  c) CPU  d) Printer

4. ON clause is used for:  
   a) Join matching  b) Format monitor  c) Shutdown  d) Boot

5. If no match in RIGHT table, LEFT JOIN shows:  
   a) NULL for right columns  b) Error  c) Duplicate rows  d) Delete row

6. Which removes non-matching rows from both sides?  
   a) INNER  b) LEFT  c) RIGHT  d) CROSS only

7. Customer without account — which JOIN lists them?  
   a) INNER  b) LEFT (Customer left)  c) RIGHT only  d) None

8. FULL OUTER JOIN:  
   a) All from both, unmatched NULL  b) Only inner  c) Only left  d) Deletes data

9. SELECT from two tables without JOIN/WHERE link may cause:  
   a) Cartesian product  b) Faster query  c) Auto index  d) No output

10. FK in Account table pointing to Customer is for:  
    a) Referential integrity  b) Virus scan  c) Font size  d) Cable

---

## भाग C — उत्तर

| Q | Ans |
|---|-----|
| 1 | a |
| 2 | b |
| 3 | a |
| 4 | a |
| 5 | a |
| 6 | a |
| 7 | b |
| 8 | a |
| 9 | a |
| 10 | a |

**પૂર્ણ →** [00-TODAY-PLAN.md](./00-TODAY-PLAN.md)
