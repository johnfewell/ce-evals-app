# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)

There are many has_many relationships:

Attendees
has_many :course_attendees
has_many :finished_evaluations

Course
has_many :course_attendees
has_many :finished_evaluations

Evaluation
has_many :evaluation_questions
has_many :finished_evaluations

FinishedEvaluation
has_many :answers

Instructor
has_many :courses

Question
has_many :evaluation_questions
has_many :answers


- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)

There are many belongs_to relationships:

Answer
belongs_to :question
belongs_to :attendee

Question
belongs_to :instructor

FinishedEvaluation
belongs_to :attendee, optional: true
belongs_to :evaluation, optional: true
belongs_to :course, optional: true

Evaluation
belongs_to :course, optional: true

Course
belongs_to :instructor

Attendee
belongs_to :user, optional: true


- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)

There are many has_many through relationships.

Question
has_many :evaluations, :through => :evaluation_questions
has_many :attendees, :through => :answers

Attendee
has_many :courses, :through => :course_attendees
has_many :instructors, :through => :courses

Course
has_many :attendees, :through => :course_attendees

Evaluation
has_many :questions, :through => :evaluation_questions

Instructor
has_many :attendees, :through => :courses

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)

Yes. Users submit answers through evaluations.

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

Added to models, yes.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

Yes, scoped views can be seen at:

/courses/current
/courses/upcoming
/courses/finished
/courses/draft
/evaluations/assigned
/evaluations/unassigned

- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)

/attendees/:id/evaluations/:id/answers

writes answers using the custom writer in the FinishedEvaluation model.

- [x] Include signup (how e.g. Devise)

Using Devise

- [x] Include login (how e.g. Devise)

Using Devise

- [x] Include logout (how e.g. Devise)

Using Devise

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

Using Devise/OmniAuth/Facebook

- [x] Include nested resource show or index (URL e.g. users/2/recipes)

/courses/:id/report

Shows the report for a completed course.

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)

Form for completing finished evaluations: /attendees/:id/evaluations/:id/answers

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Yes, all the forms output validation errors.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
