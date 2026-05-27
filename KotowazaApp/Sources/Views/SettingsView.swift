import SwiftUI
import UserNotifications

struct SettingsView: View {

    @EnvironmentObject private var viewModel: ProverbViewModel

    @State private var notificationTime: Date = {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }()

    var body: some View {
        NavigationStack {
            Form {
                notificationSection
                infoSection
            }
            .navigationTitle("設定")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.refreshAuthorizationStatus()
                syncTimePicker()
            }
        }
    }

    // MARK: - Sections

    private var notificationSection: some View {
        Section {
            notificationToggleRow
            if viewModel.notificationEnabled && viewModel.authorizationStatus == .authorized {
                timePickerRow
            }
        } header: {
            Text("毎日のことわざ通知")
        } footer: {
            notificationFooterText
        }
    }

    private var notificationToggleRow: some View {
        HStack {
            Label("通知を受け取る", systemImage: "bell.fill")
                .foregroundStyle(.primary)

            Spacer()

            if viewModel.authorizationStatus == .denied {
                Button("設定を開く") {
                    openSystemSettings()
                }
                .font(.subheadline)
            } else {
                Toggle("", isOn: Binding(
                    get: { viewModel.notificationEnabled },
                    set: { newValue in
                        if viewModel.authorizationStatus == .notDetermined {
                            viewModel.requestNotificationPermission()
                        } else {
                            viewModel.toggleNotification(enabled: newValue)
                        }
                    }
                ))
                .tint(.orange)
            }
        }
    }

    private var timePickerRow: some View {
        DatePicker(
            "通知時刻",
            selection: $notificationTime,
            displayedComponents: .hourAndMinute
        )
        .onChange(of: notificationTime) { _, newValue in
            let components = Calendar.current.dateComponents([.hour, .minute], from: newValue)
            viewModel.updateNotificationTime(
                hour: components.hour ?? 8,
                minute: components.minute ?? 0
            )
        }
        .tint(.orange)
    }

    @ViewBuilder
    private var notificationFooterText: some View {
        if viewModel.authorizationStatus == .denied {
            Text("通知が拒否されています。iOSの設定アプリから「ことわざ」アプリの通知を許可してください。")
        } else {
            Text("毎日設定した時刻に、その日のことわざをお知らせします。")
        }
    }

    private var infoSection: some View {
        Section("このアプリについて") {
            LabeledContent("ことわざ数", value: "\(allProverbs.count)件")
            LabeledContent("カテゴリ数", value: "\(ProverbCategory.allCases.count)種類")
            LabeledContent("バージョン", value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0")
        }
    }

    // MARK: - Helpers

    private func syncTimePicker() {
        var components = DateComponents()
        components.hour = viewModel.notificationHour
        components.minute = viewModel.notificationMinute
        if let date = Calendar.current.date(from: components) {
            notificationTime = date
        }
    }

    private func openSystemSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(ProverbViewModel())
}
