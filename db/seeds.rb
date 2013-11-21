# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Candidate.delete_all
p "creating candidates"
candidates = Candidate.create([
	{ name: "António Fonseca", photo: "#{UIFaces::face(1)}", current_position: "Software Engineering Student at FEUP" },
	{ name: "Francisco Seabra", photo: "#{UIFaces::face(2)}", current_position: "Freelancer" },
	{ name: "João Durães", photo: "#{UIFaces::face(4)}", current_position: "Backend Developer at Blip" },
	{ name: "Francisco Pinto", photo: "#{UIFaces::face(5)}", current_position: "Backend Engineer at Blip" },
	{ name: "Carlos Araújo", photo: "#{UIFaces::face(6)}", current_position: "Frontend Engineer at Blip" },
	{ name: "Luís Pinho", photo: "#{UIFaces::face(7)}", current_position: "Software Engineering Student at FEUP" },
	{ name: "Miguel Coutinho", photo: "#{UIFaces::face(8)}", current_position: "Delivery Manager at FEUP" },
	{ name: "André Ferreira", photo: "#{UIFaces::face(9)}", current_position: "Intern at Blip" },
	{ name: "Luís Carvalho", photo: "#{UIFaces::face(12)}", current_position: "Frontend Developer at Blip" },
	{ name: "João Portela", photo: "#{UIFaces::face(13)}", current_position: "Software Engineer at Blip" },
	{ name: "João Coelho", photo: "#{UIFaces::face(15)}", current_position: "Software Developer at Blip" },
	{ name: "Maria João Bastos", photo: "#{UIFaces::face(16)}", current_position: "Quality Assurance Engineer at Blip" }
])
p "candidates created"

Interviewer.delete_all
p "creating interviewers"
interviewers = Interviewer.create([
	{ name: "Sérgio Lopes", photo: "#{UIFaces::face(3)}", position: "Delivery Manager at Blip" },
	{ name: "José Fonseca", photo: "#{UIFaces::face(10)}", position: "Head of Sports at Blip" },
	{ name: "Daniel Lopes", photo: "#{UIFaces::face(11)}", position: "Senior Developer at Blip" },
	{ name: "Vasco Costa", photo: "#{UIFaces::face(14)}", position: "Senior Frontend Engineer at Blip" }
])
p "interviewers created"

Question.delete_all
p "creating questions"
questions = Question.create([
	{ title: "Array Basics", difficulty: 1, category: "Javascript" },
	{ title: "Object Basics", difficulty: 1, category: "Javascript" },
	{ title: "DOM Manipulation Basics", difficulty: 1, category: "Javascript" },
	{ title: "Event Basics", difficulty: 2, category: "Javascript" },
	{ title: "Closures", difficulty: 1, category: "Javascript" },
	{ title: "Prototypes", difficulty: 1, category: "Javascript" },
	{ title: "Best Practices", difficulty: 1, category: "Javascript" },


	{ title: "Selectors Basics", difficulty: 1, category: "CSS" },
	{ title: "Selectors Performance", difficulty: 3, category: "CSS" },
	{ title: "CSS Organization", difficulty: 3, category: "CSS" },
	{ title: "CSS3 Stuff", difficulty: 2, category: "Javascript" }
])
p "questions created"

Position.delete_all
p "creating positions"
positions = Position.create([
	{ name: "Frontend Engineer"},
	{ name: "Backend Engineer"},
	{ name: "Quality Assurance Engineer"}
])
p "positions created"


Interview.delete_all
p "creating interviews"
interviews = Interview.create([
	{ position_id: "Frontend Developer", candidate_id: candidates.first.id, interviewer_id: interviewers.first.id, position_id: positions.first.id, state: "SCHEDULE" },
	{ position_id: "Frontend Developer", candidate_id: candidates.last.id,  interviewer_id: interviewers.first.id, position_id: positions.first.id, state: "SCHEDULE" }
])
p "interviews created"