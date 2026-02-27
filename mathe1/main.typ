#import "@local/ufr-sheet-universal:0.1.0": conf
#import "@preview/simple-plot:0.3.0": plot

#show: doc => conf(
  doc,
  subject: [Mathematik I für Studierende \ der Informatik und \ der Ingenieurwissenschaften],
  date: "27.02.2026",
  prof: "Prof. Dr. Peter Pfaffelhuber",
  semester: "WS 2025/2026",
  title: [Klausurabschrift],
  left_header: [\ Autor: \ Lutz Pfannenschmidt ],
  header: ("", [Klausur WS 25/26], ""),
)
#set text(lang: "de")
#set enum(numbering: "(a)")
#show math.equation: set text(size: 12pt, weight: 100)

#line(length: 100%, stroke: 0.25pt)

*Diese Klausur wurde direkt vom Original abgetippt und ist vollständig.*

- Die Bearbeitungszeit der Klausur beträgt 120 Minuten.
- Das einzige zugelassene Hilfsmittel ist ein doppelseitig beschriftetes oder bedrucktes Din A4-Blatt.
- Schreiben Sie mit einem Kugelschreiber, nicht mit einem Bleistift und *nicht* in roter Farbe
- Lösen Sie die Heftung des Klausurbogens nicht.
- Die Klausur ist in ordentlich lesbarer Form zu bearbeiten. Wir behalten uns vor, schwer lesbare Teile der Klausur als ungültig ersatzlos zu streichen.
- Bearbeiten Sie die Aufgaben sorgfältig und kommentieren Sie Ihre Rechen- und Beweisschritte, sofern nicht anders verlangt. Aus der Vorlesung bekannte Inhalte dürfen verwendet werden, Ihre Verwendung muss aber klar gekennzeichnet werden.
- Jede Aufgabe ist auf dem dafür vorgesehenen Blatt zu bearbeiten. Sollten Vorder- und Rückseite des Blattes für die Lösung nicht ausreichen, können sie die Klausuraufsicht um zusätzliche Blätter bitten. Bearbeiten Sie auf jedem zusätzlichen Blatt nur eine Aufgabe und kennzeichnen Sie gut lesbar um welche Aufgabe es sich auf dem jeweiligen Blatt handelt. Versehen Sie jedes zusätzliche Blatt mit Ihrem *Namen* und Ihrer *Matrikelnummer*.
- *Nichteinhaltung der obigen Regeln führt dazu, dass - je nach Schwere - einzelne Aufgabenteile/Extrablätter nicht bewertet werden können. Jeder Täuschungsversuch wird mit der Note "nicht bestanden" (5,0) geahndet. Wiederholte Täuschungsversuche können zur Exmatrikulation führen.*

