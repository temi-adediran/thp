zones = ["A5", "A2", "A3", "A4", "A1"]
zones.each do |name|
  Zone.create(name: name)
end

chapters = ["The Favoured Haven", "The Rich Haven", "The Treasured Haven"]
chapters.each do |name|
  Chapter.create(name: name, zone_id: 1)
end

User.create(
  email: "sample1@haven.org",
  first_name: "Admin1",
  last_name: "Sample1",
  password: "password",
  zone_id: 1,
  chapter_id: 1
)

User.create(
  email: "sample2@haven.org",
  first_name: "Admin2",
  last_name: "Sample2",
  password: "password",
  zone_id: 1,
  chapter_id: 1
)

User.create(
  email: "sample3@haven.org",
  first_name: "Admin3",
  last_name: "Sample3",
  password: "password",
  zone_id: 2,
  chapter_id: 2
)

User.create(
  email: "sample4@haven.org",
  first_name: "Admin4",
  last_name: "Sample4",
  password: "password",
  zone_id: 3,
  chapter_id: 3
)

User.create(
  email: "sample5@haven.org",
  first_name: "Admin5",
  last_name: "Sample5",
  password: "password",
  zone_id: 1,
  chapter_id: 1
)

