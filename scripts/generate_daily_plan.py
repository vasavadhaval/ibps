"""
Generate daily IBPS SO IT Officer preparation TODO markdown files.
Run: python scripts/generate_daily_plan.py
"""
from datetime import date, timedelta
from pathlib import Path

START = date(2026, 5, 20)
PRELIMS = date(2026, 8, 29)
OUT_DIR = Path(__file__).resolve().parent.parent / "daily"

WEEKDAYS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

# --- Curriculum: (phase, week_in_phase 0-3, day_in_week 0-6) -> content ---
# Simplified: cycle by day index with phase overrides

PHASE1_QUANT = [
    "Simplification & approximation: 40 problems, 20 min timer. Book: Fast Track Ch 1 OR any banking PDF Ch 1.",
    "Percentage: theory 30 min (book Ch 2) + 25 problems timed.",
    "Percentage applications: 20 problems (profit-style word problems).",
    "Ratio & proportion: book Ch 3 theory + 25 problems.",
    "Ratio & mixture: 20 problems + 10 revision from Percentage.",
    "Average: book Ch 4 + 25 problems.",
    "Ages & partnership: 20 problems + formula sheet write-up (1 page).",
    "Profit & loss: book Ch 5 + 25 problems.",
    "Simple & compound interest: book Ch 6 + 20 problems.",
    "Time & work: book Ch 7 + 20 problems.",
    "Time, speed & distance: book Ch 8 + 20 problems.",
    "Mensuration (2D): formulas + 15 problems.",
    "Number series: 15 patterns + 15 problems.",
    "DI — Table: 2 sets × 5 questions, 25 min total.",
    "DI — Bar graph: 2 sets × 5 questions.",
    "DI — Pie chart: 2 sets × 5 questions.",
    "Mixed arithmetic drill: 30 problems (45 min) — no new theory.",
    "Revision: Percentage + Ratio — 40 problems combined.",
    "Revision: TSD + Time & work — 30 problems.",
    "Quant weak-area repair (from error log): 45 min.",
]

PHASE1_REASONING = [
    "Alphanumeric series: 30 questions + 10 min revision of types.",
    "Letter series & ranking: 25 questions.",
    "Coding-decoding (basic): 20 questions.",
    "Inequalities (direct): 25 questions.",
    "Syllogism (2-statement): 20 questions + Watch: 'Syllogism basics banking'.",
    "Blood relations: 20 questions.",
    "Direction sense: 20 questions.",
    "Order & ranking: 20 questions.",
    "Linear seating (single row): 3 sets × 5 questions.",
    "Linear seating (dual row): 2 sets.",
    "Circular seating (facing center): 2 sets.",
    "Circular seating (inside-outside): 2 sets.",
    "Floor-based puzzle (2 var): 2 puzzles.",
    "Floor-based puzzle (3 var): 2 puzzles.",
    "Box puzzle: 2 puzzles.",
    "Scheduling puzzle: 1 puzzle + 1 month-based puzzle.",
    "Input-output (if in mock) OR Data sufficiency: 15 questions.",
    "Mixed reasoning drill: 40 questions (easy→medium).",
    "Puzzle marathon: 4 puzzles, 40 min.",
    "Reasoning weak-area repair (error log): 45 min.",
]

PHASE1_ENGLISH = [
    "SP Bakshi: Nouns + Articles (Ch 1–2) + 15 error-spotting questions.",
    "Tenses (Ch 3) + 15 sentence improvement.",
    "Prepositions & conjunctions (Ch 4–5) + 15 fill-in-blanks.",
    "Reading comprehension 1 passage + 5 questions (untimed, understand passage).",
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
    "English weak-area repair (error log): 45 min.",
]

