//
//  ResultPickerView.swift
//  AnimalMath
//
//  Created by Markus Seidler on 30/9/20.
//  Copyright © 2020 Mata. All rights reserved.
//

import SwiftUI

struct ResultPickerView: View {
    var signed: Binding<String>
    var digitOne: Binding<Int>
    var digitTwo: Binding<Int>
    var digitThree: Binding<Int>
    
    var signedArray = ["+", "-"]
    var digitOneArray = [Int](0...9)
    var digitTwoArray = [Int](0...9)
    var digitThreeArray = [Int](0...9)
    var digitFourArray = [Int](0...9)
    
    let hStackSpacing: CGFloat = 1.0

    
    var body: some View {
        
            HStack(spacing: hStackSpacing) {
                customizedPicker(selection: signed, selectionArray: signedArray)
                customizedPicker(selection: digitOne, selectionArray: digitOneArray)
                customizedPicker(selection: digitTwo, selectionArray: digitTwoArray)
                customizedPicker(selection: digitThree, selectionArray: digitThreeArray)
            }
    }

}

struct customizedPicker<Element>: View where Element: Hashable {
    var selection: Binding<Element>
    var selectionArray: Array<Element>
    let pickerWidth: CGFloat = 50.0
    let pickerHeight: CGFloat = 80.0
    
    var body: some View {
        Picker(selection: selection, label: Text("")) {
            ForEach(selectionArray, id:\.self) { item in
                Text("\(item)" as String).tag(item)
            }
        }
        .labelsHidden()
        .frame(width: pickerWidth, height: pickerHeight, alignment: .center)
        .clipped()
    }
}

struct ResultPickerView_Previews: PreviewProvider {
    
    static var previews: some View {
        ResultPickerView(signed: .constant("+"), digitOne: .constant(3), digitTwo: .constant(8), digitThree: .constant(2))
    }
}
