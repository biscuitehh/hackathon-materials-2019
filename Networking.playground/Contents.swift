// Our required libraries
// UIKit contains all of the UI magic we'll need
// PlaygroundSupport contains an awesome helper method that lets our Playground live forever
import UIKit
import PlaygroundSupport

// Educational image
let imageUrlString = "https://tr2.cbsistatic.com/hub/i/r/2014/05/15/f8964afd-bd82-4e0e-bcbe-e927363dcdc1/resize/770x/0e2790f31ea183d9ace520989b73ec33/codedoge.jpg"

// Convert the string version of our image URL into something iOS can digest
guard let imageUrl = URL(string: imageUrlString) else {
    fatalError()
}

// Create our network request
var request = URLRequest(url: imageUrl)
request.httpMethod = "GET"

// Create our network task
// Our network task allows us to fire off our network request and handle the response in a neat fashion
// NOTE: It actually doesn't fire off yet.
let task = URLSession.shared.dataTask(with: request) { data, response, error in
    
    // Awesome error handling
    // Real talk: you should always display this to the user (in a useful fashion, of course)
    if let error = error {
        print("error=\(error)")
        return
    }
    
    // UI operations should generally run on the main thread
    // Note: we aren't actually assigning anything to an image view this time, but it's good practice
    DispatchQueue.main.async {
        // Our awesome image
        let image = UIImage(data: data!)
    }
}

// This is where we actually start our network task
task.resume()

// This allows our Playground to live forever
PlaygroundPage.current.needsIndefiniteExecution = true