PHASE1_PK = [
    "Computer fundamentals: CPU, memory, I/O — 5 pages notes + 10 MCQs.",
    "Number systems & boolean logic — notes + 10 MCQs.",
    "Operating systems: process, thread, scheduling — notes + 10 MCQs.",
    "Memory management & virtual memory — 10 MCQs.",
    "File systems & storage — 10 MCQs.",
    "DBMS intro & ER model — notes + 10 MCQs.",
    "Normalization (1NF–3NF BCNF) — 10 MCQs.",
    "SQL: SELECT, JOIN, GROUP BY — 15 query MCQs.",
    "Transactions & ACID — 10 MCQs.",
    "Indexing & B-trees basics — 10 MCQs.",
    "Computer networks: OSI vs TCP/IP — notes + 10 MCQs.",
    "IP, subnetting basics — 10 MCQs.",
    "Network devices & protocols (HTTP, DNS, DHCP) — 10 MCQs.",
    "Data structures: array, stack, queue, linked list — 10 MCQs.",
    "Trees, graphs (basics) — 10 MCQs.",
    "Sorting & searching — 10 MCQs.",
    "Software engineering: SDLC, Agile — 10 MCQs.",
    "Testing & UML basics — 10 MCQs.",
    "Cybersecurity: threats, firewall, encryption — 10 MCQs.",
    "IT in banking: CBS, ATM, payment systems — Watch: 'Core Banking Solution basics' + 10 MCQs.",
]

PHASE2_EXTRA_SAT = [
    "FULL PRELIMS MOCK (IBPS SO or PO pattern) — 120 min exam conditions.",
    "Mock analysis: 2 hours — every wrong question in error log.",
    "Sectional mock: Reasoning only — 40 min.",
    "Sectional mock: Quant only — 40 min.",
    "Sectional mock: English only — 40 min.",
    "Revision day: all error-log topics — 3 hours.",
]

PHASE3_EXTRA = [
    "FULL MOCK #1 — exam hall rules.",
    "Mock analysis (full day focus).",
    "FULL MOCK #2.",
    "Light revision + formulas + 1 mini sectional.",
    "FULL MOCK #3.",
    "Exam strategy sheet: attempt order per section — finalize.",
    "FULL MOCK #4.",
    "Only revision & weak topics — no new theory.",
    "FULL MOCK #5 (if energy allows) OR rest.",
]


def phase_for(d: date) -> int:
    if d <= date(2026, 6, 20):
        return 1
    if d <= date(2026, 8, 1):
        return 2
    return 3


def day_num(d: date) -> int:
    return (d - START).days + 1


def pick(lst, idx):
    return lst[idx % len(lst)]


