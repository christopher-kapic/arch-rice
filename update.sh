echo 'Currently installed'
pacman -Q | wc -l
echo 'programs.'

echo 'Explicitly installed packages:'
pacman -Qe

sudo pacman -Syyu
