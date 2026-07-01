-- Project detail page copy and sections.
-- This file stores custom content that used to live in hand-written Astro project pages.

DROP TABLE IF EXISTS project_embedded_videos;
DROP TABLE IF EXISTS project_extra_sections;
DROP TABLE IF EXISTS project_extra_details;
DROP TABLE IF EXISTS project_highlights;
DROP TABLE IF EXISTS project_page_copy;

CREATE TABLE project_page_copy (
  project_id TEXT PRIMARY KEY,
  overview TEXT,
  what_built TEXT,
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

CREATE TABLE project_highlights (
  project_id TEXT NOT NULL,
  body TEXT NOT NULL,
  position INTEGER NOT NULL,
  PRIMARY KEY (project_id, position),
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

CREATE TABLE project_extra_details (
  project_id TEXT NOT NULL,
  label TEXT NOT NULL,
  value TEXT NOT NULL,
  position INTEGER NOT NULL,
  PRIMARY KEY (project_id, position),
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

CREATE TABLE project_extra_sections (
  project_id TEXT NOT NULL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  position INTEGER NOT NULL,
  PRIMARY KEY (project_id, position),
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

CREATE TABLE project_embedded_videos (
  project_id TEXT NOT NULL,
  title TEXT NOT NULL,
  src TEXT NOT NULL,
  position INTEGER NOT NULL,
  PRIMARY KEY (project_id, position),
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

INSERT INTO project_page_copy (project_id, overview, what_built) VALUES ('a-new-heap', 'A New Heap was a two-part data structures project centered on priority queues. The first part used priority queues in a stream-driven simulation, while the second part focused on implementing and reasoning about custom priority queue structures.', 'I implemented a simulation that processed deployment data as a stream, maintained the correct priority ordering for each side of each simulated planet, and produced optional summaries depending on runtime flags. The project also included custom priority queue work, emphasizing how implementation choices affect correctness and performance.');
INSERT INTO project_highlights (project_id, body, position) VALUES ('a-new-heap', 'Built a priority-queue-driven simulation around streamed deployment data.', 0);
INSERT INTO project_highlights (project_id, body, position) VALUES ('a-new-heap', 'Supported multiple output modes, including battle summaries, running medians, general evaluations, and watcher-style analysis.', 1);
INSERT INTO project_highlights (project_id, body, position) VALUES ('a-new-heap', 'Implemented and compared custom priority queue structures for ordering and retrieval tradeoffs.', 2);

INSERT INTO project_page_copy (project_id, overview, what_built) VALUES ('a2-go', 'A2-GO! was an extended reality project built in EECS 440. The project explored how physical location, movement, and digital interaction can combine into an augmented reality game experience.', 'I built a location-based augmented reality game concept in Unity, focusing on how players could move through physical space while interacting with digital game elements. The project emphasized XR prototyping, spatial interaction design, and communicating the design through a course portfolio.');
INSERT INTO project_highlights (project_id, body, position) VALUES ('a2-go', 'Built a Unity-based augmented reality project around location-aware interaction.', 0);
INSERT INTO project_highlights (project_id, body, position) VALUES ('a2-go', 'Connected physical movement and place-based context with digital gameplay concepts.', 1);
INSERT INTO project_highlights (project_id, body, position) VALUES ('a2-go', 'Documented the project through a course portfolio created for EECS 440.', 2);

INSERT INTO project_page_copy (project_id, overview, what_built) VALUES ('advanced-lc2k-assembler', 'Advanced LC2K Assembler was a computer organization project focused on producing object-file output for the later linking stage. The project connected assembly translation with symbol and relocation metadata.', 'I built the assembler portion of the LC2K assembly and linking workflow. The project translated LC2K assembly into a structured object-file format while preserving the metadata needed by the linker and enforcing assembler-level validation rules.');
INSERT INTO project_highlights (project_id, body, position) VALUES ('advanced-lc2k-assembler', 'Generated intermediate object files from LC2K assembly input.', 0);
INSERT INTO project_highlights (project_id, body, position) VALUES ('advanced-lc2k-assembler', 'Handled text, data, symbol, and relocation sections.', 1);
INSERT INTO project_highlights (project_id, body, position) VALUES ('advanced-lc2k-assembler', 'Added validation around labels, opcodes, register operands, and offset fields while preserving strict output formatting.', 2);

INSERT INTO project_page_copy (project_id, overview, what_built) VALUES ('application-security-exploits', 'Application Security Exploits was a security project about understanding how memory-safety bugs can affect native software. The work centered on analyzing intentionally vulnerable programs in a controlled environment and learning how low-level program behavior connects to real security risk.', 'I completed a set of application-security exercises focused on vulnerability analysis, low-level debugging, and secure-systems reasoning. The public page intentionally stays high level and does not include coursework solution details.');
INSERT INTO project_highlights (project_id, body, position) VALUES ('application-security-exploits', 'Analyzed vulnerable native programs in a controlled virtual-machine environment.', 0);
INSERT INTO project_highlights (project_id, body, position) VALUES ('application-security-exploits', 'Used debugger-driven investigation and architecture-level reasoning to understand control-flow weaknesses.', 1);
INSERT INTO project_highlights (project_id, body, position) VALUES ('application-security-exploits', 'Documented application-security concepts at a high level while keeping implementation details private.', 2);

INSERT INTO project_page_copy (project_id, overview, what_built) VALUES ('back-to-the-ship', 'This algorithms project focused on navigating a three-dimensional maze and reconstructing a valid route. The work emphasized search strategy selection, careful map representation, and clear output formatting.', 'I implemented a route-finding program that read map input, searched through the state space, and reported the discovered route in the requested format. The core work was representing movement across levels and switching cleanly between depth-first and breadth-first behavior.');
INSERT INTO project_highlights (project_id, body, position) VALUES ('back-to-the-ship', 'Modeled a multi-level maze from either map-style or coordinate-list input.', 0);
INSERT INTO project_highlights (project_id, body, position) VALUES ('back-to-the-ship', 'Supported both stack-based depth-first search and queue-based breadth-first search routing.', 1);
INSERT INTO project_highlights (project_id, body, position) VALUES ('back-to-the-ship', 'Produced route output in multiple formats while handling command-line options and validation.', 2);

INSERT INTO project_page_copy (project_id, overview, what_built) VALUES ('bisdorf-org', 'Bisdorf.org is my personal portfolio website. I built it as a lightweight, maintainable site for sharing my background, technical projects, resume, and professional links. The site is built with Astro, uses TypeScript and CSS for structure and styling, and is deployed to a custom domain.', 'I built a custom portfolio site focused on clarity, fast static delivery, and maintainable content. The project includes the public website structure, shared layout system, project showcase, resume support, and deployment configuration behind the live domain.');
INSERT INTO project_highlights (project_id, body, position) VALUES ('bisdorf-org', 'Built a responsive portfolio site to present experience, education, projects, resume, and contact links.', 0);
INSERT INTO project_highlights (project_id, body, position) VALUES ('bisdorf-org', 'Structured the site around reusable Astro layouts and static project data for maintainable content updates.', 1);
INSERT INTO project_highlights (project_id, body, position) VALUES ('bisdorf-org', 'Added resume rendering, direct resume download, project showcase pages, contact links, and search indexing support.', 2);
INSERT INTO project_highlights (project_id, body, position) VALUES ('bisdorf-org', 'Configured the site for production deployment with a custom domain.', 3);

INSERT INTO project_page_copy (project_id, overview, what_built) VALUES ('detecting-dirty-dish-culprits', 'This project explored whether security-camera footage from a shared kitchen could be used to identify moments when someone placed dishes in the sink or drying rack without properly washing them. Rather than detecting dishes directly, the model focused on the person in frame because the camera angle often obscured the dishes themselves.', 'The system combines object detection with a temporal post-processing step. A YOLOv8 detector classifies people in video frames as washing or walking, and a continuity detector tracks whether a detected washing interval is long enough to avoid being flagged as a likely dirty-dish drop-off.');
INSERT INTO project_highlights (project_id, body, position) VALUES ('detecting-dirty-dish-culprits', 'Built a person-centric computer vision pipeline that outputs timestamps where someone likely leaves dirty dishes without washing them.', 0);
INSERT INTO project_highlights (project_id, body, position) VALUES ('detecting-dirty-dish-culprits', 'Annotated kitchen footage with washer and walker classes, then trained a YOLOv8-based detector using transfer learning.', 1);
INSERT INTO project_highlights (project_id, body, position) VALUES ('detecting-dirty-dish-culprits', 'Added continuity logic on top of frame-by-frame detections to flag short washing intervals for human review.', 2);
INSERT INTO project_highlights (project_id, body, position) VALUES ('detecting-dirty-dish-culprits', 'Evaluated the model with a 70/20/10 train-validation-test split and achieved a final mAP50 score of 0.96.', 3);
INSERT INTO project_extra_details (project_id, label, value, position) VALUES ('detecting-dirty-dish-culprits', 'Collaborator', 'Kevin Yin', 0);

INSERT INTO project_page_copy (project_id, overview, what_built) VALUES ('solar-powered-emergency-beacon', 'The Solderers designed and tested a proof-of-concept emergency beacon for hikers in remote areas. The prototype requested GPS data, displayed coordinates to the user, and transmitted location information to a receiving station while using a solar panel and battery for power.', 'The first prototype centered on an Arduino connected to a GPS module, Bluetooth module, LCD display, buttons, a solar charging circuit, and a rechargeable battery. Testing showed that the prototype could display coordinates, transmit data over Bluetooth, and operate from stored power, while also revealing practical limits around solar charge time, satellite-transmission requirements, and commercial feasibility.');
INSERT INTO project_highlights (project_id, body, position) VALUES ('solar-powered-emergency-beacon', 'Built a solar-powered emergency beacon prototype around an Arduino microcontroller.', 0);
INSERT INTO project_highlights (project_id, body, position) VALUES ('solar-powered-emergency-beacon', 'Integrated a NEO-6M GPS module, HC-05 Bluetooth module, LCD display, solar panel, Sunny Buddy charger, and rechargeable battery.', 1);
INSERT INTO project_highlights (project_id, body, position) VALUES ('solar-powered-emergency-beacon', 'Tested GPS accuracy, Bluetooth transmission range, display behavior, solar output, battery charge time, and battery life.', 2);
INSERT INTO project_highlights (project_id, body, position) VALUES ('solar-powered-emergency-beacon', 'Analyzed design tradeoffs for future COSPAS-SARSAT integration, including power requirements, weight, cost, and weatherproofing.', 3);
INSERT INTO project_extra_details (project_id, label, value, position) VALUES ('solar-powered-emergency-beacon', 'Team', 'The Solderers', 0);
INSERT INTO project_extra_sections (project_id, title, content, position) VALUES ('solar-powered-emergency-beacon', 'Results', 'The prototype met most first-stage requirements: it displayed GPS data, transmitted over Bluetooth beyond the target range, and ran all primary components. The final analysis concluded that the concept was technically promising as a prototype, but not yet commercially practical with the evaluated battery, solar, weight, and COSPAS-SARSAT power constraints.', 0);

INSERT INTO project_page_copy (project_id, overview, what_built) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'This EECS 475 project examined how cryptographic primitives make blockchains possible, how Bitcoin and Monero make different security and privacy tradeoffs, and how non-cryptographic weaknesses can still lead to theft, fraud, and user harm.', 'The project combined technical explanation with security analysis. It started with the cryptographic foundations behind blockchain, then moved into Bitcoin transaction structure, Monero privacy systems, attempts to undermine Monero anonymity, and a case study of the Save the Kids token collapse as an example of how human incentives and weak surrounding systems can defeat otherwise strong cryptography.');
INSERT INTO project_highlights (project_id, body, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Explained blockchain fundamentals through hash functions, elliptic curve cryptography, blocks, proof of work, and consensus.', 0);
INSERT INTO project_highlights (project_id, body, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Compared Bitcoin’s transparent transaction model with Monero’s privacy-focused design.', 1);
INSERT INTO project_highlights (project_id, body, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Analyzed Monero privacy mechanisms including ring signatures, RingCT, stealth addresses, and Dandelion++.', 2);
INSERT INTO project_highlights (project_id, body, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Connected cryptographic guarantees to real-world failures through pseudonymity, exchange leaks, irreversible transactions, and the Save the Kids case study.', 3);
INSERT INTO project_extra_details (project_id, label, value, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Format', 'Research paper, presentation, and video', 0);
INSERT INTO project_embedded_videos (project_id, title, src, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Final project video', 'https://www.youtube.com/embed/l5QoU5vnb30', 0);
