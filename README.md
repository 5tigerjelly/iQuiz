# iQuiz
##A Multiple-Choice Q-and-A application

–users can choose from a collection of quizzes

–each quiz has a number (1-to-many) of questions

–each question is a multiple-choice answer

–users progress through each question one at a time

–app will track their answers

–app could upload their scores

–quizzes are updated from a server

##Basic interaction

–we need a TableView for the quizzes

–each element will lead the user to a list of questions

–so we start with the TableView filled with subjects

use Mathematics, Marvel Super Heroes, and Science
for now, use an in-memory array
make sure to build this as a UITableViewSource

##TableView cells

–icon on the left (any image works)

–subject: title (30 characters)

–description: short sentence

ToolBar across the top

–put a button on the Toolbar, title it "Settings"

–"Settings" should (for now) pop a UIAlertController

have it read "Settings go here"/"OK"
