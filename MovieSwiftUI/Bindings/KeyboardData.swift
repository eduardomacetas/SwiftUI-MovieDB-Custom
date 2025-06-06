//
//  KeyboardData.swift
//  MovieSwiftUI
//
//  Created by Alfian Losari on 07/06/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import SwiftUI
import Combine
import UIKit

final class KeyboardData: ObservableObject {
    
    @Published var height: CGFloat? = nil
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardData.keyboardShown(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardData.keyboardHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    deinit {
        self.height = 0
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
@objc func keyboardShown(_ sender: Notification) {
    if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height

        // Obtén la primera ventana activa de la escena principal
        let window = UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }

        let bottomPadding = (window?.safeAreaInsets.bottom ?? 0) * 2
        self.height = keyboardHeight - bottomPadding
    }
}
    
    @objc func keyboardHidden(_ sender: Notification) {
        self.height = 0
    }
    
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    
}


