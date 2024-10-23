#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Merci de spécifier un répertoire en argument."
    exit 1
fi

liste() {
    for file in "$1"/*; do
        if [[ -d "$file" ]]; then
            liste "$file"
        elif [[ -f "$file" ]]; then
            md5=$(md5sum "$file" | cut -d' ' -f1)
            echo "$file: $md5" >> md5rep.txt
        fi
    done
}

liste "$1"

echo "Liste des fichiers et leurs MD5 enregistrée dans md5rep.txt"

# Il était possible de faire plus simple sans récursif...
# Exemple en dessous (bonus)

---

#!/bin/bash

#if [[ -z "$1" ]]; then
#    echo "Merci de spécifier un répertoire en argument."
#    exit 1
#fi
#
#for file in $(find "$1" -type f); do
#    md5=$(md5sum "$file" | cut -d' ' -f1)
#    echo "$file: $md5" >> md5rep.txt
#done
#
#echo "Liste des fichiers et leurs MD5 enregistrée dans md5rep.txt"