
# Notes


## define what I want all of the routes to do

/
- Logged out greeting
- Logged in, Admin only. Some kind of dashboard

/courses
- Admin can see all of the courses
- Instructors can see their courses
- Attendees can see their courses

/courses/new
- Admin
- Instructor
- Attendees no access

/courses/:id
- Admin can U&D course. Displays all course info
- Instructor can update. Displays all course info
- Attendees can only see their courses, otherwise redirect to courses_url. Does not display attendees

/courses/:id/edit
- Admin & Instructor
- link_to evaluation edit page

/courses/:id/evaluations
- Instructor can see the aggregate eval data for their course

/courses/:id/evaluations/edit
- Admin & Instructor can edit the evaluation for a particular course

/courses/:id/evaluations/new
- Admin & Instructor can create the evaluation for a particular course

/courses/:id/evaluations/show
- Admin & instructor can view the version of the evaluation

/courses/:id/evaluations/:id
- I don't think this route should exist

/attendees
- Admin only, all attendees, grouped somehow

/attendees/new

/attendees/:id/edit

/attendees/1/courses/edit

/attendees/csv
- Instructor and admin only.
- A special route for CSV upload of attendee data

/attendees/link
- A special route for linking signed up user to attendees. Admin only

/attendees/:id
- Admin can see all, instructors can see theirs, attendees can only see themselves
- The attendee dashboard. Shows what evaluations they need to complete, what conferences they have attended in the past

/instructors
- Admin only. Shows all instructors

/instructors/:id
- Admin & instructor can only see their own.
- The instructor dashboard, shows them their upcoming conferences and ones in the past.
- Shows which conferences still need evaluations set up.

/evaluations
- Admin only
- Shows evaluations for all courses?

/evaluations/:id
- I'm not sure I need this route because it makes more sense to nest it.

/certificates
- Admin only, not sure what this would do

/certificates/:id
- I'm not sure I need this route because it makes more sense to nest it.

/attendees/:id/certificates
- Admin and attendee only.
- Shows all of that attendees' certificates for events

/attendees/:id/certificates/:id
- Admin and attendee only.
- Shows a specific certificate


#TODO:

- [] Make rating scale questions for evaluations
- [] Make it so that you can't reassign evaluations once there are associated finished_evaluations
- [] Make a report for classes so that instructors can see data for their class in a view, eg courses/2/report
- [] Finish the CanCanCan auth stuff
- [] Eliminate unneeded routes
- [] Add some page for new users who aren't assigned yet
- [] make an assignment page for admin
- [] DRY it
- [] Partial it
- [] Style
