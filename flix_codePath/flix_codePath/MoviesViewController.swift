//
//  MoviesViewController.swift
//  flix_codePath
//
//  Created by Betsy Avila on 9/3/21.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    //properties
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [[String:Any]]() //looking at an array of dictionaries
    
    override func viewDidLoad() {
        super.viewDidLoad() //LOADS FIRST

        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        print("Hello") //test
        
        //network request
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movies = dataDictionary["results"] as! [[String:Any]] //extract movie results, so cast it as a dictionary, add self in front to rid of compile error
                
                self.tableView.reloadData() //call functions again to avoid blank screen
                print(dataDictionary)
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//asks for a number of rows
        return movies.count //starts from zero so make sure to reloadData() on startup
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //for a particular row, give this cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell //helps if there a hundred rows of cells
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String //cast title as a string type
        let synopsis = movie["overview"] as! String
        
        cell.titleLabel!.text = title
        cell.synopsisLabel!.text = synopsis
        
        let baseUrl = "https://image.tmdb.org/t/p/w185" //185 px wide
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)! //combine base url and poster url
        
        cell.posterView.af.setImage(withURL: posterUrl)
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        print("Loading up the details screen")
        //pick the movie to the new controller
        let cell = sender as! UITableViewCell
        //makes to sure to pick the right cell, so change default sender and cast with "!"
        
        let indexPath = tableView.indexPath(for: cell)!
        
        //pass the slected movie to detailsviewcontroller
        let movie = movies[indexPath.row]
        
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movie = movie //type cast selected movie

        tableView.deselectRow(at: indexPath, animated: true) //change selected highlight on app
        
    }
    
    

}
