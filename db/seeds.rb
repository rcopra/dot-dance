require 'faker'

User.destroy_all
Artist.destroy_all
Club.destroy_all
Event.destroy_all
Lineup.destroy_all

# Create users
party_goer = User.create(email: 'person@example.com', password: 'password', username: 'person')
party_promoter = User.create(email: 'promoter@example.com', password: 'password', username: 'promoter')
club_owner = User.create(email: 'club@example.com', password: 'password', username: 'owner')

# Create artists

djs = [
  "Marcel Dettmann",
  "Nick Höppner",
  "Mary Yuzovskaya",
  "Natalie Robinson",
  "Norman Nodge",
  "Philippa Pacho",
  "TRYCE",
  "DJ Fucks Himself",
  "Marlon Hoffstadt",
  "Gabber Eleganza",
  "Cybersex",
  "Henning Baer",
  "Dax J",
  "FRÆNZ",
  "Detroit In Effect",
  "Bailey Ibbs",
  "Adrestia",
  "dj sweet6teen",
  "DANCE DIVINE",
  "madwoman"
]

djs.each do |name|
  Artist.create(name: name, genre: "Techno")
end

# Create clubs
berlin_clubs = [
  {
    name: "Berghain",
    address: "Am Wriezener Bahnhof, 10243 Berlin",
    description: "Sitting in a dusty lot on the border of Kreuzberg and Friedrichshain, Berghain is widely considered one of the world's best nightclubs. It has three dance floors: Berghain, a dark main room where most DJs play techno, Panorama Bar, an upstairs space that's more focused on house, and the Säule on ground floor, though the music policy in all rooms is very open-ended. (There's also a men's-only club on the first level called Lab.Oratory, the occasionally used Halle and a smaller club with a separate entrance called Kantine am Berghain.)

    A number of details give Berghain its cult appeal: its residents, which include Steffi, Tama Sumo, Marcel Dettmann and Ben Klock, its set lengths, which range from three hours to more than eight, and its decor, which is mostly metal and poured concrete, with 30 meter ceilings and seemingly endless nooks and crannies.

    Most of the parties are extremely long: Friday night events usually wrap up early Saturday afternoon, but Saturdays typically run well into Monday morning. Perhaps the most notorious aspect of the club is its door policy—hundreds of people are turned away each weekend, including regulars, often for reasons that are completely mysterious to everyone except the doormen. "
  },
  {
    name: "Watergate",
    address: "Falckensteinstraße 49, 10997 Berlin",
    description: "Riverside club with top electronic DJs and great views."
  },
  {
    name: "://about blank",
    address: "Markgrafendamm 24c, 10245 Berlin",
    description: "://about blank is a formerly illegal, multi-room club by Ostrkeuz S-Bahnhof in Friedrichshain. It's a short walk from Salon Zur Wilde Renate, and like that club, it's a lightly renovated re-purposed building with seemingly endless nooks and crannies. There are two main dance floors inside, and in the summer DJs play out in the garden (this is open in the winter too, often with a bonfire going).

    The music policy is open-ended but mostly focused on house and techno, with occasional bass or disco nights. The overall atmosphere is gritty, and the parties often go well into the following afternoon or evening."
  },
    {
    name: "Tresor",
    address: "Köpenicker Str. 70, 10179 Berlin",
    description: "The new incarnation of an old techno institution, Tresor Club is set in an abandoned power plant spanning 22,000m² on Köpenicker Straße in Berlin's Mitte neighbourhood - a labyrinth of concrete passages mazing into basement vaults and industrial halls."
  },
  {
    name: "Sisyphos",
    address: "Hauptstraße 15, 10317 Berlin",
    description: "Unique club with multiple dance floors and outdoor areas."
  },
  {
    name: "Renate",
    address: "Alt Stralau 70, 10245 Berlin",
    description: "Born from an unrenovated apartment building in Friedrichshain, across the river from Treptower Park.

    Salon Zur Wilden Renate has three main dance floors: Schwarzer Raum on the ground floor, mainly focussing on techno. Then upstairs there is Grüner Raum where it’s all about house, and Roter Raum for all things slow, weird and trippy disco. The atmosphere is that of a theatrical house party. The booking is a mixture of international and local artists. A large outdoor courtyard is open during the summer, which provides another bar with food and plenty of space to hang out."
  },
  {
    name: "RSO.BERLIN",
    address: "Schnellerstrasse 137, 12439 Berlin",
    description: "Griessmuehle moves southeast. From now, we are to be found with new beer garden and open-air area on the former Bärenquell brewery in Berlin-Niederschöneweide. Neither the closure of Griessmuehle, nor the numerous arduous removals and relocations could get us down. We are back—in the old manner, at a new location."
  },
  {
    name: "Anomalie Art Club",
    address: "Storkower Str. 123, 10407 Berlin",
    description: "The Anomaly Art Club is an open forum for art, music, culture, nightlife, fashion, sports and upscale vegetarian cuisine."
  },
  {
    name: "Else",
    address: "An den Treptowers 10, 12435 Berlin",
    description: "Colorful riverside dance club featuring a leafy patio with converted shipping containers."
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

# Create events with lineups
# 15.times do |i|
#  Lineup.create(
#    artist: Artist.offset(rand(Artist.count)).first,
#    event: event
##  )
# end

events = [
  {
    title: "Schrott-Etüde: An Etude for Extinction",
    date: Date.today + i.days,
    description: "A musical composition for multiple percussion, cars and bodies on fire.

    According to Frédéric Chopin, “an étude is a musical composition of considerable difficulty, designed to provide practice material for an instrument and its player.” Yet, they are designed to “always please the audience in concert”.The scene for Schrott-Etüde (Scrap Etude): An Etude for Extinction is the parking lot at Olympiastadion.

    Based on a composition by experimental composer Katharina Ernst and sound designer Stefan Schneider, this Etude once more melts together musical elements and stunt actions. A mixed cast of stunt women, musicians and performers explore new contexts for representation in dance and the possibilities of a 'technical' theatre in a series of joint operatic rituals and orchestrated crash tests.",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vNzVmZmZlOGI0ZDA2OTEzZjMwNGRiYjExMTAxYWQ2ZjQ3NTRjM2M4YS5qcGc=",
    user_id: 2,
    club_id: 2,
    address: "Coubertinplatz, 14053 Berlin"
  },
  {
    title: "House of Lunacy - Midsummer Dreaming",
    date: Date.today + i.days,
    description: "'Are you sure that we are awake? It seems to me that yet we sleep, we dream'...

    The summer of LOVE is here! And we are celebrating those warm summer months and closing with a big juicy bang!

    Its has been a long awaited soiree but finally we get to gather together under the sun and the moon to radiate love and lustful energies with each other once more.

    The Luniverse has finally taken us to the finale of the summer, we've arrived at an exotic and erotic planet filled with beautiful flowers blooming and divine beings, this worlds inhabitants are hedonistic and creative creatures inviting us to play... we can't wait.",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vNGNlYWI5YWQ2ODU5YWQ5ZGQ2MDcyMzdhYzE0NTdiZWJjZDkzM2ZlMy5qcGc=",
    user_id: 2,
    club_id: 6,
    address: "Alt Stralau 70, 10245 Berlin"
  },
  {
    title: "BITE Nite 5 Years",
    date: Date.today + i.days,
    description: "Hardly any label brings 80s influences like EBM, industrial and dark wave into a contemporary techno aesthetic more coherently than the BITE label, co-run by Phase Fatale. For the label's fifth anniversary at Berghain and Panorama Bar, he'll be playing with label acts like Reka, Silent Servant (in a long overdue back2back with Phase Fatale), Unhuman and Vulkanski, resident of Tbilisi's KHIDI club, as well as friends and like-minded acts. Berlin-New York duo Enxin/Onyx, consisting of Tommi Tokyo and Nicky Mao, play dystopian ritual music infused with Mao's ghostly vocals, evoking the broken spirit of Throbbing Gristle. Meanwhile, Sharlese is considered one of the most exciting synth-wave and goth DJs on the American West Coast, serving as resident DJ of Seattle's underground techno collective secondnature and as a member of Black Techno Matters.",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vOGRlMGUyMWZhNjA4ZDY0NzQxYzA4MTk3MDM4MGM0MzM2ZTgyNjMxNi5qcGc=",
    user_id: 2,
    club_id: 1,
    address: "70 Am Wriezener Bahnhof, 10243 Berlin"
  },
  {
    title: "SÄULE",
    date: Date.today + i.days,
    description: "As a member of Madrid's Loopstage collective, Colell explores various, mostly trance-influenced strains of techno that he brings together in his energetic DJ sets. Recently, he launched his own label, Aurora Records. Katie is a newcomer in the contemporary club scene who's been playing a mix of forest trance and urban psy at select events over the past few years. Joining them tonight at Säule is Viennese newskool trance DJ Transki.",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vNWVjODVmYThjODlkYWQ0MTAwOWY3YjM1OTE2NzQ4ZGE4OWNlYWQ2Ny5wbmc=",
    user_id: 2,
    club_id: 1,
    address: "70 Am Wriezener Bahnhof, 10243 Berlin"
  },
  {
    title: "Radiant Records",
    date: Date.today + i.days,
    description: "Radiant Records is part of the expanded universe of the nomadic party series by Byron Yeates and his collective, Radiant Love. Across more than ten releases, a hedonistic prog-trance-ambient-house world unfolds in different tempos and styles, firmly anchored to the queer dancefloors of our time. French duo Baraka, consisting of singer and poet Hawa Sarita and DJ/producer Cristofeu, represents a hybrid dance-pop that brings together Sarita's catchy vocals with her partner's powerful percussion and acid sounds. In addition to their live gig, tonight's label party at Panorama Bar will feature DJ sets from Byron Yeates, Australian DJ Kia and Finnish electro producer Sansibar.",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vNDZkNjQyYTE5ZmU0MzkyYzJiMTM3NTQ4MjQ5ODc1NThjYjZkNjhjNy5wbmc=",
    user_id: 2,
    club_id: 1,
    address: "70 Am Wriezener Bahnhof, 10243 Berlin"
  },
  {
    title: "NEVER SLEEP w/ Gabber Eleganza, Snake Gang live, Soraya & Lizzitsky",
    date: Date.today + i.days,
    description: "ONLINE PRESALE:
    Please note that a presale ticket does not guarantee entry. The club reserves the right to deny entry. Tickets will be automatically refunded in that case. Due to increased security checks at the entrance, there may be an increased waiting time even with a ticket. We ask you to please take this into account and respect it. Thank you.",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vZTcwOGYyYmNlZWQ5MzMxZjM5OTVjZjcwYTgzZWQ0MzQxMzJkYmZmNS5qcGc=",
    user_id: 2,
    club_id: 7,
    address: "Schnellerstrasse 137, 12439 Berlin"
  },
  {
    title: "Grounded Theory [58]",
    date: Date.today + i.days,
    description: "Grounded Theory have been showcasing heavyweight club music for 14 years. This celebratory birthday bash welcomes resident and cofounder Henning Baer, UK techno master DAX J, NYC's high energy rave specialist KYRUH and Herrensauna resident SPFDJ, for a night of no-holds-barred techno. ",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vMWE1ZDU2MGJkZjhhYmQ4NGU1MjA3NTU0MGZmZTEwZTgwOGU2YzE0OC5qcGc=",
    user_id: 2,
    club_id: 7,
    address: "Schnellerstrasse 137, 12439 Berlin"
  },
  {
    title: "ANOMALIE x OXYGEN",
    date: Date.today + i.days,
    description: "Celebrating the new generation of techno DJs like Fatima Hajji, Michael Klein, Koloah, DYEN and Frazi.er, keep your calendar free for this extended 36-hour rave at Anomalie Art Club.",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vODA4NTZmODE3OWEzYmViMTI0OTBjYWQ1ZTVmMTcwMDY4MTMwMmQ3ZS5qcGc=",
    user_id: 2,
    club_id: 8,
    address: "Storkower Str. 123, 10407 Berlin"
  },
  {
    title: "RFLXN x Gravity Network with Bailey Ibbs, Detroit In Effect, JKS, Kaiser & Neri J",
    date: Date.today + i.days,
    description: "Gravity, the European cooperation project aiming to develop electronic music culture by creating a foundation for an expanding network of electronic music venues, in which that we are a part of, returns to RSO. The night sees Molekül co-founder, JKS, return to the ROBUS floor and DJ Bus Replacement on the SUMME floor. The cultural night also features Neri J, Detroit in Effect, and Kaiser.",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vYTMyODkxYjA4YzA4NjZlNzBhNDhjMDYwZGQzNDBiYWE3Zjg1OTk4ZS5qcGc=",
    user_id: 2,
    club_id: 7,
    address: "Schnellerstrasse 137, 12439 Berlin"
  },
  {
    title: "Intercell - Summer Series - Else Berlin",
    date: Date.today + i.days,
    description: "We're glad to announce our second showcase at Else Klub, taking over this amazing venue for another heated summer session on September 2nd. Coming through with a sweet blend of groove, tech-trance and everything in between, and yet again starting off outdoors and extending the dance indoors for the darker dancers.

    Join in on another outburst.",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vNWMyZWViMDU0MzhiMGNiMGQ1MWQ2NThiMTAzMjg4ZTEwOWNhNjZlNS5wbmc=",
    user_id: 2,
    club_id: 9,
    address: "An den Treptowers 10, 12435 Berlin"
  },
  {
    title: "MATTER",
    date: Date.today + i.days,
    description: "INFO

    Where is Else?
    In the heart of East Berlin, right beside Treptower Park SBahn Station.

    What if it rains?
    Else's entire open-air dancefloor is covered by a transparent roof that will keep you warm and dry.

    What's the sound system?
    There's a brand new, high-end sound system: Lambda Labs QX3 and a new DJ booth, which is surrounded by the crowd from all sides.",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vNTViOTQ4NmI1NGUyNzAwYmNkNzdmM2RjYmU3N2FiODY2NGM5YmI3Yy5qcGc=",
    user_id: 2,
    club_id: 9,
    address: "An den Treptowers 10, 12435 Berlin"
  },
  {
    title: "ungesund",
    date: Date.today + i.days,
    description: "Loose vibes, lowkey bangers and a warm summer night. What else does it even need? Expect a load of hypnotic techno, pumping house and eclectic breaks on two floors curated in the best manner with care and love.

    Any form of racism, discrimination, sexism, homophobia or transphobia won’t be tolerated. Please respect the no photo policy, keep your phone in your pocket and enjoy the moment.
    ",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vODI3ZGZkNDc1YTVmOGY5ODMwNzM4MWJiMjMwYmE0Nzk5ZGZjMTI3Ni5qcGc=",
    user_id: 2,
    club_id: 3,
    address: "Markgrafendamm 24c, 10245 Berlin"
  },
  {
    title: "10 JAHRE DIFFUSE REALITY",
    date: Date.today + i.days,
    description: "10 years of love.
    10 years of passion.
    10 years of Diffuse Reality in Berlin.

    3 ROOMS • TECHNO • GARDEN
    *̷ ̷D̷R̷E̷S̷S̷ ̷C̷O̷D̷E̷:̷ ̷T̷O̷ ̷S̷W̷E̷A̷T̷ ̷*̷

    Respect our no video/photo policy.
    Enjoy the moment, dance and connect with the people around you.",
    poster_image: "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9pbWFnZXMucmEuY28vMDI4YjYyM2VhOGIzMjZmZDVkZDY2NWU5ZmYxNzNkZjVlY2Q2N2U5ZC5qcGc=",
    user_id: 2,
    club_id: 3,
    address: "Markgrafendamm 24c, 10245 Berlin"
  }
]

events.each do |event|
  Event.create(
    title: event[:title],
    description: event[:description],
    address: event[:address],
    user: party_promoter,
    date: event[:date],
    club_id: event[:club_id]
  )
  event.accepted!

  rand(1..5).times do
    Lineup.create(
      artist: Artist.offset(rand(Artist.count)).first,
      event: event
    )
  end
end
puts "Seed data has been successfully created."
