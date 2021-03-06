# Generated by git-ship. See 'git-ship --man' for help or https://github.com/jhthorsen/app-git-ship
use ExtUtils::MakeMaker;
WriteMakefile(
  NAME => 'Applify',
  AUTHOR => 'Jan Henning Thorsen <jhthorsen@cpan.org>',
  LICENSE => 'artistic_2',
  ABSTRACT_FROM => 'lib/Applify.pm',
  VERSION_FROM => 'lib/Applify.pm',
  EXE_FILES => [qw(  )],
  META_MERGE => {
    resources => {
      bugtracker => 'https://github.com/jhthorsen/applify/issues',
      homepage => 'https://github.com/jhthorsen/applify',
      repository => 'https://github.com/jhthorsen/applify.git',
    },
  },
  BUILD_REQUIRES => {
  'Test::More' => '0.88'
}
,
  PREREQ_PM => {
  'Cwd' => '3.31',
  'File::Basename' => '2.70',
  'Getopt::Long' => '2.38'
}
,
  test => { TESTS => 't/*.t' },
);
