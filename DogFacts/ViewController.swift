//
//  ViewController.swift
//  DogFacts
//
//  Created by Konstantin Fomenkov on 09.04.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButtonPressed()
    }

    @IBAction func nextButtonPressed() {
        fetchImage()
        fetchFact()
    }

    private func fetchImage() {
        NetworkManager.shared.fetchImage { data in
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
    }

    private func fetchFact() {
        NetworkManager.shared.fetchFact { data in
            DispatchQueue.main.async {
                self.textLabel.text = data.facts?[0] ?? "no fact found, sorry!"
            }
        }
    }
}

