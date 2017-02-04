puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

30.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
20.times do
  SubjectItem.create!(
    title: Faker::Lorem.sentence,
    teacher: teachers.sample
  )
end

40.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.between(20.years.ago, 10.years.ago)
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

Student.all.each do |student|
  year = 2015
  6.times do |i|
      Payment.create!(
        student: student,
        year: year,
        month: i+7,
        paid_at: Faker::Date.between(Date.new(year, i+7, 1), Date.new(year, i+7, 28))
      )
  end

  year = 2016
  6.times do |i|
      Payment.create!(
        student: student,
        year: year,
        month: i+1,
        paid_at: Faker::Date.between(Date.new(year, i+1, 1), Date.new(year, i+1, 28))
      )
  end

  Payment.create!(
    student: student,
    year: year,
    month: 7,
  )
end

puts "Seeds: done"
