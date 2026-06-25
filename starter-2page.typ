#let resume(
  author: "",
  location: "",
  contacts: (),
  body
) = {
  let theme_color = rgb("#2b5c85")
  set document(author: author, title: author)

  set text(font: "Inter", size: 10pt, lang: "en")
  set page(margin: (top: 0.8cm, bottom: 0.8cm, left: 1cm, right: 1cm))

  show link: set text(fill: theme_color)

  show heading: it => {
    if it.level == 1 {
      pad(top: 0pt, bottom: -10pt, text(fill: theme_color, weight: "bold", smallcaps(it.body)))
      line(length: 100%, stroke: 1pt + theme_color)
    } else {
      pad(top: 0.2em, bottom: 0.2em, text(fill: theme_color, weight: "bold", it.body))
    }
  }

  align(center)[
    #block(text(weight: 700, 2em, fill: theme_color, smallcaps(author)))
    #pad(top: 0.2em, bottom: 0.3em)[
      #text(size: 0.9em, fill: gray, style: "italic", location) |
      #contacts.join("  •  ")
    ]
  ]

  set par(justify: true)
  body
}

#let exp(
  role: "",
  project: "",
  date: "",
  location: "",
  details: [],
) = {
  pad(
    bottom: 0em,
    grid(
      columns: (auto, 1fr),
      row-gutter: 0.2em,
      align(left)[
        #text(size: 1.05em, weight: "bold", fill: rgb("#2b5c85"), role)
        #{
            if project != "" [
                #h(0.4em) | #h(0.4em) #text(fill: rgb("#404040"), weight: "semibold", project)
            ]
        }
      ],
      align(right)[
        #text(weight: "semibold", size: 0.95em, date)
      ]
    )
  )
  pad(left: 0.5em, top: 0.2em, bottom: 0.4em, details)
}

#show: resume.with(
  author: "Prabhanjan Padhye",
  location: "Pune, India",
  contacts: (
    [#link("mailto:prabhanjan@fosslife.com")[Email]],
    [#link("https://prabhanjan.dev")[Website]],
    [#link("https://github.com/fosslife")[GitHub]],
    [#link("https://linkedin.com/in/Sparkenstein")[LinkedIn] #text(size: 0.85em, fill: gray)[(2.5K+)]],
  )
)

= Summary
Full-stack engineer with 9+ years scaling production systems across AI, ed-tech, and developer tooling. Open-source author (5,000+ GitHub stars across projects, \#1 on HackerNews) and active contributor to runtimes including Deno. Comfortable across Rust/Node services, React frontends, and multi-cloud infrastructure; equally hands-on as an individual contributor and as a lead shaping team direction.

= Skills
#pad(top: 0.3em, bottom: 0.4em)[
  *Languages:* JavaScript, TypeScript, Rust, Python, Go, Bash, SQL \
  *Frontend:* React, Solid, Next.js, Astro, Svelte, Tauri \
  *Backend:* Node.js, Axum, Tokio, FastAPI, Flask, GraphQL, REST, WebSockets \
  *Data & Infra:* Postgres, MongoDB, Dgraph, Redis, Kafka, Docker, Podman, Kubernetes \
  *Cloud & Ops:* AWS, GCP, Cloudflare, Terraform, GitHub Actions, Linux, Git \
  *Practices:* System design, multi-tenant architecture, performance tuning, hiring & mentorship
]

= Experience

#exp(
  role: "Lead Engineer",
  project: "reps.ai",
  date: "2025 - present",
  details: [
    - Architecting the core AI-native platform from the ground up, owning system design, infra, and the engineering roadmap.
    - Building and leading the team of 6 for a high impact AI product.
  ]
)

#exp(
  role: "Engineering Manager",
  project: "Bigspring",
  date: "Nov 2022 - 2025",
  details: [
    - Cut average API latency from 1s+ to ~50ms on the platform's hot path, sustaining 8K active users per minute on a 300K-LOC Next.js / Node / GraphQL stack.
    - Designed the multi-tenant infrastructure (isolation, billing, onboarding) powering enterprise deployments for Google and Pfizer; led 10+ engineers across architecture reviews, hiring, and releases.
  ]
)

#exp(
  role: "Team Lead",
  project: "MasaiSchool",
  date: "Mar 2020 - Nov 2022",
  details: [
    - Built 3 core ed-tech platforms (onboarding portal, student dashboard, LMS) in React, Python, Astro, and Svelte; scaled the LMS to 2,500 concurrent students per live lecture.
    - Authored technical curricula and mentored 5,000+ students in modern full-stack engineering.
  ]
)

#exp(
  role: "Full-Stack Developer",
  project: "Growerhub, Syngenta",
  date: "Oct 2018 - Mar 2020",
  details: [
    - Founding engineer on Syngenta's agro-tech product; shipped 2 full-stack apps with geospatial mapping and image-processing pipelines for field-level crop analytics.
  ]
)

