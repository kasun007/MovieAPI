import Foundation

struct APIService: APIServiceProtocol {
    
    // Generic function for fetching data of a given type from a URL
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {
        
        // Make sure URL is not nil
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        // Create a data task to fetch data from the URL
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            // Check for errors in the request
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                // Parse the data using the provided type
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                    
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }

        // Start the data task
        task.resume()
    }
    
    // Function for fetching an array of Movie objects from a URL
    func fetchMovies(url: URL?, completion: @escaping(Result<[Movie], APIError>) -> Void) {
        
        // Make sure URL is not nil
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        // Create a data task to fetch data from the URL
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            // Check for errors in the request
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                // Parse the data as an array of Movie objects
                let decoder = JSONDecoder()
                do {
                    let movies = try decoder.decode([Movie].self, from: data)
                    completion(Result.success(movies))
                    
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }

        // Start the data task
        task.resume()
    }
}
