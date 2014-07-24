# Yet another ssmtp module
class ssmtp(
  $email=false,
  $mailhub='smtp.gmail.com:587',
  $user=false,
  $pass=false,
){

  validate_string($email)
  validate_string($user)
  validate_string($pass)

  package{'ssmtp':
    ensure  => present
  } ->

  file { '/etc/ssmtp/ssmtp.conf':
    ensure  => file,
    mode    => '0644',
    content => template('ssmtp/ssmtp.conf.erb'),
    owner   => root,
    group   => root,
  }

}
