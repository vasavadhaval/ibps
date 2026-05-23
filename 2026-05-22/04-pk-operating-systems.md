# PK — Operating System (प्रक्रिया, थ्रेड) — दिन 3

> **સૂચના (Gujarati):** સામગ્રી **હિંદી**. 8–10 લાઇન **સારાંશ** લખવો.

**भाषा (सामग्री):** हिंदी · **समय:** 30 मिन

---

## भाग A — OS notes

### Operating System क्या है?
**हार्डवेयर** और **यूज़र/प्रोग्राम** के बीच परत — CPU, मेमोरी, फ़ाइल, I/O **प्रबंधन**।

### मुख्य कार्य
| कार्य | विवरण |
|------|--------|
| **Process management** | प्रोग्राम चलाना, बंद करना |
| **Memory management** | RAM आवंटन, virtual memory |
| **File system** | फ़ाइल/फ़ोल्डर |
| **I/O management** | printer, disk, network |
| **Security** | users, permissions |

### Process vs Program
| | Program | Process |
|---|---------|---------|
| | डिस्क पर फ़ाइल | **चल रहा** program |
| | passive | active — CPU, RAM लेता है |

### Process states
```
New → Ready → Running → Waiting → Terminated
              ↑___________|
```

| State | मतलब |
|-------|--------|
| **Ready** | CPU का इंतज़ार |
| **Running** | CPU पर चल रहा |
| **Waiting** | I/O या event का इंतज़ार |
| **Blocked** | Waiting जैसा |

### Thread (थ्रेड)
- Process के **अंदर** छोटी इकाई  
- **साझा memory** (same process)  
- हल्का — context switch तेज़  
- **Multi-threading:** एक process में कई काम (browser tabs)

### Process vs Thread
| | Process | Thread |
|---|---------|--------|
| Memory | अलग space | साझा |
| Switch | भारी | हल्का |
| Crash | एक process दूसरे को कम प्रभावित | एक thread गड़बड़ → पूरा process? |

### Scheduling (संक्षेप)
CPU किस process को दे — **FCFS, SJF, Round Robin, Priority**  
**Round Robin:** सबको छोटा time slice — fair

### Deadlock (परीक्षा favourite)
दो process एक-दूसरे का resource इंतज़ार — **कोई आगे नहीं**  
चार शर्तें: Mutual exclusion, Hold & wait, No preemption, Circular wait

### बैंक में OS
Server पर **Linux/Windows Server**, ATM embedded OS, **virtualization** — एक सर्वर पर कई VM

---

## सारांश (लिखें — 8–10 पंक्ति)

- [ ] Process vs Program  
- [ ] Ready / Running / Waiting  
- [ ] Thread क्या है  
- [ ] Deadlock एक लाइन  

---

## भाग B — 10 MCQ

1. OS का मुख्य काम नहीं:  
   a) Memory manage  b) Process manage  c) CPU बनाना  d) File manage  

2. चल रहे program को कहते हैं:  
   a) Thread  b) Process  c) Register  d) Kernel only  

3. Process **Ready** state में:  
   a) CPU पर है  b) CPU का इंतज़ार  c) Terminated  d) I/O complete  

4. Thread की memory:  
   a) Process से अलग हमेशा  b) Same process के साथ share  c) Hard disk  d) Cache only  

5. Round Robin scheduling:  
   a) सबसे छोटा job पहले  b) Time slice देकर बारी-बारी  c) Priority only  d) Random  

6. Deadlock की स्थिति:  
   a) दो process एक-दूसरे wait  b) CPU full  c) RAM खाली  d) Disk format  

7. Virtual memory का फायदा:  
   a) RAM से बड़ा program चलाना  b) Printer तेज़  c) Virus हटाना  d) Network  

8. Kernel है:  
   a) OS का core  b) Application  c) Browser  d) Database  

9. Multi-threading:  
   a) एक process में कई threads  b) एक thread में कई process  c) No CPU  d) Only Linux  

10. बैंक server पर आमतौर पर:  
    a) केवल MS Word  b) Server OS + CBS  c) Calculator  d) BIOS only  

---

## भाग C — उत्तर

| Q | Ans |
|---|-----|
| 1 | c |
| 2 | b |
| 3 | b |
| 4 | b |
| 5 | b |
| 6 | a |
| 7 | a |
| 8 | a |
| 9 | a |
| 10 | b |

**वापस →** [00-TODAY-PLAN.md](./00-TODAY-PLAN.md)