def build_tasks(d: date) -> dict:
    n = day_num(d)
    ph = phase_for(d)
    wd = d.weekday()  # 0=Mon, 5=Sat, 6=Sun
    is_sat = wd == 5
    is_sun = wd == 6
    is_weekend = is_sat or is_sun

    qi = (n - 1) % len(PHASE1_QUANT)
    ri = (n - 1) % len(PHASE1_REASONING)
    ei = (n - 1) % len(PHASE1_ENGLISH)
    pi = (n - 1) % len(PHASE1_PK)

    quant = pick(PHASE1_QUANT, qi)
    reasoning = pick(PHASE1_REASONING, ri)
    english = pick(PHASE1_ENGLISH, ei)
    pk = pick(PHASE1_PK, pi)

    if ph == 1:
        phase_name = "Phase 1 — Foundations"
        hours = "3.5 h" if not is_weekend else "5 h"
    elif ph == 2:
        phase_name = "Phase 2 — Speed & Mocks"
        hours = "4 h" if not is_weekend else "5.5 h"
        quant = f"TIMED: {quant} (strict timer)."
        reasoning = f"TIMED: {reasoning} (strict timer)."
    else:
        phase_name = "Phase 3 — Exam Mode"
        hours = "4 h" if not is_weekend else "5–6 h"
        quant = "Revision only: " + quant.split(":")[0] + " — 20 problems max."
        reasoning = "Revision only: " + reasoning.split(":")[0] + " — 2 puzzles max."

    extra = []
    if n == 1:
        extra.append(
            "SETUP: Error Log notebook, download 2 IBPS SO Prelims PDFs, write exam date 29-Aug-2026 on first page."
        )
        extra.append(
            "DIAGNOSTIC: Half Prelims paper (Reasoning+Quant only, 80 min) — don't worry about score; log weak topics."
        )

    if ph == 1 and is_sat and n > 7:
        extra.append("Sectional practice: Reasoning 40 min timed — 25+ questions attempted.")
    if ph == 1 and is_sun and n > 7:
        extra.append("Review entire week's error log; rewrite formulas for 2 weakest Quant topics.")

    if ph == 2:
        if is_sat:
            extra.append(pick(PHASE2_EXTRA_SAT, (n // 7) % len(PHASE2_EXTRA_SAT)))
        if is_sun:
            extra.append(pick(PHASE2_EXTRA_SAT, ((n // 7) + 1) % len(PHASE2_EXTRA_SAT)))

    if ph == 3:
        if is_sat or is_sun or n % 3 == 0:
            extra.append(pick(PHASE3_EXTRA, (n // 3) % len(PHASE3_EXTRA)))
        english = "RC + grammar revision: 2 passages + 15 mixed questions (timed 35 min)."

    if d >= PRELIMS - timedelta(days=3):
        extra.append("FINAL: Confirm admit card process, ID proof list, exam centre route — 30 min admin.")
        quant = "Light: 15 simplification + 1 DI set only."
        reasoning = "Light: 2 puzzles + 10 syllogism — confidence building."
        pk = "Light: 20 PK MCQs mixed — revision only."

    return {
        "phase_name": phase_name,
        "hours": hours,
        "quant": quant,
        "reasoning": reasoning,
        "english": english,
        "pk": pk,
        "extra": extra,
        "day_num": n,
    }


def render_day(d: date, t: dict) -> str:
    wd_name = WEEKDAYS[d.weekday()]
    fname = d.isoformat()
    title = f"{wd_name}, {d.strftime('%d %B %Y')}"

    extra_blocks = ""
    for i, e in enumerate(t["extra"], 1):
        extra_blocks += f"\n### Setup / Mock / Admin\n- [ ] {e}\n"

    early = "- [ ] Revise yesterday's Error Log (15 min)\n- [ ] 10 PK MCQs from random past topic (10 min)"
    behind = "Do **Quant + Reasoning** sections only today. Move English/PK checkboxes to tomorrow (max 1 day slip)."

    return f"""# {title} — Day {t['day_num']:03d} · {t['phase_name']}

> **Exam:** IBPS SO IT Officer Prelims · **~29 Aug 2026**  
> **Time budget today:** {t['hours']}  
> **Rule:** Finish checkboxes. No new books/videos beyond what is written here.

---

## Today's TODO

### 1. Quant — 75 min
- [ ] {t['quant']}

### 2. Reasoning — 75 min
- [ ] {t['reasoning']}

### 3. English — 45 min
- [ ] {t['english']}

### 4. Professional Knowledge (IT) — 30 min
- [ ] {t['pk']}
{extra_blocks}
---

## Done when
- [ ] All four sections attempted (or minimum rule applied)
- [ ] Wrong questions noted in **Error Log** with topic name

## If you finish early
{early}

## If you fall behind
{behind}

---
*Previous day:* `{(d - timedelta(days=1)).isoformat()}.md` · *Next day:* `{(d + timedelta(days=1)).isoformat()}.md`
"""


def main():
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    index_lines = ["# Daily plan index\n", f"**Start:** {START.isoformat()} · **Prelims:** {PRELIMS.isoformat()}\n", "| Date | Day | File |", "|------|-----|------|"]

    d = START
    while d <= PRELIMS:
        t = build_tasks(d)
        content = render_day(d, t)
        path = OUT_DIR / f"{d.isoformat()}.md"
        path.write_text(content, encoding="utf-8")
        index_lines.append(f"| {d.isoformat()} | {t['day_num']} | [{d.isoformat()}.md](./{d.isoformat()}.md) |")
        d += timedelta(days=1)

    (OUT_DIR / "INDEX.md").write_text("\n".join(index_lines) + "\n", encoding="utf-8")
    count = (PRELIMS - START).days + 1
    print(f"Generated {count} daily files in {OUT_DIR}")


if __name__ == "__main__":
    main()
