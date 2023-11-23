//
//     PaiementView.swift
//  projectpmd
//
//  Created by Apple Esprit on 23/11/2023.
//

import SwiftUI
import PassKit

struct PaiementView: View {
    // Sample donations
    let donations = [Donation(name: "fees", price: 3.0), Donation(name: "amount", price: 80.0)]

    var body: some View {
        VStack {
            Text("Donation")
                .font(.title)
                .padding()

            // Use the PaymentButton
            PaymentButton(donations: donations)
                .frame(minWidth: 100, maxWidth: .infinity, maxHeight: 45)
                .padding()

            Spacer()
        }
    }
}

struct PaiementView_Previews: PreviewProvider {
    static var previews: some View {
        PaiementView()
    }
}

struct PaymentButton: UIViewRepresentable {
    var donations: [Donation]

    func makeCoordinator() -> PaymentManager {
        PaymentManager(donations: donations)
    }

    func makeUIView(context: Context) -> some UIView {
        context.coordinator.button
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        context.coordinator.donations = donations
    }
}

class PaymentManager: NSObject, PKPaymentAuthorizationControllerDelegate {
    var donations: [Donation]
    var button = PKPaymentButton(paymentButtonType: .donate, paymentButtonStyle: .automatic)

    init(donations: [Donation]) {
        self.donations = donations
        super.init()
        button.addTarget(self, action: #selector(callBack(_:)), for: .touchUpInside)
    }

    @objc func callBack(_ sender: Any) {
        openURL("https://idmsa.apple.com/IDMSWebAuth/signin?appIdKey=891bd3417a7776362562d2197f89480a8547b108fd934911bcbea0110d07f757&path=%2Faccount%2F&rv=1")
    }

    func startPayment(donations: [Donation]) {
        // Your existing payment handling logic
    }

    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment) async -> PKPaymentAuthorizationResult {
        // Your existing payment authorization logic
        return .init(status: .success, errors: nil)
    }

    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss()
    }

    private func openURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

struct Donation: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
}
