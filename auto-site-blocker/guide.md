🕒 Auto Site Blocker
Automatically blocks YouTube, Reddit, and any other distracting sites at specific times using systemd timers.
Tested on Linux (Arch / KDE), but works on any systemd-based distro.

1. Copy or symlink files
(recommended symlink)

#scripts
sudo ln -sf "$(pwd)/scripts/block_sites.sh" /usr/local/bin/block_sites.sh
sudo ln -sf "$(pwd)/scripts/unblock_sites.sh" /usr/local/bin/unblock_sites.sh

#systemd units
sudo ln -sf "$(pwd)/systemd/block-sites.service" /etc/systemd/system/block-sites.service
sudo ln -sf "$(pwd)/systemd/block-sites.timer" /etc/systemd/system/block-sites.timer
sudo ln -sf "$(pwd)/systemd/unblock-sites.service" /etc/systemd/system/unblock-sites.service
sudo ln -sf "$(pwd)/systemd/unblock-sites.timer" /etc/systemd/system/unblock-sites.timer

2. Backup your original host file

sudo cp /etc/hosts /etc/hosts.clean
sudo cp "$(pwd)/hosts.blocked" /etc/hosts.blocked

3. Edit /etc/hosts.blocked

Right now this file block only Youtube and Reddit, but you can edit it to you preference.

sudo nano /etc/hosts.blocked

4. Change the blocking schedule

Timers control when blocking and unblocking happens

nano systemd/block-sites.timer
nano systemd/unblock-sites.timer

and edit in each file
OnCalendar=*-*-* 21:30:00

5. Start service

sudo systemctl start block-sites.service
sudo systemctl start unblock-sites.service
sudo systemctl daemon-reload

6. Verify

systemctl list-timers | grep sites




