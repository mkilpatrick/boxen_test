class yext::applications {
  notify { 'class yext::applications declared': }

  # Disable Gatekeeper so you can install any package you want
  property_list_key { 'Disable Gatekeeper':
    ensure => present,
    path   => '/var/db/SystemPolicy-prefs.plist',
    key    => 'enabled',
    value  => 'no',
  }


  # Common applications
  install cyberduck
  install chrome
  install firefox
  install sourcetree
  package { 'Sketch':
    ensure   => installed,
    source   => 'https://www.sketchapp.com/static/download/sketch.zip',
    provider => compressed_app
  }
  include sublime_text
  sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

}