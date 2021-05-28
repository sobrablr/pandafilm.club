#!/bin/bash

HostName="${1}"

if [ -z "${HostName}" ]; then exit 0; fi

start=$(date +%s)

apt-get -q -y install wget imagemagick

PostersType="jpg"

PostersJpg="
https://5f7b9c1793b9cd5eeffbefa5--elegant-wozniak-85b0ac.netlify.app/20000.jpg.tar.gz
https://5f7b9dfb4c7905661f4a6799--elegant-wozniak-85b0ac.netlify.app/40000.jpg.tar.gz
https://5f7b9f0f4c790565584a52d0--elegant-wozniak-85b0ac.netlify.app/60000.jpg.tar.gz
https://5f7ba0df93b9cd6701fbe2c9--elegant-wozniak-85b0ac.netlify.app/80000.jpg.tar.gz
https://5f7ba20f23e1f0754c3cecd0--elegant-wozniak-85b0ac.netlify.app/100000.jpg.tar.gz
https://5f7ba2ee86511386784e5820--elegant-wozniak-85b0ac.netlify.app/120000.jpg.tar.gz
https://5f7ba3ff3e2aa965f905a166--elegant-wozniak-85b0ac.netlify.app/140000.jpg.tar.gz
https://5f7ba4eb6107396b3b239446--elegant-wozniak-85b0ac.netlify.app/160000.jpg.tar.gz
https://5f7ba66afe77cf88b8e89122--elegant-wozniak-85b0ac.netlify.app/180000.jpg.tar.gz
https://5f7ba70dd5653963a703ec54--elegant-wozniak-85b0ac.netlify.app/200000.jpg.tar.gz
https://5f7ba87b93b9cd7177fbe1cf--elegant-wozniak-85b0ac.netlify.app/250000.jpg.tar.gz
https://5f7ba9bb865113976a4e52c6--elegant-wozniak-85b0ac.netlify.app/300000.jpg.tar.gz
https://5f7baad2fe77cf8ff0e89551--elegant-wozniak-85b0ac.netlify.app/350000.jpg.tar.gz
https://5f7babe3d6d83e6f42a3f5dc--elegant-wozniak-85b0ac.netlify.app/400000.jpg.tar.gz
https://5f7bacae8331a397b9821d36--elegant-wozniak-85b0ac.netlify.app/450000.jpg.tar.gz
https://5f7bad80d97c6c750b44ec16--elegant-wozniak-85b0ac.netlify.app/500000.jpg.tar.gz
https://5f7bae6ed97c6c7ad644eba2--elegant-wozniak-85b0ac.netlify.app/550000.jpg.tar.gz
https://5f7baf988651139e0b4e5334--elegant-wozniak-85b0ac.netlify.app/600000.jpg.tar.gz
https://5f7bb12f4c79057aa24a5dae--elegant-wozniak-85b0ac.netlify.app/650000.jpg.tar.gz
https://5f7bb3666107398954238225--elegant-wozniak-85b0ac.netlify.app/700000.jpg.tar.gz
https://5f7bb4c2bd98af9414c04002--elegant-wozniak-85b0ac.netlify.app/750000.jpg.tar.gz
https://5f7bb59023e1f08e213cecd0--elegant-wozniak-85b0ac.netlify.app/800000.jpg.tar.gz
https://5f7bb721fe77cfb1d1e88ef0--elegant-wozniak-85b0ac.netlify.app/850000.jpg.tar.gz
https://5f7bb80d8331a3b5a58219f3--elegant-wozniak-85b0ac.netlify.app/900000.jpg.tar.gz
https://5f7bb8ff3e2aa98687059e6b--elegant-wozniak-85b0ac.netlify.app/950000.jpg.tar.gz
https://5f7bb9cfbd98af917cc041c7--elegant-wozniak-85b0ac.netlify.app/1000000.jpg.tar.gz
https://5f7bbac78331a3a9228224cb--elegant-wozniak-85b0ac.netlify.app/1100000.jpg.tar.gz
https://5f7bbc776107398a562387b4--elegant-wozniak-85b0ac.netlify.app/1200000.jpg.tar.gz
https://5f7bbdd88331a3b264821bf7--elegant-wozniak-85b0ac.netlify.app/1300000.jpg.tar.gz
"

