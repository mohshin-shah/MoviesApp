import UIKit
import TableKit

class MovieListViewController: ViewController, MovieListView {
  
  var presenter: MovieListPresenter!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "movie_list_screen_title".localized
    setRefreshControlOn(tableView, action: #selector(refresh))
    presenter.onViewDidLoad()
  }
  
  func show(movies: [MovieViewModel]) {
    tableDirector.clear()
    let rows: [Row] = movies.map { TableRow<MovieListCell>(item: $0) }
    tableDirector += TableSection(rows: rows)
    tableView.reloadData()
  }
  
  func refresh() {
    presenter.onRefresh()
  }
}
