import SwiftUI

struct ContentView: View {
    @State private var minutes = 25
    @State private var selectedApps: Set<String> = []
    @State private var isRunning = false

    let apps = ["Instagram", "YouTube", "TikTok", "ゲーム"]

    var body: some View {
        VStack(spacing: 24) {
            Text("MY LIMIT")
                .font(.largeTitle.bold())

            Text("制限するアプリを選択")
                .font(.headline)

            ForEach(apps, id: \.self) { app in
                Toggle(app, isOn: Binding(
                    get: { selectedApps.contains(app) },
                    set: {
                        if $0 {
                            selectedApps.insert(app)
                        } else {
                            selectedApps.remove(app)
                        }
                    }
                ))
            }

            Text("制限時間：\(minutes)分")

            Picker("時間", selection: $minutes) {
                Text("25分").tag(25)
                Text("50分").tag(50)
                Text("90分").tag(90)
            }
            .pickerStyle(.segmented)

            Button(isRunning ? "終了" : "制限スタート") {
                isRunning.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
