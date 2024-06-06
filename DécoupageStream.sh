## Découpage de l'enregistrement en différent fichier vidéo par DJ

ffmpeg -i '.\Fichier source.mp4' -ss 00:08:20 -to 02:19:21 -o NOM DU DJ.mp4

ffmpeg -ss 00:00:20 -i '.\Fichier source.mp4' -to 00:08:20 NOMDUDJ.mp4

ffmpeg -ss 02:19:21 -to 03:45:42 -i '.\Fichier source.mp4' NOM DU DJ.mp4
ffmpeg -ss 03:45:42 -to 05:17:37 -i '.\Fichier source.mp4' NOM DU DJ.mp4
ffmpeg -ss 05:17:37 -to 06:51:33 -i '.\Fichier source.mp4' NOM DU DJ.mp4
ffmpeg -ss 06:51:33 -to 08:51:35 -i '.\Fichier source.mp4' NOM DU DJ.mp4

Faire un fade In Out audio sur une 2em passe (voir script dossier)
