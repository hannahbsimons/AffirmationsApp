//
//  ReminderView.swift
//  Affirmations
//
//  Created by Hannah Simons on 10/11/23.
//

import SwiftUI
import UserNotifications

struct ReminderView: View {
    @State private var isReminderEnabled = false
    
    var body: some View {
        ZStack() {
            Color(.yellow2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                
                Text("Would you like daily reminders to enunciate your affirmations?")
                    .foregroundColor(.orange)
                    .font(.custom("Futura", size: 18))
                
                HStack(spacing: 20) {
                    Button(action: {
                        isReminderEnabled = true
                        requestNotificationPermission()
                        scheduleDailyReminder()
                    }) {
                        Text("Yes")
                            .foregroundColor(.green)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .font(.custom("Futura", size: 18))
                    }
                    
                    Button(action: {
                        isReminderEnabled = false
                    }) {
                        Text("No")
                            .foregroundColor(.red)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .font(.custom("Futura", size: 18))
                    }
                }
            }
        }
        .padding()
    }
    
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("Notification permission granted")
            } else {
                print("Notification permission denied")
            }
        }
    }
    
    private func scheduleDailyReminder() {
        let content = UNMutableNotificationContent()
        content.title = "Daily Affirmation Reminder"
        content.body = "It's time to enunciate your affirmations!"
        content.sound = UNNotificationSound.default

        var dateComponents = DateComponents()
        dateComponents.hour = 20
        dateComponents.minute = 0

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: "dailyReminder", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Failed to schedule notification: \(error)")
            } else {
                print("Daily reminder scheduled")
            }
        }
    }
}

#Preview {
    ReminderView()
}
