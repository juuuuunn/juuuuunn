import SwiftUI
import UserNotifications

struct SettingsView: View {

    @EnvironmentObject private var viewModel: ProverbViewModel

    @State private var slotTimes: [Date] = Array(repeating: Date(), count: 3)

    var body: some View {
        NavigationStack {
            Form {
                if viewModel.authorizationStatus == .denied {
                    deniedSection
                } else {
                    ForEach(viewModel.notificationSlots) { slot in
                        slotSection(slot)
                    }
                }
                infoSection
            }
            .navigationTitle("設定")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.refreshAuthorizationStatus()
                syncSlotTimes()
            }
        }
    }

    // MARK: - Sections

    private var deniedSection: some View {
        Section {
            HStack {
                Label("通知を受け取る", systemImage: "bell.fill")
                    .foregroundStyle(.primary)
                Spacer()
                Button("設定を開く") { openSystemSettings() }
                    .font(.subheadline)
            }
        } header: {
            Text("毎日のことわざ通知")
        } footer: {
            Text("通知が拒否されています。iOSの設定アプリから「ことわざ」アプリの通知を許可してください。")
        }
    }

    @ViewBuilder
    private func slotSection(_ slot: NotificationSlot) -> some View {
        let slotIndex = slot.id
        let slotNames = ["通知 1", "通知 2", "通知 3"]

        Section {
            // Toggle
            HStack {
                Label(slotNames[slotIndex], systemImage: "bell.fill")
                    .foregroundStyle(.primary)
                Spacer()
                Toggle("", isOn: Binding(
                    get: { viewModel.notificationSlots[slotIndex].enabled },
                    set: { newValue in
                        if viewModel.authorizationStatus == .notDetermined {
                            viewModel.requestNotificationPermission(slotId: slotIndex)
                        } else {
                            viewModel.toggleSlot(id: slotIndex, enabled: newValue)
                        }
                    }
                ))
                .tint(.orange)
            }

            if viewModel.notificationSlots[slotIndex].enabled {
                // Time picker
                DatePicker(
                    "通知時刻",
                    selection: $slotTimes[slotIndex],
                    displayedComponents: .hourAndMinute
                )
                .onChange(of: slotTimes[slotIndex]) { _, newValue in
                    let components = Calendar.current.dateComponents([.hour, .minute], from: newValue)
                    var updated = viewModel.notificationSlots[slotIndex]
                    updated.hour = components.hour ?? 8
                    updated.minute = components.minute ?? 0
                    viewModel.updateSlot(updated)
                }
                .tint(.orange)

                // Category picker
                Picker("カテゴリ", selection: Binding(
                    get: { viewModel.notificationSlots[slotIndex].category },
                    set: { newCategory in
                        var updated = viewModel.notificationSlots[slotIndex]
                        updated.category = newCategory
                        viewModel.updateSlot(updated)
                    }
                )) {
                    Text("すべて").tag(Optional<ProverbCategory>.none)
                    ForEach(ProverbCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(Optional(category))
                    }
                }
            }
        } header: {
            Text(slotNames[slotIndex])
        } footer: {
            if slotIndex == 0 && !viewModel.notificationEnabled {
                Text("毎日設定した時刻に、その日のことわざをお知らせします。")
            }
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

    private func syncSlotTimes() {
        for slot in viewModel.notificationSlots {
            var components = DateComponents()
            components.hour = slot.hour
            components.minute = slot.minute
            if let date = Calendar.current.date(from: components) {
                slotTimes[slot.id] = date
            }
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
