import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionButton1: UIButton!
    @IBOutlet weak var optionButton2: UIButton!
    @IBOutlet weak var optionButton3: UIButton!
    @IBOutlet weak var optionButton4: UIButton!
    
    var currentQuestionIndex = 0

    let questions: [String] = [
        "What is the smallest planet in our solar system?",
        "Which planet is known as the Red Planet?",
        "Which planet has the most moons?"
    ]
    
    let answers: [[String]] = [
        ["Earth", "Mars", "Mercury", "Venus"],
        ["Jupiter", "Mars", "Saturn", "Venus"],
        ["Earth", "Saturn", "Jupiter", "Neptune"]
    ]
    
    let correctAnswers: [String] = [
        "Mercury",
        "Mars",
        "Saturn" // Example correct answer
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
    }

    // MARK: - Load Question
    func loadQuestion() {
        questionLabel.text = "\(currentQuestionIndex + 1). \(questions[currentQuestionIndex])"
        optionButton1.setTitle(answers[currentQuestionIndex][0], for: .normal)
        optionButton2.setTitle(answers[currentQuestionIndex][1], for: .normal)
        optionButton3.setTitle(answers[currentQuestionIndex][2], for: .normal)
        optionButton4.setTitle(answers[currentQuestionIndex][3], for: .normal)
    }

    @IBAction func answerTapped(_ sender: UIButton) {
        guard let userAnswer = sender.titleLabel?.text else { return }
        
        let correct = correctAnswers[currentQuestionIndex]
        
        let alertTitle = userAnswer == correct ? "Correct!" : "Wrong!"
        let alertMessage = userAnswer == correct ? "Nice job!" : "The correct answer was \(correct)."

        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Next", style: .default, handler: { _ in
            self.nextQuestion()
        }))
        present(alert, animated: true, completion: nil)
    }

    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            loadQuestion()
        } else {
            let alert = UIAlertController(title: "Finished!", message: "You have completed the quiz!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
                self.currentQuestionIndex = 0
                self.loadQuestion()
            }))
            present(alert, animated: true, completion: nil)
        }
    }
}
