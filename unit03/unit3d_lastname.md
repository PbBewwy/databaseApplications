**Before you start:** rename this file to `unit3d_lastname.md`, using your own last name. Watch the video and read `unit3d_Walkthrough.md`. Commit and push when you're done.

**Name:**

---

# Unit 3d — Types of Databases

Answer every question. No SQL today.

---

## While you watch the video

**1.** Fill in the table while you watch [7 Database Paradigms – Fireship](https://www.youtube.com/watch?v=W2Z7fbCLSTw).

| Type | One product he names | Good for |
|---|---|---|
| Key-value | Redis | Caching, quick and simple lookups |
| Wide-column | Apache Cassandra | Large-scale data, high write throughput |
| Document | MongoDB | Unstructured data, rapid prototyping |
| Relational | MySQL | Structured data, ACID compliance, complex queries |
| Graph | Neo4j | Highly conneted data, social networks, reccomendation engines |
| Full-text search | Elasticsearch | Searching large volumes of text, autocomplete |
| Multi-model | FaunaDB | Depennds on usage |

---

## After the video

**2.** Key-value databases keep their data in memory. What does that make them good at? What can't you do with them?

**Answer:** Quick data changes, but large amounts of data is unpractical/inefficient


**3.** What is the downside of a document database, according to the video?

**Answer:** Data relationships are more difficult to handle


**4.** A relational database needs a join table to connect many things to many things. In a graph database, what does that job instead?

**Answer:** It connects through edges rather than keys


**5.** Name one relational database product from the video.

**Answer:** PostgreSQL


---

## Pick the database

**6.** For each client, pick the best type of database and give one reason. Use the "How to pick one" table in the walkthrough.

**Choose from:** Relational · Document · Graph · Key-value · Full-text search · Wide-column

| # | Client says… | Type | One reason |
|:-:|---|---|---|
| a | "We run a pharmacy. Every prescription must link to one patient and one doctor, and nothing can ever be out of sync." | Relational | Reliable connections are important to the user |
| b | "Our store sells 40,000 products. Shoes have sizes, laptops have RAM. Every category has different information." | Document | Data has many attributes |
| c | "We want to suggest new friends: people who are friends with your friends." | Graph | Good for quick and easily searchable connections |
| d | "Our game needs a leaderboard. Scores change thousands of times a second." | Key-value | Quick reads and writes, can handle the required speed |
| e | "Our website has 50,000 recipes, and people need to search them by any word." | Full-text search | Made for fast searching |
| f | "We have 10,000 weather sensors sending a reading every second." | Wide-column | Made for large write throughput |

**7.** In 3a, the `teams` + `games` tables stored each team once and linked games to teams with `team_id`. Why is a relational database a good fit for NBA data?

**Answer:** Because individual records don't have large amounts of connections or attributes


**8.** You're building an app for our school that keeps track of students, classes, and grades. Which type of database would you pick, and why?

**Answer:** Probably relational, because it needs large amounts of data, throughput doesn't need to be high, and it can easily do complex queries for grades