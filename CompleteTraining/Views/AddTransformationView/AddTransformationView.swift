//
//  AddTransformationView.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import Foundation
import UIKit

class AddTransformationView : UIView {
    
    
    
    @IBOutlet weak var transformationLabel: UILabel!
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewInit()
    }
    func viewInit() {
   
        let xibFile = Bundle.main.loadNibNamed("AddTransformationView", owner: self, options: nil)![0] as! UIView
        addSubview(xibFile)
        xibFile.frame = self.bounds
        
    }
    func loadViewFromNib(nibName: String) -> UIView {
        
        let bundle = Bundle(for: type(of: self))
                let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
                let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
                view.frame = bounds
                view.autoresizingMask = [
                    UIView.AutoresizingMask.flexibleWidth,
                    UIView.AutoresizingMask.flexibleHeight
                ]
                addSubview(view)
        return view
                
    }
}

