#!/bin/bash

# Onelots, 2024
# Brute force d'un hash md5
# Réutilise à ta guise, mais attention à Compilatio mon salaud

hash="79af87723dc295f95bdb277a61189a2a"
dep=$(date +%s)

for a in {a..z} {0..9}; do
    for b in {a..z} {0..9}; do
        for c in {a..z} {0..9}; do
            essai="$a$b$c"
            md5=$(echo -n "$essai" | md5sum | cut -d' ' -f1)

            if [[ "$md5" == "$hash" ]]; then
                fin=$(date +%s)
                temps=$((fin - dep))
                echo "Correspondance trouvée : $essai"
                echo "Temps écoulé : $temps secondes"
                exit 0
            else
                echo "Essai : $essai (md5 : $md5)"
            fi
        done
    done
done

echo "Aucune correspondance trouvée."
