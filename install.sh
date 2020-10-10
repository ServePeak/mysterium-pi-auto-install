
# https://www.sigmdel.ca/michel/ha/wireguard/wireguard_02_en.html
echo "deb http://archive.raspbian.org/raspbian testing main" | sudo tee --append /etc/apt/sources.list.d/testing.list
sudo apt update
printf 'Package: *\nPin: release a=testing\nPin-Priority: 50\n' | sudo tee --append /etc/apt/preferences.d/limit-testing
sudo apt update && sudo apt upgrade -y

sudo apt install raspberrypi-kernel-headers wireguard openvpn -y

# Download the latest armhf package from releases
curl -s https://api.github.com/repos/mysteriumnetwork/node/releases/latest | grep browser_download_url | grep armhf.deb | cut -d '"' -f 4 | wget -i -
sudo dpkg -i myst_linux_armhf.deb
rm myst_linux_armhf.deb