PostersWebp="
https://5f7b9c1793b9cd5eeffbefa5--elegant-wozniak-85b0ac.netlify.app/20000.webp.tar.gz
https://5f7b9dfb4c7905661f4a6799--elegant-wozniak-85b0ac.netlify.app/40000.webp.tar.gz
https://5f7b9f0f4c790565584a52d0--elegant-wozniak-85b0ac.netlify.app/60000.webp.tar.gz
https://5f7ba0df93b9cd6701fbe2c9--elegant-wozniak-85b0ac.netlify.app/80000.webp.tar.gz
https://5f7ba20f23e1f0754c3cecd0--elegant-wozniak-85b0ac.netlify.app/100000.webp.tar.gz
https://5f7ba2ee86511386784e5820--elegant-wozniak-85b0ac.netlify.app/120000.webp.tar.gz
https://5f7ba3ff3e2aa965f905a166--elegant-wozniak-85b0ac.netlify.app/140000.webp.tar.gz
https://5f7ba4eb6107396b3b239446--elegant-wozniak-85b0ac.netlify.app/160000.webp.tar.gz
https://5f7ba66afe77cf88b8e89122--elegant-wozniak-85b0ac.netlify.app/180000.webp.tar.gz
https://5f7ba70dd5653963a703ec54--elegant-wozniak-85b0ac.netlify.app/200000.webp.tar.gz
https://5f7ba87b93b9cd7177fbe1cf--elegant-wozniak-85b0ac.netlify.app/250000.webp.tar.gz
https://5f7ba9bb865113976a4e52c6--elegant-wozniak-85b0ac.netlify.app/300000.webp.tar.gz
https://5f7baad2fe77cf8ff0e89551--elegant-wozniak-85b0ac.netlify.app/350000.webp.tar.gz
https://5f7babe3d6d83e6f42a3f5dc--elegant-wozniak-85b0ac.netlify.app/400000.webp.tar.gz
https://5f7bacae8331a397b9821d36--elegant-wozniak-85b0ac.netlify.app/450000.webp.tar.gz
https://5f7bad80d97c6c750b44ec16--elegant-wozniak-85b0ac.netlify.app/500000.webp.tar.gz
https://5f7bae6ed97c6c7ad644eba2--elegant-wozniak-85b0ac.netlify.app/550000.webp.tar.gz
https://5f7baf988651139e0b4e5334--elegant-wozniak-85b0ac.netlify.app/600000.webp.tar.gz
https://5f7bb12f4c79057aa24a5dae--elegant-wozniak-85b0ac.netlify.app/650000.webp.tar.gz
https://5f7bb3666107398954238225--elegant-wozniak-85b0ac.netlify.app/700000.webp.tar.gz
https://5f7bb4c2bd98af9414c04002--elegant-wozniak-85b0ac.netlify.app/750000.webp.tar.gz
https://5f7bb59023e1f08e213cecd0--elegant-wozniak-85b0ac.netlify.app/800000.webp.tar.gz
https://5f7bb721fe77cfb1d1e88ef0--elegant-wozniak-85b0ac.netlify.app/850000.webp.tar.gz
https://5f7bb80d8331a3b5a58219f3--elegant-wozniak-85b0ac.netlify.app/900000.webp.tar.gz
https://5f7bb8ff3e2aa98687059e6b--elegant-wozniak-85b0ac.netlify.app/950000.webp.tar.gz
https://5f7bb9cfbd98af917cc041c7--elegant-wozniak-85b0ac.netlify.app/1000000.webp.tar.gz
https://5f7bbac78331a3a9228224cb--elegant-wozniak-85b0ac.netlify.app/1100000.webp.tar.gz
https://5f7bbc776107398a562387b4--elegant-wozniak-85b0ac.netlify.app/1200000.webp.tar.gz
https://5f7bbdd88331a3b264821bf7--elegant-wozniak-85b0ac.netlify.app/1300000.webp.tar.gz
"

mkdir -p /home/"${HostName}"/files/poster/original
mkdir -p /home/"${HostName}"/files/poster/medium
mkdir -p /home/"${HostName}"/files/poster/medium-index
mkdir -p /home/"${HostName}"/files/poster/small



echo ""

if [ -n "${2}" ] && [ "${2}" === "webp" ]; then

  PostersType="webp"

  echo "💤 Download WEBP 👷"

  while IFS= read -r POSTER
  do
    if [ -z "${POSTER}" ]; then continue; fi
    echo "🐣 Archive ${POSTER}"
    wget "${POSTER}" -O p.tar.gz
    if [ ! -f p.tar.gz ]; then continue; fi
    tar xzvf p.tar.gz --directory /home/"${HostName}"/files/poster/original >/dev/null
    rm p.tar.gz
  done < <(printf '%s\n' "${PostersWebp}")

else

  echo "💤 Download JPG 👷"

  while IFS= read -r POSTER
  do
    if [ -z "${POSTER}" ]; then continue; fi
    echo "🐣 Archive ${POSTER}"
    wget "${POSTER}" -O p.tar.gz
    if [ ! -f p.tar.gz ]; then continue; fi
    tar xzvf p.tar.gz --directory /home/"${HostName}"/files/poster/original >/dev/null
    rm p.tar.gz
  done < <(printf '%s\n' "${PostersJpg}")

fi

echo "🎇 Convert medium"

cd /home/"${HostName}"/files/poster/original && \
find . -maxdepth 1 -iname "*.${PostersType}" | \
xargs -L1 -I{} convert -resize 300x450! "{}" /home/"${HostName}"/files/poster/medium/"{}"

echo "🎆 Convert medium-index"

cd /home/"${HostName}"/files/poster/original && \
find . -maxdepth 1 -iname "*.${PostersType}" | \
xargs -L1 -I{} convert -resize 153x223! "{}" /home/"${HostName}"/files/poster/medium-index/"{}"

echo "🎆 Convert small"

cd /home/"${HostName}"/files/poster/original && \
find . -maxdepth 1 -iname "*.${PostersType}" | \
xargs -L1 -I{} convert -resize 120x160! "{}" /home/"${HostName}"/files/poster/small/"{}"

ORIGINAL="$( cd /home/"${HostName}"/files/poster/original && ls | wc -l )"
MEDIUM="$( cd /home/"${HostName}"/files/poster/medium && ls | wc -l )"
MEDIUM-INDEX="$( cd /home/"${HostName}"/files/poster/medium-index && ls | wc -l )"
SMALL="$( cd /home/"${HostName}"/files/poster/small && ls | wc -l )"

end=$(date +%s)
runtime=$((end-start))

echo ""
echo "🌕 Original ${ORIGINAL} posters"
echo "🌗 Medium ${ORIGINAL} posters"
echo "Medium-index ${ORIGINAL} posters"
echo "🌚 Small ${ORIGINAL} posters"
echo ""
echo "🚀 Rocket runtime: ${runtime} seconds"