function addEventHandler(){
  $(".js-next").on("click", function(event) {
    let nextId = parseInt($(".js-next").attr("data-id"));
    if (isNaN(nextId)){
      $('.flash-messages').html(`
        <div class="flash flash-warn">
          <p id="alert">End of Records</p>
        </div>
        `)
    } else {
      $.get("/evaluations/" + nextId + ".json", function(evaluation){
          $('.flash-messages').empty()
          addEvalToDom(evaluation)
          addEventHandler()
      });
      event.preventDefault()
    }
  })
  $(".js-prev").on("click", function(event) {
    let prevId = parseInt($(".js-prev").attr("data-id"));
    if (isNaN(prevId)){
      $('.flash-messages').html(`
        <div class="flash flash-warn">
          <p id="alert">No Previous Record</p>
        </div>
        `)
    } else {
      $.get("/evaluations/" + prevId + ".json", function(evaluation){                   $('.flash-messages').empty()
        addEvalToDom(evaluation)
        addEventHandler()
      });
    }
    event.preventDefault()
  })
}

 function addEvalToDom(eval) {
    eval.course = eval.course || {}
    eval.next = eval.next || {}
    eval.previous = eval.previous || {}
    let newEval = new Evaluation(eval.id, eval.name, eval.course.title, eval.course.start_date, eval.questions, eval.next.id, eval.previous.id)
     $('#evaluation-main').html(newEval.renderEval())
 }

 function Evaluation(id, name, course, startDate, questions, next, previous){
   this.id = id
   this.name = name
   this.course = course
   this.startDate = startDate
   this.questions = questions
   this.next = next
   this.previous = previous
 }

 Evaluation.prototype.renderEval = function() {
   let questionList = this.questions.reduce((questionString, question) => {
     return questionString + `<li>${question.content}</li>`
   }, "" )
   return `
       <div class="d-inline-block mb-1">
         <h2>
            ${this.name}
         </h2>
       </div>
       <div class="f4 text-gray mt-2">
             <span class="mr-3" itemprop="programmingLanguage">
               Class: ${this.course || "Not assigned"}
             </span>
           Date: ${this.startDate || "Not assigned"}
       </div>
       <div class="mt-3"></div>
       <div>
        <h4>Questions</h4>
        <ul id="questions" class="f6 text-gray mt-2 mx-5">
          ${questionList}
        </ul>
       </div>
       <div class="mt-3">

       </div>
       <a href="#" class="js-prev btn" data-id="${this.previous}">Previous Evaluation</a>
       <a href="#" class="js-next btn" data-id="${this.next}">Next Evaluation</a>
   `}
