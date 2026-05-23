# PK — Memory Management (मेमोरी प्रबंधन) — दिन 4

> **સૂચના (Gujarati):** સામગ્રી **હિંદી**. OS દિવસ 3 પછી આ — process + memory સાથે જોડો.

**भाषा (सामग्री):** हिंदी · **समय:** 30 मिन

---

## भाग A — पाठ

### RAM vs Virtual Memory
| | RAM (Physical) | Virtual Memory |
|---|----------------|----------------|
| | वास्तविक chips | Disk पर extension |
| Speed | Fast | Slow (disk) |
| Size | Limited (8–64 GB typical) | OS + disk space |

**Virtual memory:** RAM full हो तो **कम used pages disk (page file/swap)** पर — program को लगता है बड़ी memory है।

### Paging
- Memory **fixed-size blocks:** **pages** (RAM), **frames**  
- **Page table:** logical address → physical address  
- **Page fault:** page RAM में नहीं → disk से load (slow)

### Segmentation
- Memory **logical segments:** code, data, stack  
- Variable size; often combined with paging

### Fragmentation
| प्रकार | मतलब |
|--------|--------|
| **Internal** | allocated block के अंदर wasted space |
| **External** | free memory छोटे-छोटे holes में |

**Compaction / paging** external कम करता है।

### Cache (revision)
L1, L2, L3 — CPU के पास, RAM से fast — frequently used data

### Thrashing
बहुत page faults → system slow — **RAM कम** या **too many processes**

### Memory allocation
- **Static:** compile time  
- **Dynamic:** runtime — malloc/new (heap), stack for local vars

### बैंक context
Server पर **CBS, database** heavy RAM · **virtualization** — एक physical server पर कई VM, हर VM को allocated RAM

---

## सारांश (6–8 पंक्ति — लिखें)

- [ ] Virtual memory क्यों  
- [ ] Page vs frame  
- [ ] Internal vs external fragmentation  

---

## भाग B — 10 MCQ

1. Virtual memory mainly uses:  
   a) Only CPU  b) Disk as extension of RAM  c) Printer  d) Keyboard  

2. Page fault means:  
   a) Page in RAM already  b) Required page not in RAM  c) CPU fault  d) Power off  

3. Physical memory is:  
   a) Virtual  b) RAM chips  c) Only cache  d) ROM  

4. Internal fragmentation occurs:  
   a) Between allocated blocks  b) Inside allocated block unused  c) In CPU  d) In network  

5. Page table maps:  
   a) Logical to physical address  b) User to password  c) IP to MAC  d) File to folder  

6. Thrashing indicates:  
   a) Too many page faults / overload  b) Fast system  c) No disk  d) Full cache hit  

7. Stack memory is usually:  
   a) Heap  b) For function calls / local vars  c) Disk  d) ROM  

8. L1 cache is:  
   a) Slowest  b) Fastest, smallest  c) Same as HDD  d) Virtual  

9. Swap space is on:  
   a) CPU register  b) Disk  c) Monitor  d) NIC only  

10. More RAM helps reduce:  
    a) Page faults  b) Keyboard errors  c) Monitor size  d) Typing speed  

---

## भाग C — उत्तर

| Q | Ans |
|---|-----|
| 1 | b |
| 2 | b |
| 3 | b |
| 4 | b |
| 5 | a |
| 6 | a |
| 7 | b |
| 8 | b |
| 9 | b |
| 10 | a |

**Next →** [05-week1-revision.md](./05-week1-revision.md)
