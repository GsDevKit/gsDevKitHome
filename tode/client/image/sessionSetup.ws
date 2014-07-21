| gsDevKitRoot sessionName stoneName |
gsDevKitRoot := '/opt/git/gsDevKitHome/'
sessionName := 'gsDevKit'.
stoneName := 'gsDevKit'.
TDShell gsDevKitRoot: gsDevKitRoot.
(TDSessionDescription new
    name: sessionName;
    gemstoneVersion: '3.2.0';
    stoneHost: 'localhost';
    stoneName: 'gsDevKit';
    gemHost: 'localhost';
    netLDI: '50377';
    gemTask: 'gemnetobject';
    userId: 'DataCurator';
    password: 'swordfish';
    osUserId: '';
    osPassword: '';
    backupDirectory: '';
    dataDirectory: '';
    serverGitRoot: '/opt/git';
    serverTodeRoot: gsDevKitRoot, '/dev/tode`;
    yourself) exportTo: TDShell sessionDescriptionHome.
TDShell testLogin: sessionName.
