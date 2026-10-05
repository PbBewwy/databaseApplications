# Database Normalization Guide

---

## First Normal Form (1NF) — One value per cell

*Split `Special_Abilities` so each ability gets its own row. Arnold is done. Fill in the yellow rows for the other three.*

| Character (PK) | Ability (PK) | Power | Experience_Level | Character_Rating |
| :--- | :--- | :---: | :---: | :--- |
| Arnold | one-liners | 8 | 9 | Blockbuster |
| Arnold | explosions | 10 | 9 | Blockbuster |
| Arnold | car chases | 7 | 9 | Blockbuster |
| Arnold | hand-to-hand | 9 | 9 | Blockbuster |
| Agent 86 | gadgets | 6 | 5 | Rising Star |
| Agent 86 | disguises | 4 | 5 | Rising Star |
| Mr. Secretary | negotiations | 8 | 7 | Blockbuster |
| Mr. Secretary | hand-to-hand | 7 | 7 | Blockbuster |
| Mr. Secretary | explosions | 5 | 7 | Blockbuster |
| Bad Cop | interrogations | 4 | 3 | Newcomer |
| Bad Cop | car chases | 6 | 3 | Newcomer |
| Bad Cop | gadgets | 3 | 3 | Newcomer |
| Bad Cop | one-liners | 2 | 3 | Newcomer |

*Primary key = (Character, Ability) — a composite key. Why isn't Character alone enough?*

---

## Second Normal Form (2NF) — The whole key

*Step 1: For each non-key column, decide what it depends on. Step 2: Split the table so nothing depends on only part of the key.*

| Non-key column | Depends on Character? | Depends on Ability? | Needs the WHOLE key? (yes/no) |
| :--- | :---: | :---: | :---: |
| Power | yes | yes | yes |
| Experience_Level | yes | no | no |
| Character_Rating | yes | no | no |

*A column that needs only part of the key has a PARTIAL DEPENDENCY. Move it to a table whose key is just that part.*

### Table A — CHARACTERS (one row per character)

| Character (PK) | Experience_Level | Character_Rating |
| :--- | :---: | :--- |
| Arnold | 9 | Blockbuster |
| Agent 86 | 5 | Rising Star |
| Mr. Secretary | 7 | Blockbuster |
| Bad Cop | 3 | Newcomer |

*`FK` → `CHARACTERS` means this column's values come from the primary key of the CHARACTERS table. It links each row in Table B to Table A.*

### Table B — CHARACTER_ABILITIES (one row per character per ability)

| Character (PK, FK → CHARACTERS) | Ability (PK) | Power |
| :--- | :--- | :---: |
| Arnold | one-liners | 8 |
| Arnold | explosions | 10 |
| Arnold | car chases | 7 |
| Arnold | hand-to-hand | 9 |
| Agent 86 | gadgets | 6 |
| Agent 86 | disguises | 4 |
| Mr. Secretary | negotiations | 8 |
| Mr. Secretary | hand-to-hand | 7 |
| Mr. Secretary | explosions | 5 |
| Bad Cop | interrogations | 4 |
| Bad Cop | car chases | 6 |
| Bad Cop | gadgets | 3 |
| Bad Cop | one-liners | 2 |

---

## Third Normal Form (3NF) — Nothing but the key

*Character_Rating can be worked out from Experience_Level. That's a TRANSITIVE dependency.*

### Table A — CHARACTERS (rating column removed)

| Character (PK) | Experience_Level (FK → RATINGS) |
| :--- | :---: |
| Arnold | 9 |
| Agent 86 | 5 |
| Mr. Secretary | 7 |
| Bad Cop | 3 |

### Table C — RATINGS (lookup: one row per experience level)

| Experience_Level (PK) | Character_Rating |
| :---: | :--- |
| 1 | Newcomer |
| 2 | Newcomer |
| 3 | Newcomer |
| 4 | Rising Star |
| 5 | Rising Star |
| 6 | Rising Star |
| 7 | Blockbuster |
| 8 | Blockbuster |
| 9 | Blockbuster |

### Table B — CHARACTER_ABILITIES (unchanged from 2NF — copy it here)

| Character (PK, FK → CHARACTERS) | Ability (PK) | Power |
| :--- | :--- | :---: |
| Arnold | one-liners | 8 |
| Arnold | explosions | 10 |
| Arnold | car chases | 7 |
| Arnold | hand-to-hand | 9 |
| Agent 86 | gadgets | 6 |
| Agent 86 | disguises | 4 |
| Mr. Secretary | negotiations | 8 |
| Mr. Secretary | hand-to-hand | 7 |
| Mr. Secretary | explosions | 5 |
| Bad Cop | interrogations | 4 |
| Bad Cop | car chases | 6 |
| Bad Cop | gadgets | 3 |
| Bad Cop | one-liners | 2 |

*Check: To find Bad Cop's rating you now JOIN CHARACTERS → RATINGS. Each fact lives in one place.*