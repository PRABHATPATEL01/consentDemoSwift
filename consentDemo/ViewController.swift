//
//  ViewController.swift
//  consentDemo
//
//  Created by Naveen Singh on 25/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var privacySettingsButton: UIBarButtonItem!

    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      privacySettingsButton.isEnabled =
        GoogleMobileAdsConsentManager.shared.isPrivacyOptionsRequired
    }

    @IBAction func privacySettingsTapped(_ sender: UIBarButtonItem) {
      GoogleMobileAdsConsentManager.shared.presentPrivacyOptionsForm(from: self) {
        [weak self] (formError) in
        guard let self, let formError else { return }

        let alertController = UIAlertController(
          title: formError.localizedDescription, message: "Please try again later.",
          preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alertController, animated: true)
      }
    }
}

