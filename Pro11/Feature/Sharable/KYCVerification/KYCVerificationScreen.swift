//
//  KYCScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI

import SwiftUI
import UIKit

struct KYCVerificationScreen: View {
    @State private var name: String = ""
    @State private var dateOfBirth: String = ""
    @State private var panCardNumber: String = ""
    @State private var documentImage: Image? = nil
    @State private var showingImagePicker = false
    @State private var isTermsAccepted = false
    @State private var isDocumentUploaded = false
    @Environment(\.presentationMode) var presentationMode

    

    var body: some View {
            VStack {
                NavigationBarBack(title: "KYC Verification") {
                    presentationMode.wrappedValue.dismiss()
                }
                    

                VStack(spacing: 20) {
                    // Name Field
                    CustomTextField(
                        placeholder: "Enter Name",
                        text: $name,
                        keyboardType: .default
                    )
                    
                    // Date of Birth Field
                    CustomTextField(
                        placeholder: "Enter Date of Birth (DD/MM/YYYY)",
                        text: $dateOfBirth,
                        keyboardType: .numberPad
                    )
                    
                    CustomTextField(
                        placeholder: "Enter PAN Card Number",
                        text: $panCardNumber,
                        keyboardType: .default
                    )
                    
                    HStack {
                        Button(action: {
                            isTermsAccepted.toggle()
                        }) {
                            Image(systemName: isTermsAccepted ? "checkmark.square.fill" : "square")
                                .foregroundColor(isTermsAccepted ? .green : .gray)
                                .font(.system(size: 20))
                        }
                        .buttonStyle(PlainButtonStyle())

                        Text("I accept the Terms and Conditions")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.black)
                    }

                    Button(action: {
                        if name.isEmpty || dateOfBirth.isEmpty || panCardNumber.isEmpty || !isTermsAccepted || documentImage == nil {
                            // Handle error or show alert
                        } else {
                            // Proceed with KYC submission
                        }
                    }) {
                        Text("Submit KYC")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isTermsAccepted ? Color.red : Color.gray)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    .disabled(!isTermsAccepted || documentImage == nil)
                    
                    Spacer()
                }
                .padding()

            }
            .navigationBarBackButtonHidden(true)
    }
}

// Image Picker - UIKit wrapper for image picking
struct ImagePicker: View {
    @Binding var isPresented: Bool
    @Binding var image: Image?

    var body: some View {
        ImagePickerController(isPresented: $isPresented, image: $image)
    }
}

// ImagePickerController is a UIKit wrapper
struct ImagePickerController: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var image: Image?

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var isPresented: Bool
        @Binding var image: Image?

        init(isPresented: Binding<Bool>, image: Binding<Image?>) {
            _isPresented = isPresented
            _image = image
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isPresented = false
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                image = Image(uiImage: selectedImage)
            }
            isPresented = false
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isPresented: $isPresented, image: $image)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = false
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

struct KYCVerificationScreen_Previews: PreviewProvider {
    static var previews: some View {
        KYCVerificationScreen()
    }
}
