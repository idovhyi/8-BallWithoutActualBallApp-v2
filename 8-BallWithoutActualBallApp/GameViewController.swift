//
//  GameViewController.swift
//  8-BallWithoutActualBallApp
//
//  Created by Ihor Dovhyi on 25.01.2022.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var ballView: UIView!
    @IBOutlet var replayLabel: UILabel!
    
    var standartReply: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ballView.layer.cornerRadius = CGFloat(ballView.frame.height / 2)
        getJson()
    }
    
    private func getJson(){
        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/question") else {
            self.replayLabel.text = standartReply
            return}
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                self.replayLabel.text = self.standartReply
                return
            }
            let replyFromServer: Welcome = try! JSONDecoder().decode(Welcome.self, from: data)
            DispatchQueue.main.async {
                self.replayLabel.text = replyFromServer.magic.answer
            }
        }.resume()
    }

    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            getJson()
        }
    }
    


    // MARK: - Navigation
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }
     
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }


}
