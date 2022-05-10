//
//  ViewController.swift
//  Which Was The Day
//
//  Created by Георгий Маркарян on 09.05.2022.
//

import UIKit

class ViewController: UIViewController {

    enum MyError: LocalizedError{
        case notEnoughData

        var errorDescription: String?{
            switch self{
            case .notEnoughData: return "Заполните все данные"

            }
        }
    }

    func validate () throws{
            guard !dayField.text!.isEmpty && !monthField.text!.isEmpty && !yearsField.text!.isEmpty else{
                throw MyError.notEnoughData
            }
    }



    private var backgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.image = UIImage(
            named: "massimiliano-morosinotto-AKW2gWJC9mM-unsplash")
        backgroundView.contentMode = .scaleAspectFill
        return backgroundView
    }()

    var topLabel: UILabel = {
        let topLabel = UILabel()
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Узнай какой был день"
        topLabel.textColor = .white
        topLabel.layer.shadowColor = UIColor.black.cgColor
        topLabel.layer.shadowRadius = 4
        topLabel.layer.shadowOpacity = 0.7
        topLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        topLabel.font = UIFont(name: "Copperplate", size: 25.0)
        return topLabel
    }()

    private let stackViewLabel: UIStackView = {
        let stackViewLabel = UIStackView()
        stackViewLabel.translatesAutoresizingMaskIntoConstraints = false
        stackViewLabel.axis = .vertical
        stackViewLabel.distribution = .equalSpacing
        stackViewLabel.spacing = 10

        return stackViewLabel
    }()

    private let stackViewTextField: UIStackView = {
        let stackViewTextField = UIStackView()
        stackViewTextField.translatesAutoresizingMaskIntoConstraints = false
        stackViewTextField.axis = .vertical
        stackViewTextField.distribution = .fillEqually
        stackViewTextField.spacing = 15

        return stackViewTextField
    }()

    private lazy  var dayField: UITextField = {
        let dayField = UITextField()
        dayField.translatesAutoresizingMaskIntoConstraints = false
        dayField.backgroundColor = .systemGray6
        dayField.textColor = .black
        dayField.textAlignment = .left
        dayField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: dayField.frame.height))
        dayField.leftViewMode = .always
        dayField.layer.cornerRadius = 5
        dayField.font = .systemFont(ofSize: 16)
        dayField.autocapitalizationType = .none
        dayField.delegate = self
        dayField.placeholder = "03"
        dayField.keyboardType = .numberPad
        return dayField
    }()

    private lazy  var monthField: UITextField = {
        let monthField = UITextField()
        monthField.translatesAutoresizingMaskIntoConstraints = false
        monthField.backgroundColor = .systemGray6
        monthField.textColor = .black
        monthField.textAlignment = .left
        monthField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: monthField.frame.height))
        monthField.leftViewMode = .always
        monthField.layer.cornerRadius = 5
        monthField.font = .systemFont(ofSize: 16)
        monthField.autocapitalizationType = .none
        monthField.delegate = self
        monthField.placeholder = "12"
        monthField.keyboardType = .numberPad
        return monthField
    }()

    private lazy  var yearsField: UITextField = {
        let yearsField = UITextField()
        yearsField.translatesAutoresizingMaskIntoConstraints = false
        yearsField.backgroundColor = .systemGray6
        yearsField.textColor = .black
        yearsField.layer.cornerRadius = 5
        yearsField.textAlignment = .left
        yearsField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: yearsField.frame.height))
        yearsField.leftViewMode = .always
        yearsField.font = .systemFont(ofSize: 16)
        yearsField.autocapitalizationType = .none
        yearsField.delegate = self
        yearsField.placeholder = "2022"
        yearsField.keyboardType = .numberPad
        return yearsField
    }()

    private var dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.text = "День"
        dayLabel.textColor = .white
        dayLabel.layer.shadowColor = UIColor.black.cgColor
        dayLabel.layer.shadowRadius = 4
        dayLabel.layer.shadowOpacity = 0.7
        dayLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        dayLabel.font = UIFont(name: "Copperplate", size: 25.0)
        return dayLabel
    }()

    private var monthLabel: UILabel = {
        let monthLabel = UILabel()
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        monthLabel.text = "Месяц"
        monthLabel.textColor = .white
        monthLabel.layer.shadowColor = UIColor.black.cgColor
        monthLabel.layer.shadowRadius = 4
        monthLabel.layer.shadowOpacity = 0.7
        monthLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        monthLabel.font = UIFont(name: "Copperplate", size: 25.0)
        return monthLabel
    }()

    private var yearLabel: UILabel = {
        let yearLabel = UILabel()
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.text = "Год"
        yearLabel.textColor = .white
        yearLabel.layer.shadowColor = UIColor.black.cgColor
        yearLabel.layer.shadowRadius = 4
        yearLabel.layer.shadowOpacity = 0.7
        yearLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        yearLabel.font = UIFont(name: "Copperplate", size: 25.0)
        return yearLabel
    }()

    var tapButton: UIButton = {
        let tapButton = UIButton()
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        tapButton.setTitle("Погнали", for: .normal)
        tapButton.titleLabel?.font = UIFont(name: "Copperplate", size: 35.0)
        tapButton.titleLabel?.layer.shadowColor = UIColor.black.cgColor
        tapButton.titleLabel?.layer.shadowOffset = CGSize(width: 4, height: 4)
        tapButton.titleLabel?.layer.shadowRadius = 4
        tapButton.titleLabel?.layer.shadowOpacity = 0.7
        tapButton.setTitleColor(.white, for: .normal)


        tapButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return tapButton
    }()

    var bottomLabel: UILabel = {
        let bottomLabel = UILabel()
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.text = "Узнай какой был день"
        bottomLabel.textColor = .white
        bottomLabel.layer.shadowColor = UIColor.black.cgColor
        bottomLabel.layer.shadowRadius = 4
        bottomLabel.layer.shadowOpacity = 0.7
        bottomLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        bottomLabel.font = UIFont(name: "Copperplate", size: 30.0)
        bottomLabel.alpha = 0
        return bottomLabel
    }()



    @objc private func tapAction(){
        UIView.animate(withDuration: 0.1,
                       animations: {
            self.tapButton.alpha = 0.5
        }) { (completed) in
            UIView.animate(withDuration: 0.5,
                           animations: {
                self.tapButton.alpha = 1
            })
        }

        do {
            try validate()
            guard let day = dayField.text, let month = monthField.text, let year = yearsField.text else {return}
            print(day)

            let calendar = Calendar.current
            let dateFormatter = DateFormatter()
            var dateComponent = DateComponents()


            dateComponent.day = Int(day)
            dateComponent.month = Int(month)
            dateComponent.year = Int(year)

            dateFormatter.locale = Locale(identifier: "ru_Ru")
            dateFormatter.dateFormat = "EEEE"

            let date = calendar.date(from: dateComponent)
            if let date = date {
                let weekday = dateFormatter.string(from: date)
                bottomLabel.text = weekday.capitalized
            }

            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
                self.bottomLabel.alpha = 1
            }

        } catch {
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
                self.bottomLabel.text = error.localizedDescription
                self.bottomLabel.alpha = 1
                print(error.localizedDescription)
            } completion: { _ in
                UIView.animate(withDuration: 3) {
                    self.bottomLabel.alpha = 0
                }
            }
        }
    }

   @objc func textFieldDidChange(_ textField: UITextField) {
            if textField == dayField {
                if (textField.text!.count) >= 2 {
                    monthField.becomeFirstResponder()
                }
            }
            else if textField == monthField {
                if (textField.text!.count) >= 2 {
                    yearsField.becomeFirstResponder()
                }
            }
       else if textField == yearsField {
           if (textField.text?.count)! >= 4 {
               view.endEditing(true)
           }
       }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        dayField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)

        monthField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        yearsField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }

    private func layout(){
        [dayLabel, monthLabel, yearLabel].forEach {stackViewLabel.addArrangedSubview($0)}
        [dayField, monthField, yearsField].forEach {stackViewTextField.addArrangedSubview($0)}

        [backgroundView, topLabel, stackViewLabel, stackViewTextField, tapButton, bottomLabel].forEach {view.addSubview($0)}

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            stackViewLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 50),
            stackViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackViewLabel.heightAnchor.constraint(equalToConstant: 150),
            stackViewLabel.widthAnchor.constraint(equalToConstant: 100),

            stackViewTextField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 50),
            stackViewTextField.leadingAnchor.constraint(equalTo: stackViewLabel.trailingAnchor, constant: 5),
            stackViewTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackViewTextField.heightAnchor.constraint(equalToConstant: 150),

            tapButton.topAnchor.constraint(equalTo: stackViewLabel.bottomAnchor, constant: 25),
            tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            bottomLabel.topAnchor.constraint(equalTo: tapButton.bottomAnchor, constant: 55),
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate{

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)

    }
}







