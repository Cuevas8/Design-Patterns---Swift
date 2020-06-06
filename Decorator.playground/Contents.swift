import UIKit

protocol ScoreAccessory {
    func string(for score: Int) -> String
}

struct TitleAccessory: ScoreAccessory {
    func string(for score: Int) -> String {
        return "SCORE: "
        
    }
}
struct PointsAccessory: ScoreAccessory {
    func string(for score: Int) -> String {
        if score == 1 {
            return " POINT"
        } else {
            return " POINTS"
        }
        
    }
}

struct ScoreLabel {
    var prefix: ScoreAccessory?
    var suffix: ScoreAccessory?
    var score = 0 {
        didSet {
        printScore()
        }
        
    }
    
    func printScore() {
        let start = prefix?.string(for: score) ?? ""
        let end = suffix?.string(for: score) ?? ""
        print("\(start)\(score)\(end)")
    }
}
var scoreLabel = ScoreLabel()
scoreLabel.prefix = TitleAccessory()
scoreLabel.suffix = PointsAccessory()
scoreLabel.score += 10

