//
//  ViewController.swift
//  NewlyCoinedWords
//
//  Created by LOUIE MAC on 2023/07/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var recommended: UILabel!
    @IBOutlet var recommendedWords: [UILabel]!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    let wordDict:Dictionary<String, String> = [
        "중꺾마" : "중요한건 꺾이지 않는 마음",
        "꾸안꾸" : "꾸민듯 안꾸민듯",
        "억텐" : "억지 텐션",
        "어쩔티비" : "어떠한 말의 반응으로 \"어쩌라고 가서 TV나 봐라\" 라는 뜻",
        "킹받다" : "화가난다는 뜻의 열받는다를 영어 King 을 합성한 말",
        "세젤귀" : "세상에서 제일 귀엽다",
        "병먹금" : "병X에게 먹이 금지",
        "ㅇㅈ" : "인정 이라는 뜻으로 초성만 빠르게 사용한 것",
        "국평오" : "대한민국 국민 평균은 5등급의 줄임말로 무식하다는 뜻",
        "특공대" : "특별히 공부도 못하는 대가리",
        "핑프" : "Finger Princess 의 약자로 검색해보지도 않고 무턱대고 물어보는 사람을 낮춰 부르는 말"
    ]
    
    var mixedArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeRandomRecommendation()
    }

    func setupUI() {
        view.backgroundColor = .black
        mainView.backgroundColor = .black
        mainTitle.text = "이게 무슨말이야!"
        mainTitle.font = UIFont.boldSystemFont(ofSize: 35)
        mainTitle.textColor = .white
        searchTextField.backgroundColor = UIColor.systemPink
        searchTextField.font = .systemFont(ofSize: 18)
        recommended.text = "추천 검색어"
        recommended.textColor = .white
        for label in recommendedWords {
            //이 제스처 등록을 루프 밖으로 빼면 모든 레이블에 같은 제스처가 등록되므로 마지막것만 살고 앞에꺼는 증발함..
            //그래서 for문 안에 넣어야됨.
            let recommendedWhenTapped = UITapGestureRecognizer(target: self, action: #selector(randomRecommendedWords(_ :)))
            label.textColor = .white
            label.font = .systemFont(ofSize: 18)
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.systemPink.cgColor
            label.layer.cornerRadius = 22
            label.clipsToBounds = true
            label.numberOfLines = 1
            label.addGestureRecognizer(recommendedWhenTapped)
            label.isUserInteractionEnabled = true
        }
        resultLabel.textColor = .systemPink
        resultLabel.font = .systemFont(ofSize: 18)
        resultLabel.layer.borderWidth = 1
        resultLabel.layer.borderColor = UIColor.systemPink.cgColor
        resultLabel.layer.cornerRadius = 22
        resultLabel.clipsToBounds = true
        resultLabel.numberOfLines = 0
        
//        searchTextField.addTarget(self, action: #selector(searchNewWords), for: .editingChanged)
        
        resultLabel.text = "인간들아 무엇이 알고싶느냐"
        
    }
    
    @objc func randomRecommendedWords(_ sender: UITapGestureRecognizer) {
        if let label = sender.view as? UILabel {
            searchTextField.text = label.text
            searchTextField.becomeFirstResponder()
        }
    }
    
    func makeRandomRecommendation() {
        let mixWordDict = wordDict.keys
        mixedArray.append(contentsOf: mixWordDict)
        for i in 0...recommendedWords.count-1 {
            recommendedWords[i].text = mixedArray[i]
        }
    }
    
    @IBAction func searchNewWordes(_ sender: UITextField) {
        if let inputText = searchTextField.text {
            if let result = wordDict[inputText] {
                resultLabel.text = result
            } else {
                resultLabel.text = "검색어를 입력해주세요!"
            }
        }
        print("test")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

