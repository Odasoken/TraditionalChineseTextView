//
//  ViewController.swift
//  TraditionalChineseTextViewDemo
//
//  Created by juliano on 2023/1/9.
//

import UIKit
let  fontLibName = "FZXZTFW--GB1-0"
class ViewController: UIViewController {

    @IBOutlet weak var textView: TraditionalChineseTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.text = "大道之行也，天下为公，选贤与能，讲信修睦。故人不独亲其亲，不独子其子，使老有所终，壮有所用，幼有所长，矜、寡、孤、独、废疾者皆有所养，男有分，女有归。货恶其弃于地也，不必藏于己；力恶其不出于身也，不必为己。是故谋闭而不兴，盗窃乱贼而不作，故外户而不闭，是谓大同"
        textView.font = UIFont.init(name: fontLibName, size: CGFloat(45))
        textView.backgroundColor = UIColor.init(red: 224 / 255.0, green: 171 / 255.0, blue: 93 / 255.0, alpha: 1.0)
    }


}

