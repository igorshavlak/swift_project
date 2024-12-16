import Foundation

struct Video {
    let title: String
    let views: Int
    let url: String
}

func generateSampleVideos() -> [Video] {
    return [
        Video(title: "Swift Programming",    views: 5000, url: "https://example.com/video1"),
        Video(title: "SwiftUI Basics",       views: 3200, url: "https://example.com/video2"),
        Video(title: "iOS App Development",  views: 7500, url: "https://example.com/video3"),
        Video(title: "Xcode Tips & Tricks",  views: 2100, url: "https://example.com/video4"),
        Video(title: "Data Structures",      views: 4600, url: "https://example.com/video5"),
        Video(title: "Algorithms 101",       views: 3800, url: "https://example.com/video6"),
        Video(title: "Networking in Swift",  views: 1200, url: "https://example.com/video7"),
        Video(title: "UI Design Principles", views: 6100, url: "https://example.com/video8"),
        Video(title: "Combine Framework",    views: 1800, url: "https://example.com/video9"),
        Video(title: "Concurrency in Swift", views: 8900, url: "https://example.com/video10")
    ]
}

func printVideos(_ videos: [Video]) {
    if videos.isEmpty {
        print("Немає відео для відображення.")
        return
    }
    for (index, video) in videos.enumerated() {
        print("\(index + 1). Назва: \(video.title), Перегляди: \(video.views)")
    }
}

func searchVideos(by titlePart: String, in videos: [Video]) -> [Video] {
    let lowercasedSearch = titlePart.lowercased()
    return videos.filter { $0.title.lowercased().contains(lowercasedSearch) }
}


func sortVideosByViewsDescending(_ videos: [Video]) -> [Video] {
    return videos.sorted { $0.views > $1.views }
}


func printVideoDetails(_ video: Video) {
    print("==== Деталі відео ====")
    print("Назва: \(video.title)")
    print("Перегляди: \(video.views)")
    print("Посилання: \(video.url)")
    print("======================")
}

func main() {
    
    let allVideos = generateSampleVideos()

    
    while true {
        print("\nВітаємо! Оберіть дію:")
        print("1. Показати всі відео")
        print("2. Знайти відео за назвою")
        print("3. Показати всі відео (відсортовані за переглядами)")
        print("4. Показати деталі відео за індексом")
        print("5. Вийти\n")

       
        guard let userInput = readLine(), let choice = Int(userInput) else {
            print("Некоректне введення. Спробуйте ще раз.")
            continue 
        }

        switch choice {
        case 1:
        
            print("Список відео:")
            printVideos(allVideos)

        case 2:
   
            print("Введіть назву для пошуку:")
            if let searchQuery = readLine() {
                let foundVideos = searchVideos(by: searchQuery, in: allVideos)
                print("Результати пошуку:")
                printVideos(foundVideos)
            }

        case 3:
         
            let sortedVideos = sortVideosByViewsDescending(allVideos)
            print("Відео, відсортовані за кількістю переглядів (спадання):")
            printVideos(sortedVideos)

        case 4:

            print("Введіть номер відео (1 - \(allVideos.count)) для перегляду детальної інформації:")
            if let indexString = readLine(), let index = Int(indexString) {
                let realIndex = index - 1
                if realIndex >= 0 && realIndex < allVideos.count {
                    printVideoDetails(allVideos[realIndex])
                } else {
                    print("Неправильний індекс відео.")
                }
            }

        case 5:
    
            print("Програму завершено за бажанням користувача.")
            return

        default:
            print("Невідома команда. Спробуйте ще раз.")
        }
    }
}

main()
