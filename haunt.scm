(use-modules (haunt site)
	     (haunt reader)
	     (haunt page)
	     (haunt utils)
	     (haunt html)
	     (haunt builder flat-pages))

(define (index-content site posts)
  `((h1 "Hi,  I'm a duck!")
    (p "This spirited duck, is happy of his rustic website.")))

(define (index-page site posts)
  (make-page "index.html"
	     (index-content site posts)
	     sxml->html))

(site #:title "A Site."
      #:default-metadata
      '((author . "A Duck"))
      #:readers (list sxml-reader)
      #:builders (list index-page))