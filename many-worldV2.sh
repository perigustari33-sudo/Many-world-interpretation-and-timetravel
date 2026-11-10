#!/bin/bash
## Many-World Interpretation simulasi (diperbaiki)
## Bus kemarin: 20 orang + saya = 21
## Setiap lompatan waktu menciptakan 1 realitas baru (1 proses baru)
## Hentikan setelah 20 realitas/proses tercipta

past=20
now=1
MAX_REALITAS=20          # batas proses yang ingin dibuat

aksi=$1
generasi=${2:-0}         # berapa realitas sudah tercipta

# --- Validasi argumen ---
if [ -z "$aksi" ]; then
    echo "Realitas $$ : tidak melakukan perjalanan waktu"
    exit 1
fi

if [ "$aksi" != "1" ]; then
    echo "Aksi harus 1 (karena anda 1 orang)"
    exit 1
fi

# --- Kondisi berhenti ---
if [ "$generasi" -ge "$MAX_REALITAS" ]; then
    echo "Realitas $$ (generasi $generasi): batas $MAX_REALITAS realitas tercapai. Berhenti."
    exit 0
fi

# --- Satu lompatan waktu = satu realitas baru ---
echo "Realitas $$ (generasi $generasi) dalam bus: $((past + 1)) orang"
echo "  -> Keberadaan 'Saya' setelah lompatan: $((now - 1))"

# Jalankan realitas berikutnya di BACKGROUND, lalu matikan diri sendiri
sh "$0" "$aksi" "$((generasi + 1))" &
child_pid=$!

# Induk tidak perlu menunggu; ia "lenyap" setelah menciptakan anak
# (opsional) tunggu sebentar agar output rapi
sleep 0.2

echo "Realitas $$ selesai, menciptakan realitas anak PID $child_pid"
exit 0
