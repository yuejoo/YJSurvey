# YJSurvey

## Do
* Multiple answers question (Checked boxes)
* Singel answers question (Selection)
* Open-ended questions (Textfield)
* Drop-down lists. (X)
* Rating scales. (Slider)
* Likert scales. (TODO)
* Matrix questions (TODO)

## Models

```
interface Question {
    int id
    String context
}

interface Answer {
    String context
    View nextQuestion
}

class MultipleAnswerQuestion extends Question {
    [Answer] potentialAnswers
    View getView()
}

class SingleAnswerQuestion extends Question {
    [Answer] potentialAnswers
    View getView()
}

class TextFieldAnswerQuestion extends Question {
    Answer answer
    View getView()
}

class RatingScalAnswerQuestion extends Question {
    Answer answer
    View getView()
}

class Record {
    void record(QuestionId, SelectedAnswer)
}

```
