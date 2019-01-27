library(dplyr)
library(ggplot2)
library(scales)

data <- unlist(c(
  c("Mr. Penumbra's 24-Hour Bookstore", "Ready Player One", "The Stranger", "Aristotle and Dante Discover the Secrets of the Universe", "The Subtle Art of Not Giving a F*ck", "The Thinking Person's Guide to Climate Change"),
  c("The Kite Runner", "Harry Potter", "Lord of the Flies", "It", "A Thousand Splendid Suns", "Desert Solitaire"),
  c("Gone Girl", "Shoe Dog", "1833", "The Snowball", "The Lord of the Rings", "The Kite Runner"),
  c("Becoming", "Harry Potter", "Scrappy Little Nobody", "The Book Thief", "The Fault in Our Stars", "Hunger Games"),
  c("The Complete Works of Edgar Allen Poe", "Confessions of a Heretic", "Clockwork Angel", "Miss Peregrine's Home for Peculiar Children", "Gospel of Filth", "God of Small Things"),
  c("Extremely Loud and Incredibly Close", "A Tale of Two Cities", "All the Light We Cannot See", "Into the Wild", "The Great Gatsby", "Out of the Dust"),
  c("The Great Gatsby","Of Mice and Man", "Robinson Crusoe", "Frankenstein","1984", "The Bell Jar"),
  c("Count of Monte Cristo", "Sherlock Holmes", "Harry Potter", "The Alchemist", "The Warlock", "The War of the Ember"),
  c("Le Petit Prince","NYPD 4","The Alchemist","Secret","Found","11 Birthdays"),
  c("Harry Potter", "The Great Gatsby", "The Giving Tree", "The Cat in the Hat", "Red", "Hunger Games"),
  c("Design of Everyday Things", "Hooked", "Always Hungry?", "Sapiens", "Silicon City", "Tested"),
  c("Of Mice and Men", "The Great Gatsby", "1984", "Harry Potter", "Percy Jackson"),
  c("The Godfather", "Thinking, Fast and Slow", "Intimate relationship", "Poor Charlie's Almanack", "lestime de soi", "SLEEP"),
  c("Kafka on the Shore", "If Cats Disappeared from the World", "Miss Hokusai", "Through the Looking Glass", "Battle Royale", "The Girl who Leapt Through Time"),
  c("Harry Potter", "Sherlock Holmes", "Fireflies", "After Dark", "Ready Player One", "Lord of the Rings"),
  c("Nisei Daughter", "Digital Fortress", "Into Thin Air", "Norwegian Wood", "Ghost in the Wires", "The Da Vinci Code"),
  c("The Stand", "Mr. Mercedes", "Percy Jackson", "Freakonomics", "Shoe Dog", "Hunger Games"),
  c("The Alchemist", "Percy Jackson", "Animal Farm", "Mortal Coil", "A Game of Thrones", "The Cruel Prince"),
  c("On Liberty", "Harry Potter", "City of Bones", "The Tyranny of Utility", "The Outsiders", "Outliers"),
  c("The Bible", "Believer's Authority", "Every Good Endeavor","Book of Acts", "Your Spritual Gifts", "How People Grow"),
  c("Becoming", "Cane", "Harry Potter", "Quicksand", "Passing", "The Design of Everyday Things"),
  c("Psycho-Cybernetics", "Letters From a Stoic", "Harry Potter", "Cosmosapiens", "Cracking the Coding Interview", "Brave New World"),
  c("Harry Potter"),
  c("1984", "Animal Farm", "Brave New World", "Foundation", "The Left Hand of Darkness", "Ilium"),
  c("Harry Potter", "Lord of the Flies", "Goose Girl", "Cinderella", "This Lullaby", "Black Panther") 
))

favorite_books <- data %>%
  table() %>% # Count frequencies of each unique value
  as.data.frame() %>% 
  rename(book = '.', freq = Freq) %>% 
  arrange(-freq)

favorite_books %>% 
  filter(freq > 1) %>% 
  ggplot(aes(x = reorder(book, -freq), y = freq)) + 
  geom_bar(stat = 'identity') +
  ggtitle('Our Favorite Books (INFO 201 AE Wi19)') +
  xlab('Book title') +
  ylab('Number of students who like the book') +
  scale_y_continuous(breaks = pretty_breaks()) +
  coord_flip() +
  ggsave('wi19_favorite_books.png')


