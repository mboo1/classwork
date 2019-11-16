def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie.joins(:actors).where('actors.name in (?)', those_actors).group('movies.id').having('COUNT(*) = ?', those_actors.length).select(:title, :id)
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie.group('decade').order('AVG(score) DESC').limit(1).pluck("case when yr between 1920 and 1929 then 1920 
  when yr between 1930 and 1939 then 1930
  when yr between 1940 and 1949 then 1940
  when yr between 1950 and 1959 then 1950
  when yr between 1960 and 1969 then 1960
  when yr between 1970 and 1979 then 1970
  when yr between 1980 and 1989 then 1980
  when yr between 1990 and 1999 then 1990
  when yr between 2000 and 2010 then 2000 end as decade").first
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery

  movie_ids = Actor.joins(:movies).where('actors.name = ?', name).pluck('movies.id')
  Actor.joins(:movies).where('movies.id IN (?) AND actors.name != (?)', movie_ids,name).pluck('DISTINCT actors.name')
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor.left_joins(:castings).where('movie_id is null').count
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  test = "%"
  whazzername.downcase.each_char do |char|
    test += char + "%"
  end


  Movie.joins(:actors).where('LOWER(name) like ?', test).select('movies.*')

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  Actor.joins(:movies).group("actors.id").order('career DESC').limit(3).select('actors.id, name, (max(yr) - min(yr)) as career') 
end
