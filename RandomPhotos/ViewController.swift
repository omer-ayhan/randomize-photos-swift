//
//  ViewController.swift
//  RandomPhotos
//
//  Created by Omer Ayhan on 1.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let imageBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Randomize", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let inputBox: UITextField = {
        let inputBox = UITextField()
        
        return inputBox
    }()
    
    let colors: [UIColor] = [
        .systemCyan,
        .systemRed,
        .systemPink,
        .systemYellow,
        .systemPurple,
        .systemOrange,
        .systemBlue,
        .systemMint
    ]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let navTitle = UILabel(frame: CGRect(x: 0, y: 40, width: 320, height: 40))
        navTitle.center = CGPoint(x: 160, y: 285)
        navTitle.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        navTitle.textAlignment = .center
        navTitle.text = "Randomize Photos"
        self.navigationItem.titleView = navTitle
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(inputBox)
        view.addSubview(imageBtn)
        getRandomPhoto()
        imageBtn.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
       getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageBtn.frame = CGRect(x: 30, y: view.frame.size.height - 150 - view.safeAreaInsets.bottom, width: view.frame.size.width - 60, height: 55)
    }

    func getRandomPhoto(){
        let urlStr = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlStr)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }

}

