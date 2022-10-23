# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Admin.create!(
     email: '1@1',
     password: '111111'
     )

users = User.create!(
    [
      {email:'user1@test.com',password:'111111',user_name:'イチロー',last_name:'お試し',first_name:'一郎',last_name_kana:'オタメシ',first_name_kana:'イチロー',telephone_number:'111111111',profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
      {email:'user2@test.com',password:'222222',user_name:'ジロー',last_name:'お試し',first_name:'二郎',last_name_kana:'オタメシ',first_name_kana:'ジロー'    ,telephone_number:'222222222',profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},   
      {email:'user3@test.com',password:'333333',user_name:'サブロー',last_name:'お試し',first_name:'三郎',last_name_kana:'オタメシ',first_name_kana:'サブロー',telephone_number:'333333333',profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    ]
    )    

Post.create!(
        [
            { images: [
                ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-1.jpg"), filename:"sample-post1-1.jpg"),
                ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-2.jpg"), filename:"sample-post1-2.jpg"),
                ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-3.jpg"), filename:"sample-post1-3.jpg")
                ],
                caption:'横浜へ行きました。
                         #神奈川県 #中華街 #みなとみらい',
                post_status:0,
                distance:200,
                address:'横浜', 
                user_id: users[0].id
            },
            { images: [
                ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2-1.jpg"), filename:"sample-post2-1.jpg"),
                ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2-2.jpg"), filename:"sample-post2-2.jpg"),
                ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2-3.jpg"), filename:"sample-post2-3.jpg")
                ], 
                caption:'安住神社へ行きました。
                         #栃木県 #バイク神社 #安住 ',
                post_status:0,
                distance:300,
                address:'安住神社', 
                user_id: users[1].id
            },
             { images: [
                ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3-1.jpg"), filename:"sample-post3-1.jpg"),
                ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3-2.jpg"), filename:"sample-post3-2.jpg"),
                ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3-3.jpg"), filename:"sample-post3-3.jpg")
                ], 
                caption:'大阪へ行きました。
                         #大阪 #道頓堀 #地蔵 ',
                post_status:0,
                distance:900,
                address:'道頓堀', 
                user_id: users[2].id
            }
        
        
        ]
    )