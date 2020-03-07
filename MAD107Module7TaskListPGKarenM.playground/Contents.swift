import Cocoa

var str = "Hello, playground"

var kamTaskList: [(task: String, priority: Int)] = [(task: "Do laundry", priority: 7),
                                                    (task: "Walk Dog", priority: 1),
                                                    (task: "Text children", priority: 1),
                                                    (task: "Feed hamsters and clean cages", priority: 1),
                                                    (task: "Make dinner", priority: 2),
                                                    (task: "Do iOS homework", priority: 2),
                                                    (task: "Work on Android MCH", priority: 3),
                                                    (task: "Clean bathrooms", priority: 9),
                                                    (task: "Work out", priority: 2),
                                                    (task: "Load/unload the dishwasher", priority: 5),
                                                    (task: "Work on Mom's taxes", priority: 6)
]


//.. closure
var sortClosure1 = { ([(task: String, priority: Int)]) -> ([(task: String, priority: Int)]) in
    
    let kamArray = kamTaskList.sorted(by: {$0.priority < $1.priority })
    return kamArray
}

func tasksForToday(maxTasks: Int, sortArray: ([(task: String, priority: Int)]) -> ([(task: String, priority: Int)])) {
    
    var count = 1
    let done = sortArray(kamTaskList)
    
    var maxNbr = maxTasks
    
    if maxNbr <= done.count {
        //
    } else {
        maxNbr = done.count
    }
    
    print("   Number of tasks printed: \(maxNbr) out of \(done.count)")    //"\(maxTasks)")
    print("\n Priority             Task      ")
    print(" --------       ----------------")

    for item in done where (count <= maxNbr && maxNbr <= done.count) {
        print("    \(item.priority)    \t\t\(item.task)")
        count += 1
    }
}

tasksForToday(maxTasks: 12, sortArray: sortClosure1)


