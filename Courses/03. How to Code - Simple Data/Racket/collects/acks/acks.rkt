#lang racket/base

(provide get-general-acks
         get-authors)

(define (get-authors)
  (get-general-acks))

(define (get-general-acks)
  (string-append
   "The following individuals contributed to the implementation"
   " and documentation of Racket: "
   "Jesse Alama, "
   "Claire Alvis, "
   "Leif Andersen, "
   "Yavuz Arkun, "
   "Michael Ballantyne, "
   "Ian Barland, "
   "Eli Barzilay, "
   "Gann Bierner, "
   "Stephen Bloch, "
   "Matthew Butterick, "
   "Filipe Cabecinhas, "
   "Stephen Chang, "
   "Richard Cleis, "
   "John Clements, "
   "Richard Cobbe, "
   "Greg Cooper, "
   "Ryan Culpepper, "
   "Stephen De Gabrielle, "
   "Christos Dimoulas, "
   "Eric Dobson, "
   "Carl Eastlund, "
   "Moy Easwaran, "
   "Will Farr, "
   "Matthias Felleisen, "
   "Dan Feltey, "
   "Burke Fetscher, "
   "Michael Filonenko, "
   "Robby Findler, "
   "Jack Firth, "
   "Kathi Fisler, "
   "Cormac Flanagan, "
   "Matthew Flatt, "
   "Spencer Florence, "
   "Fred Fu, "
   "Tony Garnock-Jones, "
   "Dionna Amalie Glaze, "
   "Sebastian Good, "
   "Paul Graunke, "
   "Kathy Gray, "
   "Ben Greenman, "
   "Dan Grossman, "
   "Arjun Guha, "
   "Dave Gurnell, "
   "Tobias Hammer, "
   "Alex Harsányi, "
   "William Hatch, "
   "Bruce Hauman, "
   "Greg Hendershott, "
   "Dave Herman, "
   "Blake Johnson, "
   "Andrew Kent, "
   "Alexis King, "
   "Casey Klein, "
   "Alex Knauth, "
   "Geoffrey S. Knauth, "
   "Mark Krentel, "
   "Shriram Krishnamurthi, "
   "Mario Latendresse, "
   "Xiangqi Li, "
   "Guillaume Marceau, "
   "Gustavo Massaccesi, "
   "Paulo Matos, "
   "Jacob Matthews, "
   "Jay McCarthy, "
   "Mike T. McHenry, "
   "Philippe Meunier, "
   "Laurent Orseau, "
   "Scott Owens, "
   "Pavel Panchekha, "
   "David T. Pierson, "
   "Bogdan Popa, "
   "Sorawee Porncharoenwase, "
   "Jon Rafkind, "
   "Jamie Raymond, "
   "Grant Rettke, "
   "Paul Schlie, "
   "Dorai Sitaram, "
   "Francisco Solsona, "
   "Sarah Spall, "
   "Mike Sperber, "
   "Vincent St-Amour, "
   "Paul Stansifer, "
   "Paul Steckler, "
   "Stevie Strickland, "
   "James Swaine, "
   "Jens Axel Søgaard, "
   "Asumu Takikawa, "
   "Kevin Tew, "
   "Sam Tobin-Hochstadt, "
   "Neil Toronto, "
   "Milo Turner, "
   "Dale Vaillancourt, "
   "Neil Van Dyke, "
   "David Van Horn, "
   "Anton van Straaten, "
   "Dimitris Vyzovitis, "
   "Stephanie Weirich, "
   "Noel Welsh, "
   "Adam Wick, "
   "Danny Yoo, "
   "Shu-Hung You, "
   "yjqww6, "
   "Jon Zeppieri, "
   "and "
   "ChongKai Zhu."))