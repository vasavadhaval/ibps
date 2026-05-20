$ErrorActionPreference = "Stop"
$outDir = Join-Path (Split-Path $PSScriptRoot -Parent) "daily"

$start = Get-Date "2026-05-20"
$prelims = Get-Date "2026-08-29"
$weekdays = @("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")

$phase1Quant = @(
    "Simplification and approximation: 40 problems, 20 min timer. Book: Fast Track Ch 1 OR any banking PDF Ch 1.",
    "Percentage: theory 30 min (book Ch 2) + 25 problems timed.",
    "Percentage applications: 20 problems (profit-style word problems).",
    "Ratio and proportion: book Ch 3 theory + 25 problems.",
    "Ratio and mixture: 20 problems + 10 revision from Percentage.",
    "Average: book Ch 4 + 25 problems.",
    "Ages and partnership: 20 problems + formula sheet write-up (1 page).",
    "Profit and loss: book Ch 5 + 25 problems.",
    "Simple and compound interest: book Ch 6 + 20 problems.",
    "Time and work: book Ch 7 + 20 problems.",
    "Time, speed and distance: book Ch 8 + 20 problems.",
    "Mensuration (2D): formulas + 15 problems.",
    "Number series: 15 patterns + 15 problems.",
    "DI - Table: 2 sets x 5 questions, 25 min total.",
    "DI - Bar graph: 2 sets x 5 questions.",
    "DI - Pie chart: 2 sets x 5 questions.",
    "Mixed arithmetic drill: 30 problems (45 min) - no new theory.",
    "Revision: Percentage + Ratio - 40 problems combined.",
    "Revision: TSD + Time and work - 30 problems.",
    "Quant weak-area repair (from error log): 45 min."
)

$phase1Reasoning = @(
    "Alphanumeric series: 30 questions + 10 min revision of types.",
    "Letter series and ranking: 25 questions.",
    "Coding-decoding (basic): 20 questions.",
    "Inequalities (direct): 25 questions.",
    "Syllogism (2-statement): 20 questions + Watch: 'Syllogism basics banking'.",
    "Blood relations: 20 questions.",
    "Direction sense: 20 questions.",
    "Order and ranking: 20 questions.",
    "Linear seating (single row): 3 sets x 5 questions.",
    "Linear seating (dual row): 2 sets.",
    "Circular seating (facing center): 2 sets.",
    "Circular seating (inside-outside): 2 sets.",
    "Floor-based puzzle (2 var): 2 puzzles.",
    "Floor-based puzzle (3 var): 2 puzzles.",
    "Box puzzle: 2 puzzles.",
    "Scheduling puzzle: 1 puzzle + 1 month-based puzzle.",
    "Input-output OR Data sufficiency: 15 questions.",
    "Mixed reasoning drill: 40 questions (easy to medium).",
    "Puzzle marathon: 4 puzzles, 40 min.",
    "Reasoning weak-area repair (error log): 45 min."
)

$phase1English = @(
    "SP Bakshi: Nouns + Articles (Ch 1-2) + 15 error-spotting questions.",
    "Tenses (Ch 3) + 15 sentence improvement.",
    "Prepositions and conjunctions (Ch 4-5) + 15 fill-in-blanks.",
    "Reading comprehension 1 passage + 5 questions (untimed).",
    "Cloze test: 2 sets (10 blanks each).",
    "Para jumbles: 2 sets of 5 sentences.",
    "Error spotting mixed: 25 questions.",
    "Reading comprehension 2 passages (banking/economy topic).",
    "Sentence correction: 20 questions.",
    "Vocabulary in context: 1 RC + note 10 new words in error notebook.",
    "Phrase replacement / word swap: 15 questions.",
    "Reading comprehension timed: 1 passage in 8 min.",
    "Mixed English drill: 30 questions (grammar + vocab).",
    "RC marathon: 3 short passages.",
    "English weak-area repair (error log): 45 min."
)

