ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'peperoni-cafe.com',
  user_name:            'peperoni.cafe.contact@gmail.com',
  password:             'Infini33*',
  authentication:       'plain',
  enable_starttls_auto: true  }