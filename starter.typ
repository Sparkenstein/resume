#let resume(
  author: "",
  location: "",
  contacts: (),
  body
) = {
  let theme_color = rgb("#2b5c85")
  set document(author: author, title: author)

  // Maximum density layout: 0.8cm top/bottom margins, 10pt font
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

  // Ultra-condensed header
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
  // Tighter padding here to save vertical space
  pad(left: 0.5em, top: 0.2em, bottom: 0.4em, details)
}

#show: resume.with(
  author: "Prabhanjan Padhye",
  location: "Pune, India",
  contacts: (
    [#link("mailto:prabhanjan@fosslife.com")[prabhanjan\@fosslife.com]],
    [#link("https://prabhanjan.dev")[prabhanjan.dev]],
    [#link("https://github.com/fosslife")[github.com/fosslife]],
    [#link("https://linkedin.com/in/Sparkenstein")[linkedin.com/in/Sparkenstein]],
  )
)

= Summary
Senior full-stack engineer with 10 years building production systems across AI, ed-tech, and developer tooling; most recently built an enterprise AI platform's real-time voice and roleplay pipeline end to end. Open-source author (5,000+ GitHub stars, \#1 on HackerNews) and Deno contributor, hands-on across Rust/Node, React, LLM integrations, and multi-cloud infra.

= Skills
#pad(top: 0.3em, bottom: 0.4em)[
  *Languages:* JavaScript, TypeScript, Rust, Python, Bash \
  *Frameworks:* React, Next.js, Angular, Svelte, Astro, Tauri, Node.js, Axum, Tokio, FastAPI, GraphQL \
  *AI:* Gemini Live API, OpenAI API, real-time voice pipelines, speech-to-text, LLM translation, persona design \
  *Tools & Cloud:* AWS, GCP, Docker, Podman, Postgres, MongoDB, Linux, Git
]

= Experience

#exp(
  role: "Lead Engineer",
  project: "reps.ai",
  date: "Feb 2025 - Present",
  details: [
    - First engineer on an enterprise AI execution-readiness platform; designed and built the core product end to end, owning architecture, infra, and the technical roadmap.
    - Built the real-time AI roleplay engine (voice, transcription, translation, personas) on Gemini Live and OpenAI.
    - Designed an AI pipeline that drafts, reviews, and judges roleplays, cutting creation time from 2 days to minutes.
    - Grew the team to 6 engineers, personally hiring 3; lead it hands-on, owning system design and code review.
  ]
)

#exp(
  role: "Engineering Manager",
  project: "Bigspring",
  date: "Nov 2022 - Feb 2025",
  details: [
    - Cut average API latency from 1s+ to \~50ms on the platform's hot path, sustaining 8K concurrent users #box[(k6 load-tested)] on a 300K-LOC Next.js / Node / GraphQL stack.
    - Designed the multi-tenant infrastructure (isolation, billing, onboarding) powering enterprise deployments for Google and Pfizer; led 10+ engineers across architecture reviews, hiring, and releases.
  ]
)

#exp(
  role: "Team Lead",
  project: "MasaiSchool",
  date: "Mar 2020 - Nov 2022",
  details: [
    - Built 3 core ed-tech platforms (onboarding portal, student dashboard, LMS) in React, Python, Astro, and Svelte; scaled the LMS to 2,500 concurrent students per live lecture.
    - Authored all core technical courses and mentored 5,000+ students; 2,500+ placed in engineering roles.
  ]
)

#exp(
  role: "Full-Stack Developer",
  project: "Syngenta (Growerhub, Cropwise)",
  date: "Oct 2018 - Mar 2020",
  details: [
    - Founding engineer on Growerhub, Syngenta's farmer-facing app, and early contributor to Cropwise during the platform transition (Cropwise now covers 180M+ acres globally); shipped 2 full-stack apps with geospatial mapping and image-processing pipelines for field-level crop analytics.
  ]
)


#exp(
  role: "Front-end Developer",
  project: "Confluxsys",
  date: "Sep 2016 - Oct 2018",
  details: [
    - Migrated a legacy enterprise suite from AngularJS to React in 3 months.
  ]
)

= Key Projects & Open Source

#exp(
  role: "Author",
  project: link("https://github.com/fosslife/devtools-x")[DevTools-X] + " & " + link("https://github.com/fosslife/delta")[Delta],
  date: "Open Source  •  60+ projects",
  details: [
    - *DevTools-X:* Cross-platform desktop toolbox for developers built with React and Rust (Tauri); reached \#1 on HackerNews and 5,000+ GitHub stars across projects.
    - *Delta:* Multi-cloud (S3, GCS, R2) file uploader and URL shortener, built for horizontal multi-region scale.
  ]
)

#exp(
  role: "Contributor",
  project: link("https://github.com/denoland/deno")[denoland/deno],
  date: "TypeScript/JavaScript Runtime",
  details: [
    - Fixed #link("https://github.com/denoland/deno/pull/7017")[`URLSearchParams.toString()`] browser parity, added #link("https://github.com/denoland/deno/pull/8462")[`cargo-deny`] CI, and wrote #link("https://github.com/denoland/deno/pull/6998")[zsh completion docs].
  ]
)

