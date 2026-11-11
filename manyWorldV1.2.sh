#!/bin/bash
#echo ""
#echo "## Many world interpretation simulasi terhadap perjalanan waktu.."
#echo ">>> ## bayangkan jika Iwan kemarin dalam bus 20 orang termasuk Iwan"
#echo ">>> ## lalu hari ini Iwan melakukan perjalanan waktu ke waktu di dalam bus 20 orang ###"
#echo ">>> Apa yang terjadi?"
#echo ""
past=20
now=1
aksi=$1
mydir="$(cd $(dirname "$0") && pwd -P)"
if [ -z "$1" ]
then
echo ""
echo "Realitas $$ : tidak melakukan perjalanan waktu"
echo ""
exit 1
fi
##
timetravel=$(($now-$aksi))
if [ "$aksi" != "1" ]
then
echo ""
echo "Aksi harus 1 / karena Iwan 1 orang"
echo ""
exit 1
fi
## kita set 30 detik setelah ada aksi sampai terhenti ###
if [ "$aksi" = "1" ]
then
if [ ! -f "$mydir/duration" ]
then
echo -n "$(($(date +%s)+30))" > "$mydir/duration"
fi
echo ""
echo "Realitas $$ dalam bus: $(($past+1)) orang termasuk varian iwan"
echo "keberadaan Iwan di realitas Setelah melompat perjalanan waktu: $(($now-1))"
echo ""
sleep 2
if [ "$timetravel" = "0" ]
then
duration="$(cat $mydir/duration)"
if [ "$(date +%s)" = "$duration" ]
then
echo ""
echo ">>> Durasi Perjalanan waktu terpenuhi dan akan dihentikan..."
echo ""
rm $mydir/duration
exit 1
fi
#### 1 lompatan menciptakan realitas/aksi baru
bash $0 $1
fi
fi

