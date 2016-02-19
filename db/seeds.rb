# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Faculty.create(
	[
		{
			name: 'Ingeniería de Sistemas e Informática',
			parent_id: nil
		},
		{
			name: 'Ingeniería de Sistemas',
			parent_id: 1
		},
		{
			name: 'Ingeniería de Software',
			parent_id: 1
		}
	]
)

Course.create(
	[
		{
			code: 'C2015-001',
			name: 'Programación I',
			faculty_id: 3
		},
		{
			code: 'C2015-002',
			name: 'Estructura de Datos I',
			faculty_id: 3
		},
		{
			code: 'C2015-003',
			name: 'Diseño de Software',
			faculty_id: 3
		},
		{
			code: 'C2015-004',
			name: 'Calidad de Software',
			faculty_id: 3
		},
		{
			code: 'C2015-005',
			name: 'Sistemas Inteligentes',
			faculty_id: 2
		},
		{
			code: 'C2015-006',
			name: 'Redes y Transmisión de Datos',
			faculty_id: 2
		},
		{
			code: 'C2015-007',
			name: 'Seguridad de la Información',
			faculty_id: 2
		},
		{
			code: 'C2015-008',
			name: 'Base de Datos',
			faculty_id: 2
		}
	]
)