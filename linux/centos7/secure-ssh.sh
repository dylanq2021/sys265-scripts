#SECURE-SSH.SH
#AUTHOR DYLANQ2021
#Creates a new ssh user called $1
#Adss a public key to that users authorized keys file
#Removes roots ability to ssh in

#declare user name
echo -e "What is your username?: \c "
read user
#add user
sudo useradd $user
#let the user know it was successful
echo $user created!
#make directory
sudo mkdir /home/$user/.ssh
#copy public key
sudo cp /home/dylan/sys265-scripts/linux/public-keys/sys265.pub /home/$user/.ssh/authorized_keys
#change permissions
sudo chmod 700 /home/$user/.ssh
sudo chmod 600 /home/$user/.ssh/authorized_keys
sudo chown -R $user:$user /home/$user/.ssh
#permit root login disable
sudo printf '\n%s\n' 'PermitRootLogin no' >> /etc/ssh/sshd_config
sudo systemctl restart sshd
echo permit root login disabled
