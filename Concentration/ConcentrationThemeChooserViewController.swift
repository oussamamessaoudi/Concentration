//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Oussama Messaoudi on 12/21/19.
//  Copyright © 2019 Oussama Messaoudi. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {

    enum Theme {
        case hallowen;
        case animals;
        case _default;
    }

    static var themes : [Theme : [String]] = [
        .hallowen: ["👹", "💀", "👻", "👽", "🤡", "🥳"],
        .animals : ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊"],
        ._default: ["🤞🏻", "✌🏻", "🤟🏻", "🤘🏻", "👌🏻", "👈🏻" ]
    ]
    override func awakeFromNib() {
        super.awakeFromNib()
        splitViewController?.delegate = self;
    }
    
    
    // MARK: - Navigation
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool
    {
        return true;
    }
    var concentrationViewController : ConcentrationViewController?;
    @IBAction func performSegue(_ sender: UIButton) {
        if let gameController = splitViewController?.viewControllers.last as? ConcentrationViewController {
            changeTheme(sender, gameController)
        }
        else if let gameController = concentrationViewController {
            changeTheme(sender, gameController)
            navigationController?.pushViewController(gameController, animated: true)
        }

        else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Choose Theme"){
            if let button = sender as? UIButton {
                let concentrationViewController = segue.destination as! ConcentrationViewController
                changeTheme(button, concentrationViewController)
                self.concentrationViewController = concentrationViewController;
            }
        }

    }
    fileprivate func changeTheme(_ sender: UIButton, _ gameController: ConcentrationViewController) {
        switch sender.currentTitle {
        case "Halloween":
            gameController.theme = ConcentrationThemeChooserViewController.themes[.hallowen]
        case "Animals":
            gameController.theme = ConcentrationThemeChooserViewController.themes[.animals]
        default:
            gameController.theme = ConcentrationThemeChooserViewController.themes[._default]
            break;
        }
    }

    

}