#v(1cm)
#let b = 1.5cm
#align(center, grid(
  columns: (b, b, b, b, b, b, b),
  rows: (b, b),
  // gutter: 3em,
  inset: 3pt,
  stroke: 1pt,
  ..range(6).map(a => align(center, [#v(23pt) #text(size: 15pt, str(a + 1))])),
  [#v(20pt)$sum$],
  ..(3, 3, 4, 4, 4, 4, 22).map(c => align(right + bottom, "(" + str(c) + ")")),
))

#pagebreak()
= Aufgabe 1 #text(weight: "medium")[(3 Punkte)]

Ordnen Sie die folgenden Abbildungsvorschriften $f: RR-> RR, f(x) =$

$ sin(x^2)/x, quad cos(sin(x)), quad e^(-x^2), quad cos^2(x) + sin^2(x), quad sin(cos(x)), quad ln(e^x) $

ihren Graphen zu, indem Sie die jeweils passende Abbildungsvorschrift neben Ihren Graphen schreiben. Sie müssen Ihre Antwort in dieser Aufgabe nicht begründen (je 0,5 Punkte).

#let s = [#v(2.5cm) #line(length: 40%)]
#table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  },
  align: left,
  columns: (8fr, 7fr),
  [*Funktion*], [*Funktionsgraph*],
  s,

  // cos^2(x) + sin^2(x)
  plot(
    xmin: -4,
    xmax: 4,
    ymin: 0,
    ymax: 2,
    width: 6,
    height: 2,
    (fn: x => calc.pow(calc.cos(x), 2) + calc.pow(calc.sin(x), 2), stroke: blue + 1.5pt),
  ),
  s,
  // ln(e^x)
  plot(
    xmin: -4,
    xmax: 4,
    ymin: -4,
    ymax: 5,
    ytick-step: 2,
    width: 6,
    height: 2,
    (fn: x => calc.ln(calc.pow(calc.e, x))),
    stroke: blue + 1.5pt,
  ),
  s,
  // e^(-x^(2))
  plot(
    xmin: -4,
    xmax: 4,
    ymin: 0,
    ymax: 2,
    width: 6,
    height: 2,
    (fn: x => calc.pow(calc.e, -1 * x * x), stroke: blue + 1.5pt),
  ),
  s,
  // cos(sin(x))
  plot(
    xmin: -4,
    xmax: 4,
    ymin: 0,
    ymax: 2,
    width: 6,
    height: 2,
    (fn: x => calc.cos(calc.sin(x)), stroke: blue + 1.5pt),
  ),
  s,
  // sin(cos(x))
  plot(
    xmin: -4,
    xmax: 4,
    ymin: -1,
    ymax: 1,
    width: 6,
    height: 2,
    (fn: x => calc.sin(calc.cos(x)), stroke: blue + 1.5pt),
  ),
  s,
  // (sin(x^2))/x
  plot(
    xmin: -4,
    xmax: 4,
    ymin: -1,
    ymax: 1,
    width: 6,
    height: 2,
    (fn: x => calc.sin(calc.pow(x, 2)) / x, stroke: blue + 1.5pt),
  ),
)

#pagebreak()
= Aufgabe 2 #text(weight: "medium")[(3 Punkte)]

+ Kreuzen Sie an, ob die folgenden Aussagen richtig oder falsch sind. Sie müssen Ihre Antwort in dieser Aufgabe nicht begründen. Für jede Zeile gilt: Eine richtige Antwort ergibt 0,5 Punkte, keine Antwort ergibt 0 Punkte und eine falsche Antwort ergibt -0,5 Punkte. Die Gesamtpunktzahl für die Aufgabe ist mindestens 0 Punkte.

  #let q = align(center, rect(width: 8pt, height: 8pt))
  #text(size: 10pt)[
    #table(
      inset: 8pt,
      columns: (6fr, 1fr, 1fr),
      [*Aussage*], align(center, [*richtig*]), align(center, [*falsch*]),
      [Jede surjektive Abbildung $f : RR -> RR$ ist injektiv. ], q, q,
      [Die Funktion $f : (—1,1) ->RR, quad x |-> (x^2-1)/(x-1)$ ist beschränkt.], q, q,
      [Es gilt ${n in NN : exists m in NN, quad n^4=m} #sym.subset.eq {n in NN : exists m in NN, quad n=m^2}$. ], q, q,
      [Jede monoton wachsende, gegen $a in RR$ konvergente Folge reeller Zahlen ist durch $a$ nach oben beschränkt. ],
      q,
      q,

      [Für jede Zahl $x in CC$ gibt es ein $z in RR$ mit $z^2=x$ ], q, q,
    )
  ]

+ Skizzieren Sie den Graphen einer surjektive Abbildung $f: RR -> RR$, die nicht überall stetig ist (0,5 Punkte).

#pagebreak()
= Aufgabe 3 #text(weight: "medium")[(4 Punkte)]

Beweisen Sie durch vollständige Induktion, dass für alle $n in NN$ die natürliche Zahl $7^n-2^n$ durch $5$ teilbar ist.


#pagebreak()
= Aufgabe 4 #text(weight: "medium")[(4 Punkte)]

Entscheiden Sie, ob die folgenden Reihen konvergieren und beweisen Sie Ihre Antwort:

(1) $sum_(n=1)^(infinity) (sin(1/n))/n$

(2) $sum_(n=1)^(infinity) (5/6 + 1/n)^n$

#pagebreak()
= Aufgabe 5 #text(weight: "medium")[(4 Punkte)]

Die Funktion $f: RR -> RR$  sei definiert durch die Vorschrift:

$
  f(x) := cases(
    2-x^2 "," & x<=1,
    e^(-x^2+4x-3) "," & x>1,
  )
$

Beweisen Sie, dass der maximale Funktionswert von $f$ genau $e$ beträgt. Was ist der minimale Funktionswert?


#pagebreak()
= Aufgabe 6 #text(weight: "medium")[(4 Punkte)]

berechnen sie die folgenden Integrale:

#v(12pt)

(1) $integral_0^(pi/2) (sin(x))^2 cos (x) d x$

#v(12pt)

(2) #text(size: 16pt)[$integral_(-1)^(2) (11-t)/((t-4)(t+3)) d t$]
