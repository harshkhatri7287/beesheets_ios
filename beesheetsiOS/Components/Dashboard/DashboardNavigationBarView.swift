import SwiftUI

public struct DashboardNavigationBarView: View {
    public let onNotificationsTap: () -> Void
    public let onProfileTap: () -> Void

    public init(
        onNotificationsTap: @escaping () -> Void = {},
        onProfileTap: @escaping () -> Void = {}
    ) {
        self.onNotificationsTap = onNotificationsTap
        self.onProfileTap = onProfileTap
    }

    public var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: 8) {
                Image("beesheets_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)

                Text("BeeHyv")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 0.08, green: 0.78, blue: 0.39),
                        Color(red: 0.01, green: 0.62, blue: 0.97)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))

            Spacer()

            HStack(spacing: 16) {
                Button(action: onNotificationsTap) {
                    Image(systemName: "bell")
                        .font(.title3)
                        .foregroundColor(.primary)
                }

                Button(action: onProfileTap) {
                    Image(systemName: "person.crop.circle")
                        .font(.title3)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
        .padding(.bottom, 4)
    }
}
