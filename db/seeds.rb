Animal.create(name: 'Yellow-Eyed Penguin', blurb: 'Some blurb', ext_url: 'wikipedia.org',
             image: open('https://upload.wikimedia.org/wikipedia/commons/4/4f/Yellow-eyed_Penguin_MC.jpg', "r"),
             image_file_name: 'yelloweye.jpg')

Animal.create(name: 'Blue Penguin', blurb: 'Some blurb', ext_url: 'wikipedia.org',
             image: open('https://upload.wikimedia.org/wikipedia/commons/3/38/Eudyptula_minor_Bruny_1.jpg', "r"),
             image_file_name: 'bluepenguin.jpg')
        
Animal.create(name: 'Sea Lion', blurb: 'Some blurb', ext_url: 'wikipedia.org',
             image: open('https://upload.wikimedia.org/wikipedia/commons/b/b9/New_Zealand_Sea_Lion.jpg', "r"),
             image_file_name: 'sealion.jpg')

Location.create(id: 1, 
                name: 'St Claire', 
                category: 0,
                blurb: 'Nice beach, just 5 minutes drive from the City Center', 
                geolocation: 'POINT(-45.911775 170.490659)',
                image: open('http://ih0.redbubble.net/image.3998569.1307/flat,550x550,075,f.jpg', "r"),
                image_file_name: 'stclaire.jpg')

DogStatus.create(id: 1,
                 location_id: 1,
                 status: 0,
                 guidelines: 'Dogs are not allowed on the beach from the Salt Water Pool to the nearest piles on the beach to the North.')

Location.create(id: 2,
                name: 'St Kilda', 
                category: 0, 
                blurb: '5 minutes drive from the city, South of St. Claire.',
                geolocation: 'POINT(-45.908461 170.516194)',
                image: open('http://images.travelpod.com/tw_slides/ta00/cb6/fd0/st-kilda-beach-dunedin-christchurch.jpg', "r"),
                image_file_name: 'stkilda.jpg')

DogStatus.create(id: 2,
                 location_id: 2,
                 status: 1,
                 guidelines: 'Dogs allowed off lead. Take care around rocks at the extreme North end of the beach, wildlife maye be present here.')

Location.create(id: 3,
                name: 'Allans Beach',
                category: 0,
                blurb: 'Lovely beach out on the peninsula, backdrop to Papanui inlet.',
                geolocation: 'POINT(-45.875067 170.701030)',
                image: open('http://images.fineartamerica.com/images-medium-large/allans-beach--new-zealand-czrart.jpg', "r"),
                image_file_name: 'allans.jpg')

DogStatus.create(id: 3,
                 location_id: 3,
                 status: 2,
                 guidelines: 'Dogs allowed everywhere.')

Location.create(id: 4,
                name: 'Brighton Beach',
                category: 0,
                blurb: 'Located 30 minutes drive South of the city, its great.',
                geolocation: 'POINT(-45.9468324 170.335150099)',
                image: open('http://www.wallyandbarbara.com/newzealand/images4/P1040906.JPG', "r"),
                image_file_name: 'brighton.jpg')

DogStatus.create(id: 4,
                 location_id: 4,
                 status: 1,
                 guidelines: 'Dogs not allowed within the bay from the Big Rock to the small cliff at the North end of the domain including the estuary and all of the beach within the confines of Brighton Road. Dogs allowed off lead elsewhere.')


Location.create(id: 5,
                name: 'Tunnel Beach',
                category: 0,
                blurb: 'Best at low tide this twenty minute easy walk.',
                geolocation: 'POINT(-45.920753 170.459245)',
                image: open('http://www.chrisgin.com/images/seascapes/large/TunnelBeach_1095.jpg', "r"),
                image_file_name: 'tunnelbeach.jpg')

DogStatus.create(id: 5,
                 location_id: 5,
                 status: 0,
                 guidelines: 'Dogs allowed on a leash.')

Report.create(location_id: 1, geolocation: 'POINT(-45.912665 170.489735)', blurb: "Spotted Penguin playing in the surf",
             image: open('http://d1k2jfc4wnfimc.cloudfront.net/assets/matakohe/images/contentfill.jpg', "r"),
             image_file_name: 'penguin.jpg',created_at: DateTime.now, animal_id: 1)

Report.create(location_id: 1, geolocation: 'POINT(-45.913587 170.488179)', blurb: "Spotted Penguin shore near Salt Water Pool",
             image: open('http://d1k2jfc4wnfimc.cloudfront.net/assets/matakohe/images/contentfill.jpg', "r"),
             image_file_name: 'penguin.jpg',created_at: DateTime.now, animal_id: 2)

Report.create(location_id: 2, geolocation: 'POINT(-45.908496 170.531367)', blurb: "Spotted Sea Lion near lookout, far North end of beach.",
             image: open('https://animalblawg.files.wordpress.com/2010/11/the-california-sea-lion.jpg', "r"),
             image_file_name: 'sealion.jpg',created_at: DateTime.now, animal_id: 3)


AnimalLocation.create(animal_id: 1, location_id: 1)
AnimalLocation.create(animal_id: 2, location_id: 1)
AnimalLocation.create(animal_id: 3, location_id: 2)