#exp(
  role: "Front-end Developer",
  project: "Identity and Access Government",
  date: "Sept 2016 - Oct 2018",
  details: [
    - Migrated a legacy enterprise suite from AngularJS v1 to React in 3 months and set up the component patterns the team continued to build on.
  ]
)

= Key Projects & Open Source

#exp(
  role: "Author",
  project: link("https://github.com/fosslife/devtools-x")[DevTools-X],
  date: "TypeScript, Rust, Tauri  •  1.5K+ stars",
  details: [
    - Cross-platform desktop toolbox bundling 50+ offline-first developer utilities (formatters, converters, generators) into a single 10MB native app; reached \#1 on HackerNews.
  ]
)

#exp(
  role: "Author",
  project: link("https://github.com/fosslife/delta")[Delta],
  date: "Rust, Multi-cloud",
  details: [
    - Multi-region file uploader and URL shortener built on multi-cloud infrastructure (S3, GCS, R2), designed for millions of requests per second with per-region failover.
  ]
)

#exp(
  role: "Author",
  project: link("https://github.com/fosslife/awesome-ricing")[awesome-ricing],
  date: "Curated list  •  4.2K+ stars",
  details: [
    - Most-starred curated index of Linux desktop customization tooling; community-maintained reference cited across r/unixporn and ricing tutorials.
  ]
)

#exp(
  role: "Author",
  project: link("https://github.com/fosslife/truthy")[Truthy],
  date: "TypeScript, React Native",
  details: [
    - Cross-platform (desktop + mobile) 2FA manager with end-to-end encrypted sync; secure replacement for proprietary authenticators.
  ]
)

#exp(
  role: "Author",
  project: link("https://github.com/fosslife/waterfowl")[Waterfowl] + " & " + link("https://github.com/fosslife/rykard")[Rykard],
  date: "TypeScript, Tauri",
  details: [
    - *Waterfowl:* native GUI database manager for Postgres (with planned MySQL/SQLite support), built as a lighter alternative to Electron-based tools.
    - *Rykard:* native Docker desktop replacement focused on speed and lower memory footprint.
  ]
)

#exp(
  role: "Contributor",
  project: link("https://github.com/denoland/deno")[denoland/deno],
  date: "TypeScript / JavaScript Runtime",
  details: [
    - Fixed #link("https://github.com/denoland/deno/pull/7017")[`URLSearchParams.toString()`] to match browser behavior, added #link("https://github.com/denoland/deno/pull/8462")[`cargo-deny`] CI integration, and contributed #link("https://github.com/denoland/deno/pull/6998")[zsh completion docs].
  ]
)

#exp(
  role: "Contributor",
  project: link("https://github.com/goniszewski/grimoire")[goniszewski/grimoire],
  date: "SvelteKit, Self-hosted Bookmarks",
  details: [
    - Shipped #link("https://github.com/goniszewski/grimoire/pull/144")[auth error handling] for the signup/login flow, improving UX for self-hosted users.
  ]
)

#pad(left: 0.5em, top: 0.1em, bottom: 0.4em, text(size: 0.9em, style: "italic", fill: gray)[
  60+ additional projects (CLIs, libraries, bots, experiments) at #link("https://github.com/fosslife")[github.com/fosslife] and #link("https://github.com/Sparkenstein")[github.com/Sparkenstein].
])

= Education

#exp(
  role: "Bachelor of Engineering, Computer Science",
  project: "University of Pune",
  date: "2012 - 2016",
  details: [
    - First Class with Distinction.
    - Coursework: Data Structures & Algorithms, Operating Systems, Databases, Computer Networks, Compilers, Distributed Systems.
  ]
)

= Certifications

#pad(top: 0.3em, bottom: 0.4em, left: 0.5em)[
  - *Cisco Certified Network Engineer* — Cisco, 2014
  - *Certified Kubenetes Administrator* — Lynda.com, 2017
  - *Certified Android Developer* — Google, 2015
]

= Talks & Writing

#pad(top: 0.3em, bottom: 0.4em, left: 0.5em)[
  - *Rust - the next big thing* — Meetup, 2019. Hosted multiple rust meetups and workshops locally.
  - Technical writing and tutorials at #link("https://prabhanjan.dev")[prabhanjan.dev].
]

= Awards & Achievements

#pad(top: 0.3em, bottom: 0.4em, left: 0.5em)[
  - *\#1 on HackerNews* — DevTools-X front-page launch; 1.5K+ stars within the first week.
  - *5,000+ cumulative GitHub stars* across authored open-source projects.
  - *Smart India Hackathon* — Government of India, 2016. Won the hackathon with a project that helped farmers and AYUSH students study and understand the plants. 
]
