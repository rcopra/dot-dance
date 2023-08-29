require 'faker'

User.destroy_all
Artist.destroy_all
Club.destroy_all
Event.destroy_all
Lineup.destroy_all

# Create users
party_goer = User.create(email: 'person@example.com', password: 'password')
party_promoter = User.create(email: 'promoter@example.com', password: 'password')
club_owner = User.create(email: 'club@example.com', password: 'password')

# Create artists

funny_techno_names = [
  "Squidtastic",
  "Beep Boop",
  "Funky Circuit",
  "Synth Sausage",
  "Bleep Blorp",
  "Dr. Disco Byte",
  "Robo Grooves",
  "Circuit Breaker",
  "Techno Tofu",
  "Groove Machine"
]

funny_techno_names.each do |name|
  Artist.create(name: name, genre: "Techno")
end

# Create clubs
berlin_clubs = [
  {
    name: "Berghain",
    address: "Am Wriezener Bahnhof, 10243 Berlin",
    description: "Legendary techno club in a former power plant."
  },
  {
    name: "Watergate",
    address: "Falckensteinstraße 49, 10997 Berlin",
    description: "Riverside club with top electronic DJs and great views."
  },
  {
    name: "KitKatClub",
    address: "Köpenicker Str. 76, 10179 Berlin",
    description: "Famous for its hedonistic and diverse parties."
  },
    {
    name: "Tresor",
    address: "Köpenicker Str. 70, 10179 Berlin",
    description: "Iconic club known for its industrial and underground vibe."
  },
  {
    name: "Sisyphos",
    address: "Hauptstraße 15, 10317 Berlin",
    description: "Unique club with multiple dance floors and outdoor areas."
  }
]

berlin_clubs.each do |club|
  Club.create(
    name: club[:name],
    address: club[:address],
    description: club[:description],
    user: club_owner
  )
end

event_images = [
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vMThiNGQ3YjFlOTJkNTQ3OWY5ZDIwMTNjYzIxNjcwMWM0NzFhZGFjNS5qcGc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vNTEwYTBlMWRiMjczNzYyZTkzOTk0MjIwM2YyZGMyMDQ3NzYyZjIyMC5qcGc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vMjRiZDZiM2FiMGQ4YjgwMDRlNzgyODM4NTg2OTAzMGM1YTJlMmU0Mi5qcGc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vYjQ1OTg1MzVkOWJkMmY3MTM5M2UyOTNmMmYyOGYzZDY1ZGM0MGFhNi5qcGc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vODZiZDNiZjBlODk2NjI2NjliMzdiZWM5NzBlNWIxZWNkMTQyMmMxMC5qcGc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vZDFhODE3NThkZWUwOWI5NzVjMTllZGQ2OTMyMTIxYWM0YWE1NWZkZC5wbmc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vZjFjYjNjODE0MjRlMmRkNTYwYjA0OGJjZGE2YjNlZTYxODk2NTU0Ny5qcGc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vZDk4ZTc3YTQxMDg3YTE4ZjA4ZGE3MTBjYmVjMWQyMDFmZmFjM2UwNi5qcGc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vYmJjNDhiZDQ2ZWI0YjBiODFlYTE4ZDIzYjE0ZTk2YTczNzNhNGRiMi5qcGc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vYjNlNWMwYWVmN2M5ODdhOTJmMzcyYThhNDgwODM5OWQwMTVmMzIyOC5wbmc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vZTY1MjRkOGY2ZWI4Y2Y4YjIzYTRlNDAxZTU4ZmNjNzFhNWNjMzNkNy5wbmc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vYjY3ZTgyMDM4NmM1ZTg1ZDkwZGQzMzBiNGU1MmMzNGNjMmI5MDNhYi5qcGc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vNjQ3YjliYjQ2N2EyMTRlNTllYzg5N2NkYWJjN2JjYzM0ZmE2ZWQ3Mi5qcGc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vODhiODM1ZjRlODhlOTI3MjkzN2ZlZmNiNWVmODJkMTRkOTc2YmEyNS5qcGc=',
  'https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vZTNhNjY5MzMwN2M3NjQ4ZGVjYzVhZTA1MzNlYTYyZTVkZDJmZGM0Yi5qcGc='
]

# Create events with lineups
15.times do |i|
  club = Club.offset(rand(Club.count)).first

  event = Event.create(
    title: "Event #{i + 1}",
    date: Date.today + i.days,
    description: "Event Description #{i + 1}",
    address: "Event Address #{i + 1}",
    user: party_promoter,
    club: club,
    poster_image: event_images[i]
  )

  # Add lineups to events
  Lineup.create(
    artist: Artist.offset(rand(Artist.count)).first,
    event: event
  )
end

puts "Seed data has been successfully created."
