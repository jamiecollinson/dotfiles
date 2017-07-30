;;; lipsum --- functions for generating lorem ipsum text
;;; commentary:

;;; Code:

(defconst lorem-ipsum-sentences
  '("Lorem ipsum dolor sit amet, consectetuer adipiscing elit."
    "Donec hendrerit tempor tellus."
    "Donec pretium posuere tellus."
    "Proin quam nisl, tincidunt et, mattis eget, convallis nec, purus."
    "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    "Nulla posuere."
    "Donec vitae dolor."
    "Nullam tristique diam non turpis."
    "Cras placerat accumsan nulla."
    "Nullam rutrum."
    "Nam vestibulum accumsan nisl."
    "Pellentesque dapibus suscipit ligula."
    "Donec posuere augue in quam."
    "Etiam vel tortor sodales tellus ultricies commodo."
    "Suspendisse potenti."
    "Aenean in sem ac leo mollis blandit."
    "Donec neque quam, dignissim in, mollis nec, sagittis eu, wisi."
    "Phasellus lacus."
    "Etiam laoreet quam sed arcu."
    "Phasellus at dui in ligula mollis ultricies."
    "Integer placerat tristique nisl."
    "Praesent augue."
    "Fusce commodo."
    "Vestibulum convallis, lorem a tempus semper, dui dui euismod elit, vitae placerat urna tortor vitae lacus."
    "Nullam libero mauris, consequat quis, varius et, dictum id, arcu."
    "Mauris mollis tincidunt felis."
    "Aliquam feugiat tellus ut neque."
    "Nulla facilisis, risus a rhoncus fermentum, tellus tellus lacinia purus, et dictum nunc justo sit amet elit."
    "Aliquam erat volutpat."
    "Nunc eleifend leo vitae magna."
    "In id erat non orci commodo lobortis."
    "Proin neque massa, cursus ut, gravida ut, lobortis eget, lacus."
    "Sed diam."
    "Praesent fermentum tempor tellus."
    "Nullam tempus."
    "Mauris ac felis vel velit tristique imperdiet."
    "Donec at pede."
    "Etiam vel neque nec dui dignissim bibendum."
    "Vivamus id enim."
    "Phasellus neque orci, porta a, aliquet quis, semper a, massa."
    "Phasellus purus."
    "Pellentesque tristique imperdiet tortor."
    "Nam euismod tellus id erat."
    "Nullam eu ante vel est convallis dignissim."
    "Fusce suscipit, wisi nec facilisis facilisis, est dui fermentum leo, quis tempor ligula erat quis odio."
    "Nunc porta vulputate tellus."
    "Nunc rutrum turpis sed pede."
    "Sed bibendum."
    "Aliquam posuere."
    "Nunc aliquet, augue nec adipiscing interdum, lacus tellus malesuada massa, quis varius mi purus non odio."
    "Pellentesque condimentum, magna ut suscipit hendrerit, ipsum augue ornare nulla, non luctus diam neque sit amet urna."
    "Curabitur vulputate vestibulum lorem."
    "Fusce sagittis, libero non molestie mollis, magna orci ultrices dolor, at vulputate neque nulla lacinia eros."
    "Sed id ligula quis est convallis tempor."
    "Curabitur lacinia pulvinar nibh."
    "Nam a sapien."))

(defconst startup-phrases
  '("moleskine"
    "responsive"
    "cortado"
    "food-truck"
    "agile"
    "pivot"
    "ideate"
    "iterate"
    "actionable insight"
    "prototype"
    "big data"
    "grok"
    "thinker-maker-doer"
    "co-working"
    "pair programming"
    "experiential"
    "parallax"
    "long shadow"
    "human-centered design"
    "bootstrapping"
    "innovate"
    "user centered design"
    "physical computing"
    "SpaceTeam"
    "unicorn"
    "sticky note"
    "waterfall is so 2000 and late"
    "workflow"
    "latte"
    "disrupt"
    "intuitive"
    "driven"
    "viral"
    "minimum viable product"
    "affordances"
    "earned media"
    "integrate"
    "thought leader"
    "360 campaign"
    "hacker"
    "engaging"
    "paradigm"
    "entrepreneur"
    "personas"
    "user story"
    "ship it"
    "Steve Jobs"
    "fund"
    "venture capital"
    "quantitative vs. qualitative"
    "pitch deck"
    "convergence"
    "piverate"))

(defconst latin-phrases
  '("lorem"
    "ipsum"
    "dolor"
    "sit"
    "amet"
    "consectetur"
    "adipisicing"
    "elit"
    "sed"
    "do"
    "eiusmod"
    "tempor"
    "incididunt"
    "ut"
    "labore"
    "et"
    "dolore"
    "magna"
    "aliqua"
    "Ut"
    "enim"
    "ad"
    "minim"
    "veniam"
    "quis"
    "nostrud"
    "exercitation"
    "ullamco"
    "laboris"
    "nisi"
    "ut"
    "aliquip"
    "ex"
    "ea"
    "commodo"
    "consequat"
    "Duis"
    "aute"
    "irure"
    "dolor"
    "in"
    "reprehenderit"
    "in"
    "voluptate"
    "velit"
    "esse"
    "cillum"
    "dolore"
    "eu"
    "fugiat"
    "nulla"
    "pariatur"
    "Excepteur"
    "sint"
    "occaecat"
    "cupidatat"
    "non"
    "proident"
    "sunt"
    "in"
    "culpa"
    "qui"
    "officia"
    "deserunt"
    "mollit"
    "anim"
    "id"
    "est"
    "laboru"))

(defun get-random-word (ls)
  (nth (random (length ls)) ls))

(defun get-sentence-from-phrase (n ls)
  (if (= n 0) '()
    (cons (get-random-word ls)
	  (get-sentence-from-phrase (- n 1) ls))))

(defun startup-sentence ()
  (let '(length (+ 5 (random 10)))
    (sentencify (get-sentence-from-phrase length startup-phrases))))

(startup-sentence)

(defun get-random-sentence ()
  (nth
   (random
    (length lorem-ipsum-sentences))
   lorem-ipsum-sentences))

(defun generate-sentence-list (n)
  (if (= n 0) '()
    (cons (get-random-sentence) (generate-sentence-list (- n 1)))))

(defun generate-paragraph (n)
  (mapconcat 'identity (generate-sentence-list n) " "))

(generate-paragraph 10)

(defun insert-paragraph (n)
  (interactive "n")
  (insert (generate-paragraph n)))

(defun sentencify (ls)
  (concat 
   (mapconcat 'identity
	      (cons (capitalize (car ls)) (cdr ls))
	      " ")
   "."))

(assert (string= (sentencify '("one" "two")) "One two."))
(assert (string= (sentencify '("one two" "three")) "One two three."))
