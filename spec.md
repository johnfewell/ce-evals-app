# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)

There are many has_many relationships.

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)

There are many belongs_to relationships.

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)

There are many has_many through relationships.

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)

Yes. Users submit answers through evaluations.

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

Added to models, yes.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

Yes, scoped courses can be seen at /courses/finished.

- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)

- [x] Include signup (how e.g. Devise)

Using Devise

- [x] Include login (how e.g. Devise)

Using Devise

- [x] Include logout (how e.g. Devise)

Using Devise

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

Using Devise/OmniAuth/Facebook

- [ ] Include nested resource show or index (URL e.g. users/2/recipes)

!!!! work on this:

/attendees/1/finished_evaluations

Only the attendee's finished evaluations

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)

Not a new but a custom form use for completing evaluations: /attendees/:id/evaluations/:id/answers

- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

!!!! I need to work on this more

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
