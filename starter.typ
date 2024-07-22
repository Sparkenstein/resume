
/*
This copy of the resume formatting template is provided in the template download in case
you'd like to make your preferred edits to the template directly.

If you'd like to use this copy instead of the package, you'll need to update the #import
statement in your resume.typ file to reference this file directly.

Have you made edits or bug fixes to this template that you feel would help out others?
It would be fantastic if you submitted a pull request to the template repository at
https://github.com/chaoticgoodcomputing/typst-resume-starter !
*/

/*
Core formatting for the template document type. Establishes general document-wide formatting,
and creates the header and footer for the resume.
*/
#let resume(
  author: "",
  location: "",
  contacts: (),
  body
) = {

  // Sets document metadata
  set document(author: author, title: author)

  // Document-wide formatting, including font and margins
  set text(
    font: "New Computer Modern",
    size: 11pt,
    lang: "en"
  )

  set page(
    margin: (
      top: 1.25cm,
      bottom: 0cm,
      left: 1.5cm,
      right: 1.5cm
    ),
  )

  show link: set text(
    fill: rgb("#0645AD")
  )
  
  // Header parameters, including author and contact information.
  show heading: it => [
    #pad(top: 0pt, bottom: -15pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]

  // Author
  align(center)[
    #block(text(weight: 700, 2.5em, [#smallcaps(author)]))
  ]

  // Contact
  pad(
    top: 0.25em,
    align(center)[
      #smallcaps[#contacts.join("  |  ")]
    ],
  )

  // Location
  if location != "" {
    align(center)[
      #smallcaps[#location]
    ]
  }

  // Main body.
  set par(justify: true)

  body
}

/*
Allows hiding or showing full resume dynamically using global variable. This can
be helpful for creating a single document that can be rendered differently depending on
the desired output, for cases where you'd like to simultaneously render both a full copy
and a single-page instance of only the most important or vital information.
*/
#let hide(should-hide, content) = {
  if not should-hide {
    content
  }
}

/*
Education section formatting, allowing enumeration of degrees and GPA
*/
#let edu(
  institution: "",
  date: "",
  degrees: (),
  gpa: "",
  location: ""
) = {
  pad(
    bottom: 10%,
    grid(
      columns: (auto, 1fr),
      align(left)[
        #strong[#institution]
        #{
          if gpa != "" [
            | #emph[GPA: #gpa]
          ]
        }
        \ #{
          for degree in degrees [
            #strong[#degree.at(0)] | #emph[#degree.at(1)] \
          ]
        }
      ],
      align(right)[
        #emph[#date]
        #{
          if location != "" [
            \ #emph[#location]
          ]
        }
      ]
    )
  )
}

/*
Skills section formatting, responsible for collapsing individual entries into
a single list.
*/
#let skills(areas) = {
  for area in areas {
    strong[#area.at(0): ]
    area.at(1).join(" | ")
    linebreak()
  }
}

/*
Experience section formatting logic.
*/
#let exp(
  role: "",
  project: "",
  date: "",
  location: "",
  summary: "",
  details: [],
) = {
  pad(
    bottom: 15%,
    grid(
      columns: (auto, 1fr),
      align(left)[
        #strong[#role] #{ if project != "" [| #emph[#project]] } 
        #{
          if summary != "" [
            \ #emph[#summary]
          ]
        }
      ],
      align(right)[
        #emph[#date]
        #{
          if location != "" [
            \ #emph[#location]
          ]
        }
      ]
    )
  )
  details
}

#show: resume.with(
  author: "Prabhanjan Padhye",
  location: "Pune, India",
  contacts: (
    [#link("mailto:prabhanjan@fosslife.com")[Email]],
    [#link("https://prabhanjan.dev")[Website]],
    [#link("https://github.com/fosslife")[GitHub]],
    [#link("https://linkedin.com/in/Sparkenstein")[LinkedIn]],
  ),
  // footer: [#align(center)[#emph[References available on request]]]
)

= Summary
A full-stack js/ts dev with 7+ years of experience. part time open-source enthusiast, have a big list of open-source projects with large number of stars and recognition on Hackernews too. Consistent growth over the years, looking for a place to own responsibilities. 


= Skills
#skills((
  ("Languages", (
    [Full-Stack JavaScript],
    [Full-stack Typescript],
    [Rust],
    [Python],
  )),
  ("Software", (
    [Vim, VS Code],
    [Git],
    [Linux, Mac, Windows],
    [Figma],
  )),
  ("Frameworks", (
    [React, Solid, NextJS],
    [Axum, Tokio, etc],
    [Fastapi, Flask, Telethon]
  )),
  ("Tools", (
    [AWS, GCP],
    [Docker, Podman],
    [Postgres, MongoDB, Dgraph],
  ))
))


= Experience
#exp(
  role: "Front-end Developer",
  project: "Identity and Access Government",
  date: "Sept 2016 - Oct 2018",
  location: "Pune, India",
  summary: "Junior developer working on dedicated suite of software",
  details: [
    - Owning entire suite of products for a complete lifecycle from scratch
    - Rewrote the entire thing from AngularJS v1 to React in a matter of 3 months
  ]
)

#exp(
  role: "Full-Stack Developer",
  project: "Growerhub, Syngenta",
  date: "Oct 2018 - Mar 2020",
  location: "Pune, India",
  summary: "Syngenta is world leading agro-tech company, worked as pioneer of the tech team",
  details: [
    - Was part of the founding tech team, owned all responsibilities from hiring to finishing projects
    - Worked on 2 different projects, both full stack, completely owning isolated modules
  ]
)

