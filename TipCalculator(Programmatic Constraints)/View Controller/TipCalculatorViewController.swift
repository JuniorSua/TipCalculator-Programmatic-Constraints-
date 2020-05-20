//
//  TipCalculatorViewController.swift
//  TipCalculator(Programmatic Constraints)
//
//  Created by Junior Suarez-Leyva on 5/19/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    override func loadView() {
        super.loadView()
        addAllSubviews()
        billAmountBuiltStackView()
        tipPercentageBuiltStackView()
        finalBillAmountBuiltStackView()
        resetButtonStackView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .subtleGreen
    }
    
    
    
    // MARK: Helper function
    func addAllSubviews() {
        // For the Bill Amount
        view.addSubview(billAmountLabel)
        view.addSubview(billAmountTextField)
        view.addSubview(billAmountStackView)
        // For Tip Computed Tip Amount
        view.addSubview(tipPercentageLabel)
        view.addSubview(tipPercentSegmentedController)
        view.addSubview(tipPerecentageStackView)
        // Final Bill Amount
        view.addSubview(calclatedTipAmountLabel)
        view.addSubview(calculatedBilltotalAmountLabel)
        view.addSubview(computedTipStackView)
        // Reset Button
        view.addSubview(resetButton)
        view.addSubview(resetStackView)
    }
    
    
    func billAmountBuiltStackView() {
        billAmountStackView.addArrangedSubview(billAmountLabel)
        billAmountStackView.addArrangedSubview(billAmountTextField)
        billAmountStackView.topAnchor.constraint(equalTo: self.safeArea.topAnchor, constant: 40).isActive = true
        billAmountStackView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 12).isActive = true
        billAmountStackView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: -12).isActive = true
    }
    
    func tipPercentageBuiltStackView() {
        tipPerecentageStackView.addArrangedSubview(tipPercentageLabel)
        tipPerecentageStackView.addArrangedSubview(tipPercentSegmentedController)
        tipPerecentageStackView.topAnchor.constraint(equalTo: billAmountStackView.bottomAnchor, constant: 30).isActive = true
        tipPerecentageStackView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 12).isActive = true
        tipPerecentageStackView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: -12).isActive = true
    }
    
    func finalBillAmountBuiltStackView() {
        computedTipStackView.addArrangedSubview(calclatedTipAmountLabel)
        computedTipStackView.addArrangedSubview(calculatedBilltotalAmountLabel)
        computedTipStackView.topAnchor.constraint(equalTo: tipPerecentageStackView.bottomAnchor, constant: 40).isActive = true
        computedTipStackView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 12).isActive = true
        computedTipStackView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: -12).isActive = true
    }
    
    func resetButtonStackView() {
        resetStackView.addArrangedSubview(resetButton)
        resetStackView.topAnchor.constraint(equalTo: computedTipStackView.bottomAnchor, constant: 40).isActive = true
        resetStackView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 12).isActive = true
        resetStackView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: -12).isActive = true
    }
    
    
    // MARK: Views
    var billAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "Bill Amount:"
        label.textAlignment = .natural
        return label
    }()
    
    var billAmountTextField: UITextField = {
        let label = UITextField()
        label.placeholder = "Enter bill amount here..."
        label.borderStyle = UITextField.BorderStyle.roundedRect
        return label
        
    }()
    
    //label.textAlignment = .natural
    //return label
    
    //let sampleTextField = UITextField()
    //sampleTextField
    //sampleTextField.font = UIFont.systemFontOfSize(15)
    //sampleTextField.borderStyle = UITextBorderStyle.RoundedRect
    //sampleTextField.autocorrectionType = UITextAutocorrectionType.No
    //sampleTextField.keyboardType = UIKeyboardType.Default
    //sampleTextField.returnKeyType = UIReturnKeyType.Done
    //sampleTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
    //sampleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
    //sampleTextField.delegate = self
    //self.view.addSubview(sampleTextField)
    
    var tipPercentageLabel: UILabel = {
        let label = UILabel()
        label.text = "How much would you like to Tip?"
        label.textColor = .moneyGreen
        label.textAlignment = .natural
        return label
    }()
    
    let tipPercentSegmentedController: UISegmentedControl = {
        let items = ["15%", "20%", "25%"]
        let segmentedController = UISegmentedControl(items: items)
        segmentedController.selectedSegmentIndex = 2
        return segmentedController
    }()
    
    
    var calclatedTipAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "(Tip Amount:)"
        label.textAlignment = .natural
        return label
    }()
    
    var calculatedBilltotalAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "(Total Amount:)"
        label.textAlignment = .natural
        return label
    }()
    
    @objc func selectButton(sender: UIButton) {
        
    }
    
    var resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 7
        button.layer.borderColor = UIColor.mintGreen.cgColor
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 36)
        button.setTitleColor(.moneyGreen, for: .normal)
        button.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Views
    
    
    let billAmountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let tipPerecentageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let computedTipStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let resetStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
}
