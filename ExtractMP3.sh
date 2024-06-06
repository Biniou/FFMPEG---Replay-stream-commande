#/bin/bash
#Création dossier audio
mkdir audio
#Extrait MP3 avec limite de taille a 128Mo, qui est la limite de l'hebergeur de podcast + metadata
for f in *.mp4; do 
  ffmpeg -i "$f" -acodec libmp3lame -qscale:a 2 -fs 128000000 -metadata artist=Révolté6tm audio/"${f%.*}.mp3"
done

