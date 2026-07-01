-- Edit this file if you want the build-time project database to be the source of truth.

DROP TABLE IF EXISTS project_resources;
DROP TABLE IF EXISTS project_technologies;
DROP TABLE IF EXISTS projects;

CREATE TABLE projects (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  organization TEXT NOT NULL,
  classification TEXT NOT NULL,
  course_code TEXT,
  season TEXT,
  summary TEXT NOT NULL,
  detail_slug TEXT NOT NULL,
  detail_path TEXT NOT NULL,
  detail_mode TEXT NOT NULL,
  featured INTEGER DEFAULT 0,
  image_src TEXT,
  image_alt TEXT,
  image_label TEXT,
  image_accent TEXT,
  body_markdown TEXT
);

CREATE TABLE project_technologies (
  project_id TEXT NOT NULL,
  technology TEXT NOT NULL,
  position INTEGER NOT NULL,
  PRIMARY KEY (project_id, position),
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

CREATE TABLE project_resources (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  project_id TEXT NOT NULL,
  label TEXT NOT NULL,
  href TEXT,
  kind TEXT NOT NULL,
  note TEXT,
  position INTEGER NOT NULL,
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('a-new-heap', 'A New Heap', 'University of Michigan', 'Data Structures and Algorithms', 'EECS 281', 'Winter 2023', 'Heap-focused data structure project involving priority behavior and implementation tradeoffs.', 'eecs-281', '/projects/umich/eecs-281/a-new-heap', 'static', 0, NULL, NULL, NULL, NULL, '## Overview

Heap-focused data structure project involving priority behavior and implementation tradeoffs.

## Context

This project is listed under EECS 281 — Data Structures and Algorithms.

## Technical focus

Primary technologies and concepts include C++, Priority Queues, Binary Heaps, Pairing Heaps, Streaming Algorithms, and Simulation.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('a-new-heap', 'C++', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('a-new-heap', 'Priority Queues', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('a-new-heap', 'Binary Heaps', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('a-new-heap', 'Pairing Heaps', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('a-new-heap', 'Streaming Algorithms', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('a-new-heap', 'Simulation', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('a-new-heap', 'Project specification', 'https://eecs281staff.github.io/p2-a-new-heap/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('a-new-heap', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-281_Project-2a_A-new-heap', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('a2-go', 'A2-GO!', 'University of Michigan', 'Extended Reality for Social Impact', 'EECS 440', 'Winter 2025', 'Location-based augmented reality game built with Unity.', 'eecs-440', '/projects/umich/eecs-440/a2-go', 'static', 0, NULL, NULL, NULL, NULL, '## Overview

Location-based augmented reality game built with Unity.

## Context

This project is listed under EECS 440 — Extended Reality for Social Impact.

## Technical focus

Primary technologies and concepts include Unity, C#, Augmented Reality, Location-Based Gameplay, Mobile Interaction, and Game Design.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('a2-go', 'Unity', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('a2-go', 'C#', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('a2-go', 'Augmented Reality', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('a2-go', 'Location-Based Gameplay', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('a2-go', 'Mobile Interaction', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('a2-go', 'Game Design', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('a2-go', 'Course website', 'https://eecs440.com/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('a2-go', 'Course portfolio', 'https://public.websites.umich.edu/~bisdorfj/EECS_440/project_2.html', 'website', NULL, 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('advanced-lc2k-assembler', 'Advanced LC2K Assembler', 'University of Michigan', 'Computer Organization', 'EECS 370', 'Fall 2024', 'More advanced assembler work for LC2K, expanding beyond the first assembler.', 'eecs-370', '/projects/umich/eecs-370/advanced-lc2k-assembler', 'static', 0, NULL, NULL, NULL, NULL, '## Overview

More advanced assembler work for LC2K, expanding beyond the first assembler.

## Context

This project is listed under EECS 370 — Computer Organization.

## Technical focus

Primary technologies and concepts include C, LC2K Assembly, Assemblers, Object Files, Symbol Tables, and Relocation Metadata.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('advanced-lc2k-assembler', 'C', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('advanced-lc2k-assembler', 'LC2K Assembly', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('advanced-lc2k-assembler', 'Assemblers', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('advanced-lc2k-assembler', 'Object Files', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('advanced-lc2k-assembler', 'Symbol Tables', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('advanced-lc2k-assembler', 'Relocation Metadata', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('advanced-lc2k-assembler', 'Project specification', 'https://eecs370.github.io/project_2_spec/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('advanced-lc2k-assembler', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-370_Project-2a', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('application-security-exploits', 'Application Security Exploits', 'University of Michigan', 'Computer Security', 'EECS 388', 'Fall 2024', 'Application-level security project involving vulnerabilities, exploitation, and mitigation concepts.', 'eecs-388', '/projects/umich/eecs-388/application-security-exploits', 'static', 0, NULL, NULL, NULL, NULL, '## Overview

Application-level security project involving vulnerabilities, exploitation, and mitigation concepts.

## Context

This project is listed under EECS 388 — Computer Security.

## Technical focus

Primary technologies and concepts include C, Python, Shell, Application Security, Memory Safety, Buffer Overflows, and Exploit Development.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('application-security-exploits', 'C', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('application-security-exploits', 'Python', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('application-security-exploits', 'Shell', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('application-security-exploits', 'Application Security', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('application-security-exploits', 'Memory Safety', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('application-security-exploits', 'Buffer Overflows', 5);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('application-security-exploits', 'Exploit Development', 6);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('application-security-exploits', 'Project specification', 'https://eecs388.org/projects/appsec.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('application-security-exploits', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-388_Project-4', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('back-to-the-ship', 'Back to the Ship!', 'University of Michigan', 'Data Structures and Algorithms', 'EECS 281', 'Winter 2023', 'Algorithmic search/pathfinding-style project.', 'eecs-281', '/projects/umich/eecs-281/back-to-the-ship', 'static', 0, NULL, NULL, NULL, NULL, '## Overview

Algorithmic search/pathfinding-style project.

## Context

This project is listed under EECS 281 — Data Structures and Algorithms.

## Technical focus

Primary technologies and concepts include C++, Breadth-First Search, Depth-First Search, Graph Traversal, Path Reconstruction, and Command-Line Interfaces.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('back-to-the-ship', 'C++', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('back-to-the-ship', 'Breadth-First Search', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('back-to-the-ship', 'Depth-First Search', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('back-to-the-ship', 'Graph Traversal', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('back-to-the-ship', 'Path Reconstruction', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('back-to-the-ship', 'Command-Line Interfaces', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('back-to-the-ship', 'Project specification', 'https://eecs281staff.github.io/p1-back-to-the-ship/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('back-to-the-ship', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-281_Project-1_Back-to-the-ship', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('bisdorf-org', 'Bisdorf.org', 'Personal', 'Portfolio', NULL, 'Summer 2026', 'Personal portfolio website for presenting experience, education, projects, resume, and contact information.', 'portfolio', '/projects/personal/portfolio/bisdorf-org', 'static', 0, NULL, NULL, NULL, NULL, '## Overview

Personal portfolio website for presenting experience, education, projects, resume, and contact information.

## Context

This project is listed under Personal — Portfolio.

## Technical focus

Primary technologies and concepts include Astro, TypeScript, CSS, Cloudflare Pages, Cloudflare DNS, and Node.js.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('bisdorf-org', 'Astro', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('bisdorf-org', 'TypeScript', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('bisdorf-org', 'CSS', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('bisdorf-org', 'Cloudflare Pages', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('bisdorf-org', 'Cloudflare DNS', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('bisdorf-org', 'Node.js', 5);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('bisdorf-org', 'GitHub', 6);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('bisdorf-org', 'Live website', 'https://www.bisdorf.org/', 'website', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('bisdorf-org', 'GitHub repository', 'https://github.com/joshuabisdorf/Bisdorf.org', 'repository', NULL, 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('cache-simulator', 'Cache Simulator', 'University of Michigan', 'Computer Organization', 'EECS 370', 'Fall 2024', 'Cache behavior simulator for computer organization concepts.', 'eecs-370', '/projects/umich/eecs-370/cache-simulator', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Cache behavior simulator for computer organization concepts.

## Context

This project is listed under EECS 370 — Computer Organization.

## Technical focus

Primary technologies and concepts include C, Computer Architecture, Cache Simulation, Memory Hierarchy, and Address Tracing.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cache-simulator', 'C', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cache-simulator', 'Computer Architecture', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cache-simulator', 'Cache Simulation', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cache-simulator', 'Memory Hierarchy', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cache-simulator', 'Address Tracing', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('cache-simulator', 'Project specification', 'https://eecs370.github.io/project_4_spec/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('cache-simulator', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-370_Project-4', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('combinational-calculator', 'Combinational Calculator', 'University of Michigan', 'Logic Design', 'EECS 270', 'Fall 2024', 'Combinational logic calculator built from digital logic components.', 'eecs-270', '/projects/umich/eecs-270/combinational-calculator', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Combinational logic calculator built from digital logic components.

## Context

This project is listed under EECS 270 — Logic Design.

## Technical focus

Primary technologies and concepts include Verilog, Digital Logic, Combinational Circuits, Arithmetic Circuits, and Testbenches.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('combinational-calculator', 'Verilog', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('combinational-calculator', 'Digital Logic', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('combinational-calculator', 'Combinational Circuits', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('combinational-calculator', 'Arithmetic Circuits', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('combinational-calculator', 'Testbenches', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('combinational-calculator', 'Project specification', 'https://www.eecs270.org/p3_combinational_calculator.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('combinational-calculator', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-270-Project-4_Combinational-calculator', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('cryptography-attacks', 'Cryptography Attacks', 'University of Michigan', 'Computer Security', 'EECS 388', 'Fall 2024', 'Applied cryptography project for EECS 388.', 'eecs-388', '/projects/umich/eecs-388/cryptography-attacks', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Applied cryptography project for EECS 388.

## Context

This project is listed under EECS 388 — Computer Security.

## Technical focus

Primary technologies and concepts include Python, Applied Cryptography, Hashing, Public-Key Cryptography, and Security Analysis.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cryptography-attacks', 'Python', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cryptography-attacks', 'Applied Cryptography', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cryptography-attacks', 'Hashing', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cryptography-attacks', 'Public-Key Cryptography', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cryptography-attacks', 'Security Analysis', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('cryptography-attacks', 'Project specification', 'https://eecs388.org/projects/crypto.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('cryptography-attacks', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-388_Project-1', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('cse-simulator-vr-game', 'CSE Simulator VR Game', 'University of Michigan', 'Extended Reality for Social Impact', 'EECS 440', 'Winter 2025', 'Virtual reality simulator game built with Unreal Engine.', 'eecs-440', '/projects/umich/eecs-440/cse-simulator-vr-game', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Virtual reality simulator game built with Unreal Engine.

## Context

This project is listed under EECS 440 — Extended Reality for Social Impact.

## Technical focus

Primary technologies and concepts include Unreal Engine, Blueprints, Virtual Reality, XR Prototyping, and Game Design.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cse-simulator-vr-game', 'Unreal Engine', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cse-simulator-vr-game', 'Blueprints', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cse-simulator-vr-game', 'Virtual Reality', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cse-simulator-vr-game', 'XR Prototyping', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('cse-simulator-vr-game', 'Game Design', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('cse-simulator-vr-game', 'Course website', 'https://eecs440.com/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('cse-simulator-vr-game', 'Course portfolio', 'https://public.websites.umich.edu/~bisdorfj/EECS_440/project_1.html', 'website', NULL, 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('dancear', 'DanceAR', 'University of Michigan', 'Extended Reality for Social Impact', 'EECS 440', 'Winter 2025', 'Extended reality dance accessibility and learning project.', 'eecs-440', '/projects/umich/eecs-440/dancear', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Extended reality dance accessibility and learning project.

## Context

This project is listed under EECS 440 — Extended Reality for Social Impact.

## Technical focus

Primary technologies and concepts include JavaScript, Web, Extended Reality, and Accessibility.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('dancear', 'JavaScript', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('dancear', 'Web', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('dancear', 'Extended Reality', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('dancear', 'Accessibility', 3);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('dancear', 'Course website', 'https://eecs440.com/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('dancear', 'Project website', 'https://dance-ar-440.netlify.app/', 'website', NULL, 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('debugging-automation', 'Debugging Automation', 'University of Michigan', 'Software Engineering', 'EECS 481', 'Winter 2025', 'Software engineering project focused on automating debugging workflows.', 'eecs-481', '/projects/umich/eecs-481/debugging-automation', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Software engineering project focused on automating debugging workflows.

## Context

This project is listed under EECS 481 — Software Engineering.

## Technical focus

Primary technologies and concepts include Python, Shell, Delta Debugging, Fault Localization, Coverage Analysis, and Automation.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('debugging-automation', 'Python', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('debugging-automation', 'Shell', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('debugging-automation', 'Delta Debugging', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('debugging-automation', 'Fault Localization', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('debugging-automation', 'Coverage Analysis', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('debugging-automation', 'Automation', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('debugging-automation', 'Project specification', 'https://eecs481.org/hw5.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('debugging-automation', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-481_Homework-5', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Decrypting Blockchain: The Art of the Steal', 'University of Michigan', 'Cryptography', 'EECS 475', 'Winter 2025', 'Research project analyzing blockchain security, privacy, Monero traceability, and cryptocurrency scams.', 'eecs-475', '/projects/umich/eecs-475/decrypting-blockchain-the-art-of-the-steal', 'static', 0, NULL, NULL, NULL, NULL, '## Overview

Research project analyzing blockchain security, privacy, Monero traceability, and cryptocurrency scams.

## Context

This project is listed under EECS 475 — Cryptography.

## Technical focus

Primary technologies and concepts include Cryptography, Blockchain, Elliptic Curve Cryptography, Hash Functions, Bitcoin, and Monero.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Cryptography', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Blockchain', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Elliptic Curve Cryptography', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Hash Functions', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Bitcoin', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Monero', 5);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Privacy Analysis', 6);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'View final report', '/project-artifacts/eecs-475/decrypting-blockchain-the-art-of-the-steal/Decrypting-Blockchain_The-Art-Of-The-Steal_Final-Report.pdf', 'artifact', 'PDF research report covering blockchain fundamentals, Monero privacy, tracing limitations, and cryptocurrency scam analysis.', 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'View final presentation', '/project-artifacts/eecs-475/decrypting-blockchain-the-art-of-the-steal/Decrypting-Blockchain_The-Art-Of-The-Steal_Final-Presentation.pdf', 'artifact', 'PDF slide deck for the EECS 475 final presentation.', 1);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('decrypting-blockchain-the-art-of-the-steal', 'Watch on YouTube', 'https://youtu.be/l5QoU5vnb30', 'video', 'Final project video hosted on YouTube.', 2);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('defect-detection', 'Defect Detection', 'University of Michigan', 'Software Engineering', 'EECS 481', 'Winter 2025', 'Software engineering project focused on finding defects in code.', 'eecs-481', '/projects/umich/eecs-481/defect-detection', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Software engineering project focused on finding defects in code.

## Context

This project is listed under EECS 481 — Software Engineering.

## Technical focus

Primary technologies and concepts include C, C++, Static Analysis, Infer, Cppcheck, and Defect Detection.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('defect-detection', 'C', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('defect-detection', 'C++', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('defect-detection', 'Static Analysis', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('defect-detection', 'Infer', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('defect-detection', 'Cppcheck', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('defect-detection', 'Defect Detection', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('defect-detection', 'Project specification', 'https://eecs481.org/hw4.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('defect-detection', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-481_Homework-4', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('detecting-dirty-dish-culprits', 'Detecting Dirty Dish Culprits', 'University of Michigan', 'Computer Vision', 'EECS 442', 'Fall 2024', 'Computer vision system that flags timestamps where people likely leave dirty dishes without washing them.', 'eecs-442', '/projects/umich/eecs-442/detecting-dirty-dish-culprits', 'static', 0, NULL, NULL, NULL, NULL, '## Overview

Computer vision system that flags timestamps where people likely leave dirty dishes without washing them.

## Context

This project is listed under EECS 442 — Computer Vision.

## Technical focus

The project is categorized as Computer Vision and Machine Learning.

Primary technologies and concepts include Python, YOLOv8, Roboflow, OpenCV, Computer Vision, and Object Detection.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('detecting-dirty-dish-culprits', 'Python', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('detecting-dirty-dish-culprits', 'YOLOv8', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('detecting-dirty-dish-culprits', 'Roboflow', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('detecting-dirty-dish-culprits', 'OpenCV', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('detecting-dirty-dish-culprits', 'Computer Vision', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('detecting-dirty-dish-culprits', 'Object Detection', 5);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('detecting-dirty-dish-culprits', 'Action Classification', 6);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('detecting-dirty-dish-culprits', 'View final report', '/project-artifacts/eecs-442/detecting-dirty-dish-culprits/Detecting-Dirty-Dish-Culprits_Final-Report.pdf', 'artifact', 'PDF report describing the motivation, method, experiments, and conclusions.', 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('detecting-dirty-dish-culprits', 'View final presentation', '/project-artifacts/eecs-442/detecting-dirty-dish-culprits/Detecting-Dirty-Dish-Culprits_Final-Presentation.pdf', 'artifact', 'PDF slide deck summarizing the project approach and results.', 1);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('detecting-dirty-dish-culprits', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-442_Dishwashing_ethically', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 2);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('digital-forensics', 'Digital Forensics', 'University of Michigan', 'Computer Security', 'EECS 388', 'Fall 2024', 'Digital forensics project involving investigation and evidence analysis.', 'eecs-388', '/projects/umich/eecs-388/digital-forensics', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Digital forensics project involving investigation and evidence analysis.

## Context

This project is listed under EECS 388 — Computer Security.

## Technical focus

The project is categorized as Cybersecurity.

Primary technologies and concepts include Python, Shell, Digital Forensics, File Analysis, Evidence Recovery, and Security Analysis.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('digital-forensics', 'Python', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('digital-forensics', 'Shell', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('digital-forensics', 'Digital Forensics', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('digital-forensics', 'File Analysis', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('digital-forensics', 'Evidence Recovery', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('digital-forensics', 'Security Analysis', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('digital-forensics', 'Project specification', 'https://eecs388.org/projects/forensics.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('digital-forensics', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-388_Project-5', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('euchre', 'Euchre', 'University of Michigan', 'Programming and Data Structures', 'EECS 280', 'Fall 2022', 'Card game simulation project involving object-oriented design and game logic.', 'eecs-280', '/projects/umich/eecs-280/euchre', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Card game simulation project involving object-oriented design and game logic.

## Context

This project is listed under EECS 280 — Programming and Data Structures.

## Technical focus

Primary technologies and concepts include C++, Object-Oriented Programming, Game Logic, Polymorphism, and Testing.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('euchre', 'C++', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('euchre', 'Object-Oriented Programming', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('euchre', 'Game Logic', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('euchre', 'Polymorphism', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('euchre', 'Testing', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('euchre', 'Project specification', 'https://eecs280staff.github.io/euchre/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('euchre', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-280_Project-3_EUCHRE', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('image-processing', 'Image Processing', 'University of Michigan', 'Programming and Data Structures', 'EECS 280', 'Fall 2022', 'Image manipulation and processing project.', 'eecs-280', '/projects/umich/eecs-280/image-processing', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Image manipulation and processing project.

## Context

This project is listed under EECS 280 — Programming and Data Structures.

## Technical focus

The project is categorized as Computer Vision and Data.

Primary technologies and concepts include C++, Image Processing, PPM Images, Matrix Manipulation, and Command-Line Interfaces.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('image-processing', 'C++', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('image-processing', 'Image Processing', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('image-processing', 'PPM Images', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('image-processing', 'Matrix Manipulation', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('image-processing', 'Command-Line Interfaces', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('image-processing', 'Project specification', 'https://eecs280staff.github.io/image-processing/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('image-processing', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-280_Project-2_CV', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('instruction-level-lc2k-simulator', 'Instruction-Level LC2K Simulator', 'University of Michigan', 'Computer Organization', 'EECS 370', 'Fall 2024', 'Simulator for executing LC2K instructions at the instruction level.', 'eecs-370', '/projects/umich/eecs-370/instruction-level-lc2k-simulator', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Simulator for executing LC2K instructions at the instruction level.

## Context

This project is listed under EECS 370 — Computer Organization.

## Technical focus

The project is categorized as Computer Architecture.

Primary technologies and concepts include C, LC2K Assembly, Instruction Simulation, Machine Code, and Computer Architecture.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('instruction-level-lc2k-simulator', 'C', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('instruction-level-lc2k-simulator', 'LC2K Assembly', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('instruction-level-lc2k-simulator', 'Instruction Simulation', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('instruction-level-lc2k-simulator', 'Machine Code', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('instruction-level-lc2k-simulator', 'Computer Architecture', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('instruction-level-lc2k-simulator', 'Project specification', 'https://eecs370.github.io/project_1_spec/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('instruction-level-lc2k-simulator', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-370_Project-1s', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('lc2k-assembler', 'LC2K Assembler', 'University of Michigan', 'Computer Organization', 'EECS 370', 'Fall 2024', 'Assembler that translates LC2K assembly into machine code.', 'eecs-370', '/projects/umich/eecs-370/lc2k-assembler', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Assembler that translates LC2K assembly into machine code.

## Context

This project is listed under EECS 370 — Computer Organization.

## Technical focus

The project is categorized as Computer Architecture.

Primary technologies and concepts include C, LC2K Assembly, Assemblers, Machine Code, and Symbol Resolution.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-assembler', 'C', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-assembler', 'LC2K Assembly', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-assembler', 'Assemblers', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-assembler', 'Machine Code', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-assembler', 'Symbol Resolution', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('lc2k-assembler', 'Project specification', 'https://eecs370.github.io/project_1_spec/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('lc2k-assembler', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-370_Project-1a', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('lc2k-linker', 'LC2K Linker', 'University of Michigan', 'Computer Organization', 'EECS 370', 'Fall 2024', 'Linker for combining LC2K object files.', 'eecs-370', '/projects/umich/eecs-370/lc2k-linker', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Linker for combining LC2K object files.

## Context

This project is listed under EECS 370 — Computer Organization.

## Technical focus

The project is categorized as Computer Architecture.

Primary technologies and concepts include C, LC2K Assembly, Linkers, Object Files, Symbol Resolution, and Relocation Metadata.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-linker', 'C', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-linker', 'LC2K Assembly', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-linker', 'Linkers', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-linker', 'Object Files', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-linker', 'Symbol Resolution', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-linker', 'Relocation Metadata', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('lc2k-linker', 'Project specification', 'https://eecs370.github.io/project_2_spec/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('lc2k-linker', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-370_Project-2l', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('lc2k-pipeline', 'LC2K Pipeline', 'University of Michigan', 'Computer Organization', 'EECS 370', 'Fall 2024', 'Pipeline simulator for LC2K processor behavior.', 'eecs-370', '/projects/umich/eecs-370/lc2k-pipeline', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Pipeline simulator for LC2K processor behavior.

## Context

This project is listed under EECS 370 — Computer Organization.

## Technical focus

The project is categorized as Computer Architecture.

Primary technologies and concepts include C, LC2K Assembly, Pipeline Simulation, Data Hazards, Forwarding, and Branch Prediction.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-pipeline', 'C', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-pipeline', 'LC2K Assembly', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-pipeline', 'Pipeline Simulation', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-pipeline', 'Data Hazards', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-pipeline', 'Forwarding', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-pipeline', 'Branch Prediction', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('lc2k-pipeline', 'Project specification', 'https://eecs370.github.io/project_3_spec/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('lc2k-pipeline', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-370_Project-3', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('lc2k-recursive-function', 'LC2K Recursive Function', 'University of Michigan', 'Computer Organization', 'EECS 370', 'Fall 2024', 'Recursive function implemented at the LC2K assembly level.', 'eecs-370', '/projects/umich/eecs-370/lc2k-recursive-function', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Recursive function implemented at the LC2K assembly level.

## Context

This project is listed under EECS 370 — Computer Organization.

## Technical focus

The project is categorized as Computer Architecture.

Primary technologies and concepts include LC2K Assembly, Recursion, Stack Frames, Calling Conventions, and Low-Level Programming.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-recursive-function', 'LC2K Assembly', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-recursive-function', 'Recursion', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-recursive-function', 'Stack Frames', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-recursive-function', 'Calling Conventions', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('lc2k-recursive-function', 'Low-Level Programming', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('lc2k-recursive-function', 'Project specification', 'https://eecs370.github.io/project_2_spec/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('lc2k-recursive-function', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-370_Project-2r', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('machine-learning-classifier', 'Machine Learning Classifier', 'University of Michigan', 'Programming and Data Structures', 'EECS 280', 'Fall 2022', 'Introductory machine learning classifier project.', 'eecs-280', '/projects/umich/eecs-280/machine-learning-classifier', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Introductory machine learning classifier project.

## Context

This project is listed under EECS 280 — Programming and Data Structures.

## Technical focus

The project is categorized as Machine Learning and Data.

Primary technologies and concepts include C++, Machine Learning, Naive Bayes, Text Classification, and Data Processing.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('machine-learning-classifier', 'C++', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('machine-learning-classifier', 'Machine Learning', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('machine-learning-classifier', 'Naive Bayes', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('machine-learning-classifier', 'Text Classification', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('machine-learning-classifier', 'Data Processing', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('machine-learning-classifier', 'Project specification', 'https://eecs280staff.github.io/ml-classifier/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('machine-learning-classifier', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-280_Project-5_ML', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('multiplication-in-assembly', 'Multiplication in Assembly', 'University of Michigan', 'Computer Organization', 'EECS 370', 'Fall 2024', 'Multiplication routine implemented in LC2K assembly.', 'eecs-370', '/projects/umich/eecs-370/multiplication-in-assembly', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Multiplication routine implemented in LC2K assembly.

## Context

This project is listed under EECS 370 — Computer Organization.

## Technical focus

The project is categorized as Computer Architecture.

Primary technologies and concepts include LC2K Assembly, Bitwise Arithmetic, Low-Level Programming, Computer Organization, and Control Flow.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('multiplication-in-assembly', 'LC2K Assembly', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('multiplication-in-assembly', 'Bitwise Arithmetic', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('multiplication-in-assembly', 'Low-Level Programming', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('multiplication-in-assembly', 'Computer Organization', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('multiplication-in-assembly', 'Control Flow', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('multiplication-in-assembly', 'Project specification', 'https://eecs370.github.io/project_1_spec/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('multiplication-in-assembly', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-370_Project-1m', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('mutation-testing', 'Mutation Testing', 'University of Michigan', 'Software Engineering', 'EECS 481', 'Winter 2025', 'Software testing project focused on mutation testing and test-suite quality.', 'eecs-481', '/projects/umich/eecs-481/mutation-testing', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Software testing project focused on mutation testing and test-suite quality.

## Context

This project is listed under EECS 481 — Software Engineering.

## Technical focus

The project is categorized as Software Engineering.

Primary technologies and concepts include Python, Mutation Testing, Python AST, AST Transformations, Test Quality, and Automation.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('mutation-testing', 'Python', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('mutation-testing', 'Mutation Testing', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('mutation-testing', 'Python AST', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('mutation-testing', 'AST Transformations', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('mutation-testing', 'Test Quality', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('mutation-testing', 'Automation', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('mutation-testing', 'Project specification', 'https://eecs481.org/hw3.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('mutation-testing', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-481_Homework-3', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('network-security', 'Network Security', 'University of Michigan', 'Computer Security', 'EECS 388', 'Fall 2024', 'Network security project involving networking attacks, defenses, or protocols.', 'eecs-388', '/projects/umich/eecs-388/network-security', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Network security project involving networking attacks, defenses, or protocols.

## Context

This project is listed under EECS 388 — Computer Security.

## Technical focus

The project is categorized as Cybersecurity.

Primary technologies and concepts include Python, Network Security, Protocol Analysis, Packet Handling, Attacks, and Defenses.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('network-security', 'Python', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('network-security', 'Network Security', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('network-security', 'Protocol Analysis', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('network-security', 'Packet Handling', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('network-security', 'Attacks', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('network-security', 'Defenses', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('network-security', 'Project specification', 'https://eecs388.org/projects/networking.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('network-security', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-388_Project-3', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('office-hours-queue-web-app', 'Office Hours Queue', 'University of Michigan', 'Programming and Data Structures', 'EECS 280', 'Fall 2022', 'Office-hours queue web server project involving linked lists, iterators, JSON, and REST-style request handling.', 'eecs-280', '/projects/umich/eecs-280/office-hours-queue-web-app', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Office-hours queue web server project involving linked lists, iterators, JSON, and REST-style request handling.

## Context

This project is listed under EECS 280 — Programming and Data Structures.

## Technical focus

The project is categorized as Web and Software Engineering.

Primary technologies and concepts include C++, Linked Lists, Iterators, Dynamic Memory, REST APIs, and JSON.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('office-hours-queue-web-app', 'C++', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('office-hours-queue-web-app', 'Linked Lists', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('office-hours-queue-web-app', 'Iterators', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('office-hours-queue-web-app', 'Dynamic Memory', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('office-hours-queue-web-app', 'REST APIs', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('office-hours-queue-web-app', 'JSON', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('office-hours-queue-web-app', 'Project specification', 'https://eecs280staff.github.io/p4-web/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('office-hours-queue-web-app', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-280_Project-4_WEB', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('open-source-contribution', 'Open Source Contribution', 'University of Michigan', 'Software Engineering', 'EECS 481', 'Winter 2025', 'Open-source contribution project involving Signal Desktop.', 'eecs-481', '/projects/umich/eecs-481/open-source-contribution', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Open-source contribution project involving Signal Desktop.

## Context

This project is listed under EECS 481 — Software Engineering.

## Technical focus

The project is categorized as Software Engineering and Web.

Primary technologies and concepts include TypeScript, JavaScript, Electron, Open Source, Code Review, and GitHub.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('open-source-contribution', 'TypeScript', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('open-source-contribution', 'JavaScript', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('open-source-contribution', 'Electron', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('open-source-contribution', 'Open Source', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('open-source-contribution', 'Code Review', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('open-source-contribution', 'GitHub', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('open-source-contribution', 'Project specification', 'https://eecs481.org/hw6.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('open-source-contribution', 'GitHub repository', 'https://github.com/signalapp/signal-desktop', 'repository', NULL, 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('pokemon', 'Pokemon', 'University of Michigan', 'Data Structures and Algorithms', 'EECS 281', 'Winter 2023', 'Algorithms project involving graph search and optimization concepts.', 'eecs-281', '/projects/umich/eecs-281/pokemon', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Algorithms project involving graph search and optimization concepts.

## Context

This project is listed under EECS 281 — Data Structures and Algorithms.

## Technical focus

The project is categorized as Algorithms.

Primary technologies and concepts include C++, Graph Algorithms, Minimum Spanning Trees, Traveling Salesperson, Branch and Bound, and Optimization.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('pokemon', 'C++', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('pokemon', 'Graph Algorithms', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('pokemon', 'Minimum Spanning Trees', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('pokemon', 'Traveling Salesperson', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('pokemon', 'Branch and Bound', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('pokemon', 'Optimization', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('pokemon', 'Project specification', 'https://eecs281staff.github.io/p4-pokemon/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('pokemon', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-281_Project-4_Pokemon', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('priority-queues', 'Priority Queues', 'University of Michigan', 'Data Structures and Algorithms', 'EECS 281', 'Winter 2023', 'Priority queue implementation and comparison project.', 'eecs-281', '/projects/umich/eecs-281/priority-queues', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Priority queue implementation and comparison project.

## Context

This project is listed under EECS 281 — Data Structures and Algorithms.

## Technical focus

The project is categorized as Algorithms.

Primary technologies and concepts include C++, Priority Queues, Binary Heaps, Pairing Heaps, Data Structures, and Performance Analysis.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('priority-queues', 'C++', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('priority-queues', 'Priority Queues', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('priority-queues', 'Binary Heaps', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('priority-queues', 'Pairing Heaps', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('priority-queues', 'Data Structures', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('priority-queues', 'Performance Analysis', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('priority-queues', 'Project specification', 'https://eecs281staff.github.io/p2b-priority-queues/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('priority-queues', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-281_Project-2b_Priority-queues', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('renee', 'Renee', 'University of Michigan', 'Logic Design', 'EECS 270', 'Fall 2024', 'Digital logic design project from the Robbie/Renee sequence.', 'eecs-270', '/projects/umich/eecs-270/renee', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Digital logic design project from the Robbie/Renee sequence.

## Context

This project is listed under EECS 270 — Logic Design.

## Technical focus

Primary technologies and concepts include Verilog, Digital Logic, Finite State Machines, Datapath Design, and Testbenches.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('renee', 'Verilog', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('renee', 'Digital Logic', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('renee', 'Finite State Machines', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('renee', 'Datapath Design', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('renee', 'Testbenches', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('renee', 'Project specification', 'https://www.eecs270.org/p2_renee.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('renee', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-270_Project-3b-Renee', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('ring-oscillator', 'Ring Oscillator', 'University of Michigan', 'Logic Design', 'EECS 270', 'Fall 2024', 'Digital logic timing and delay project involving a ring oscillator.', 'eecs-270', '/projects/umich/eecs-270/ring-oscillator', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Digital logic timing and delay project involving a ring oscillator.

## Context

This project is listed under EECS 270 — Logic Design.

## Technical focus

The project is categorized as Digital Logic.

Primary technologies and concepts include Verilog, Digital Logic, Ring Oscillators, Timing Analysis, and Circuit Delay.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('ring-oscillator', 'Verilog', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('ring-oscillator', 'Digital Logic', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('ring-oscillator', 'Ring Oscillators', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('ring-oscillator', 'Timing Analysis', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('ring-oscillator', 'Circuit Delay', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('ring-oscillator', 'Project specification', 'https://www.eecs270.org/p4_timing_and_delay.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('ring-oscillator', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-270_Project-2_Timing-and-delay', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('robbie', 'Robbie', 'University of Michigan', 'Logic Design', 'EECS 270', 'Fall 2024', 'Digital logic design project from the Robbie/Renee sequence.', 'eecs-270', '/projects/umich/eecs-270/robbie', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Digital logic design project from the Robbie/Renee sequence.

## Context

This project is listed under EECS 270 — Logic Design.

## Technical focus

Primary technologies and concepts include Verilog, Digital Logic, Finite State Machines, Datapath Design, and Testbenches.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('robbie', 'Verilog', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('robbie', 'Digital Logic', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('robbie', 'Finite State Machines', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('robbie', 'Datapath Design', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('robbie', 'Testbenches', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('robbie', 'Project specification', 'https://www.eecs270.org/p2_robbie.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('robbie', 'GitHub repository', 'https://github.com/joshuabisdorf/EECS-270_Project-3a_Robbie', 'repository', NULL, 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('selector', 'Selector', 'University of Michigan', 'Logic Design', 'EECS 270', 'Fall 2024', 'Selector/multiplexer-style digital logic project.', 'eecs-270', '/projects/umich/eecs-270/selector', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Selector/multiplexer-style digital logic project.

## Context

This project is listed under EECS 270 — Logic Design.

## Technical focus

The project is categorized as Digital Logic.

Primary technologies and concepts include Verilog, Digital Logic, Multiplexers, Combinational Circuits, and Testbenches.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('selector', 'Verilog', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('selector', 'Digital Logic', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('selector', 'Multiplexers', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('selector', 'Combinational Circuits', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('selector', 'Testbenches', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('selector', 'Project specification', 'https://www.eecs270.org/p1_selector.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('selector', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-270_Project-1_Selector', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('sequential-calculator', 'Sequential Calculator', 'University of Michigan', 'Logic Design', 'EECS 270', 'Fall 2024', 'Sequential logic calculator project.', 'eecs-270', '/projects/umich/eecs-270/sequential-calculator', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Sequential logic calculator project.

## Context

This project is listed under EECS 270 — Logic Design.

## Technical focus

The project is categorized as Digital Logic.

Primary technologies and concepts include Verilog, Digital Logic, Sequential Circuits, Finite State Machines, Arithmetic Circuits, and Testbenches.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('sequential-calculator', 'Verilog', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('sequential-calculator', 'Digital Logic', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('sequential-calculator', 'Sequential Circuits', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('sequential-calculator', 'Finite State Machines', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('sequential-calculator', 'Arithmetic Circuits', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('sequential-calculator', 'Testbenches', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('sequential-calculator', 'Project specification', 'https://www.eecs270.org/p7_sequential_calculator.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('sequential-calculator', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-270-Project-7_Sequential-calculator', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('sillyql', 'SillyQL', 'University of Michigan', 'Data Structures and Algorithms', 'EECS 281', 'Winter 2023', 'Simplified SQL/database-style project.', 'eecs-281', '/projects/umich/eecs-281/sillyql', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Simplified SQL/database-style project.

## Context

This project is listed under EECS 281 — Data Structures and Algorithms.

## Technical focus

The project is categorized as Algorithms and Data.

Primary technologies and concepts include C++, Databases, Hash Tables, Binary Search Trees, Query Processing, and Table Joins.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('sillyql', 'C++', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('sillyql', 'Databases', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('sillyql', 'Hash Tables', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('sillyql', 'Binary Search Trees', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('sillyql', 'Query Processing', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('sillyql', 'Table Joins', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('sillyql', 'Project specification', 'https://eecs281staff.github.io/p3-sillyql/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('sillyql', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-281_Project-3_SillyQL', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('solar-powered-emergency-beacon', 'Solar Powered Emergency Beacon', 'University of Michigan', 'Solar Energy and Wireless Systems', 'ENGR 100', 'Winter 2023', 'Arduino-based solar emergency beacon prototype with GPS, Bluetooth transmission, LCD output, and power testing.', 'engr-100', '/projects/umich/engr-100/solar-powered-emergency-beacon', 'static', 0, NULL, NULL, NULL, NULL, '## Overview

Arduino-based solar emergency beacon prototype with GPS, Bluetooth transmission, LCD output, and power testing.

## Context

This project is listed under ENGR 100 — Solar Energy and Wireless Systems.

## Technical focus

The project is categorized as Embedded Systems.

Primary technologies and concepts include Arduino, C++, GPS, Bluetooth, Solar Power, and Circuit Design.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('solar-powered-emergency-beacon', 'Arduino', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('solar-powered-emergency-beacon', 'C++', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('solar-powered-emergency-beacon', 'GPS', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('solar-powered-emergency-beacon', 'Bluetooth', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('solar-powered-emergency-beacon', 'Solar Power', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('solar-powered-emergency-beacon', 'Circuit Design', 5);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('solar-powered-emergency-beacon', 'Embedded Systems', 6);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('solar-powered-emergency-beacon', 'View final report', '/project-artifacts/engr-100/solar-powered-emergency-beacon/The-Solderers_Final-Report.pdf', 'artifact', 'PDF report describing the prototype, tests, requirements validation, tradeoffs, and recommendation.', 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('solar-powered-emergency-beacon', 'View final presentation', '/project-artifacts/engr-100/solar-powered-emergency-beacon/The-Solderers_Final-Presentation.pdf', 'artifact', 'PDF slide deck summarizing the prototype and business analysis.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('statistics-engine', 'Statistics Engine', 'University of Michigan', 'Programming and Data Structures', 'EECS 280', 'Fall 2022', 'Introductory statistics/data-processing project.', 'eecs-280', '/projects/umich/eecs-280/statistics-engine', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Introductory statistics/data-processing project.

## Context

This project is listed under EECS 280 — Programming and Data Structures.

## Technical focus

The project is categorized as Data.

Primary technologies and concepts include C++, Statistics, CSV Parsing, Data Processing, and Unit Testing.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('statistics-engine', 'C++', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('statistics-engine', 'Statistics', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('statistics-engine', 'CSV Parsing', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('statistics-engine', 'Data Processing', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('statistics-engine', 'Unit Testing', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('statistics-engine', 'Project specification', 'https://eecs280staff.github.io/stats/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('statistics-engine', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-280_Project-1_STATS', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('statistics-toolkit', 'Statistics Toolkit', 'University of Michigan', 'Data Structures and Algorithms', 'EECS 281', 'Winter 2023', 'Statistics warmup/project for data structures and algorithms.', 'eecs-281', '/projects/umich/eecs-281/statistics-toolkit', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Statistics warmup/project for data structures and algorithms.

## Context

This project is listed under EECS 281 — Data Structures and Algorithms.

## Technical focus

The project is categorized as Algorithms and Data.

Primary technologies and concepts include C++, Statistics, Data Processing, Algorithm Analysis, and Command-Line Interfaces.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('statistics-toolkit', 'C++', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('statistics-toolkit', 'Statistics', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('statistics-toolkit', 'Data Processing', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('statistics-toolkit', 'Algorithm Analysis', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('statistics-toolkit', 'Command-Line Interfaces', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('statistics-toolkit', 'Project specification', 'https://eecs281staff.github.io/p0-statistics/', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('statistics-toolkit', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-281_Project-0_Statistics', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('test-automation', 'Test Automation', 'University of Michigan', 'Software Engineering', 'EECS 481', 'Winter 2025', 'Software engineering project focused on automated testing.', 'eecs-481', '/projects/umich/eecs-481/test-automation', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Software engineering project focused on automated testing.

## Context

This project is listed under EECS 481 — Software Engineering.

## Technical focus

The project is categorized as Software Engineering.

Primary technologies and concepts include Java, JUnit, Randoop, Test Automation, Regression Testing, and Coverage Analysis.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('test-automation', 'Java', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('test-automation', 'JUnit', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('test-automation', 'Randoop', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('test-automation', 'Test Automation', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('test-automation', 'Regression Testing', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('test-automation', 'Coverage Analysis', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('test-automation', 'Project specification', 'https://eecs481.org/hw2.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('test-automation', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-481_Homework-2', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('test-coverage', 'Test Coverage', 'University of Michigan', 'Software Engineering', 'EECS 481', 'Winter 2025', 'Software engineering project focused on measuring and improving test coverage.', 'eecs-481', '/projects/umich/eecs-481/test-coverage', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Software engineering project focused on measuring and improving test coverage.

## Context

This project is listed under EECS 481 — Software Engineering.

## Technical focus

The project is categorized as Software Engineering.

Primary technologies and concepts include Python, C, Java, Test Coverage, Branch Coverage, and Coverage Tools.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('test-coverage', 'Python', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('test-coverage', 'C', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('test-coverage', 'Java', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('test-coverage', 'Test Coverage', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('test-coverage', 'Branch Coverage', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('test-coverage', 'Coverage Tools', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('test-coverage', 'Project specification', 'https://eecs481.org/hw1.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('test-coverage', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-481_Homework-1', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('traffic-light-controller', 'Traffic Light Controller', 'University of Michigan', 'Logic Design', 'EECS 270', 'Fall 2024', 'Finite-state-machine-style traffic light controller project.', 'eecs-270', '/projects/umich/eecs-270/traffic-light-controller', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Finite-state-machine-style traffic light controller project.

## Context

This project is listed under EECS 270 — Logic Design.

## Technical focus

The project is categorized as Digital Logic.

Primary technologies and concepts include Verilog, Digital Logic, Finite State Machines, Control Logic, and Testbenches.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('traffic-light-controller', 'Verilog', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('traffic-light-controller', 'Digital Logic', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('traffic-light-controller', 'Finite State Machines', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('traffic-light-controller', 'Control Logic', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('traffic-light-controller', 'Testbenches', 4);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('traffic-light-controller', 'Project specification', 'https://www.eecs270.org/p6_tlc.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('traffic-light-controller', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-270-Project-6_Traffic-light-controller', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('up-down-counter', 'Up-Down Counter', 'University of Michigan', 'Logic Design', 'EECS 270', 'Fall 2024', 'Sequential counter circuit that counts up and down.', 'eecs-270', '/projects/umich/eecs-270/up-down-counter', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Sequential counter circuit that counts up and down.

## Context

This project is listed under EECS 270 — Logic Design.

## Technical focus

The project is categorized as Digital Logic.

Primary technologies and concepts include Verilog, Digital Logic, Counters, Sequential Circuits, Clocked Logic, and Testbenches.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('up-down-counter', 'Verilog', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('up-down-counter', 'Digital Logic', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('up-down-counter', 'Counters', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('up-down-counter', 'Sequential Circuits', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('up-down-counter', 'Clocked Logic', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('up-down-counter', 'Testbenches', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('up-down-counter', 'Project specification', 'https://www.eecs270.org/p5_up_down_counter.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('up-down-counter', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-270-Project-5_Up-down-counter', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

INSERT INTO projects (id, title, organization, classification, course_code, season, summary, detail_slug, detail_path, detail_mode, featured, image_src, image_alt, image_label, image_accent, body_markdown) VALUES ('web-security', 'Web Security', 'University of Michigan', 'Computer Security', 'EECS 388', 'Fall 2024', 'Web security project involving common web vulnerabilities and defenses.', 'eecs-388', '/projects/umich/eecs-388/web-security', 'dynamic', 0, NULL, NULL, NULL, NULL, '## Overview

Web security project involving common web vulnerabilities and defenses.

## Context

This project is listed under EECS 388 — Computer Security.

## Technical focus

Primary technologies and concepts include JavaScript, Python, SQL, Web Security, Cross-Site Scripting, and SQL Injection.');
INSERT INTO project_technologies (project_id, technology, position) VALUES ('web-security', 'JavaScript', 0);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('web-security', 'Python', 1);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('web-security', 'SQL', 2);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('web-security', 'Web Security', 3);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('web-security', 'Cross-Site Scripting', 4);
INSERT INTO project_technologies (project_id, technology, position) VALUES ('web-security', 'SQL Injection', 5);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('web-security', 'Project specification', 'https://eecs388.org/projects/web.html', 'specification', NULL, 0);
INSERT INTO project_resources (project_id, label, href, kind, note, position) VALUES ('web-security', 'School-restricted GitHub repository', 'https://github.com/joshuabisdorf/EECS-388_Project-2', 'repository', 'Private coursework repository; access is restricted. Contact me for more details.', 1);

