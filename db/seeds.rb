User.create(name: "Admin", email: "admin@example.com", password: "abc123", password_confirmation: "abc123", admin: 1)
(1..100).each do |i| 
  User.create(name: "User#{i}", email: "user#{i}@example.com", password: "abc123", password_confirmation: "abc123")
end

subject_list = [
  "MySQL",
  "MySQL Exercise",
  "Ruby on Rails",
  "Git"
]
subject_list.each do |name|
  Subject.create(name: name)
end

#TODO 
=begin
subject_list = [
  "MySQL",
  "MySQL Exercise",
  "Ruby on Rails",
  "Git"
]
subject_list.each do |name|
  Subject.create(name: name)
end

sample_text = %w(hi hello bye ohayou konnichiwa konbanwa arigatou goodnight goodmorning sayounara nippon english england vietnam vietnamese)
type = "T"
(1..100).each do |i|
  subject_id = i/25 # 1~4
  content = sample_text.shuffle[0..5].join(" ")
  answer = content.reverse
  Question.create(subject_id: subject_id, type: type, content: content, answer: answer)
end

type = "S"
separator = "[|]"
model_answer = %w(0 0 0 1)
(1..100).each do |i|
  subject_id = i/25 # 1~4
  content = sample_text.shuffle[0..5].join(" ")
  content << separator << sample_text.shuffle[0..3].join(separator)
  answer = model_answer.shuffle.join()
  Question.create(subject_id: subject_id, type: type, content: content, answer: answer)
end

type = "M"
separator = "[|]"
model_answer = %w(0 1 0 1)
(1..100).each do |i|
  subject_id = i/25 # 1~4
  content = sample_text.shuffle[0..5].join(" ")
  content << separator << sample_text.shuffle[0..3].join(separator)
  answer = model_answer.shuffle.join()
  Question.create(subject_id: subject_id, type: type, content: content, answer: answer)
end

type = "E"
(1..20).each do |i|
  subject_id = i/5
  content = sample_text.shuffle[0..9].join(" ")
  answer = "No sample answer"
  Question.create(subject_id: subject_id, type: type, content: content, answer: answer)
end

Exam.create(subject_id: 1, name: "Exam 1", form: "MMMSSSTTTEEE")
Exam.create(subject_id: 2, name: "Exam 2", form: "SSSTTTEEEMMM")
Exam.create(subject_id: 3, name: "Exam 3", form: "TTTEEEMMMSSS")
Exam.create(subject_id: 4, name: "Exam 4", form: "MESTMESTQQQQ")

(1..20).each do |i|
  user_id = User.find(i).id
  exam_id = i/5
  AnswerSheet.create(user_id: user_id, exam_id: exam_id)
end
=end