$phase1Pk = @(
    "Computer fundamentals: CPU, memory, I/O - 5 pages notes + 10 MCQs.",
    "Number systems and boolean logic - notes + 10 MCQs.",
    "Operating systems: process, thread, scheduling - notes + 10 MCQs.",
    "Memory management and virtual memory - 10 MCQs.",
    "File systems and storage - 10 MCQs.",
    "DBMS intro and ER model - notes + 10 MCQs.",
    "Normalization (1NF-3NF BCNF) - 10 MCQs.",
    "SQL: SELECT, JOIN, GROUP BY - 15 query MCQs.",
    "Transactions and ACID - 10 MCQs.",
    "Indexing and B-trees basics - 10 MCQs.",
    "Computer networks: OSI vs TCP/IP - notes + 10 MCQs.",
    "IP, subnetting basics - 10 MCQs.",
    "Network devices and protocols (HTTP, DNS, DHCP) - 10 MCQs.",
    "Data structures: array, stack, queue, linked list - 10 MCQs.",
    "Trees, graphs (basics) - 10 MCQs.",
    "Sorting and searching - 10 MCQs.",
    "Software engineering: SDLC, Agile - 10 MCQs.",
    "Testing and UML basics - 10 MCQs.",
    "Cybersecurity: threats, firewall, encryption - 10 MCQs.",
    "IT in banking: CBS, ATM, payment systems - Watch: 'Core Banking Solution basics' + 10 MCQs."
)

$phase2ExtraSat = @(
    "FULL PRELIMS MOCK (IBPS SO or PO pattern) - 120 min exam conditions.",
    "Mock analysis: 2 hours - every wrong question in error log.",
    "Sectional mock: Reasoning only - 40 min.",
    "Sectional mock: Quant only - 40 min.",
    "Sectional mock: English only - 40 min.",
    "Revision day: all error-log topics - 3 hours."
)

$phase3Extra = @(
    "FULL MOCK #1 - exam hall rules.",
    "Mock analysis (full day focus).",
    "FULL MOCK #2.",
    "Light revision + formulas + 1 mini sectional.",
    "FULL MOCK #3.",
    "Exam strategy sheet: attempt order per section - finalize.",
    "FULL MOCK #4.",
    "Only revision and weak topics - no new theory.",
    "FULL MOCK #5 (if energy allows) OR rest."
)

function Get-Phase($d) {
    if ($d -le (Get-Date "2026-06-20")) { return 1 }
    if ($d -le (Get-Date "2026-08-01")) { return 2 }
    return 3
}

function Pick($arr, $idx) { return $arr[$idx % $arr.Length] }

New-Item -ItemType Directory -Force -Path $outDir | Out-Null
$index = @("# Daily plan index", "", "**Start:** 2026-05-20 · **Prelims:** 2026-08-29", "", "| Date | Day | File |", "|------|-----|------|")

