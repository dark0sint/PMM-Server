# PMM Server

Backend Node.js (Express + SQLite) dengan login JWT. Folder `public/` berisi tampilan web (responsif untuk HP dan desktop).

## Menjalankan di server (Docker)
1. Salin `.env.example` menjadi `.env`, lalu isi `JWT_SECRET` dengan string acak (`openssl rand -hex 32`).
2. `docker compose up -d --build`
3. Buka `http://IP-SERVER:3000`. Data tersimpan di volume `pmm-data`.

## Tanpa Docker
`npm install` lalu `JWT_SECRET=... node server.js` (Node 20+).

## HTTPS dan domain (wajib untuk akses umum)
Pasang reverse proxy, contoh Caddy (otomatis HTTPS):
`pmm.contoh.id { reverse_proxy localhost:3000 }`
Setelah itu atur `CORS_ORIGIN=https://pmm.contoh.id` di `.env`.

## API (semua selain auth memerlukan header `Authorization: Bearer <token>`)
- POST /api/auth/register, /api/auth/login, GET /api/me
- GET /api/perangkat?q=&fase=
- GET /api/pelatihan, PUT /api/pelatihan/:id/materi/:idx {selesai}
- GET /api/asesmen, POST /api/asesmen/kirim {jawaban:{idSoal:indeks}}
- GET/POST /api/karya, DELETE /api/karya/:id
- GET /api/video
- GET/POST /api/komunitas, POST /api/komunitas/:id/suka
- GET/POST /api/kinerja, PATCH/DELETE /api/kinerja/:id
- GET/PUT /api/refleksi

## Catatan
- Tampilan (`public/index.html`) sudah memakai API, punya layar login, dan bisa dipasang di HP (PWA, butuh HTTPS).
- Akun pertama didaftarkan lewat layar "Buat akun baru".
- Cadangkan file `/data/pmm.db` secara berkala.
