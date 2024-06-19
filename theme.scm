(define-module (theme)
  #:use-module (haunt utils)
  #:use-module (haunt artifact)
  #:use-module (haunt builder blog)
  #:use-module (haunt html)
  #:use-module (haunt post)
  #:use-module (haunt site)
  #:export (duck-theme))

(define (link name uri)
  `(a (@ (href ,uri)) ,name))

(define duck-theme
  (theme #:name "duck"
	 #:layout
	 (lambda (site title body)
	   `((doctype "html")
	     (head
	      (meta (@ (charset "utf-8")))
	      (title ,(string-append title " - " (site-title site)))
	      (body
	       (div
		(div
		 (ul (li ,(link "Duck" "/index.html"))
		     (li ,(link "About" "/about.html"))
		     (li ,(link "Blog" "/blog.html"))))
		,body)))))))
