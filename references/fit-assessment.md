# Book Fit Assessment Guide

## Core Idea

**Every book has extractable value.** The question is not "is this book suitable?" but "what kind of skill does this book want to become?"

---

## Assessment Process (3 Questions)

### Question 1: What is this book made of?

| Content Type | Examples | What the Agent Can Do With It |
|-------------|----------|-------------------------------|
| Frameworks & Methods | *Blue Ocean Strategy*, *Lean Startup*, *Hooked* | Execute structured workflows, guide decisions |
| Writing Craft & Style | *On Writing* (King), *Storyworthy*, *Talk Like TED* | Emulate voice, apply rhetorical techniques |
| Stories & Decisions | *Shoe Dog*, *The Everything Store*, *Steve Jobs* | Extract decision patterns, apply leadership principles |
| Systems & Habits | *Atomic Habits*, *Deep Work*, *Getting Things Done* | Build personal systems, track practices |
| Tactical Playbooks | *Never Split the Difference*, *SPIN Selling*, *Influence* | Run scenario-based responses, apply scripts |
| Mental Models | *Thinking in Bets*, *Principles*, *Poor Charlie's Almanack* | Structure thinking, avoid cognitive traps |
| Narrative Technique | *1984*, *The Great Gatsby*, any literary fiction | Emulate narrative voice, replicate worldbuilding |

### Question 2: How many independent tools/patterns does it contain?

| Count | Recommended Strategy |
|-------|---------------------|
| 3+ distinct frameworks | Multi-skill package — one skill per framework |
| 1-2 core methods | Single skill with sections for each method |
| Style/voice patterns | Style emulation skill with pattern library |
| Decision moments (biography) | Scenario-based skill with case references |
| Abstract concepts | Thinking prompts skill with mental models |

### Question 3: What should the agent be able to DO?

- **Help make decisions** → Workflow-driven skill with decision trees
- **Write/create in a style** → Pattern emulation skill with examples
- **Avoid mistakes** → Anti-pattern skill with checklists
- **Execute a process** → Step-by-step workflow skill
- **Think differently** → Mental model / perspective skill

---

## Book Type → Skill Type Mapping

### Type 1: Methodology / Framework Books
**Examples:** *Blue Ocean Strategy*, *Lean Startup*, *Hooked*, *Crossing the Chasm*

**Skill format:** Multi-skill package with references
- One skill per major framework
- References provide deep methodology (5K+ words each)
- Templates for frameworks with structured outputs
- Plugin format recommended (shareable, professional)

**Quality test:** Can the agent guide a user through ERRC analysis without the user having read the book?

### Type 2: Writing Craft / Style Books
**Examples:** *On Writing* (Stephen King), *Storyworthy* (Matthew Dicks), *Bird by Bird* (Anne Lamott)

**Skill format:** Style emulation skill with pattern library
- Extract specific techniques (sentence structure, pacing, voice patterns)
- Before/after examples as references
- Trigger: "Write in the style of..." or "Apply [technique] to..."
- Single skill usually sufficient

**Quality test:** Can the agent rewrite a paragraph using the book's techniques?

### Type 3: Business Biography / Narrative
**Examples:** *Shoe Dog* (Phil Knight), *The Everything Store* (Bezos), *Steve Jobs* (Isaacson)

**Skill format:** Decision framework skill with case studies
- Extract key decision moments and the principles behind them
- Build scenario-based references ("When facing X, consider Y because Z")
- Anti-patterns: What went WRONG and why
- Single skill with rich references

**Quality test:** Can the agent help a user facing a similar decision by drawing on the book's lessons?

### Type 4: Personal Productivity / Habits
**Examples:** *Atomic Habits*, *Deep Work*, *Getting Things Done*, *The One Thing*

**Skill format:** Action-oriented skill with checklists
- Extract daily/weekly systems and practices
- Build implementation checklists
- Include common failure modes and recovery strategies
- Single skill with practical references

**Quality test:** Can the agent help a user design and stick to a system from the book?

### Type 5: Sales / Negotiation / Persuasion
**Examples:** *Never Split the Difference*, *Influence*, *SPIN Selling*, *Pitch Anything*

**Skill format:** Scenario-driven skill with playbooks
- Extract situational frameworks and response scripts
- Build "if X happens, do Y" playbooks
- Include real negotiation/sales scenarios as references
- Single or multi-skill depending on breadth

**Quality test:** Can the agent coach a user through a scenario using the book's tactics?

### Type 6: Fiction / Literary Works
**Examples:** *1984*, *The Great Gatsby*, *Dune*, any novel

**Skill format:** Creative writing emulation skill
- Extract narrative techniques, voice patterns, worldbuilding methods
- Build a "write in the style of [author]" skill
- Include passage analysis as references (why this sentence works)
- Single skill

**Quality test:** Can the agent generate prose that captures the book's distinctive style?

### Type 7: Academic / Research
**Examples:** *Thinking Fast and Slow*, *Predictably Irrational*, *The Black Swan*

**Skill format:** Analytical thinking skill with mental models
- Extract cognitive tools and thinking frameworks
- Build "identify this bias" or "apply this model" prompts
- Keep abstract — focus on application, not theory
- Single skill with model-based references

**Quality test:** Can the agent help a user spot a cognitive trap in their reasoning?

---

## Quick Decision Flowchart

```
START: User provides a book
  │
  ├─ Does it contain actionable frameworks/tools?
  │    YES → Type 1 (Methodology) — Multi-skill package
  │
  ├─ Is it about writing/speaking craft?
  │    YES → Type 2 (Style) — Style emulation skill
  │
  ├─ Is it a biography or narrative of real decisions?
  │    YES → Type 3 (Biography) — Decision framework skill
  │
  ├─ Is it about personal systems/habits?
  │    YES → Type 4 (Productivity) — Action skill with checklists
  │
  ├─ Is it about persuasion/negotiation/sales tactics?
  │    YES → Type 5 (Tactical) — Scenario playbook skill
  │
  ├─ Is it fiction or literary?
  │    YES → Type 6 (Fiction) — Creative emulation skill
  │
  ├─ Is it research/psychology/decision science?
  │    YES → Type 7 (Academic) — Mental models skill
  │
  └─ Still unsure?
       Ask: "What do you want the agent to HELP YOU DO with this book?"
       The answer reveals the skill type.
```

---

## Input Formats Supported

Book2Skill Factory can work with:
- **PDF** files (text-based, not scanned images)
- **EPUB** files
- **Markdown** or plain text
- **Readable web links** (articles, blog series, online book chapters)
- **Direct text input** (paste book content or detailed notes)
- **User's notes / highlights** (if they've already taken notes, even better)

Note: Scanned PDFs without OCR will need to be converted to text first.
