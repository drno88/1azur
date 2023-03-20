#/bin/bash
#AZUR 0.12.1
#Download Music and add to playlists
sleep 5
rm /var/azuracast/station_playlists.sql;
rm /var/azuracast/station_playlist_folders.sql;
rm /var/azuracast/station_schedules.sql;
#Add IP from Main or comment mysql
#mysqldump -c -u root -pAbishot999 -h 172.16.103.253 azuracast station_playlists > /var/azuracast/station_playlists.sql;
#mysqldump -c -u root -pAbishot999 -h 172.16.103.253 azuracast station_playlist_folders > /var/azuracast/station_playlist_folders.sql;
#mysqldump -c -u root -pAbishot999 -h 172.16.103.253 azuracast station_schedules > /var/azuracast/station_schedules.sql;
#mysql -u root -pAbishot999 azuracast < /var/azuracast/station_playlists.sql;
#mysql -u root -pAbishot999 azuracast < /var/azuracast/station_playlist_folders.sql;
#mysql -u root -pAbishot999 azuracast < /var/azuracast/station_schedules.sql;
rm /var/azuracast/station_playlists.sql;
rm /var/azuracast/station_playlist_folders.sql;
rm /var/azuracast/station_schedules.sql;
#Sync Muzik
rclone sync cloud: /var/azuracast/muzik/muzik_sync --create-empty-src-dirs -P --transfers=1 --checkers=1;
sleep 5
php /var/azuracast/www/bin/console sync:run medium;
sleep 5
php /var/azuracast/www/bin/console sync:run medium;
sleep 5
php /var/azuracast/www/bin/console sync:run medium;
sleep 10
#Add music to playlists
mysql -u root -pAbishot999 -D azuracast -e "insert into station_playlist_media(playlist_id, media_id, weight, last_played) select (select id from station_playlists where name='1_day'), id, 0, 0 from station_media m where path like 'muzik_sync/1_day/%' and not exists (select * from station_playlist_media where media_id=m.id and playlist_id=(select id from station_playlists where name='1_day'))";
mysql -u root -pAbishot999 -D azuracast -e "insert into station_playlist_media(playlist_id, media_id, weight, last_played) select (select id from station_playlists where name='1_utro'), id, 0, 0 from station_media m where path like 'muzik_sync/1_utro/%' and not exists (select * from station_playlist_media where media_id=m.id and playlist_id=(select id from station_playlists where name='1_utro'))";
mysql -u root -pAbishot999 -D azuracast -e "insert into station_playlist_media(playlist_id, media_id, weight, last_played) select (select id from station_playlists where name='1_vecher'), id, 0, 0 from station_media m where path like 'muzik_sync/1_vecher/%' and not exists (select * from station_playlist_media where media_id=m.id and playlist_id=(select id from station_playlists where name='1_vecher'))";
mysql -u root -pAbishot999 -D azuracast -e "insert into station_playlist_media(playlist_id, media_id, weight, last_played) select (select id from station_playlists where name='2_day'), id, 0, 0 from station_media m where path like 'muzik_sync/2_day/%' and not exists (select * from station_playlist_media where media_id=m.id and playlist_id=(select id from station_playlists where name='2_day'))";
mysql -u root -pAbishot999 -D azuracast -e "insert into station_playlist_media(playlist_id, media_id, weight, last_played) select (select id from station_playlists where name='2_utro'), id, 0, 0 from station_media m where path like 'muzik_sync/2_utro/%' and not exists (select * from station_playlist_media where media_id=m.id and playlist_id=(select id from station_playlists where name='2_utro'))";
mysql -u root -pAbishot999 -D azuracast -e "insert into station_playlist_media(playlist_id, media_id, weight, last_played) select (select id from station_playlists where name='2_vecher'), id, 0, 0 from station_media m where path like 'muzik_sync/2_vecher/%' and not exists (select * from station_playlist_media where media_id=m.id and playlist_id=(select id from station_playlists where name='2_vecher'))";
mysql -u root -pAbishot999 -D azuracast -e "insert into station_playlist_media(playlist_id, media_id, weight, last_played) select (select id from station_playlists where name='1_reklama'), id, 0, 0 from station_media m where path like 'muzik_sync/1_reklama/%' and not exists (select * from station_playlist_media where media_id=m.id and playlist_id=(select id from station_playlists where name='1_reklama'))";
mysql -u root -pAbishot999 -D azuracast -e "insert into station_playlist_media(playlist_id, media_id, weight, last_played) select (select id from station_playlists where name='2_reklama'), id, 0, 0 from station_media m where path like 'muzik_sync/2_reklama/%' and not exists (select * from station_playlist_media where media_id=m.id and playlist_id=(select id from station_playlists where name='2_reklama'))";
mysql -u root -pAbishot999 -D azuracast -e "insert into station_playlist_media(playlist_id, media_id, weight, last_played) select (select id from station_playlists where name='3_reklama'), id, 0, 0 from station_media m where path like 'muzik_sync/3_reklama/%' and not exists (select * from station_playlist_media where media_id=m.id and playlist_id=(select id from station_playlists where name='3_reklama'))";
mysql -u root -pAbishot999 -D azuracast -e "insert into station_playlist_media(playlist_id, media_id, weight, last_played) select (select id from station_playlists where name='1_special'), id, 0, 0 from station_media m where path like 'muzik_sync/1_special/%' and not exists (select * from station_playlist_media where media_id=m.id and playlist_id=(select id from station_playlists where name='1_special'))";
mysql -u root -pAbishot999 -D azuracast -e "insert into station_playlist_media(playlist_id, media_id, weight, last_played) select (select id from station_playlists where name='2_special'), id, 0, 0 from station_media m where path like 'muzik_sync/2_special/%' and not exists (select * from station_playlist_media where media_id=m.id and playlist_id=(select id from station_playlists where name='2_special'))";
mysql -u root -pAbishot999 -D azuracast -e "insert into station_playlist_media(playlist_id, media_id, weight, last_played) select (select id from station_playlists where name='3_special'), id, 0, 0 from station_media m where path like 'muzik_sync/3_special/%' and not exists (select * from station_playlist_media where media_id=m.id and playlist_id=(select id from station_playlists where name='3_special'))";
sleep 5
php /var/azuracast/www/bin/console sync:run short;
php /var/azuracast/www/bin/console sync:run medium;
php /var/azuracast/www/bin/console sync:run short;
sleep 5
php /var/azuracast/www/bin/console sync:run medium;
php /var/azuracast/www/bin/console sync:run short;
sleep 5
php /var/azuracast/www/bin/console sync:run medium;
php /var/azuracast/www/bin/console sync:run short;
