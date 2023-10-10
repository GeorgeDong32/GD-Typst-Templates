#import "../functions/style.typ": *
#import "../functions/booktab.typ": *
#import "../functions/dirac.typ": *

#let homework(
    subject: "课程",
    title: "作业一",
    name: "张三",
    stdid: "11223344",
    time: "2023年10月9日",
    body
) = {
    set document(title: title)
    set page(paper: "a4", numbering: "1", number-align: center, margin: (top: 3cm, bottom: 3cm, left: 2cm, right: 2cm))
    set text(font: fonts.text, lang: "zh", size: 11pt)
    set heading(numbering: "1.1.")

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
        #set par(first-line-indent: 0em, hanging-indent: 2em)

        #let sized_heading(it, size, weight, mt, mb) = [
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
            sized_heading(it, 20pt, "semibold", 0.5em, 0.3em)
        } else if it.level == 2 {
            sized_heading(it, 16pt, "semibold", 0.5em, 0.2em)
        } else if it.level == 3 {
            sized_heading(it, 14pt, "semibold", 0.5em, 0.1em)
        } else {
            sized_heading(it, 12pt, "semibold", 0.5em, 0.1em)
        }
    ]

    show link: underline

    let fieldname(name) = [
        #set align(right + horizon)
        #set text(font: fonts.text)
        #name
    ]

    let cell = rect.with(
        width: 100%,
        radius: 6pt,
        stroke: none
    )

    let fieldvalue(value) = [
        #set align(left + horizon)
        #set text(
            font: fonts.text,
            weight: "medium",
            size: 11pt
        )
        #cell(value)
    ]

    set page(header: align(center)[
        #grid(
            columns: (1.5fr, 1fr, 1fr, 1fr),
            rows: (12pt,0pt),
            gutter: 1em,
            fieldvalue(subject),
            fieldvalue(title),
            fieldvalue(name),
            fieldvalue(stdid)
        )
    ])

    align(center)[
        #block(text(weight: "semibold", 30pt, subject))
        #v(20pt, weak: true)
        #block(text(weight: "medium", 24pt, title))
        #v(20pt, weak: true)
        #set text(13pt)
        #text(time)
    ]

    set align(left + top)
    set par(justify: true, first-line-indent: 0pt, leading: line_height)
    set math.vec(delim: "[")
    set math.mat(delim: "[")

    show par: set block(spacing: line_height)

    body
}
