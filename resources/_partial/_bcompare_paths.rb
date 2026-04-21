# frozen_string_literal: true

property :version,
         String,
         default: '4.4.7.28397',
         description: 'Beyond Compare version including build number.'

property :install_dir,
         String,
         default: lazy { default_install_dir(version) },
         description: 'Installation directory for Beyond Compare.'

property :bcompare_exe,
         String,
         default: lazy { default_bcompare_exe(version) },
         description: 'Full path to BCompare.exe.'
