module.exports =
  jwt:
    secret: 'BusterIsAJuniorStink'
    session: true

  cookie:
    httpOnly: true
    sameSite: true
    signed: true
    secure: true
    maxAge: 60000 * 10000
  defaultUser:
    username: 'amit'
    password: 'buster'

