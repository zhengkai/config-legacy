<?php
$cfg['PmaAbsoluteUri'] = 'http://pma/';
$cfg['SuhosinDisableWarning'] = true;
$cfg['blowfish_secret'] = 'RDVmPiNFXRSuFMYzNlBXHEqO3QSfRc';

$cfg['Servers'] = array();

$i = 1;
$cfg['Servers'][$i]['verbose'] = 'Koala';
$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['socket'] = '/var/run/mysqld/mysqld.sock';
$cfg['Servers'][$i]['connect_type'] = 'socket';
$cfg['Servers'][$i]['extension'] = 'mysqli';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = '';
$cfg['Servers'][$i]['hide_db'] = 'mysql|information_schema';

$cfg['ThemeDefault'] = 'original';
$cfg['AjaxEnable'] = FALSE;

$cfg['MaxRows'] = 50;
$cfg['Order'] = 'DESC';
$cfg['SQLQuery']['ShowAsPHP'] = FALSE;
$cfg['SuhosinDisableWarning'] = TRUE;
$cfg['ShowPhpInfo'] = TRUE;
$cfg['LeftFrameDBTree'] = FALSE;
$cfg['LeftDisplayLogo'] = FALSE;

$cfg['SaveDir'] = '/www/pma/sql';
$cfg['TempDir'] = '/www/pma/sql';
$cfg['UploadDir'] = '/www/pma/sql';

