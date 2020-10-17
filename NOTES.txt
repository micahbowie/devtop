My Devtop

User Story:
  -A user can login
  -user can logout
  -user can pick an app from the homepage
  -user can stay logged in while in that app
  -user can search from the homepage
  -user can CRUD notes
  -user can CRUD "thatlab" questions
  -user can answer questions.
  -user can CRUD flash cards
  -user can see blog of the day and fact of the day on homepage
  -user change homepage background (light-theme and dark-theme)

Apps on homepage:
  -flashcard
  -thatlab
  -stackoverflow
  -rubyguides
  -notes
  -stackoverflow
  -learnco
  -github
  -twitter
  -slack
  -codewars

Tables:

User

id | username | password |

Note

id | user_id | title | content |

Flashcard

id | user_id | front | back |

questions

id | user_id | title | question_content |

answers

id | user_id | question_id | answer |



Models:

  User
    has_many notes
    has_many flashcards
    has_many questions
    has_many answers
  questions
    belongs_to user
    has_many answers
  answers
    belongs_to question
    belongs_to user
  flashcards
    belongs_to user

  Functions:

     -fact of the day on homescreen
     -blog post bout dev on homescreen