$d = $start
$dayNum = 0
while ($d -le $prelims) {
    $dayNum++
    $ph = Get-Phase $d
    $wd = [int]$d.DayOfWeek
    # PowerShell: Sunday=0 ... Saturday=6
    $isSat = ($wd -eq 6)
    $isSun = ($wd -eq 0)
    $isWeekend = $isSat -or $isSun
    $n = $dayNum
    $qi = $n - 1; $ri = $n - 1; $ei = $n - 1; $pi = $n - 1

    $quant = Pick $phase1Quant $qi
    $reasoning = Pick $phase1Reasoning $ri
    $english = Pick $phase1English $ei
    $pk = Pick $phase1Pk $pi
    $extra = @()

    if ($ph -eq 1) { $phaseName = "Phase 1 - Foundations"; $hours = if ($isWeekend) { "5 h" } else { "3.5 h" } }
    elseif ($ph -eq 2) {
        $phaseName = "Phase 2 - Speed and Mocks"
        $hours = if ($isWeekend) { "5.5 h" } else { "4 h" }
        $quant = "TIMED: $quant (strict timer)."
        $reasoning = "TIMED: $reasoning (strict timer)."
    }
    else {
        $phaseName = "Phase 3 - Exam Mode"
        $hours = if ($isWeekend) { "5-6 h" } else { "4 h" }
        $topicQ = ($quant -split ":")[0]
        $topicR = ($reasoning -split ":")[0]
        $quant = "Revision only: $topicQ - 20 problems max."
        $reasoning = "Revision only: $topicR - 2 puzzles max."
        $english = "RC + grammar revision: 2 passages + 15 mixed questions (timed 35 min)."
    }

    if ($n -eq 1) {
        $extra += "SETUP: Error Log notebook, download 2 IBPS SO Prelims PDFs, write exam date 29-Aug-2026 on first page."
    }
    if ($n -eq 2) {
        $extra += "DIAGNOSTIC: Half Prelims paper (Reasoning+Quant only, 80 min) - log weak topics in Error Log."
    }
    if ($ph -eq 1 -and $isSat -and $n -gt 7) { $extra += "Sectional practice: Reasoning 40 min timed - 25+ questions attempted." }
    if ($ph -eq 1 -and $isSun -and $n -gt 7) { $extra += "Review entire week's error log; rewrite formulas for 2 weakest Quant topics." }
    if ($ph -eq 2 -and $isSat) { $extra += Pick $phase2ExtraSat ([math]::Floor($n / 7)) }
    if ($ph -eq 2 -and $isSun) { $extra += Pick $phase2ExtraSat ([math]::Floor($n / 7) + 1) }
    if ($ph -eq 3 -and ($isSat -or $isSun -or ($n % 3 -eq 0))) { $extra += Pick $phase3Extra ([math]::Floor($n / 3)) }

    if ($d -eq $prelims) {
        # Exam day - handled by override below
    }
    elseif ($d -ge $prelims.AddDays(-3) -and $d -lt $prelims) {
        $extra += "FINAL: Confirm admit card process, ID proof list, exam centre route - 30 min admin."
        $quant = "Light: 15 simplification + 1 DI set only."
        $reasoning = "Light: 2 puzzles + 10 syllogism - confidence building."
        $pk = "Light: 20 PK MCQs mixed - revision only."
    }

    $wdName = @('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')[[int]$d.DayOfWeek]

    $prev = $d.AddDays(-1).ToString("yyyy-MM-dd")
    $next = $d.AddDays(1).ToString("yyyy-MM-dd")
    $fname = $d.ToString("yyyy-MM-dd")

    $extraBlock = ""
    foreach ($e in $extra) {
        $extraBlock += "`n### Setup / Mock / Admin`n- [ ] $e`n"
    }

    $content = @"
# $wdName, $($d.ToString('dd MMMM yyyy')) - Day $($n.ToString('000')) - $phaseName

> **Exam:** IBPS SO IT Officer Prelims - target **29 Aug 2026**  
> **Time budget today:** $hours  
> **Rule:** Finish checkboxes. No new books/videos beyond what is written here.

---

## Today's TODO

### 1. Quant - 75 min
- [ ] $quant

### 2. Reasoning - 75 min
- [ ] $reasoning

### 3. English - 45 min
- [ ] $english

### 4. Professional Knowledge (IT) - 30 min
- [ ] $pk
$extraBlock
---

## Done when
- [ ] All four sections attempted (or minimum rule applied)
- [ ] Wrong questions noted in **Error Log** with topic name

## If you finish early
- [ ] Revise yesterday's Error Log (15 min)
- [ ] 10 PK MCQs from random past topic (10 min)

## If you fall behind
Do **Quant + Reasoning** sections only today. Move English/PK checkboxes to tomorrow (max 1 day slip).

---
*Previous day:* ``$prev.md`` - *Next day:* ``$next.md``
"@

    if ($d -eq $prelims) {
        $content = @"
# $wdName, $($d.ToString('dd MMMM yyyy')) - EXAM DAY

> **IBPS SO IT Officer - Prelims today.** You prepared 102 days. Trust your practice.

---

## Before the exam (morning only)

- [ ] Wake up on time; light breakfast (no heavy food).
- [ ] Revise formula sheet (15 min) - Percentage, Ratio, TSD shortcuts only.
- [ ] Read Error Log top 10 mistakes (10 min) - do NOT repeat these today.
- [ ] Reach centre 45 min early with admit card, photo ID, pen.

## During the exam

- [ ] English: attempt easy grammar/RC first; target 28-35 attempts with accuracy.
- [ ] Reasoning: do syllogism/inequality first, then puzzles you can solve.
- [ ] Quant: simplification and DI first; skip lengthy questions without guilt.
- [ ] Watch sectional timers (40 min each) - do not donate time to one section.

## After the exam

- [ ] Do not discuss answers extensively (destroys focus for Mains prep).
- [ ] Rest today. Tomorrow we start Mains PK plan if you feel ready (wait for result).

---
*You did the hard work. Execute calmly.*
"@
    }

    $path = Join-Path $outDir "$fname.md"
    [System.IO.File]::WriteAllText($path, $content, [System.Text.UTF8Encoding]::new($false))
    $index += "| $fname | $n | [$fname.md](./$fname.md) |"
    $d = $d.AddDays(1)
}

Set-Content -Path (Join-Path $outDir "INDEX.md") -Value ($index -join "`n") -Encoding UTF8
Write-Host "Generated $dayNum daily files in $outDir"
