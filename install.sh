sudo apt-get update 

sudo apt-get upgrade -y

sudo apt install curl apt-transport-https -y

sudo curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

echo "deb https://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list

sudo apt update

sudo apt install syncthing -y

echo "[Unit]
Description=Syncthing - Open Source Continuous File Synchronization for %I
Documentation=man:syncthing(1)
After=network.target

[Service]
User=%i
ExecStart=/usr/bin/syncthing -no-browser -gui-address="0.0.0.0:8384" -no-restart -logflags=0
Restart=on-failure
SuccessExitStatus=3 4
RestartForceExitStatus=3 4

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/syncthing@.service

sudo systemctl daemon-reload

sudo systemctl start syncthing@$USER

sudo systemctl enable syncthing@$USER
