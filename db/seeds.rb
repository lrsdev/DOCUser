Location.create(id: 1, name: 'St Claire', location_type: 0, blurb: 'Nice beach', 
                dog_guide_lines: 'No dogs North of esplanade', dog_status: 0,
                image: open('http://ih0.redbubble.net/image.3998569.1307/flat,550x550,075,f.jpg', "r"),
               image_file_name: 'stclaire.jpg')

Location.create(id: 2, name: 'St Kilda', location_type: 0, blurb: 'Okay beach',
                dog_guide_lines: 'Dogs okay in all areas of beach', dog_status: 0,
                image: open('http://images.travelpod.com/tw_slides/ta00/cb6/fd0/st-kilda-beach-dunedin-christchurch.jpg', "r"),
                image_file_name: 'stkilda.jpg')

User.create(id: 1, first_name: 'Samuel', last_name: 'Stewart', email: 'sam@stewpot.nz', password: 'foo')

Report.create(id: 1, location_id: 1, user_id: 1, lat: -78.100, long: 123.4356, blurb: "Spotted seal near beach entrance",
             image: open('http://d1k2jfc4wnfimc.cloudfront.net/assets/matakohe/images/contentfill.jpg', "r"),
             image_file_name: 'penguin.jpg')

Report.create(id: 2, location_id: 2, user_id: 1, lat: -23.100, long: -134.234, blurb: "Spotted Penguin near lookout",
             image: open('https://animalblawg.files.wordpress.com/2010/11/the-california-sea-lion.jpg', "r"),
             image_file_name: 'sealion.jpg')

