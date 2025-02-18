Usuario.create!(
  email: 'admin@exemplo.com',
  password: '123123', 
  password_confirmation: '123123', 
  name: 'admin',
  role: 3,
)
Usuario.create!(
  email: 'atendente@exemplo.com',
  password: '123123', 
  password_confirmation: '123123', 
  name: 'atendente',
  role: 2,
)
Usuario.create!(
  email: 'funcionario@exemplo.com',
  password: '123123', 
  password_confirmation: '123123', 
  name: 'funcionario',
  role: 1,
)
Unidade.create!(
  name: 'SP',
  usuario_id: nil
)