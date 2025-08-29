import SwiftUI

// MARK: - Test for Components Refactoring

struct ComponentsTest: View {
    @State private var testText = ""
    @State private var selectedSegment = 0
    
    var body: some View {
        VStack(spacing: 16) {
            // Test DandoriTextField
            DandoriTextField(
                text: $testText,
                placeholder: "Test TextField"
            )
            
            // Test DandoriButton
            DandoriButton("Test Button") {
                print("Button tapped")
            }
            
            // Test DandoriSegmented
            DandoriSegmented(
                selection: $selectedSegment,
                options: ["Option 1", "Option 2"],
                variant: .default
            )
            
            // Test DandoriChip
            DandoriChip(text: "Test Chip", variant: .accent, size: .medium)
            
            // Test DandoriBadge
            DandoriBadge("Test Badge")
            
            // Test DandoriCard
            DandoriCard(variant: .default, size: .standard) {
                Text("Test Card Content")
            }
            
            // Test Toast components exist
            Text("All components available ✅")
                .foregroundColor(.green)
        }
        .padding()
    }
}

#Preview {
    ComponentsTest()
}
