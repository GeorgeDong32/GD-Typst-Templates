#import "../functions/style.typ": *
#import "../functions/booktab.typ": *
#import "../functions/dirac.typ": *

#let fonts = (
  text: ("Times New Roman", "SimSun"),
  sans: ("Times New Roman", "SimSun"),
  code: ("Cascadia Code", "Consolas", "SimSun"),
)

#let textbf(it) = block(
  text(
    font: fonts.sans,
    weight: "bold",
    it
  )
)

#let textit(it) = block(text(style: "italic", it))
#let FS1 = 26pt
#let FS2 = 21pt
#let FS3 = 15.75pt
#let FS4 = 14pt
#let FS4S = 12pt
#let CoverB = 0.6em

#let report(
    name: "Test",
    stdid: "11223344",
    coursename: "Typst实验",
    expname: "实验一 Typst入门",
    body
) = {
    set page(paper: "a4", margin: (top: 2.54cm, bottom: 2.54cm, left: 3.18cm, right: 3.18cm),
    header: [
      #set text(10pt)
      #coursename#h(2em)#expname#h(1fr)#name#h(2em)#stdid
      ])
    set text(font: fonts.text, lang: "zh", size: FS4S)

    show raw.where(block: true): block.with(
        fill: rgb(248, 248, 248),
        inset: (x: 1.25em, y: 1em),
        width: 100%,
        radius: 4pt,
    )

    show raw.where(block: true): par.with(
        first-line-indent: 0em,
        justify: true,
        leading: 8pt,
    )

    show raw.where(block: false): box.with(
        fill: rgb(248, 248, 248),
        inset: (x: 5pt, y: 0pt),
        outset: (y: 4pt),
        radius: 3pt
    )

    show raw: text.with(
        font: fonts.code,
        size: 1em,
    )

    show heading: it => [
        // Cancel indentation for headings of level 2 or above
        #set par(first-line-indent: 0em)

        #let sized_heading(it, size, weight, mt, mb, ) = [
            #set text(size, weight: weight)
            #v(mt)
            #if it.numbering != none {
                counter(heading).display()
                h(0.1em)
            }
            #text(size, weight: weight, it.body)
            #v(mb)
        ]
        #if it.level == 1 { 
            [
                #set text(16pt, weight: "regular")
                #v(0.3em)
                #counter(heading).step(level: 1)
                #counter(heading).display("一、")
                #it.body
                #v(0em)
            ]
        } else if it.level == 2 {
            [
                #set text(14pt, weight: "regular")
                #v(0.3em)
                #counter(heading).step(level: 2)
                #counter(heading).display("1.1")
                #h(0.2em)
                #it.body
                #v(0em)
            ]
        } else if it.level == 3 {
            [
                #set text(12pt, weight: "regular")
                #v(0.3em)
                #counter(heading).step(level: 3)
                #counter(heading).display("1.1")
                #h(0.2em)
                #it.body
                #v(0em)
            ]
        } else {
            [
                #set text(12pt, weight: "regular")
                #v(0.3em)
                #counter(heading).step(level: 4)
                #counter(heading).display("1.1")
                #h(0.2em)
                #it.body
                #v(0em)
            ]
        }
    ]
    show link: underline

    let fieldname(name) = [
        #set align(right + horizon)
        #set text(font: fonts.text)
        #name
    ]

    let fieldvalue(value) = [
        #set align(left + horizon)
        #set text(font: fonts.text)
        #value
    ]
    counter(heading).update(4)
    body
}

#let title(content: "") = align(center)[
    #v(0.8em)
    #set text(FS3)
    #content
    #v(1.35em)
]