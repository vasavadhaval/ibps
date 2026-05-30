# PK — Transactions & ACID — दिन 10

> **સૂચના (Gujarati):** DBMS core — banking transactions માટે must know.

**भाषा (सामग्री):** हिंदी · **समय:** 30 मिन

---

## भाग A — पाठ

### Transaction क्या है?
**Logical unit of work** — या तो **पूरा** हो या **पूरा rollback** (ATM transfer: debit + credit दोनों या कोई नहीं)

### ACID properties

| Property | मतलब |
|----------|--------|
| **A**tomicity | All or nothing — fail हो तो undo |
| **C**onsistency | DB valid state से valid state |
| **I**solation | Concurrent transactions एक-दूसरे interfere न करें |
| **D**urability | COMMIT के बाद crash में भी saved |

### Commands (TCL)
- **BEGIN / START TRANSACTION** — start  
- **COMMIT** — permanent save  
- **ROLLBACK** — undo changes  
- **SAVEPOINT** — partial rollback point

### Isolation levels (संक्षेप)
| Level | Dirty read | Non-repeatable | Phantom |
|-------|------------|----------------|---------|
| Read Uncommitted | Possible | Possible | Possible |
| Read Committed | No | Possible | Possible |
| Repeatable Read | No | No | Possible |
| Serializable | No | No | No |

### Banking example
**Transfer Rs 1000:**  
1. Debit Account A  
2. Credit Account B  
→ Both in **one transaction** — ACID ensures no money lost mid-way

### Concurrency problems
- **Dirty read** — uncommitted data read  
- **Lost update** — two updates overwrite  
- **Deadlock** — two transactions wait each other (OS + DBMS)

---

## भाग B — 10 MCQ

1. ACID में A stands for:  
   a) Atomicity  b) Availability  c) Authentication  d) Archive

2. COMMIT means:  
   a) Save changes permanently  b) Delete table  c) Shutdown  d) Format disk

3. ROLLBACK:  
   a) Undo transaction  b) Copy file  c) Print report  d) Send email

4. All-or-nothing is:  
   a) Atomicity  b) Isolation only  c) Index  d) View

5. After COMMIT, data survives crash due to:  
   a) Durability  b) Colour  c) Font  d) Mouse

6. Transfer debit+credit should be:  
   a) One transaction  b) Two unrelated  c) No lock  d) Manual file

7. Dirty read occurs at:  
   a) Read Uncommitted level  b) Serializable only  c) Never  d) Backup only

8. SAVEPOINT allows:  
   a) Partial rollback  b) Delete DB  c) Virus scan  d) Reboot

9. Isolation prevents:  
   a) Interference between concurrent transactions  b) All joins  c) SELECT  d) Keys

10. Consistency ensures:  
    a) Rules/constraints maintained  b) Faster CPU  c) Bigger monitor  d) WiFi speed

---

## भाग C — उत्तर

| Q | Ans |
|---|-----|
| 1 | a |
| 2 | a |
| 3 | a |
| 4 | a |
| 5 | a |
| 6 | a |
| 7 | a |
| 8 | a |
| 9 | a |
| 10 | a |

**પૂર્ણ →** [00-TODAY-PLAN.md](./00-TODAY-PLAN.md)
