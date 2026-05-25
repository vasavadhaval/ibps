# PK — File Systems (फ़ाइल प्रणाली) — दिन 5

> **સૂચના (Gujarati):** OS + Memory પછી — ફાઇલો કેવી રીતે સંગ્રહાય.

**भाषा (सामग्री):** हिंदी · **समय:** 30 मिन

---

## भाग A — पाठ

### File vs Folder
- **File:** data unit (document, .exe, .sql)  
- **Directory/Folder:** files organize करने की जगह

### File attributes
Name, size, type, location, created/modified date, **permissions** (read/write/execute)

### File allocation methods
| विधि | विवरण |
|------|--------|
| **Contiguous** | एक साथ blocks — fast, fragmentation |
| **Linked** | linked list of blocks — no external fragmentation, slow seek |
| **Indexed** | **index block** pointer table — UNIX/inode जैसा |

### FAT vs NTFS (Windows)
| | FAT | NTFS |
|---|-----|------|
| | Older, simple | Newer, secure |
| | Limited size | Large files, journaling |
| | USB often | Windows server/PC |

### Linux — ext3/ext4
**ext4** common — journaling (crash后 recovery), large files

### Inode (UNIX/Linux)
**Metadata** store — file size, permissions, disk block pointers — filename अलग directory entry

### Path
- **Absolute:** `/home/user/file.txt` (root से)  
- **Relative:** `../folder/file` (current से)

### Permissions (Linux style)
**rwx** — read, write, execute — owner, group, others  
**उदा:** `chmod 755`

### Journaling
Changes पहले **log** में — crash पर filesystem **consistent** रहे

### बैंक
Servers पर **database files**, **logs**, backup tapes — RAID + secure permissions

---

## भाग B — 10 MCQ

1. Folder is used to:  
   a) Delete CPU  b) Organize files  c) Increase RAM  d) Print  

2. NTFS is mainly:  
   a) Windows filesystem  b) Only mobile  c) BIOS  d) Browser  

3. Inode stores:  
   a) Only filename  b) File metadata  c) Monitor  d) Keyboard  

4. Absolute path starts from:  
   a) Random  b) Root  c) User desktop only  d) RAM  

5. Journaling helps:  
   a) Faster gaming only  b) Recovery after crash  c) Delete virus always  d) WiFi  

6. ext4 is used in:  
   a) Linux commonly  b) Only calculator  c) Mouse  d) Printer only  

7. File permission "w" means:  
   a) Write  b) Wait  c) Window  d) Wireless  

8. Indexed allocation uses:  
   a) Index block with pointers  b) No blocks  c) Only cloud  d) Cache L1  

9. FAT32 limitation (concept):  
   a) Smaller max file size vs NTFS  b) No files  c) Only text  d) Infinite size  

10. Bank server logs should be:  
    a) Public to all  b) Protected with access control  c) Deleted daily always  d) On ATM screen  

---

## भाग C — उत्तर

| Q | Ans |
|---|-----|
| 1 | b |
| 2 | a |
| 3 | b |
| 4 | b |
| 5 | b |
| 6 | a |
| 7 | a |
| 8 | a |
| 9 | a |
| 10 | b |

**પૂર્ણ →** [00-TODAY-PLAN.md](./00-TODAY-PLAN.md)
