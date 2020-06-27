# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  # Initialize movie and then and save it
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.new
  movie.title = attributes[:title]
  movie.release_date = attributes[:release_date]
  movie.director = attributes[:director]
  movie.lead = attributes[:lead]
  movie.in_theaters = attributes[:in_theaters]
  movie.save
  movie
end

def can_be_created_in_a_block(args = {title: "Home Alone", release_date: 1990, director: "", lead: "", in_theaters: nil})
    Movie.create do |m|
    m.title = args[:title]
    m.release_date = args[:release_date]
    m.director = args[:director]
    m.lead = args[:lead]
    m.in_theaters = args[:in_theaters]
  end
end

def can_get_the_first_item_in_the_database
  Movie.first
end

def can_get_the_last_item_in_the_database
  Movie.last
end

def can_get_size_of_the_database
  i = 0
  Movie.find_each do |movie|
    i += 1
  end
  i
end

def can_find_the_first_item_from_the_database_using_id
  Movie.find(1)
end

def can_find_by_multiple_attributes
  # Search Values:
  # title == "Title"
  # release_date == 2000
  # director == "Me"
  Movie.where(title: "Title", release_date: 2000, director: "Me").take
end

def can_find_using_where_clause_and_be_sorted
  Movie.where(title: "Movie_3").or(Movie.where(title: "Movie_4")).order(title: :desc)
end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick", save it, then return it
  Movie.create(title: "Awesome Flick")
  movie = Movie.where(title: "Awesome Flick").take
  movie.title = "Even Awesomer Flick"
  movie.save
  movie
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  movie = Movie.where(title: "Wat?").take
  movie.update(title: "Wat, huh?")
  movie
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  5.times do |i|
    Movie.update(title: "A Movie", release_date: 2000+i)
  end

end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  movie = Movie.where(title: "That One Where the Guy Kicks Another Guy Once").take
  movie.destroy
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.destroy_all
end
