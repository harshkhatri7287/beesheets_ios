// filepath: ViewModels/DashboardViewModel.swift
import Foundation
import SwiftUI
import Combine

public final class DashboardViewModel: ObservableObject {
    @Published var dashboard: DashboardHomeDTO?
    @Published var isLoading: Bool = false
    @Published var error: DashboardServiceError?

    private let service: DashboardServiceProtocol

    public init(service: DashboardServiceProtocol) {
        self.service = service
    }

    @MainActor
    func load() async {
        isLoading = true
        error = nil

        do {
            let dto = try await service.fetchDashboardHome()
            self.dashboard = dto
        } catch let e as DashboardServiceError {
            self.error = e
        } catch {
            self.error = .networkUnavailable
        }

        isLoading = false
    }

    // MARK: - View helpers
    var greetingSalutation: String {
        "Good Morning!"
    }

    var greetingName: String {
        dashboard?.user.fullName ?? "Guest"
    }

    var greetingMessage: String {
        "Welcome, \(greetingName)"
    }

    var todaySummary: TodaySummaryDTO? { dashboard?.todaySummary }
    var leaveQuotas: [LeaveQuotaDTO] { dashboard?.leaveQuotas ?? [] }
    var wfhQuota: WFHQuotaDTO? { dashboard?.wfhQuota }
    var quickLinks: [QuickLinkDTO] { dashboard?.quickLinks ?? [] }
}
