//
//  PaiementView.swift
//  projectpmd
//
//  Created by iMac on 15/11/2023.
//

import SwiftUI

import Combine



struct PaiementView: View {

    @State private var cardName = ""

    @State private var cardNumber = ""

    @State private var amount = ""



    var body: some View {

        VStack {

            Image("image") // Remplacez "yourImageName" par le nom de votre image

                .resizable()

                .aspectRatio(contentMode: .fit)

                .frame(height: 40)

                .padding(.bottom, 20)



            VStack(alignment: .leading, spacing: 10) {

                Text("   Nom sur la carte")

                TextField("Entrez le nom sur la carte", text: $cardName)

                    .padding()

                    .textFieldStyle(RoundedBorderTextFieldStyle())

                    .autocapitalization(.words)

                    .disableAutocorrection(true)

                    .onReceive(Just(cardName)) { newName in

                        let filtered = newName.filter { $0.isLetter }

                        if filtered != newName {

                            self.cardName = filtered

                        }

                    }



                Text("   N de carte")

                TextField("Entrez le numéro de carte", text: $cardNumber)

                    .padding()

                    .textFieldStyle(RoundedBorderTextFieldStyle())

                    .keyboardType(.numberPad)

                    .onReceive(Just(cardNumber)) { newNumber in

                        let filtered = newNumber.filter { $0.isNumber }

                        if filtered != newNumber {

                            self.cardNumber = filtered

                        }

                        if cardNumber.count > 16 {

                            cardNumber = String(cardNumber.prefix(16))

                        }

                    }



                Text("   Montant")

                TextField("Entrez le montant", text: $amount)

                    .padding()

                    .textFieldStyle(RoundedBorderTextFieldStyle())

                    .keyboardType(.decimalPad)

                    .onReceive(Just(amount)) { newAmount in

                        let filtered = newAmount.filter { $0.isNumber || $0 == "." }

                        if filtered != newAmount {

                            self.amount = filtered

                        }

                    }

            }



            Button(action: {

                // Ajoutez ici l'action que vous souhaitez effectuer lorsque le bouton est cliqué

                print("Effectuer le paiement avec les informations suivantes :")

                print("Nom sur la carte : \(cardName)")

                print("Numéro de carte : \(cardNumber)")

                print("Montant : \(amount)")

            }) {

                Text("Effectuer le paiement")

                    .padding()

                    .foregroundColor(.white)

                    .background(Color.blue)

                    .cornerRadius(10.0)

            }

            .padding()



            Spacer()

        }

        .padding()

        .navigationBarTitle("Paiement", displayMode: .inline)

    }

}



struct PaiementView_Previews: PreviewProvider {

    static var previews: some View {

        NavigationView {

            PaiementView()

        }

    }

}
