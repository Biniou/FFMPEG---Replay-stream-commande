#!/bin/bash
#Si fichier editer sous windows pour l'executer sous l'environnement UNIX installer les logiciel suivant :
#apt-get install dos2unix
#apt-get install bc
#ffmpeg in last version
# Rendre le script exécutable
#chmod +x fadescript
#Convertir en format unix pour charactére caché
#dos2unix fadescript fadescript

#Début du script
#Créer un dossier fade
mkdir fade

for f in *.mp4; do dur=$(ffprobe -loglevel error -show_entries format=duration -of default=nk=1:nw=1 "$f")
echo $dur
  dur=$(ffprobe -loglevel error -show_entries format=duration -of default=nk=1:nw=1 "$f")
  #awk -F: '{printf "%02d:%02d:%02d\n",$1,$2,$3}')
  offset=$(bc -l <<< "$dur"-1)
  ffmpeg -i "$f" -filter_complex "[0:v]fade=type=in:duration=1,fade=type=out:duration=1:start_time="$offset"[v];[0:a]afade=type=in:duration=1,afade=type=out:duration=1:start_time="$offset"[a]" -map "[v]" -map "[a]" fade/"$f"
done

####ffmpeg -i "$f" -filter_complex [0:a]afade=type=in:duration=1,afade=type=out:duration=1:start_time='$offset' [a] -map "[v]" -map "[a]" fade/"$f"
###done
