#!/bin/bash
## Many world interpretation simulasi
## jika saya kemarin dalam bus 20 orang termasuk saya
## lalu hari ini saya melakukan perjalanan waktu ke waktu di dalam bus 20 orang ###
past=20
now=1
aksi=$1

if [ -z "$1" ]
then
echo "Realitas $$ : tidak melakukan perjalanan waktu"
exit 1
fi
##
timetravel=$(($now-$aksi))
if [ "$aksi" != "1" ]
then
echo "Aksi harus 1 / karena anda 1 orang"
exit 1
fi
##
if [ "$aksi" = "1" ]
then
echo "Realitas $$ dalam bus: $(($past+1)) orang"
echo "keberadaan Saya di realitas Saat melompat perjalanan waktu: $(($now-1))"
sleep 4
if [ "$timetravel" = "0" ]
then
#### 1 lompatan menciptakan realitas baru
sh $0 $1
kill -9 $$
fi
fi

