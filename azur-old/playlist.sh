#/bin/bash
#AZUR 0.9.6
#Download Music and add to playlists
sleep 30
rm /var/azuracast/playlist.sql
rclone sync cloud: /var/azuracast/muzik/muzik_sync --create-empty-src-dirs -P --transfers=1 --checkers=1;
sleep 10
rclone sync cloud: /var/azuracast/muzik/muzik_sync --create-empty-src-dirs -P --transfers=1 --checkers=1;
php /var/azuracast/www/util/cli.php sync:run medium;
php /var/azuracast/www/util/cli.php sync:run short;
sleep 10
php /var/azuracast/www/util/cli.php sync:run medium;
php /var/azuracast/www/util/cli.php sync:run short;
sleep 10
php /var/azuracast/www/util/cli.php sync:run medium;
php /var/azuracast/www/util/cli.php sync:run short;
sleep 10
php /var/azuracast/www/util/cli.php sync:run medium;
php /var/azuracast/www/util/cli.php sync:run short;
sleep 10
rclone sync cloud: /var/azuracast/muzik/muzik_sync --create-empty-src-dirs -P --transfers=1 --checkers=1;
sleep 10
php /var/azuracast/www/util/cli.php sync:run medium;
php /var/azuracast/www/util/cli.php sync:run short;
sleep 10
php /var/azuracast/www/util/cli.php sync:run medium;
php /var/azuracast/www/util/cli.php sync:run short;
sleep 5
#Add IP from Main or comment mysql
#mysqldump -c -u root -pAbishot999 -h 172.16.101.253 azuracast station_playlists > /var/azuracast/playlist.sql;
#mysql -u root -pAbishot999 azuracast < /var/azuracast/playlist.sql;
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
php /var/azuracast/www/util/cli.php sync:run medium;
php /var/azuracast/www/util/cli.php sync:run short;
sleep 10
php /var/azuracast/www/util/cli.php sync:run medium;
php /var/azuracast/www/util/cli.php sync:run short;
sleep 10
php /var/azuracast/www/util/cli.php sync:run medium;
php /var/azuracast/www/util/cli.php sync:run short;
sleep 10
php /var/azuracast/www/util/cli.php sync:run medium;
php /var/azuracast/www/util/cli.php sync:run short;
sleep 10
php /var/azuracast/www/util/cli.php sync:run medium;
php /var/azuracast/www/util/cli.php sync:run short;
sleep 10
php /var/azuracast/www/util/cli.php sync:run medium;
php /var/azuracast/www/util/cli.php sync:run short;
sleep 5
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
sleep 2
pactl set-sink-volume 0 90%
sleep 2
pactl set-sink-volume 0 80%
sleep 2
pactl set-sink-volume 0 70%
sleep 2
pactl set-sink-volume 0 60%
sleep 1
pactl set-sink-volume 0 50%
sleep 1
pactl set-sink-volume 0 40%
sleep 1
pactl set-sink-volume 0 30%
sleep 1
pactl set-sink-volume 0 20%
sleep 1
php /var/azuracast/www/util/cli.php sync:run short;
sleep 1
php /var/azuracast/www/util/cli.php azuracast:radio:restart;
sleep 2
php /var/azuracast/www/util/cli.php sync:run short;
sleep 1
pactl set-sink-volume 0 60%
sleep 1
pactl set-sink-volume 0 70%
sleep 1
pactl set-sink-volume 0 80%
sleep 1
pactl set-sink-volume 0 90%
sleep 1
pactl set-sink-volume 0 100%
rm /var/azuracast/playlist.sql
rclone sync cloud: /var/azuracast/muzik/muzik_sync --create-empty-src-dirs -P --transfers=1 --checkers=1;
sleep 20
rclone sync cloud: /var/azuracast/muzik/muzik_sync --create-empty-src-dirs -P --transfers=1 --checkers=1;
sleep 5
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
