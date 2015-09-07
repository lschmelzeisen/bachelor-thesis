allgemein:
* du sagst ab und an 'x many times', ich wuerde da nur 'x times' schreiben
* noch einige todos drin, die habe ich nicht weiter beachtet sobald ich geschnallt habe, dass grau = TODO
* mein englisch ist nicht sehr gut und ich habe daher nicht peinlich genau auf die rechtschreibung geachtet - dennoch habe ich aufgelistet was mir ins auge sprang
* achte evtl noch auf die kommata, sind in der ersten haelfte (bis p26) recht wenige und danach deutlich mehr

# Abstract
* stark
* Erwartungshaltung: bisher lineares Wachstum des Problems, wie sieht es beim neuen aus? (Ergebnis als Teil des Abstract)
* deutscher abstract fehlt

# TOC
* Seitennummern rechtsbuending waere besser lesbar

# Introduction
* argmax formalization
wenn ich es richtig verstehe, willst du in 1.2c argmax an der stelle i
fuer mich sieht es aber aus, als ob du 1.2b verwendest, was ein henne-ei problem waere(?) und den argmax bis zur stelle i liefert
schau dir das einfach nochmal an, sicher habe ich nur einen denkfehler

* 'naive' hat zwei i punkte, wtf :D (nein, kein dreck auf dem bildschirm)
* 'Markov assumption [...] w sub(l) only depends on the n−1 previous words w sup(l−1) sub(l−n+1)': bei n = 1 betrachtet man w sup(l-1) sub(l-1+1), ergo w sup(l-1) sub(l). das geht doch gar nicht? muss n > 1?
## thesis overview
* 'In chapter 3 will describe': kaputter satzbau (+'we' / -'in')
* threshold algorithm kursiv, no random access nicht

# Review
## GLM
* [p7] 'Thus, interpolation with lower order models correspond to leaving out the first word [...]. Lower order models are computed differently...'
aus dem kontext heraus soll das erste 'lower order models' ws 'higher order models' sein?
## Discounting
* [p8] 'With the the discounting values'
* [p9] 'and where n_i denotes the total number of of n-grams'

# Sums
* [p11] 'performing faster then the direct recursive implementations': than
## MKN example
* (3.4) 'N d 1+ ( • w3 w3 )': w2 w3 ?
* (3.4) wieso wird aus p_mkn p_glm?
* Algorithm 3.1: 'for i from 2 to N do: [...] γ( h^ s+i−2 )' da i bis N laeuft hast du doch iwann 'h^ s+N-2' wobei s+N-2 > s. mir ist gerade nicht klar, ob h so viele elemente hat. sieh es als nachfrage an :D
## monotony
'it remains to prove that the discount values are non-negative.' ... 'As a result [...] none of the discount values can be non-negative. [...] indeed monotone.': non-negative or not non-negative?

#fast prefix
## threshold
* [p30] '2. [...] is a encountered with a new word' -> 'is encountered with a new word'

# Evaluation
## Setup
* '... only the written part [...] was used, because next word prediction has no application to speaking' -> ich denke dieser satz ist inhaltlich nicht korrekt und koennte unnoetig diskussionszuendstoff liefern
* 'For this thesis I
implemented next word prediction using all optimizations described in Chapters 3 and 4 as well as all experiments from this chapter.': contribution sollte bereits in die introduction (bei den remainder)
## NWP
* [p46] 'As the slope of the observed line is lesser than one' -> 'less'
* [p47] 'This can easily be explained by the fact, that it calculate' -> 'calculates'
* ich finde die anordnung nicht sehr gelungen. an einer stelle macht du aussagen ueber saemtliche grafiken und auf der naechsten seite folgt eine grafik der anderen. besser waere, wenn die aussagen auch bei der entsprechenden grafik stuenden und man 'mitlesen' kann, statt staendig zu scrollen

fazit:
sehr gelungen, eindrucksvolle evaluation - hab ich ja auch schon in der praesi gesehen, nur die anordnung der evaluationsgrafiken aergert

