import Foundation

func main() {
    var tracker: [String:Int] = [:]
    var boatName: String
    var boatTime: String
    
    print("Enter the name of a boat and the time (in seconds) it completed a course.")
    print("Type \"STOP\" to end input.")
    
    print("Enter the name:")
    boatName = readLine() ?? ""
    print("Enter the time:")
    boatTime = readLine() ?? ""
    
    while boatName.uppercased() != "STOP" && boatName != ""
            && boatTime.uppercased() != "STOP" && boatTime != "" {
        let time = Int(boatTime) ?? 0
        if time > 0 {
            tracker[boatName] = time
        } else {
            print("Invalid time input. Please enter the time again.")
            boatTime = readLine() ?? ""
            continue
        }
        
        print("Enter the name:")
        boatName = readLine() ?? ""
        if boatName.uppercased() == "STOP" || boatName == "" {
            break
        }
        print("Enter the time:")
        boatTime = readLine() ?? ""
    }
    
    var min: Int = Int.max
    var minBoat: String = ""
    var sum: Int = 0
    var max: Int = Int.min
    var maxBoat: String = ""
    
    for (boat, time) in tracker {
        print("\(boat) : \(time)")
        sum += time
        
        if time < min {
            min = time
            minBoat = boat
        }
        
        if max < time {
            max = time
            maxBoat = boat
        }
    }
    
    print("The winner of the race is \(minBoat) completed the race in \(min) seconds.")
    print("The slowest boat is \(maxBoat) completed the race in \(max) seconds.")
    print("The average time is: \(Double(sum)/Double(tracker.count))")
}

main()