#exp(
  role: "Senior Software Developer",
  project: "MasaiSchool",
  date: "Mar 2020 - Nov 2022",
  location: "Bangalore, India",
  summary: "Part of the founding team, worked on ed-tech",
  details: [
    - Worked on 3 different education related projects
    - Including on-boarding portal, the dashboard, the learning management 
    - Worked as a curriculum designer for students, mentoring and tutoring
  ]
)

#exp(
  role: "Senior Software Developer",
  project: "Bigspring",
  date: "Nov 2022 - present",
  summary: "Everboarding sales at the speed of innovation",
  location: "USA",
  details: [
    - One of my biggest projects, more than 300k LOC
    - Handling FE, BE and CI. 
    - On-boarded multiple big clients from google to pfizer from all over the place. 
  ]
)




= Projects
#show: columns.with(2)

#exp(
  role: link("https://github.com/fosslife/devtools-x")[DevTools-X],
  project: "",
  details: [
    - Cross-platform collection of tools
    - Written in React and Rust
    - Has Compressors to Hashers to Generators
    - Listed on front-page in HN at \#1
  ]
)


#exp(
  role: link("https://github.com/fosslife/truthy")[Truthy],
  project: "",
  details: [
    - MFA/2FA manager with beautiful UI
    - Written in Rust
    - Win, Mac, Lin, Android and IOS support
  ]
)


#exp(
  role: link("https://github.com/fosslife/awesome-ricing")[Awesome-Ricing],
  project: "",
  details: [
    - Awesome-list of linux specific ricing
  ]
)


#exp(
  role: link("https://github.com/fosslife/grambot")[Grambot],
  project: "",
  details: [
    - Automation bot written 5 years ago, before the age of AI
    - Can scrape, find answers, auto reply, and what not.

  ]
)

#exp(
  role: link("https://github.com/fosslife/define")[Define],
  project: "",
  details: [
    - CLI tool for explaining a term on terminal, cross-platform

  ]
)

#exp(
  role: link("https://github.com/fosslife/delta")[Delta],
  project: "",
  details: [
    - A modern file uploader + URL shortner 

  ]
)







/*

#exp(
  role: link("")[The Delorean],
  project: "",
  summary: "",
  details: [
    - 
  ]
)

*/




/*

===============================
===== ADDITIONAL SECTIONS =====
===============================

In general, the only hard-advised sections of a resume that I've seen consistently recommended are the Education (or equivalent) and Experience sections. The other sections are largely up to you. However, here are some recommendations based on other sections I've seen people use to great effect, or use on my own resume:

- Projects, especially if you're in the tech industry where personal projects are encouraged or expected
- Volunteering
- Charity
- Leadership
- Awards (which, depending on your preferences, could reasonably use a different entry format)

A flavor of section that I see a lot - and would NOT recommend - is something along the lines of "Hobbies" or "Interests". This is occasionally recommended to give "flavor" to your resume or "humanize" you in some way. 

(I understand that putting quotes around "flavor" and "humanize" make me sound like a boring robot of a person, but bear with me, here.)

> If you're tempted to make (or are transferring over from an old resume that has) a Hobbies (or Hobbies-adjacent) section, I would advise you structure your hobbies as Projects and use a Projects section instead.

Many hobbies (sports, programming, gaming, knitting(?), graphic design/drawing, writing, woodworking, baking, etc) can be safely structured in the same way Projects would be, and allow you to highlight interesting things about yourself in a way that follows the same design pattern as the rest of your experiences.

=== Opinion: Making Additional Sections Work ===

If you're making a resume for the first time or are early in your career, you may feel yourself straining to fill vertical space. If that's the case - or if you're just looking to liven up your resume a bit - I'd recommend doing a "throw it all in the kitchen sink" approach.

With this approach, create new entries for anything that you could possibly conceive of as being interesting, taught you skills, or could be an even half-viable answer to somebody asking you "So, what have you done with your life?" A lot of things that don't feel like they'd fit into the hand-shakey, back-pat-y world of business, industry, and academia can be spun into things that feel like they belong on a resume.

Some examples of experiences people have put that have been used to great effect, and some general examples of how I've seen them stated, are:

- Sports Leagues/Fitness (intramural, professional, etc)
  - Constructing routines
  - Designing training plans
  - Cooperation/collaboration
- Gaming (competitively, recreationally, collaboratively (e.g. D&D))
  - Competitively (cooperation/team-building/recruiting)
  - Speedrunning (attention to detail, QA, methodology)
  - Creating games as a learning experience
  - Playing/leading D&D as a design experience (homebrewed content, especially), coordinating people, etc.
- Woodworking/Construction
- Planning projects
- Creating designs
- Solving problems
- Making brownies
  - This isn't even a bit. The guy's name is Dylan, and his brownies kicked so much ass that they got these-brownies-kicked-ass-type awards. He had it on his CV and got into MIT — probably not *solely* off the brownies, but I'd take an even-money bet that it helped.

In general, whatever you throw in the kitchen sink, the key is describing it with the same structure and detail as your experience, trying to fit it into the XYZ bullet structure as well as possible. Even if your experience is really weird, the way you describe it can be the difference between "Why did they even bother mentioning that?" and "Oh, that is pretty impressive!"

I would also recommend having the same approach with these entries as you'd take for your Skills section, where you pretty judicially add and remove (comment out!) things from this section for the jobs you're applying for, based on what might fight best with the general "vibe" of the applications you're doing. While your job experience is a pretty binary "Describe the last X jobs you've had over the last Y years", this section is very fluid by comparison.

In this section especially, I'd recommend following the guidance for hyperlinking mentioned in the Experience section above.

*/