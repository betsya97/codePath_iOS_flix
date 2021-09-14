# codePath_iOS_flix
# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [ ] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF

![flix](https://i.imgur.com/Qc2Jf5I.gif)

### Notes
Instead of using the WonderWoman movie ID from the tutorial, I wanted to use a different variable and used the Shang-Chi movie ID to display movies similar to it.

New concepts learned in Part 2 is learning more UI components like Tab Bar Controller. The tab bar controller made it possible to create separate tabs for the movie playlist and superhero page. It was a challenge for me to fully understanding the collectionView and network requests. But the tutorial was helpful to pause and comprehend. This second portion of the assignment dealt more with fitting images within certain boundaries without warping drastically.

---

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [ ] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.

### App Walkthrough GIF

![flix](https://i.imgur.com/Hy3vSD8.gif)


### Notes
This experience introduced many new concepts. It demonstrates the use of a launchscreen and how to import app icon images depending on iOS device. The app focuses more on iPhone functionality. Another new topic which I learned is how to use cocoapods to import external libraries and add more functionality to custom cells (helpful for repeating content such as movies) inside an table. The custom cells were made possible through a new cocoatouch class. The tableView element is the base for holding cells and introduced the need to declare a delegate and data source components. APIs were also new topic for me, and it was cool to see how it updates the movies in realtime. 
