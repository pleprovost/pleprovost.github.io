(use-modules (haunt site)
	     (haunt reader)
	     (haunt page)
	     (haunt utils)
	     (haunt html)
	     (haunt builder flat-pages)
	     (haunt builder blog)
	     (haunt post)
	     (theme))

(define (index-content site posts)
  `((h1 "Hi,  I'm a duck!")
    (p "This spirited duck is contented with this rustic site.")))

(define (index-page site posts)
  (make-page "index.html"
	     (index-content site posts)
	     sxml->html))

 

(site #:title "A Site."
      #:default-metadata
      '((author . "A Duck"))
      #:readers (list sxml-reader)
      #:builders (list (blog
			#:collections `(("Latest" "blog.html" ,posts/reverse-chronological))
			#:theme duck-theme)
		       (flat-pages "pages"
				   #:template (theme-layout duck-theme)))
      #:make-slug post-slug-v2)
