SELECT count (*) FROM penyanyi	konser_penyanyi
SELECT count (*) FROM penyanyi	konser_penyanyi
SELECT nama , negara , usia FROM penyanyi ORDER BY usia DESC	konser_penyanyi
SELECT nama , negara , usia FROM penyanyi ORDER BY usia DESC	konser_penyanyi
SELECT avg (usia) , min (usia) , max (usia) FROM penyanyi WHERE negara = 'Perancis'	konser_penyanyi
SELECT avg (usia) , min (usia) , max (usia) FROM penyanyi WHERE negara = 'Perancis'	konser_penyanyi
SELECT nama_lagu , lagu_rilis_tahun FROM penyanyi ORDER BY usia LIMIT 1	konser_penyanyi
SELECT nama_lagu , lagu_rilis_tahun FROM penyanyi ORDER BY usia LIMIT 1	konser_penyanyi
SELECT DISTINCT negara FROM penyanyi WHERE usia > 20	konser_penyanyi
SELECT DISTINCT negara FROM penyanyi WHERE usia > 20	konser_penyanyi
SELECT negara , count (*) FROM penyanyi GROUP BY negara	konser_penyanyi
SELECT negara , count (*) FROM penyanyi GROUP BY negara	konser_penyanyi
SELECT nama_lagu FROM penyanyi WHERE usia > (SELECT avg (usia) FROM penyanyi)	konser_penyanyi
SELECT nama_lagu FROM penyanyi WHERE usia > (SELECT avg (usia) FROM penyanyi)	konser_penyanyi
SELECT LOCATION , nama FROM stadion WHERE kapasitas BETWEEN 5000 AND 10.000	konser_penyanyi
SELECT LOCATION , nama FROM stadion WHERE kapasitas BETWEEN 5000 AND 10.000	konser_penyanyi
select max (kapasitas) , average from stadion	konser_penyanyi
select avg (kapasitas) , max (kapasitas) from stadion	konser_penyanyi
SELECT nama , kapasitas FROM stadion ORDER BY average DESC LIMIT 1	konser_penyanyi
SELECT nama , kapasitas FROM stadion ORDER BY average DESC LIMIT 1	konser_penyanyi
SELECT count (*) FROM konser WHERE YEAR = 2014 OR YEAR = 2015	konser_penyanyi
SELECT count (*) FROM konser WHERE YEAR = 2014 OR YEAR = 2015	konser_penyanyi
SELECT T2.nama , count (*) FROM konser AS T1 JOIN stadion AS T2 ON T1.id_stadion = T2.id_stadion GROUP BY T1.id_stadion	konser_penyanyi
SELECT T2.nama , count (*) FROM konser AS T1 JOIN stadion AS T2 ON T1.id_stadion = T2.id_stadion GROUP BY T1.id_stadion	konser_penyanyi
SELECT T2.nama , T2.kapasitas FROM konser AS T1 JOIN stadion AS T2 ON T1.id_stadion = T2.id_stadion WHERE T1.tahun >= 2014 GROUP BY T2.id_stadion ORDER BY count (*) DESC LIMIT 1	konser_penyanyi
select t2.nama , t2.kapasitas from konser as t1 join stadion as t2 on t1.id_stadion = t2.id_stadion where t1.tahun > 2013 group by t2.id_stadion order by count (*) desc limit 1	konser_penyanyi
SELECT YEAR FROM konser GROUP BY YEAR ORDER BY count (*) DESC LIMIT 1	konser_penyanyi
SELECT YEAR FROM konser GROUP BY YEAR ORDER BY count (*) DESC LIMIT 1	konser_penyanyi
SELECT nama FROM stadion WHERE id_stadion NOT IN (SELECT id_stadion FROM konser)	konser_penyanyi
SELECT nama FROM stadion WHERE id_stadion NOT IN (SELECT id_stadion FROM konser)	konser_penyanyi
SELECT negara FROM penyanyi WHERE usia > 40 INTERSECT SELECT negara FROM penyanyi WHERE usia < 30	konser_penyanyi
SELECT nama FROM stadion EXCEPT SELECT T2.nama FROM konser AS T1 JOIN stadion AS T2 ON T1.id_stadion = T2.id_stadion WHERE T1.tahun = 2014	konser_penyanyi
SELECT nama FROM stadion EXCEPT SELECT T2.nama FROM konser AS T1 JOIN stadion AS T2 ON T1.id_stadion = T2.id_stadion WHERE T1.tahun = 2014	konser_penyanyi
SELECT T2.nama_konser , T2.tema , count (*) FROM penyanyi_dalam_konser AS T1 JOIN konser AS T2 ON T1.id_konser = T2.id_konser GROUP BY T2.id_konser	konser_penyanyi
select t2.nama_konser , t2.tema , count (*) from penyanyi_dalam_konser as t1 join konser as t2 on t1.id_konser = t2.id_konser group by t2.id_konser	konser_penyanyi
SELECT T2.nama , count (*) FROM penyanyi_dalam_konser AS T1 JOIN penyanyi AS T2 ON T1.id_singer = T2.id_singer GROUP BY T2.id_singer	konser_penyanyi
SELECT T2.nama , count (*) FROM penyanyi_dalam_konser AS T1 JOIN penyanyi AS T2 ON T1.id_singer = T2.id_singer GROUP BY T2.id_singer	konser_penyanyi
SELECT T2.nama FROM penyanyi_dalam_konser AS T1 JOIN penyanyi AS T2 ON T1.id_singer = T2.id_singer JOIN konser AS T3 ON T1.id_konser = T3.id_konser WHERE T3.tahun = 2014	konser_penyanyi
SELECT T2.nama FROM penyanyi_dalam_konser AS T1 JOIN penyanyi AS T2 ON T1.id_singer = T2.id_singer JOIN konser AS T3 ON T1.id_konser = T3.id_konser WHERE T3.tahun = 2014	konser_penyanyi
SELECT nama , negara FROM penyanyi WHERE nama_lagu LIKE '%Hai%'	konser_penyanyi
SELECT nama , negara FROM penyanyi WHERE nama_lagu LIKE '%Hai%'	konser_penyanyi
SELECT T2.nama , T2.lokasi FROM konser AS T1 JOIN stadion AS T2 ON T1.id_stadion = T2.id_stadion WHERE T1.Tahun = 2014 INTERSECT SELECT T2.nama , T2.lokasi FROM konser AS T1 JOIN stadion AS T2 ON T1.id_stadion = T2.id_stadion WHERE T1.Tahun = 2015	konser_penyanyi
SELECT T2.nama , T2.lokasi FROM konser AS T1 JOIN stadion AS T2 ON T1.id_stadion = T2.id_stadion WHERE T1.Tahun = 2014 INTERSECT SELECT T2.nama , T2.lokasi FROM konser AS T1 JOIN stadion AS T2 ON T1.id_stadion = T2.id_stadion WHERE T1.Tahun = 2015	konser_penyanyi
select count (*) from konser where id_stadion = (select id_stadion from stadion order by kapasitas desc limit 1)	konser_penyanyi
select count (*) from konser where id_stadion = (select id_stadion from stadion order by kapasitas desc limit 1)	konser_penyanyi
SELECT count (*) FROM hewan_peliharaan WHERE berat > 10	hewan_peliharaan_1
SELECT count (*) FROM hewan_peliharaan WHERE berat > 10	hewan_peliharaan_1
SELECT berat FROM hewan_peliharaan ORDER BY pet_age LIMIT 1	hewan_peliharaan_1
SELECT berat FROM hewan_peliharaan ORDER BY pet_age LIMIT 1	hewan_peliharaan_1
SELECT max (berat) , tipe_hewan_peliharaan FROM hewan_peliharaan GROUP BY tipe_hewan_peliharaan	hewan_peliharaan_1
SELECT max (berat) , tipe_hewan_peliharaan FROM hewan_peliharaan GROUP BY tipe_hewan_peliharaan	hewan_peliharaan_1
SELECT count (*) FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi WHERE T1.usia > 20	hewan_peliharaan_1
SELECT count (*) FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi WHERE T1.usia > 20	hewan_peliharaan_1
SELECT count (*) FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T2.petid = T3.petid WHERE T1.seks = 'F' AND T3.tipe_hewan_peliharaan = 'anjing'	hewan_peliharaan_1
SELECT count (*) FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T2.petid = T3.petid WHERE T1.seks = 'F' AND T3.tipe_hewan_peliharaan = 'anjing'	hewan_peliharaan_1
SELECT count (DISTINCT tipe_hewan_peliharaan) FROM hewan_peliharaan	hewan_peliharaan_1
SELECT count (DISTINCT tipe_hewan_peliharaan) FROM hewan_peliharaan	hewan_peliharaan_1
SELECT DISTINCT T1.NamaF FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.tipe_hewan_peliharaan = 'kucing' OR T3.tipe_hewan_peliharaan = 'anjing'	hewan_peliharaan_1
SELECT DISTINCT T1.NamaF FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.tipe_hewan_peliharaan = 'kucing' OR T3.tipe_hewan_peliharaan = 'anjing'	hewan_peliharaan_1
select t1.fnama from murid as t1 join has_pet as t2 on t1.studi = t2.studi join hewan_peliharaan as t3 on t3.petitd = t2.petitd where t3.tipe_hewan_peliharaan = "kucing" intersect select t1.fnama from murid as t1 join has_pet as t2 on t1.studi = t2.studi join hewan_peliharaan as t3 on t3.petitd = t2.petitd where t3.tipe_hewan_peliharaan = "anjing"	hewan_peliharaan_1
SELECT T1.NamaF FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.tipe_hewan_peliharaan = 'kucing' INTERSECT SELECT T1.NamaF FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.tipe_hewan_peliharaan = 'anjing'	hewan_peliharaan_1
SELECT besar , usia FROM murid WHERE pelajar NOT IN (SELECT T1.studi FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.tipe_hewan_peliharaan = 'kucing')	hewan_peliharaan_1
SELECT besar , usia FROM murid WHERE pelajar NOT IN (SELECT T1.studi FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.tipe_hewan_peliharaan = 'kucing')	hewan_peliharaan_1
SELECT pelajar FROM murid EXCEPT SELECT T1.studi FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.tipe_hewan_peliharaan = 'kucing'	hewan_peliharaan_1
SELECT pelajar FROM murid EXCEPT SELECT T1.studi FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.tipe_hewan_peliharaan = 'kucing'	hewan_peliharaan_1
SELECT T1.nama_f , T1.usia FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.tipe_hewan_peliharaan = 'anjing' AND T1.studi NOT IN (SELECT T1.studi FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.tipe_hewan_peliharaan = 'kucing')	hewan_peliharaan_1
SELECT T1.nama_f , T1.usia FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.tipe_hewan_peliharaan = 'anjing' AND T1.studi NOT IN (SELECT T1.studi FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.tipe_hewan_peliharaan = 'kucing')	hewan_peliharaan_1
SELECT tipe_hewan_peliharaan , berat FROM hewan_peliharaan ORDER BY pet_age LIMIT 1	hewan_peliharaan_1
SELECT tipe_hewan_peliharaan , berat FROM hewan_peliharaan ORDER BY pet_age LIMIT 1	hewan_peliharaan_1
SELECT mungil , berat FROM hewan_peliharaan WHERE pet_age > 1	hewan_peliharaan_1
SELECT mungil , berat FROM hewan_peliharaan WHERE pet_age > 1	hewan_peliharaan_1
SELECT avg (pet_age) , max (pet_age) , tipe_hewan_peliharaan FROM hewan_peliharaan GROUP BY tipe_hewan_peliharaan	hewan_peliharaan_1
SELECT avg (pet_age) , max (pet_age) , tipe_hewan_peliharaan FROM hewan_peliharaan GROUP BY tipe_hewan_peliharaan	hewan_peliharaan_1
SELECT avg (berat) , tipe_hewan_peliharaan FROM hewan_peliharaan GROUP BY tipe_hewan_peliharaan	hewan_peliharaan_1
SELECT avg (berat) , tipe_hewan_peliharaan FROM hewan_peliharaan GROUP BY tipe_hewan_peliharaan	hewan_peliharaan_1
SELECT DISTINCT T1.nama_f , T1.usia FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi	hewan_peliharaan_1
SELECT DISTINCT T1.nama_f , T1.usia FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi	hewan_peliharaan_1
SELECT T2.petid FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi WHERE T1.Nama = 'Smith'	hewan_peliharaan_1
SELECT T2.petid FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi WHERE T1.Nama = 'Smith'	hewan_peliharaan_1
SELECT count (*) , T1.studi FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi GROUP BY T1.studi	hewan_peliharaan_1
select count (*) , t1.studi from murid as t1 join has_pet as t2 on t1.studi = t2.studi group by t1.studi	hewan_peliharaan_1
SELECT T1.nama_f , T1.seks FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi GROUP BY T1.studi HAVING count (*) > 1	hewan_peliharaan_1
SELECT T1.nama_f , T1.seks FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi GROUP BY T1.studi HAVING count (*) > 1	hewan_peliharaan_1
SELECT T1.nama FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.pet_age = 3 AND T3.tipe_hewan_peliharaan = 'kucing'	hewan_peliharaan_1
SELECT T1.nama FROM murid AS T1 JOIN has_pet AS T2 ON T1.studi = T2.studi JOIN hewan_peliharaan AS T3 ON T3.petid = T2.petid WHERE T3.pet_age = 3 AND T3.tipe_hewan_peliharaan = 'kucing'	hewan_peliharaan_1
select avg (usia) from murid where pelajar not in (select pelajar from has_pet)	hewan_peliharaan_1
select avg (usia) from murid where pelajar not in (select pelajar from has_pet)	hewan_peliharaan_1
SELECT count (*) FROM BENUA;	mobil_1
SELECT count (*) FROM BENUA;	mobil_1
SELECT T1.LanjutanId , T1.Benua , count (*) FROM BENUA AS T1 JOIN NEGARA AS T2 ON T1.LanjutanId = T2.Benua GROUP BY T1.LanjutanId;	mobil_1
SELECT T1.LanjutanId , T1.Benua , count (*) FROM BENUA AS T1 JOIN NEGARA AS T2 ON T1.LanjutanId = T2.Benua GROUP BY T1.LanjutanId;	mobil_1
SELECT count (*) FROM NEGARA;	mobil_1
SELECT count (*) FROM NEGARA;	mobil_1
SELECT T1.Nama_Lengkap , T1.Id , count (*) FROM CAR_MAKERS AS T1 JOIN MODEL_DAFTAR AS T2 ON T1.Id = T2.Pembuat GROUP BY T1.Id;	mobil_1
SELECT T1.Nama_Lengkap , T1.Id , count (*) FROM CAR_MAKERS AS T1 JOIN MODEL_DAFTAR AS T2 ON T1.Id = T2.Pembuat GROUP BY T1.Id;	mobil_1
SELECT T1.Model FROM CAR_NAMES AS T1 JOIN MOBIL_DATA AS T2 ON T1.MakeId = T2.Id ORDER BY T2.tenaga_kuda ASC LIMIT 1;	mobil_1
SELECT T1.Model FROM CAR_NAMES AS T1 JOIN MOBIL_DATA AS T2 ON T1.MakeId = T2.Id ORDER BY T2.tenaga_kuda ASC LIMIT 1;	mobil_1
SELECT T1.model FROM CAR_NAMES AS T1 JOIN MOBIL_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.Berat < (SELECT avg (Berat) FROM MOBIL_DATA)	mobil_1
SELECT T1.model FROM CAR_NAMES AS T1 JOIN MOBIL_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.Berat < (SELECT avg (Berat) FROM MOBIL_DATA)	mobil_1
SELECT DISTINCT T1.Pembuat FROM CAR_MAKERS AS T1 JOIN MODEL_DAFTAR AS T2 ON T1.Id = T2.Pembuat JOIN CAR_NAMES AS T3 ON T2.model = T3.model JOIN MOBIL_DATA AS T4 ON T3.MakeId = T4.id WHERE T4.tahun = '1970';	mobil_1
SELECT DISTINCT T1.Pembuat FROM CAR_MAKERS AS T1 JOIN MODEL_DAFTAR AS T2 ON T1.Id = T2.Pembuat JOIN CAR_NAMES AS T3 ON T2.model = T3.model JOIN MOBIL_DATA AS T4 ON T3.MakeId = T4.id WHERE T4.tahun = '1970';	mobil_1
SELECT T2.Membuat , T1.Tahun FROM MOBIL_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T1.Tahun = (SELECT min (YEAR) FROM MOBIL_DATA) ;	mobil_1
SELECT T2.Membuat , T1.Tahun FROM MOBIL_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T1.Tahun = (SELECT min (YEAR) FROM MOBIL_DATA) ;	mobil_1
SELECT DISTINCT T1.model FROM MODEL_DAFTAR AS T1 JOIN CAR_NAMES AS T2 ON T1.model = T2.model JOIN MOBIL_DATA AS T3 ON T2.MakeId = T3.id WHERE T3.tahun > 1980;	mobil_1
SELECT DISTINCT T1.model FROM MODEL_DAFTAR AS T1 JOIN CAR_NAMES AS T2 ON T1.model = T2.model JOIN MOBIL_DATA AS T3 ON T2.MakeId = T3.id WHERE T3.tahun > 1980;	mobil_1
SELECT T1.Benua , count (*) FROM BENUA AS T1 JOIN NEGARA AS T2 ON T1.LanjutanId = T2.benua JOIN pembuat_mobil AS T3 ON T2.Id_Negara = T3.Negara GROUP BY T1.Benua;	mobil_1
SELECT T1.Benua , count (*) FROM BENUA AS T1 JOIN NEGARA AS T2 ON T1.LanjutanId = T2.benua JOIN pembuat_mobil AS T3 ON T2.Id_Negara = T3.Negara GROUP BY T1.Benua;	mobil_1
SELECT T2.Nama_Negara FROM CAR_MAKERS AS T1 JOIN NEGARA AS T2 ON T1.Negara = T2.Id_Negara GROUP BY T1.Negara ORDER BY Count (*) DESC LIMIT 1;	mobil_1
SELECT T2.Nama_Negara FROM CAR_MAKERS AS T1 JOIN NEGARA AS T2 ON T1.Negara = T2.Id_Negara GROUP BY T1.Negara ORDER BY Count (*) DESC LIMIT 1;	mobil_1
select count (*) , t2.nama_lengkap from model_daftar as t1 join pembuat_mobil as t2 on t1.pembuat = t2.id group by t2.id;	mobil_1
SELECT Count (*) , T2.Nama_Lengkap , T2.id FROM MODEL_DAFTAR AS T1 JOIN CAR_MAKERS AS T2 ON T1.Pembuat = T2.Id GROUP BY T2.id;	mobil_1
SELECT T1.Mempercepat FROM MOBIL_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T2.Membuat = 'amc pikat olahraga_tentang (sw) ';	mobil_1
SELECT T1.Mempercepat FROM MOBIL_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T2.Membuat = 'amc pikat olahraga_tentang (sw) ';	mobil_1
SELECT count (*) FROM CAR_MAKERS AS T1 JOIN NEGARA AS T2 ON T1.Negara = T2.Id_Negara WHERE T2.Nama_Negara = 'Perancis';	mobil_1
SELECT count (*) FROM CAR_MAKERS AS T1 JOIN NEGARA AS T2 ON T1.Negara = T2.Id_Negara WHERE T2.Nama_Negara = 'Perancis';	mobil_1
SELECT count (*) FROM MODEL_DAFTAR AS T1 JOIN CAR_MAKERS AS T2 ON T1.Pembuat = T2.Id JOIN NEGARA AS T3 ON T2.Negara = T3.Id_Negara WHERE T3.Nama_Negara = 'Amerika_Serikat';	mobil_1
SELECT count (*) FROM MODEL_DAFTAR AS T1 JOIN CAR_MAKERS AS T2 ON T1.Pembuat = T2.Id JOIN NEGARA AS T3 ON T2.Negara = T3.Id_Negara WHERE T3.Nama_Negara = 'Amerika_Serikat';	mobil_1
SELECT avg (mpg) FROM MOBIL_DATA WHERE Silinder = 4;	mobil_1
SELECT avg (mpg) FROM MOBIL_DATA WHERE Silinder = 4;	mobil_1
select min (berat) from data_mobil where silinder = 8 and year = 1974	mobil_1
select min (berat) from data_mobil where silinder = 8 and year = 1974	mobil_1
SELECT Pembuat , Model FROM MODEL_DAFTAR;	mobil_1
SELECT Pembuat , Model FROM MODEL_DAFTAR;	mobil_1
SELECT T1.Nama_Negara , T1.Id_Negara FROM NEGARA AS T1 JOIN CAR_MAKERS AS T2 ON T1.Id_Negara = T2.Negara GROUP BY T1.Id_Negara HAVING count (*) >= 1;	mobil_1
SELECT T1.Nama_Negara , T1.Id_Negara FROM NEGARA AS T1 JOIN CAR_MAKERS AS T2 ON T1.Id_Negara = T2.Negara GROUP BY T1.Id_Negara HAVING count (*) >= 1;	mobil_1
SELECT count (*) FROM MOBIL_DATA WHERE daya_kuda > 150;	mobil_1
SELECT count (*) FROM MOBIL_DATA WHERE daya_kuda > 150;	mobil_1
SELECT avg (Berat) , YEAR FROM MOBIL_DATA GROUP BY YEAR;	mobil_1
SELECT avg (Berat) , YEAR FROM MOBIL_DATA GROUP BY YEAR;	mobil_1
SELECT T1.Nama_Negara FROM NEGARA AS T1 JOIN BENUA AS T2 ON T1.Benua = T2.LanjutanId JOIN CAR_MAKERS AS T3 ON T1.Id_Negara = T3.Negara WHERE T2.Benua = 'eropa' GROUP BY T1.Nama_Negara HAVING count (*) >= 3;	mobil_1
SELECT T1.Nama_Negara FROM NEGARA AS T1 JOIN BENUA AS T2 ON T1.Benua = T2.LanjutanId JOIN CAR_MAKERS AS T3 ON T1.Id_Negara = T3.Negara WHERE T2.Benua = 'eropa' GROUP BY T1.Nama_Negara HAVING count (*) >= 3;	mobil_1
SELECT T2.tenaga_kuda , T1.Membuat FROM CAR_NAMES AS T1 JOIN MOBIL_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.silinder = 3 ORDER BY T2.tenaga_kuda DESC LIMIT 1;	mobil_1
SELECT T2.tenaga_kuda , T1.Membuat FROM CAR_NAMES AS T1 JOIN MOBIL_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.silinder = 3 ORDER BY T2.tenaga_kuda DESC LIMIT 1;	mobil_1
SELECT T1.Model FROM CAR_NAMES AS T1 JOIN MOBIL_DATA AS T2 ON T1.MakeId = T2.Id ORDER BY T2.mpg DESC LIMIT 1;	mobil_1
select t1.model from nama_mobil as t1 join data_mobil as t2 on t1.makeid = t2.id order by t2.mpg desc limit 1;	mobil_1
SELECT avg (daya_kuda) FROM MOBIL_DATA WHERE YEAR < 1980;	mobil_1
select avg (daya_kuda) from data_mobil where year < 1980;	mobil_1
SELECT avg (T2.edispl) FROM CAR_NAMES AS T1 JOIN MOBIL_DATA AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'volvo';	mobil_1
SELECT avg (T2.edispl) FROM CAR_NAMES AS T1 JOIN MOBIL_DATA AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'volvo';	mobil_1
SELECT max (Mempercepat) , Silinder FROM MOBIL_DATA GROUP BY Silinder;	mobil_1
SELECT max (Mempercepat) , Silinder FROM MOBIL_DATA GROUP BY Silinder;	mobil_1
SELECT Model FROM CAR_NAMES GROUP BY Model ORDER BY count (*) DESC LIMIT 1;	mobil_1
SELECT Model FROM CAR_NAMES GROUP BY Model ORDER BY count (*) DESC LIMIT 1;	mobil_1
SELECT count (*) FROM MOBIL_DATA WHERE Silinder > 4;	mobil_1
SELECT count (*) FROM MOBIL_DATA WHERE Silinder > 4;	mobil_1
SELECT count (*) FROM MOBIL_DATA WHERE YEAR = 1980;	mobil_1
SELECT count (*) FROM MOBIL_DATA WHERE YEAR = 1980;	mobil_1
SELECT count (*) FROM CAR_MAKERS AS T1 JOIN MODEL_DAFTAR AS T2 ON T1.Id = T2.Pembuat WHERE T1.Nama_Lengkap = 'Amerika Motor Perusahaan';	mobil_1
SELECT count (*) FROM CAR_MAKERS AS T1 JOIN MODEL_DAFTAR AS T2 ON T1.Id = T2.Pembuat WHERE T1.Nama_Lengkap = 'Amerika Motor Perusahaan';	mobil_1
SELECT T1.Nama_Lengkap , T1.Id FROM CAR_MAKERS AS T1 JOIN MODEL_DAFTAR AS T2 ON T1.Id = T2.Pembuat GROUP BY T1.Id HAVING count (*) > 3;	mobil_1
SELECT T1.Nama_Lengkap , T1.Id FROM CAR_MAKERS AS T1 JOIN MODEL_DAFTAR AS T2 ON T1.Id = T2.Pembuat GROUP BY T1.Id HAVING count (*) > 3;	mobil_1
SELECT DISTINCT T2.Model FROM CAR_NAMES AS T1 JOIN MODEL_DAFTAR AS T2 ON T1.Model = T2.Model JOIN CAR_MAKERS AS T3 ON T2.Pembuat = T3.Id JOIN MOBIL_DATA AS T4 ON T1.MakeId = T4.Id WHERE T3.Nama_Lengkap = 'General Motor' OR T4.berat > 3500;	mobil_1
SELECT DISTINCT T2.Model FROM CAR_NAMES AS T1 JOIN MODEL_DAFTAR AS T2 ON T1.Model = T2.Model JOIN CAR_MAKERS AS T3 ON T2.Pembuat = T3.Id JOIN MOBIL_DATA AS T4 ON T1.MakeId = T4.Id WHERE T3.Nama_Lengkap = 'General Motor' OR T4.berat > 3500;	mobil_1
select distinct year from data_mobil where berat between 3000 and 4000;	mobil_1
select distinct year from data_mobil where berat between 3000 and 4000;	mobil_1
SELECT T1.tenaga_kuda FROM MOBIL_DATA AS T1 ORDER BY T1.mempercepat DESC LIMIT 1;	mobil_1
SELECT T1.tenaga_kuda FROM MOBIL_DATA AS T1 ORDER BY T1.mempercepat DESC LIMIT 1;	mobil_1
SELECT T1.silinder FROM MOBIL_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T2.Model = 'volvo' ORDER BY T1.mempercepat ASC LIMIT 1;	mobil_1
SELECT T1.silinder FROM MOBIL_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T2.Model = 'volvo' ORDER BY T1.mempercepat ASC LIMIT 1;	mobil_1
SELECT COUNT (*) FROM MOBIL_DATA WHERE Mempercepat > (SELECT Mempercepat FROM MOBIL_DATA ORDER BY Daya_kuda DESC LIMIT 1) ;	mobil_1
SELECT COUNT (*) FROM MOBIL_DATA WHERE Mempercepat > (SELECT Mempercepat FROM MOBIL_DATA ORDER BY Daya_kuda DESC LIMIT 1) ;	mobil_1
select count (*) from negara as t1 join pembuat_mobil as t2 on t1.negaraid = t2.negara group by t1.negaraid having count (*) > 2	mobil_1
select count (*) from negara as t1 join pembuat_mobil as t2 on t1.negaraid = t2.negara group by t1.negaraid having count (*) > 2	mobil_1
SELECT COUNT (*) FROM MOBIL_DATA WHERE Silinder > 6;	mobil_1
SELECT COUNT (*) FROM MOBIL_DATA WHERE Silinder > 6;	mobil_1
SELECT T1.Model FROM CAR_NAMES AS T1 JOIN MOBIL_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.Silinder = 4 ORDER BY T2.tenaga_kuda DESC LIMIT 1;	mobil_1
SELECT T1.Model FROM CAR_NAMES AS T1 JOIN MOBIL_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.Silinder = 4 ORDER BY T2.tenaga_kuda DESC LIMIT 1;	mobil_1
SELECT T2.MakeId , T2.Membuat FROM MOBIL_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T1.tenaga_kuda > (SELECT min (Daya_kuda) FROM MOBIL_DATA) AND T1.Silinder <= 3;	mobil_1
select t2.makeid , t2.membuat from data_mobil as t1 join nama_mobil as t2 on t1.id = t2.makeid where t1.tenaga_kuda > (select min (daya_kuda) from data_mobil) and t1.silinder < 4;	mobil_1
select max (mpg) from data_mobil where silinder = 8 or year < 1980	mobil_1
select max (mpg) from data_mobil where silinder = 8 or year < 1980	mobil_1
SELECT DISTINCT T1.model FROM MODEL_DAFTAR AS T1 JOIN CAR_NAMES AS T2 ON T1.Model = T2.Model JOIN MOBIL_DATA AS T3 ON T2.MakeId = T3.Id JOIN CAR_MAKERS AS T4 ON T1.Pembuat = T4.Id WHERE T3.berat < 3500 AND T4.Nama_Lengkap != 'Mengarungi Motor Perusahaan';	mobil_1
SELECT DISTINCT T1.model FROM MODEL_DAFTAR AS T1 JOIN CAR_NAMES AS T2 ON T1.Model = T2.Model JOIN MOBIL_DATA AS T3 ON T2.MakeId = T3.Id JOIN CAR_MAKERS AS T4 ON T1.Pembuat = T4.Id WHERE T3.berat < 3500 AND T4.Nama_Lengkap != 'Mengarungi Motor Perusahaan';	mobil_1
SELECT Nama_Negara FROM negara EXCEPT SELECT T1.Nama_Negara FROM negara AS T1 JOIN CAR_MAKERS AS T2 ON T1.negaraId = T2.Negara;	mobil_1
SELECT Nama_Negara FROM negara EXCEPT SELECT T1.Nama_Negara FROM negara AS T1 JOIN CAR_MAKERS AS T2 ON T1.negaraId = T2.Negara;	mobil_1
select t1.id , t1.pembuat from pembuat_mobil as t1 join model_daftar as t2 on t1.id = t2.pembuat group by t1.id having count (*) >= 2 intersect select t1.id , t1.pembuat from pembuat_mobil as t1 join model_daftar as t2 on t1.id = t2.pembuat join nama_mobil as t3 on t2.model = t3.model group by t1.id having count (*) > 3;	mobil_1
SELECT T1.Id , T1.Pembuat FROM CAR_MAKERS AS T1 JOIN MODEL_DAFTAR AS T2 ON T1.Id = T2.Pembuat GROUP BY T1.Id HAVING count (*) >= 2 INTERSECT SELECT T1.Id , T1.Pembuat FROM CAR_MAKERS AS T1 JOIN MODEL_DAFTAR AS T2 ON T1.Id = T2.Pembuat JOIN CAR_NAMES AS T3 ON T2.model = T3.model GROUP BY T1.Id HAVING count (*) > 3;	mobil_1
SELECT T1.negaraId , T1.Nama_Negara FROM Negara AS T1 JOIN CAR_MAKERS AS T2 ON T1.Id_Negara = T2.Negara GROUP BY T1.negaraId HAVING count (*) > 3 UNION SELECT T1.negaraId , T1.Nama_Negara FROM Negara AS T1 JOIN CAR_MAKERS AS T2 ON T1.Id_Negara = T2.Negara JOIN MODEL_DAFTAR AS T3 ON T2.Id = T3.Pembuat WHERE T3.Model = 'perintah';	mobil_1
select t1.negaraid , t1.nama_negara from negara as t1 join pembuat_mobil as t2 on t1.negaraid = t2.negara group by t1.negaraid having count (*) > 3 union select t1.negaraid , t1.nama_negara from negara as t1 join pembuat_mobil as t2 on t1.negaraid = t2.negara join model_daftar as t3 on t2.id = t3.pembuat where t3.model = "perintah";	mobil_1
SELECT Negara FROM Maskapai_Penerbangan WHERE Perusahaan_penerbangan = 'Jet_Biru Maskapai_penerbangan'	penerbangan_2
SELECT Negara FROM Maskapai_Penerbangan WHERE Perusahaan_penerbangan = 'Jet_Biru Maskapai_penerbangan'	penerbangan_2
SELECT Singkatan FROM Maskapai_Penerbangan WHERE Perusahaan_penerbangan = 'Jet_Biru Maskapai_penerbangan'	penerbangan_2
SELECT Singkatan FROM Maskapai_Penerbangan WHERE Perusahaan_penerbangan = 'Jet_Biru Maskapai_penerbangan'	penerbangan_2
SELECT Perusahaan_penerbangan , Singkatan FROM Maskapai_Penerbangan WHERE Negara = 'Amerika_Serikat'	penerbangan_2
SELECT Perusahaan_penerbangan , Singkatan FROM Maskapai_Penerbangan WHERE Negara = 'Amerika_Serikat'	penerbangan_2
SELECT Kode_Bandara , Nama_Bandara FROM BANDARA WHERE kota = 'Antonius'	penerbangan_2
SELECT Kode_Bandara , Nama_Bandara FROM BANDARA WHERE kota = 'Antonius'	penerbangan_2
SELECT count (*) FROM Maskapai_Penerbangan	penerbangan_2
SELECT count (*) FROM Maskapai_Penerbangan	penerbangan_2
SELECT count (*) FROM BANDARA	penerbangan_2
SELECT count (*) FROM BANDARA	penerbangan_2
SELECT count (*) FROM PENERBANGAN	penerbangan_2
SELECT count (*) FROM PENERBANGAN	penerbangan_2
SELECT Perusahaan_penerbangan FROM Maskapai_Penerbangan WHERE Singkatan = 'UAL'	penerbangan_2
SELECT Perusahaan_penerbangan FROM Maskapai_Penerbangan WHERE Singkatan = 'UAL'	penerbangan_2
SELECT count (*) FROM Maskapai_Penerbangan WHERE Negara = 'Amerika_Serikat'	penerbangan_2
SELECT count (*) FROM Maskapai_Penerbangan WHERE Negara = 'Amerika_Serikat'	penerbangan_2
SELECT Kota , Negara FROM BANDARA WHERE Nama_Bandara = 'Alton'	penerbangan_2
SELECT Kota , Negara FROM BANDARA WHERE Nama_Bandara = 'Alton'	penerbangan_2
SELECT Nama_Bandara FROM BANDARA WHERE Kode_Bandara = 'AKO'	penerbangan_2
SELECT Nama_Bandara FROM BANDARA WHERE Kode_Bandara = 'AKO'	penerbangan_2
SELECT Nama_Bandara FROM BANDARA WHERE Kota = 'Aberdeen'	penerbangan_2
SELECT Nama_Bandara FROM BANDARA WHERE Kota = 'Aberdeen'	penerbangan_2
SELECT count (*) FROM PENERBANGAN WHERE SumberBandara = 'APG'	penerbangan_2
SELECT count (*) FROM PENERBANGAN WHERE SumberBandara = 'APG'	penerbangan_2
SELECT count (*) FROM PENERBANGAN WHERE Bandara_Tujuan = 'ATO'	penerbangan_2
SELECT count (*) FROM PENERBANGAN WHERE Bandara_Tujuan = 'ATO'	penerbangan_2
SELECT count (*) FROM PENERBANGAN AS T1 JOIN BANDARA AS T2 ON T1.SumberBandara = T2.Kode_Bandara WHERE T2.Kota = 'Aberdeen'	penerbangan_2
SELECT count (*) FROM PENERBANGAN AS T1 JOIN BANDARA AS T2 ON T1.SumberBandara = T2.Kode_Bandara WHERE T2.Kota = 'Aberdeen'	penerbangan_2
SELECT count (*) FROM PENERBANGAN AS T1 JOIN BANDARA AS T2 ON T1.Bandara_Tujuan = T2.Kode_Bandara WHERE T2.Kota = 'Aberdeen'	penerbangan_2
SELECT count (*) FROM PENERBANGAN AS T1 JOIN BANDARA AS T2 ON T1.Bandara_Tujuan = T2.Kode_Bandara WHERE T2.Kota = 'Aberdeen'	penerbangan_2
SELECT count (*) FROM PENERBANGAN AS T1 JOIN BANDARA AS T2 ON T1.Bandara_Tujuan = T2.Kode_Bandara JOIN BANDARA AS T3 ON T1.SumberBandara = T3.Kode_Bandara WHERE T2.Kota = 'Ashley' AND T3.Kota = 'Aberdeen'	penerbangan_2
SELECT count (*) FROM PENERBANGAN AS T1 JOIN BANDARA AS T2 ON T1.Bandara_Tujuan = T2.Kode_Bandara JOIN BANDARA AS T3 ON T1.SumberBandara = T3.Kode_Bandara WHERE T2.Kota = 'Ashley' AND T3.Kota = 'Aberdeen'	penerbangan_2
SELECT count (*) FROM PENERBANGAN AS T1 JOIN Maskapai_Penerbangan AS T2 ON T1._Maskapai_Penerbangan = T2.uid WHERE T2._Maskapai_Penerbangan = 'Jet_Biru Maskapai_penerbangan'	penerbangan_2
SELECT count (*) FROM PENERBANGAN AS T1 JOIN Maskapai_Penerbangan AS T2 ON T1._Maskapai_Penerbangan = T2.uid WHERE T2._Maskapai_Penerbangan = 'Jet_Biru Maskapai_penerbangan'	penerbangan_2
SELECT count (*) FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T2._Maskapai_Penerbangan = T1.uid WHERE T1._Maskapai_Penerbangan = 'Serikat Maskapai_penerbangan' AND T2.Bandara_Tujuan = 'ASY'	penerbangan_2
SELECT count (*) FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T2._Maskapai_Penerbangan = T1.uid WHERE T1._Maskapai_Penerbangan = 'Serikat Maskapai_penerbangan' AND T2.Bandara_Tujuan = 'ASY'	penerbangan_2
SELECT count (*) FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T2._Maskapai_Penerbangan = T1.uid WHERE T1._Maskapai_Penerbangan = 'Serikat Maskapai_penerbangan' AND T2.SourceAirport = 'AHD'	penerbangan_2
SELECT count (*) FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T2._Maskapai_Penerbangan = T1.uid WHERE T1._Maskapai_Penerbangan = 'Serikat Maskapai_penerbangan' AND T2.SourceAirport = 'AHD'	penerbangan_2
SELECT count (*) FROM PENERBANGAN AS T1 JOIN BANDARA AS T2 ON T1.Bandara_Tujuan = T2.Kode_Bandara JOIN Maskapai_Penerbangan AS T3 ON T3.uid = T1._Maskapai_Penerbangan WHERE T2.Kota = 'Aberdeen' AND T3._Maskapai_Penerbangan = 'Serikat Maskapai_penerbangan'	penerbangan_2
SELECT count (*) FROM PENERBANGAN AS T1 JOIN BANDARA AS T2 ON T1.Bandara_Tujuan = T2.Kode_Bandara JOIN Maskapai_Penerbangan AS T3 ON T3.uid = T1._Maskapai_Penerbangan WHERE T2.Kota = 'Aberdeen' AND T3._Maskapai_Penerbangan = 'Serikat Maskapai_penerbangan'	penerbangan_2
SELECT T1.Kota FROM BANDARA AS T1 JOIN PENERBANGAN AS T2 ON T1.Kode_Bandara = T2.Bandara_Tujuan GROUP BY T1.Kota ORDER BY count (*) DESC LIMIT 1	penerbangan_2
SELECT T1.Kota FROM BANDARA AS T1 JOIN PENERBANGAN AS T2 ON T1.Kode_Bandara = T2.Bandara_Tujuan GROUP BY T1.Kota ORDER BY count (*) DESC LIMIT 1	penerbangan_2
SELECT T1.Kota FROM BANDARA AS T1 JOIN PENERBANGAN AS T2 ON T1.Kode_Bandara = T2.SourceAirport GROUP BY T1.Kota ORDER BY count (*) DESC LIMIT 1	penerbangan_2
SELECT T1.Kota FROM BANDARA AS T1 JOIN PENERBANGAN AS T2 ON T1.Kode_Bandara = T2.SourceAirport GROUP BY T1.Kota ORDER BY count (*) DESC LIMIT 1	penerbangan_2
SELECT T1.Kode_Bandara FROM BANDARA AS T1 JOIN PENERBANGAN AS T2 ON T1.Kode_Bandara = T2.Bandara_Tujuan OR T1.Kode_Bandara = T2.SourceAirport GROUP BY T1.Kode_Bandara ORDER BY count (*) DESC LIMIT 1	penerbangan_2
SELECT T1.Kode_Bandara FROM BANDARA AS T1 JOIN PENERBANGAN AS T2 ON T1.Kode_Bandara = T2.Bandara_Tujuan OR T1.Kode_Bandara = T2.SourceAirport GROUP BY T1.Kode_Bandara ORDER BY count (*) DESC LIMIT 1	penerbangan_2
SELECT T1.Kode_Bandara FROM BANDARA AS T1 JOIN PENERBANGAN AS T2 ON T1.Kode_Bandara = T2.Bandara_Tujuan OR T1.Kode_Bandara = T2.SourceAirport GROUP BY T1.Kode_Bandara ORDER BY count (*) LIMIT 1	penerbangan_2
SELECT T1.Kode_Bandara FROM BANDARA AS T1 JOIN PENERBANGAN AS T2 ON T1.Kode_Bandara = T2.Bandara_Tujuan OR T1.Kode_Bandara = T2.SourceAirport GROUP BY T1.Kode_Bandara ORDER BY count (*) LIMIT 1	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan GROUP BY T1._Maskapai_Penerbangan ORDER BY count (*) DESC LIMIT 1	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan GROUP BY T1._Maskapai_Penerbangan ORDER BY count (*) DESC LIMIT 1	penerbangan_2
SELECT T1.Singkatan , T1.Negara FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan GROUP BY T1._Maskapai_Penerbangan ORDER BY count (*) LIMIT 1	penerbangan_2
SELECT T1.Singkatan , T1.Negara FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan GROUP BY T1._Maskapai_Penerbangan ORDER BY count (*) LIMIT 1	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan WHERE T2.SourceAirport = 'AHD'	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan WHERE T2.SourceAirport = 'AHD'	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan WHERE T2.Bandara_Tujuan = 'AHD'	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan WHERE T2.Bandara_Tujuan = 'AHD'	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan WHERE T2.SourceAirport = 'APG' INTERSECT SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan WHERE T2.SourceAirport = 'CVO'	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan WHERE T2.SourceAirport = 'APG' INTERSECT SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan WHERE T2.SourceAirport = 'CVO'	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan WHERE T2.SourceAirport = 'CVO' EXCEPT SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan WHERE T2.SourceAirport = 'APG'	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan WHERE T2.SourceAirport = 'CVO' EXCEPT SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan WHERE T2.SourceAirport = 'APG'	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan GROUP BY T1._Maskapai_Penerbangan HAVING count (*) > 10	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan GROUP BY T1._Maskapai_Penerbangan HAVING count (*) > 10	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan GROUP BY T1._Maskapai_Penerbangan HAVING count (*) < 200	penerbangan_2
SELECT T1._Maskapai_Penerbangan FROM Maskapai_Penerbangan AS T1 JOIN PENERBANGAN AS T2 ON T1.uid = T2._Maskapai_Penerbangan GROUP BY T1._Maskapai_Penerbangan HAVING count (*) < 200	penerbangan_2
SELECT T1.Nomor_Penerbangan FROM PENERBANGAN AS T1 JOIN Maskapai_Penerbangan AS T2 ON T2.uid = T1._Maskapai_Penerbangan WHERE T2._Maskapai_Penerbangan = 'Serikat Maskapai_penerbangan'	penerbangan_2
SELECT T1.Nomor_Penerbangan FROM PENERBANGAN AS T1 JOIN Maskapai_Penerbangan AS T2 ON T2.uid = T1._Maskapai_Penerbangan WHERE T2._Maskapai_Penerbangan = 'Serikat Maskapai_penerbangan'	penerbangan_2
SELECT Nomor_Penerbangan FROM PENERBANGAN WHERE SumberBandara = 'APG'	penerbangan_2
SELECT Nomor_Penerbangan FROM PENERBANGAN WHERE SumberBandara = 'APG'	penerbangan_2
SELECT Nomor_Penerbangan FROM PENERBANGAN WHERE Bandara_Tujuan = 'APG'	penerbangan_2
SELECT Nomor_Penerbangan FROM PENERBANGAN WHERE Bandara_Tujuan = 'APG'	penerbangan_2
SELECT T1.Nomor_Penerbangan FROM PENERBANGAN AS T1 JOIN BANDARA AS T2 ON T1.SumberBandara = T2.Kode_Bandara WHERE T2.Kota = 'Aberdeen'	penerbangan_2
SELECT T1.Nomor_Penerbangan FROM PENERBANGAN AS T1 JOIN BANDARA AS T2 ON T1.SumberBandara = T2.Kode_Bandara WHERE T2.Kota = 'Aberdeen'	penerbangan_2
SELECT T1.Nomor_Penerbangan FROM PENERBANGAN AS T1 JOIN BANDARA AS T2 ON T1.Bandara_Tujuan = T2.Kode_Bandara WHERE T2.Kota = 'Aberdeen'	penerbangan_2
SELECT T1.Nomor_Penerbangan FROM PENERBANGAN AS T1 JOIN BANDARA AS T2 ON T1.Bandara_Tujuan = T2.Kode_Bandara WHERE T2.Kota = 'Aberdeen'	penerbangan_2
SELECT count (*) FROM Penerbangan AS T1 JOIN Bandara AS T2 ON T1.Bandara_Tujuan = T2.Kode_Bandara WHERE T2.kota = 'Aberdeen' OR T2.kota = 'Abilene'	penerbangan_2
SELECT count (*) FROM Penerbangan AS T1 JOIN Bandara AS T2 ON T1.Bandara_Tujuan = T2.Kode_Bandara WHERE T2.kota = 'Aberdeen' OR T2.kota = 'Abilene'	penerbangan_2
SELECT Nama_Bandara FROM Bandara WHERE Kode_Bandara NOT IN (SELECT SumberBandara FROM Penerbangan UNION SELECT Bandara_Tujuan FROM Penerbangan)	penerbangan_2
SELECT Nama_Bandara FROM Bandara WHERE Kode_Bandara NOT IN (SELECT SumberBandara FROM Penerbangan UNION SELECT Bandara_Tujuan FROM Penerbangan)	penerbangan_2
SELECT count (*) FROM karyawan	evaluasi_pekerjaan_karyawan
SELECT count (*) FROM karyawan	evaluasi_pekerjaan_karyawan
SELECT nama FROM karyawan ORDER BY usia	evaluasi_pekerjaan_karyawan
SELECT nama FROM karyawan ORDER BY usia	evaluasi_pekerjaan_karyawan
SELECT count (*) , kota FROM karyawan GROUP BY kota	evaluasi_pekerjaan_karyawan
SELECT count (*) , kota FROM karyawan GROUP BY kota	evaluasi_pekerjaan_karyawan
SELECT kota FROM karyawan WHERE usia < 30 GROUP BY kota HAVING count (*) > 1	evaluasi_pekerjaan_karyawan
SELECT kota FROM karyawan WHERE usia < 30 GROUP BY kota HAVING count (*) > 1	evaluasi_pekerjaan_karyawan
SELECT count (*) , LOCATION FROM toko GROUP BY LOCATION	evaluasi_pekerjaan_karyawan
SELECT count (*) , LOCATION FROM toko GROUP BY LOCATION	evaluasi_pekerjaan_karyawan
SELECT nama_manajer , daerah FROM toko ORDER BY nomor_produk DESC LIMIT 1	evaluasi_pekerjaan_karyawan
SELECT nama_manajer , daerah FROM toko ORDER BY nomor_produk DESC LIMIT 1	evaluasi_pekerjaan_karyawan
SELECT min (Nomor_produk) , max (Nomor_produk) FROM toko	evaluasi_pekerjaan_karyawan
SELECT min (Nomor_produk) , max (Nomor_produk) FROM toko	evaluasi_pekerjaan_karyawan
SELECT nama , LOCATION , daerah FROM toko ORDER BY nomor_produk DESC	evaluasi_pekerjaan_karyawan
SELECT nama , LOCATION , daerah FROM toko ORDER BY nomor_produk DESC	evaluasi_pekerjaan_karyawan
SELECT nama FROM toko WHERE nomor_produk > (SELECT avg (nomor_produk) FROM toko)	evaluasi_pekerjaan_karyawan
SELECT nama FROM toko WHERE nomor_produk > (SELECT avg (nomor_produk) FROM toko)	evaluasi_pekerjaan_karyawan
SELECT t1.nama FROM karyawan AS t1 JOIN evaluasi AS t2 ON t1.ID_Karyawan = t2.ID_Employee GROUP BY t2.ID_Employee ORDER BY count (*) DESC LIMIT 1	evaluasi_pekerjaan_karyawan
SELECT t1.nama FROM karyawan AS t1 JOIN evaluasi AS t2 ON t1.ID_Karyawan = t2.ID_Employee GROUP BY t2.ID_Employee ORDER BY count (*) DESC LIMIT 1	evaluasi_pekerjaan_karyawan
SELECT t1.nama FROM karyawan AS t1 JOIN evaluasi AS t2 ON t1.ID_Karyawan = t2.ID_Employee ORDER BY t2.bonus DESC LIMIT 1	evaluasi_pekerjaan_karyawan
SELECT t1.nama FROM karyawan AS t1 JOIN evaluasi AS t2 ON t1.ID_Karyawan = t2.ID_Employee ORDER BY t2.bonus DESC LIMIT 1	evaluasi_pekerjaan_karyawan
SELECT nama FROM karyawan WHERE ID_Karyawan NOT IN (SELECT ID_Karyawan FROM evaluasi)	evaluasi_pekerjaan_karyawan
SELECT nama FROM karyawan WHERE ID_Karyawan NOT IN (SELECT ID_Karyawan FROM evaluasi)	evaluasi_pekerjaan_karyawan
SELECT t2.nama FROM mempekerjakan AS t1 JOIN toko AS t2 ON t1.id_toko = t2.id_shop GROUP BY t1.id_toko ORDER BY count (*) DESC LIMIT 1	evaluasi_pekerjaan_karyawan
SELECT t2.nama FROM mempekerjakan AS t1 JOIN toko AS t2 ON t1.id_toko = t2.id_shop GROUP BY t1.id_toko ORDER BY count (*) DESC LIMIT 1	evaluasi_pekerjaan_karyawan
SELECT nama FROM toko WHERE id_toko NOT IN (SELECT id_toko FROM mempekerjakan)	evaluasi_pekerjaan_karyawan
SELECT nama FROM toko WHERE id_toko NOT IN (SELECT id_toko FROM mempekerjakan)	evaluasi_pekerjaan_karyawan
SELECT count (*) , t2.nama FROM mempekerjakan AS t1 JOIN toko AS t2 ON t1.id_toko = t2.id_shop GROUP BY t2.nama	evaluasi_pekerjaan_karyawan
SELECT count (*) , t2.nama FROM mempekerjakan AS t1 JOIN toko AS t2 ON t1.id_toko = t2.id_shop GROUP BY t2.nama	evaluasi_pekerjaan_karyawan
SELECT sum (bonus) FROM evaluasi	evaluasi_pekerjaan_karyawan
SELECT sum (bonus) FROM evaluasi	evaluasi_pekerjaan_karyawan
SELECT * FROM mempekerjakan	evaluasi_pekerjaan_karyawan
SELECT * FROM mempekerjakan	evaluasi_pekerjaan_karyawan
SELECT daerah FROM toko WHERE Nomor_produk < 3000 INTERSECT SELECT daerah FROM toko WHERE Nomor_produk > 10.000	evaluasi_pekerjaan_karyawan
SELECT daerah FROM toko WHERE Nomor_produk < 3000 INTERSECT SELECT daerah FROM toko WHERE Nomor_produk > 10.000	evaluasi_pekerjaan_karyawan
SELECT count (DISTINCT LOCATION) FROM toko	evaluasi_pekerjaan_karyawan
SELECT count (DISTINCT LOCATION) FROM toko	evaluasi_pekerjaan_karyawan
SELECT count (*) FROM Dokumen	cre_Doc_Template_Mgt
SELECT count (*) FROM Dokumen	cre_Doc_Template_Mgt
SELECT id_dokumen , nama_dokumen , deskripsi_dokumen FROM Dokumen	cre_Doc_Template_Mgt
SELECT id_dokumen , nama_dokumen , deskripsi_dokumen FROM Dokumen	cre_Doc_Template_Mgt
SELECT nama_dokumen , id_templat FROM Dokumen WHERE Dokumen_Deskripsi LIKE '%w%'	cre_Doc_Template_Mgt
SELECT nama_dokumen , id_templat FROM Dokumen WHERE Dokumen_Deskripsi LIKE '%w%'	cre_Doc_Template_Mgt
SELECT id_dokumen , id_templat , Dokumen_Deskripsi FROM Dokumen WHERE nama_dokumen = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT id_dokumen , id_templat , Dokumen_Deskripsi FROM Dokumen WHERE nama_dokumen = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT count (DISTINCT id_templat) FROM Dokumen	cre_Doc_Template_Mgt
SELECT count (DISTINCT id_templat) FROM Dokumen	cre_Doc_Template_Mgt
SELECT count (*) FROM Dokumen AS T1 JOIN Templat AS T2 ON T1.ID_Templat = T2.ID_Templat WHERE T2.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT count (*) FROM Dokumen AS T1 JOIN Templat AS T2 ON T1.ID_Templat = T2.ID_Templat WHERE T2.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT id_templat , count (*) FROM Dokumen GROUP BY id_templat	cre_Doc_Template_Mgt
SELECT id_templat , count (*) FROM Dokumen GROUP BY id_templat	cre_Doc_Template_Mgt
SELECT T1.id_template , T2.Template_Type_Code FROM Dokumen AS T1 JOIN Templat AS T2 ON T1.id_template = T2.id_template GROUP BY T1.id_template ORDER BY count (*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT T1.id_template , T2.Template_Type_Code FROM Dokumen AS T1 JOIN Templat AS T2 ON T1.id_template = T2.id_template GROUP BY T1.id_template ORDER BY count (*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT id_templat FROM Dokumen GROUP BY id_templat HAVING count (*) > 1	cre_Doc_Template_Mgt
SELECT id_templat FROM Dokumen GROUP BY id_templat HAVING count (*) > 1	cre_Doc_Template_Mgt
SELECT id_templat FROM Templat EXCEPT SELECT id_templat FROM Dokumen	cre_Doc_Template_Mgt
SELECT id_templat FROM Templat EXCEPT SELECT id_templat FROM Dokumen	cre_Doc_Template_Mgt
SELECT count (*) FROM Templat	cre_Doc_Template_Mgt
SELECT count (*) FROM Templat	cre_Doc_Template_Mgt
SELECT id_templat , nomor_versi , template_type_code FROM Templat	cre_Doc_Template_Mgt
SELECT id_templat , nomor_versi , template_type_code FROM Templat	cre_Doc_Template_Mgt
SELECT DISTINCT template_type_code FROM Templat	cre_Doc_Template_Mgt
SELECT DISTINCT template_type_code FROM Templat	cre_Doc_Template_Mgt
SELECT id_templat FROM Templat WHERE template_type_code = 'hal' OR template_type_code = 'PPT'	cre_Doc_Template_Mgt
SELECT id_templat FROM Templat WHERE template_type_code = 'hal' OR template_type_code = 'PPT'	cre_Doc_Template_Mgt
SELECT count (*) FROM Templat WHERE template_type_code = 'CV'	cre_Doc_Template_Mgt
SELECT count (*) FROM Templat WHERE template_type_code = 'CV'	cre_Doc_Template_Mgt
SELECT nomor_versi , template_type_code FROM Templat WHERE nomor_versi > 5	cre_Doc_Template_Mgt
SELECT nomor_versi , template_type_code FROM Templat WHERE nomor_versi > 5	cre_Doc_Template_Mgt
SELECT template_type_code , count (*) FROM Templat GROUP BY template_type_code	cre_Doc_Template_Mgt
SELECT template_type_code , count (*) FROM Templat GROUP BY template_type_code	cre_Doc_Template_Mgt
SELECT template_type_code FROM Templat GROUP BY template_type_code ORDER BY count (*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT template_type_code FROM Templat GROUP BY template_type_code ORDER BY count (*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT template_type_code FROM Templat GROUP BY template_type_code HAVING count (*) < 3	cre_Doc_Template_Mgt
SELECT template_type_code FROM Templat GROUP BY template_type_code HAVING count (*) < 3	cre_Doc_Template_Mgt
SELECT min (Versi_Nomor) , template_type_code FROM Templat	cre_Doc_Template_Mgt
SELECT min (Versi_Nomor) , template_type_code FROM Templat	cre_Doc_Template_Mgt
SELECT T1.template_type_code FROM Templat AS T1 JOIN Dokumen AS T2 ON T1.id_template = T2.id_template WHERE T2.nama_dokumen = 'Data basis'	cre_Doc_Template_Mgt
SELECT T1.template_type_code FROM Templat AS T1 JOIN Dokumen AS T2 ON T1.id_template = T2.id_template WHERE T2.nama_dokumen = 'Data basis'	cre_Doc_Template_Mgt
SELECT T2.nama_dokumen FROM Templat AS T1 JOIN Dokumen AS T2 ON T1.id_template = T2.id_template WHERE T1.template_type_code = 'BK'	cre_Doc_Template_Mgt
SELECT T2.nama_dokumen FROM Templat AS T1 JOIN Dokumen AS T2 ON T1.id_template = T2.id_template WHERE T1.template_type_code = 'BK'	cre_Doc_Template_Mgt
SELECT T1.template_type_code , count (*) FROM Templat AS T1 JOIN Dokumen AS T2 ON T1.id_template = T2.id_template GROUP BY T1.template_type_code	cre_Doc_Template_Mgt
SELECT T1.template_type_code , count (*) FROM Templat AS T1 JOIN Dokumen AS T2 ON T1.id_template = T2.id_template GROUP BY T1.template_type_code	cre_Doc_Template_Mgt
SELECT T1.template_type_code FROM Templat AS T1 JOIN Dokumen AS T2 ON T1.id_template = T2.id_template GROUP BY T1.template_type_code ORDER BY count (*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT T1.template_type_code FROM Templat AS T1 JOIN Dokumen AS T2 ON T1.id_template = T2.id_template GROUP BY T1.template_type_code ORDER BY count (*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT template_type_code FROM Templat EXCEPT SELECT template_type_code FROM Templat AS T1 JOIN Dokumen AS T2 ON T1.id_template = T2.id_template	cre_Doc_Template_Mgt
SELECT template_type_code FROM Templat EXCEPT SELECT template_type_code FROM Templat AS T1 JOIN Dokumen AS T2 ON T1.id_template = T2.id_template	cre_Doc_Template_Mgt
SELECT template_type_code , template_type_description FROM Ref_template_types	cre_Doc_Template_Mgt
SELECT template_type_code , template_type_description FROM Ref_template_types	cre_Doc_Template_Mgt
SELECT template_type_description FROM Ref_template_types WHERE template_type_code = 'IKLAN'	cre_Doc_Template_Mgt
SELECT template_type_description FROM Ref_template_types WHERE template_type_code = 'IKLAN'	cre_Doc_Template_Mgt
SELECT template_type_code FROM Ref_template_types WHERE template_type_description = 'Buku'	cre_Doc_Template_Mgt
SELECT template_type_code FROM Ref_template_types WHERE template_type_description = 'Buku'	cre_Doc_Template_Mgt
SELECT DISTINCT T1.template_type_description FROM Ref_template_types AS T1 JOIN Templat AS T2 ON T1.template_type_code = T2.template_type_code JOIN Dokumen AS T3 ON T2.ID_Templat = T3.ID_template	cre_Doc_Template_Mgt
SELECT DISTINCT T1.template_type_description FROM Ref_template_types AS T1 JOIN Templat AS T2 ON T1.template_type_code = T2.template_type_code JOIN Dokumen AS T3 ON T2.ID_Templat = T3.ID_template	cre_Doc_Template_Mgt
SELECT T2.id_template FROM Ref_template_types AS T1 JOIN Templat AS T2 ON T1.template_type_code = T2.template_type_code WHERE T1.template_type_description = 'Presentasi'	cre_Doc_Template_Mgt
SELECT T2.id_template FROM Ref_template_types AS T1 JOIN Templat AS T2 ON T1.template_type_code = T2.template_type_code WHERE T1.template_type_description = 'Presentasi'	cre_Doc_Template_Mgt
SELECT count (*) FROM Paragraf	cre_Doc_Template_Mgt
SELECT count (*) FROM Paragraf	cre_Doc_Template_Mgt
SELECT count (*) FROM Paragraf AS T1 JOIN Dokumen AS T2 ON T1.ID_dokumen = T2.ID_dokumen WHERE T2.nama_dokumen = 'Musim_panas Show'	cre_Doc_Template_Mgt
SELECT count (*) FROM Paragraf AS T1 JOIN Dokumen AS T2 ON T1.ID_dokumen = T2.ID_dokumen WHERE T2.nama_dokumen = 'Musim_panas Show'	cre_Doc_Template_Mgt
select detail_lainnya from paragraf where paragraf_teks like "Korea"	cre_Doc_Template_Mgt
select detail_lainnya from paragraf where paragraf_teks like "Korea"	cre_Doc_Template_Mgt
SELECT T1.id_paragraf , T1.paragraf_teks FROM Paragraf AS T1 JOIN Dokumen AS T2 ON T1.id_document = T2.id_document WHERE T2.Nama_Dokumen = 'Selamat_datang to NY'	cre_Doc_Template_Mgt
SELECT T1.id_paragraf , T1.paragraf_teks FROM Paragraf AS T1 JOIN Dokumen AS T2 ON T1.id_document = T2.id_document WHERE T2.Nama_Dokumen = 'Selamat_datang to NY'	cre_Doc_Template_Mgt
SELECT T1.paragraf_teks FROM Paragraf AS T1 JOIN Dokumen AS T2 ON T1.id_document = T2.id_document WHERE T2.nama_dokumen = 'Pelanggan ulasan'	cre_Doc_Template_Mgt
SELECT T1.paragraf_teks FROM Paragraf AS T1 JOIN Dokumen AS T2 ON T1.id_document = T2.id_document WHERE T2.nama_dokumen = 'Pelanggan ulasan'	cre_Doc_Template_Mgt
SELECT id_dokumen , count (*) FROM Paragraf GROUP BY id_dokumen ORDER BY id_dokumen	cre_Doc_Template_Mgt
SELECT id_dokumen , count (*) FROM Paragraf GROUP BY id_dokumen ORDER BY id_dokumen	cre_Doc_Template_Mgt
SELECT T1.id_document , T2.nama_dokumen , count (*) FROM Paragraf AS T1 JOIN Dokumen AS T2 ON T1.id_document = T2.id_document GROUP BY T1.id_document	cre_Doc_Template_Mgt
SELECT T1.id_document , T2.nama_dokumen , count (*) FROM Paragraf AS T1 JOIN Dokumen AS T2 ON T1.id_document = T2.id_document GROUP BY T1.id_document	cre_Doc_Template_Mgt
SELECT id_dokumen FROM Paragraf GROUP BY id_dokumen HAVING count (*) >= 2	cre_Doc_Template_Mgt
SELECT id_dokumen FROM Paragraf GROUP BY id_dokumen HAVING count (*) >= 2	cre_Doc_Template_Mgt
SELECT T1.id_document , T2.nama_dokumen FROM Paragraf AS T1 JOIN Dokumen AS T2 ON T1.id_document = T2.id_document GROUP BY T1.id_document ORDER BY count (*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT T1.id_document , T2.nama_dokumen FROM Paragraf AS T1 JOIN Dokumen AS T2 ON T1.id_document = T2.id_document GROUP BY T1.id_document ORDER BY count (*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT id_dokumen FROM Paragraf GROUP BY id_dokumen ORDER BY count (*) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT id_dokumen FROM Paragraf GROUP BY id_dokumen ORDER BY count (*) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT id_dokumen FROM Paragraf GROUP BY id_dokumen HAVING count (*) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT id_dokumen FROM Paragraf GROUP BY id_dokumen HAVING count (*) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT id_dokumen FROM Paragraf WHERE paragraf_teks = 'Brazil' INTERSECT SELECT id_dokumen FROM Paragraf WHERE paragraf_teks = 'Irlandia'	cre_Doc_Template_Mgt
SELECT id_dokumen FROM Paragraf WHERE paragraf_teks = 'Brazil' INTERSECT SELECT id_dokumen FROM Paragraf WHERE paragraf_teks = 'Irlandia'	cre_Doc_Template_Mgt
SELECT count (*) FROM guru	kursus_mengajar
SELECT count (*) FROM guru	kursus_mengajar
SELECT Name FROM guru ORDER BY Usia ASC	kursus_mengajar
SELECT Name FROM guru ORDER BY Usia ASC	kursus_mengajar
SELECT Usia , kampung_halaman FROM guru	kursus_mengajar
SELECT Usia , kampung_halaman FROM guru	kursus_mengajar
select nama from guru where kampung_halaman != "distrik_kota_tua_kecil"	kursus_mengajar
select nama from guru where kampung_halaman != "distrik_kota_tua_kecil"	kursus_mengajar
SELECT Name FROM guru WHERE Usia = 32 OR Usia = 33	kursus_mengajar
SELECT Name FROM guru WHERE Usia = 32 OR Usia = 33	kursus_mengajar
SELECT kampung_halaman FROM guru ORDER BY Usia ASC LIMIT 1	kursus_mengajar
SELECT kampung_halaman FROM guru ORDER BY Usia ASC LIMIT 1	kursus_mengajar
SELECT kampung_halaman , COUNT (*) FROM guru GROUP BY kampung_halaman	kursus_mengajar
SELECT kampung_halaman , COUNT (*) FROM guru GROUP BY kampung_halaman	kursus_mengajar
SELECT kampung_halaman FROM guru GROUP BY kampung_halaman ORDER BY COUNT (*) DESC LIMIT 1	kursus_mengajar
SELECT kampung_halaman FROM guru GROUP BY kampung_halaman ORDER BY COUNT (*) DESC LIMIT 1	kursus_mengajar
SELECT kampung_halaman FROM guru GROUP BY kampung_halaman HAVING COUNT (*) >= 2	kursus_mengajar
SELECT kampung_halaman FROM guru GROUP BY kampung_halaman HAVING COUNT (*) >= 2	kursus_mengajar
SELECT T3.Nama , T2.Kursus FROM kursus_arrange AS T1 JOIN kursus AS T2 ON T1.ID_Kursus = T2.ID_Kursus JOIN guru AS T3 ON T1.ID_Guru = T3.ID_Guru	kursus_mengajar
SELECT T3.Nama , T2.Kursus FROM kursus_arrange AS T1 JOIN kursus AS T2 ON T1.ID_Kursus = T2.ID_Kursus JOIN guru AS T3 ON T1.ID_Guru = T3.ID_Guru	kursus_mengajar
SELECT T3.Nama , T2.Kursus FROM kursus_arrange AS T1 JOIN kursus AS T2 ON T1.ID_Kursus = T2.ID_Kursus JOIN guru AS T3 ON T1.ID_Guru = T3.ID_Guru ORDER BY T3.Nama	kursus_mengajar
SELECT T3.Nama , T2.Kursus FROM kursus_arrange AS T1 JOIN kursus AS T2 ON T1.ID_Kursus = T2.ID_Kursus JOIN guru AS T3 ON T1.ID_Guru = T3.ID_Guru ORDER BY T3.Nama	kursus_mengajar
SELECT T3.Nama FROM kursus_arrange AS T1 JOIN kursus AS T2 ON T1.ID_Kursus = T2.ID_Kursus JOIN guru AS T3 ON T1.ID_Guru = T3.ID_Guru WHERE T2.Kursus = 'Matematika'	kursus_mengajar
SELECT T3.Nama FROM kursus_arrange AS T1 JOIN kursus AS T2 ON T1.ID_Kursus = T2.ID_Kursus JOIN guru AS T3 ON T1.ID_Guru = T3.ID_Guru WHERE T2.Kursus = 'Matematika'	kursus_mengajar
SELECT T2.Nama , COUNT (*) FROM kursus_arrange AS T1 JOIN guru AS T2 ON T1.ID_Guru = T2.ID_Guru GROUP BY T2.Nama	kursus_mengajar
SELECT T2.Nama , COUNT (*) FROM kursus_arrange AS T1 JOIN guru AS T2 ON T1.ID_Guru = T2.ID_Guru GROUP BY T2.Nama	kursus_mengajar
SELECT T2.Nama FROM kursus_arrange AS T1 JOIN guru AS T2 ON T1.ID_Guru = T2.ID_Guru GROUP BY T2.Nama HAVING COUNT (*) >= 2	kursus_mengajar
SELECT T2.Nama FROM kursus_arrange AS T1 JOIN guru AS T2 ON T1.ID_Guru = T2.ID_Guru GROUP BY T2.Nama HAVING COUNT (*) >= 2	kursus_mengajar
SELECT Name FROM guru WHERE id_Guru NOT IN (SELECT id_Guru FROM kursus_arrange)	kursus_mengajar
SELECT Name FROM guru WHERE id_Guru NOT IN (SELECT id_Guru FROM kursus_arrange)	kursus_mengajar
SELECT count (*) FROM pengunjung WHERE usia < 30	museum_kunjungan
SELECT nama FROM pengunjung WHERE Tingkat_keanggotaan > 4 ORDER BY Tingkat_keanggotaan DESC	museum_kunjungan
SELECT avg (usia) FROM pengunjung WHERE Tingkat_keanggotaan <= 4	museum_kunjungan
SELECT nama , Tingkat_keanggotaan FROM pengunjung WHERE Tingkat_keanggotaan > 4 ORDER BY usia DESC	museum_kunjungan
SELECT id_museum , nama FROM museum ORDER BY jumlah_staf DESC LIMIT 1	museum_kunjungan
SELECT avg (jumlah_staf) FROM museum WHERE tahun_terbuka < 2009	museum_kunjungan
SELECT Jumlah_Staf , Buka_Tahun FROM museum WHERE nama = 'alun-alun Museum'	museum_kunjungan
SELECT nama FROM museum WHERE jumlah_staf > (SELECT min (jumlah_staf) FROM museum WHERE tahun_terbuka > 2010)	museum_kunjungan
SELECT t1.id , t1.nama , t1.usia FROM pengunjung AS t1 JOIN mengunjungi AS t2 ON t1.id = t2.id_visitor GROUP BY t1.id HAVING count (*) > 1	museum_kunjungan
SELECT t2.id_visitor , t1.nama , t1.Level_of_keanggotaan FROM pengunjung AS t1 JOIN mengunjungi AS t2 ON t1.id = t2.id_visitor GROUP BY t2.id_visitor ORDER BY sum (t2.Total_pengeluaran) DESC LIMIT 1	museum_kunjungan
SELECT t2.ID_Museum , t1.nama FROM museum AS t1 JOIN mengunjungi AS t2 ON t1.ID_Museum = t2.ID_Museum GROUP BY t2.ID_Museum ORDER BY count (*) DESC LIMIT 1	museum_kunjungan
SELECT nama FROM museum WHERE ID_Museum NOT IN (SELECT id_museum FROM mengunjungi)	museum_kunjungan
SELECT t1.nama , t1.usia FROM pengunjung AS t1 JOIN mengunjungi AS t2 ON t1.id = t2.id_visitor ORDER BY t2.num_of_ticket DESC LIMIT 1	museum_kunjungan
SELECT avg (jumlah_tiket) , max (jumlah_tiket) FROM mengunjungi	museum_kunjungan
SELECT sum (t2.Total_pengeluaran) FROM pengunjung AS t1 JOIN mengunjungi AS t2 ON t1.id = t2.id_visitor WHERE t1.Level_of_keanggotaan = 1	museum_kunjungan
SELECT t1.nama FROM pengunjung AS t1 JOIN mengunjungi AS t2 ON t1.id = t2.id_visitor JOIN museum AS t3 ON t3.ID_Museum = t2.ID_Museum WHERE t3.open_year < 2009 INTERSECT SELECT t1.nama FROM pengunjung AS t1 JOIN mengunjungi AS t2 ON t1.id = t2.id_visitor JOIN museum AS t3 ON t3.ID_Museum = t2.ID_Museum WHERE t3.open_year > 2011	museum_kunjungan
SELECT count (*) FROM pengunjung WHERE id NOT IN (SELECT t2.id_visitor FROM museum AS t1 JOIN mengunjungi AS t2 ON t1.ID_Museum = t2.ID_Museum WHERE t1.open_year > 2010)	museum_kunjungan
SELECT count (*) FROM museum WHERE tahun_terbuka > 2013 OR tahun_terbuka < 2008	museum_kunjungan
SELECT count (*) FROM pemain	wta_1
SELECT count (*) FROM pemain	wta_1
SELECT count (*) FROM matches	wta_1
SELECT count (*) FROM matches	wta_1
SELECT nama_depan , tanggal_lahir FROM pemain WHERE kode_negara = 'Amerika_Serikat'	wta_1
SELECT nama_depan , tanggal_lahir FROM pemain WHERE kode_negara = 'Amerika_Serikat'	wta_1
SELECT avg (pecundang_usia) , avg (pemenang_usia) FROM matches	wta_1
SELECT avg (pecundang_usia) , avg (pemenang_usia) FROM matches	wta_1
SELECT avg (pemenang_peringkat) FROM matches	wta_1
SELECT avg (pemenang_peringkat) FROM matches	wta_1
SELECT min (pecundang_peringkat) FROM matches	wta_1
SELECT min (pecundang_peringkat) FROM matches	wta_1
SELECT count (DISTINCT kode_negara) FROM pemain	wta_1
SELECT count (DISTINCT kode_negara) FROM pemain	wta_1
SELECT count (DISTINCT nama_pecundang) FROM matches	wta_1
SELECT count (DISTINCT nama_pecundang) FROM matches	wta_1
SELECT nama_pertandingan FROM matches GROUP BY nama_pertandingan HAVING count (*) > 10	wta_1
SELECT nama_pertandingan FROM matches GROUP BY nama_pertandingan HAVING count (*) > 10	wta_1
SELECT nama_pemenang FROM matches WHERE YEAR = 2013 INTERSECT SELECT nama_pemenang FROM matches WHERE YEAR = 2016	wta_1
SELECT nama_pemenang FROM matches WHERE YEAR = 2013 INTERSECT SELECT nama_pemenang FROM matches WHERE YEAR = 2016	wta_1
SELECT count (*) FROM matches WHERE YEAR = 2013 OR YEAR = 2016	wta_1
SELECT count (*) FROM matches WHERE YEAR = 2013 OR YEAR = 2016	wta_1
SELECT T1.kode_negara , T1.nama_depan FROM pemain AS T1 JOIN matches AS T2 ON T1.id_player = T2.id_winner WHERE T2.nama_turnaman = 'WTA Kejuaraan' INTERSECT SELECT T1.kode_negara , T1.nama_depan FROM pemain AS T1 JOIN matches AS T2 ON T1.id_player = T2.id_winner WHERE T2.nama_turnaman = 'Australia Open'	wta_1
SELECT T1.kode_negara , T1.nama_depan FROM pemain AS T1 JOIN matches AS T2 ON T1.id_player = T2.id_winner WHERE T2.nama_turnaman = 'WTA Kejuaraan' INTERSECT SELECT T1.kode_negara , T1.nama_depan FROM pemain AS T1 JOIN matches AS T2 ON T1.id_player = T2.id_winner WHERE T2.nama_turnaman = 'Australia Open'	wta_1
SELECT nama_depan , kode_negara FROM pemain ORDER BY tanggal_lahir LIMIT 1	wta_1
SELECT nama_depan , kode_negara FROM pemain ORDER BY tanggal_lahir LIMIT 1	wta_1
SELECT nama_depan , nama_belakang FROM pemain ORDER BY tanggal_lahir	wta_1
SELECT nama_depan , nama_belakang FROM pemain ORDER BY tanggal_lahir	wta_1
SELECT nama_depan , nama_belakang FROM pemain WHERE tangan = 'L' ORDER BY tanggal_lahir	wta_1
SELECT nama_depan , nama_belakang FROM pemain WHERE tangan = 'L' ORDER BY tanggal_lahir	wta_1
SELECT T1.kode_negara , T1.nama_depan FROM pemain AS T1 JOIN peringkat AS T2 ON T1.id_player = T2.id_player ORDER BY T2.tur DESC LIMIT 1	wta_1
SELECT T1.kode_negara , T1.nama_depan FROM pemain AS T1 JOIN peringkat AS T2 ON T1.id_player = T2.id_player ORDER BY T2.tur DESC LIMIT 1	wta_1
SELECT YEAR FROM matches GROUP BY YEAR ORDER BY count (*) DESC LIMIT 1	wta_1
SELECT YEAR FROM matches GROUP BY YEAR ORDER BY count (*) DESC LIMIT 1	wta_1
SELECT nama_pemenang , poin_peringkat_pemenang FROM matches GROUP BY nama_pemenang ORDER BY count (*) DESC LIMIT 1	wta_1
SELECT nama_pemenang , poin_peringkat_pemenang FROM matches GROUP BY nama_pemenang ORDER BY count (*) DESC LIMIT 1	wta_1
SELECT nama_pemenang FROM matches WHERE nama_pertandingan = 'Australia Open' ORDER BY poin_peringkat_pemenang DESC LIMIT 1	wta_1
SELECT nama_pemenang FROM matches WHERE nama_pertandingan = 'Australia Open' ORDER BY poin_peringkat_pemenang DESC LIMIT 1	wta_1
SELECT nama_pemenang , nama_pecundang FROM matches ORDER BY minutes DESC LIMIT 1	wta_1
SELECT nama_pemenang , nama_pecundang FROM matches ORDER BY minutes DESC LIMIT 1	wta_1
SELECT avg (peringkat) , T1.nama_depan FROM pemain AS T1 JOIN peringkat AS T2 ON T1.id_player = T2.id_player GROUP BY T1.nama_depan	wta_1
SELECT avg (peringkat) , T1.nama_depan FROM pemain AS T1 JOIN peringkat AS T2 ON T1.id_player = T2.id_player GROUP BY T1.nama_depan	wta_1
SELECT sum (peringkat_poin) , T1.nama_depan FROM pemain AS T1 JOIN peringkat AS T2 ON T1.id_player = T2.id_player GROUP BY T1.nama_depan	wta_1
SELECT sum (peringkat_poin) , T1.nama_depan FROM pemain AS T1 JOIN peringkat AS T2 ON T1.id_player = T2.id_player GROUP BY T1.nama_depan	wta_1
SELECT count (*) , kode_negara FROM pemain GROUP BY kode_negara	wta_1
SELECT count (*) , kode_negara FROM pemain GROUP BY kode_negara	wta_1
SELECT kode_negara FROM pemain GROUP BY kode_negara ORDER BY count (*) DESC LIMIT 1	wta_1
SELECT kode_negara FROM pemain GROUP BY kode_negara ORDER BY count (*) DESC LIMIT 1	wta_1
SELECT kode_negara FROM pemain GROUP BY kode_negara HAVING count (*) > 50	wta_1
SELECT kode_negara FROM pemain GROUP BY kode_negara HAVING count (*) > 50	wta_1
SELECT sum (wisata) , peringkat_tanggal FROM peringkat GROUP BY peringkat_tanggal	wta_1
SELECT sum (wisata) , peringkat_tanggal FROM peringkat GROUP BY peringkat_tanggal	wta_1
SELECT count (*) , YEAR FROM matches GROUP BY YEAR	wta_1
SELECT count (*) , YEAR FROM matches GROUP BY YEAR	wta_1
SELECT DISTINCT nama_pemenang , pemenang_peringkat FROM matches ORDER BY pemenang_usia LIMIT 3	wta_1
SELECT DISTINCT nama_pemenang , pemenang_peringkat FROM matches ORDER BY pemenang_usia LIMIT 3	wta_1
SELECT count (DISTINCT nama_pemenang) FROM matches WHERE nama_pertandingan = 'WTA Kejuaraan' AND pemenang_tangan = 'L'	wta_1
SELECT count (DISTINCT nama_pemenang) FROM matches WHERE nama_pertandingan = 'WTA Kejuaraan' AND pemenang_tangan = 'L'	wta_1
SELECT T1.nama_depan , T1.kode_negara , T1.tanggal_lahir FROM pemain AS T1 JOIN matches AS T2 ON T1.id_player = T2.id_winner ORDER BY T2.winner_rank_points DESC LIMIT 1	wta_1
SELECT T1.nama_depan , T1.kode_negara , T1.tanggal_lahir FROM pemain AS T1 JOIN matches AS T2 ON T1.id_player = T2.id_winner ORDER BY T2.winner_rank_points DESC LIMIT 1	wta_1
SELECT count (*) , tangan FROM pemain GROUP BY tangan	wta_1
SELECT count (*) , tangan FROM pemain GROUP BY tangan	wta_1
SELECT count (*) FROM mengirimkan WHERE disposisi_of_kapal = 'Ditangkap'	pertempuran_kematian
SELECT nama , tonase FROM mengirimkan ORDER BY nama DESC	pertempuran_kematian
SELECT nama , date FROM pertempuran	pertempuran_kematian
SELECT max (terbunuh) , min (terbunuh) FROM kematian	pertempuran_kematian
SELECT avg (terluka) FROM kematian	pertempuran_kematian
SELECT T1.terbunuh , T1.terluka FROM kematian AS T1 JOIN mengirimkan AS t2 ON T1.id_disebabkan_oleh_kapal = T2.id WHERE T2.tonase = 'T'	pertempuran_kematian
SELECT nama , RESULT FROM pertempuran WHERE komandan_bulgaria != 'Boril'	pertempuran_kematian
SELECT DISTINCT T1.id , T1.nama FROM pertempuran AS T1 JOIN mengirimkan AS T2 ON T1.id = T2.kalah_dalam_pertempuran WHERE T2.tipe_kapal = 'Penjara'	pertempuran_kematian
SELECT T1.id , T1.nama FROM pertempuran AS T1 JOIN mengirimkan AS T2 ON T1.id = T2.kalah_dalam_pertempuran JOIN kematian AS T3 ON T2.id = T3.id_disebabkan_oleh_kapal GROUP BY T1.id HAVING sum (T3.terbunuh) > 10	pertempuran_kematian
SELECT T2.id , T2.nama FROM kematian AS T1 JOIN mengirimkan AS t2 ON T1.id_disebabkan_oleh_kapal = T2.id GROUP BY T2.id ORDER BY count (*) DESC LIMIT 1	pertempuran_kematian
SELECT nama FROM pertempuran WHERE komandan_bulgaria = 'Kaloyan' AND latin_commander = 'Baldwin SAYA'	pertempuran_kematian
SELECT count (DISTINCT RESULT) FROM pertempuran	pertempuran_kematian
SELECT count (*) FROM pertempuran WHERE id NOT IN (SELECT kalah_dalam_pertempuran FROM mengirimkan WHERE tonase = '225') ;	pertempuran_kematian
SELECT T1.nama , T1.tanggal FROM pertempuran AS T1 JOIN mengirimkan AS T2 ON T1.id = T2.kalah_dalam_pertempuran WHERE T2.nama = 'selada' INTERSECT SELECT T1.nama , T1.tanggal FROM pertempuran AS T1 JOIN mengirimkan AS T2 ON T1.id = T2.kalah_dalam_pertempuran WHERE T2.nama = 'HMS Atalanta'	pertempuran_kematian
SELECT nama , RESULT , komandan_bulgaria FROM pertempuran EXCEPT SELECT T1.nama , T1.hasil , T1.bulgarian_commander FROM pertempuran AS T1 JOIN mengirimkan AS T2 ON T1.id = T2.kalah_dalam_pertempuran WHERE T2.lokasi = 'Bahasa_inggris Saluran'	pertempuran_kematian
SELECT catatan FROM kematian WHERE catatan LIKE '%Timur%'	pertempuran_kematian
SELECT baris_1 , baris_2 FROM alamat	pelacakan_transkrip_siswa
SELECT baris_1 , baris_2 FROM alamat	pelacakan_transkrip_siswa
SELECT count (*) FROM Kursus	pelacakan_transkrip_siswa
SELECT count (*) FROM Kursus	pelacakan_transkrip_siswa
SELECT deskripsi_kursus FROM Kursus WHERE nama_kursus = 'matematika'	pelacakan_transkrip_siswa
SELECT deskripsi_kursus FROM Kursus WHERE nama_kursus = 'matematika'	pelacakan_transkrip_siswa
SELECT zip_kode_pos FROM Alamat WHERE kota = 'Pelabuhan Chelsea'	pelacakan_transkrip_siswa
SELECT zip_kode_pos FROM Alamat WHERE kota = 'Pelabuhan Chelsea'	pelacakan_transkrip_siswa
SELECT T2.nama_departemen , T1.id_departemen FROM Gelar_Program AS T1 JOIN Departemen AS T2 ON T1.id_departemen = T2.id_department GROUP BY T1.id_departemen ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
select t2.nama_departemen , t1.id_department from gelar_program as t1 join departemen as t2 on t1.id_department = t2.id_department group by t1.id_department order by count (*) desc limit 1	pelacakan_transkrip_siswa
SELECT count (DISTINCT id_department) FROM Gelar_Program	pelacakan_transkrip_siswa
SELECT count (DISTINCT id_department) FROM Gelar_Program	pelacakan_transkrip_siswa
SELECT count (DISTINCT gelar_ringkasan_nama) FROM Gelar_Program	pelacakan_transkrip_siswa
SELECT count (DISTINCT gelar_ringkasan_nama) FROM Gelar_Program	pelacakan_transkrip_siswa
SELECT count (*) FROM Departemen AS T1 JOIN Gelar_Program AS T2 ON T1.id_departemen = T2.id_department WHERE T1.nama_departemen = 'insinyur'	pelacakan_transkrip_siswa
SELECT count (*) FROM Departemen AS T1 JOIN Gelar_Program AS T2 ON T1.id_departemen = T2.id_department WHERE T1.nama_departemen = 'insinyur'	pelacakan_transkrip_siswa
SELECT nama_bagian , bagian_deskripsi FROM Bagian	pelacakan_transkrip_siswa
SELECT nama_bagian , bagian_deskripsi FROM Bagian	pelacakan_transkrip_siswa
SELECT T1.nama_kursus , T1.id_course FROM Kursus AS T1 JOIN Bagian AS T2 ON T1.id_course = T2.id_course GROUP BY T1.id_course HAVING count (*) <= 2	pelacakan_transkrip_siswa
SELECT T1.nama_kursus , T1.id_course FROM Kursus AS T1 JOIN Bagian AS T2 ON T1.id_course = T2.id_course GROUP BY T1.id_course HAVING count (*) <= 2	pelacakan_transkrip_siswa
SELECT nama_bagian FROM Bagian ORDER BY nama_bagian DESC	pelacakan_transkrip_siswa
SELECT nama_bagian FROM Bagian ORDER BY nama_bagian DESC	pelacakan_transkrip_siswa
SELECT T1.nama_semester , T1.id_semester FROM Semester AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_semester = T2.id_semester GROUP BY T1.id_semester ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT T1.nama_semester , T1.id_semester FROM Semester AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_semester = T2.id_semester GROUP BY T1.id_semester ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT departemen_deskripsi FROM Departemen WHERE nama_departemen LIKE '%komputer%'	pelacakan_transkrip_siswa
SELECT departemen_deskripsi FROM Departemen WHERE nama_departemen LIKE '%komputer%'	pelacakan_transkrip_siswa
SELECT T1.nama_depan , T1.nama_tengah , T1.nama_belakang , T1.id_siswa FROM Siswa AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_siswa = T2.id_siswa GROUP BY T1.id_siswa HAVING count (*) = 2	pelacakan_transkrip_siswa
SELECT T1.nama_depan , T1.nama_tengah , T1.nama_belakang , T1.id_siswa FROM Siswa AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_siswa = T2.id_siswa GROUP BY T1.id_siswa HAVING count (*) = 2	pelacakan_transkrip_siswa
SELECT DISTINCT T1.nama_depan , T1.nama_tengah , T1.nama_belakang FROM Siswa AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_siswa = T2.id_siswa JOIN Gelar_Program AS T3 ON T2.id_derajat_program = T3.id_derajat_program WHERE T3.degree_summary_nama = 'Sarjana'	pelacakan_transkrip_siswa
SELECT DISTINCT T1.nama_depan , T1.nama_tengah , T1.nama_belakang FROM Siswa AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_siswa = T2.id_siswa JOIN Gelar_Program AS T3 ON T2.id_derajat_program = T3.id_derajat_program WHERE T3.degree_summary_nama = 'Sarjana'	pelacakan_transkrip_siswa
SELECT T1.degree_summary_nama FROM Gelar_Program AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_derajat_program = T2.id_derajat_program GROUP BY T1.degree_summary_nama ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT T1.degree_summary_nama FROM Gelar_Program AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_derajat_program = T2.id_derajat_program GROUP BY T1.degree_summary_nama ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT T1.id_derajat_program , T1.degree_summary_nama FROM Gelar_Program AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_derajat_program = T2.id_derajat_program GROUP BY T1.id_derajat_program ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT T1.id_derajat_program , T1.degree_summary_nama FROM Gelar_Program AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_derajat_program = T2.id_derajat_program GROUP BY T1.id_derajat_program ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT T1.id_siswa , T1.nama_depan , T1.nama_tengah , T1.nama_belakang , count (*) , T1.id_siswa FROM Siswa AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_siswa = T2.id_siswa GROUP BY T1.id_siswa ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT T1.id_siswa , T1.nama_depan , T1.nama_tengah , T1.nama_belakang , count (*) , T1.id_siswa FROM Siswa AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_siswa = T2.id_siswa GROUP BY T1.id_siswa ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT nama_semester FROM Semester WHERE id_semester NOT IN (SELECT id_semester FROM Siswa_Pendaftaran)	pelacakan_transkrip_siswa
SELECT nama_semester FROM Semester WHERE id_semester NOT IN (SELECT id_semester FROM Siswa_Pendaftaran)	pelacakan_transkrip_siswa
SELECT DISTINCT T1.nama_kursus FROM Kursus AS T1 JOIN Siswa_Pendaftaran_Kursus AS T2 ON T1.id_course = T2.id_course	pelacakan_transkrip_siswa
SELECT DISTINCT T1.nama_kursus FROM Kursus AS T1 JOIN Siswa_Pendaftaran_Kursus AS T2 ON T1.id_course = T2.id_course	pelacakan_transkrip_siswa
SELECT T1.nama_kursus FROM Kursus AS T1 JOIN Siswa_Pendaftaran_Kursus AS T2 ON T1.id_course = T2.id_course GROUP BY T1.nama_kursus ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT T1.nama_kursus FROM Kursus AS T1 JOIN Siswa_Pendaftaran_Kursus AS T2 ON T1.id_course = T2.id_course GROUP BY T1.nama_kursus ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT T1.nama_belakang FROM Siswa AS T1 JOIN Alamat AS T2 ON T1.id_current_address = T2.id_address WHERE T2.state_province_county = 'Carolina_Utara' EXCEPT SELECT DISTINCT T3.nama_belakang FROM Siswa AS T3 JOIN Siswa_Pendaftaran AS T4 ON T3.id_siswa = T4.id_student	pelacakan_transkrip_siswa
SELECT T1.nama_belakang FROM Siswa AS T1 JOIN Alamat AS T2 ON T1.id_current_address = T2.id_address WHERE T2.state_province_county = 'Carolina_Utara' EXCEPT SELECT DISTINCT T3.nama_belakang FROM Siswa AS T3 JOIN Siswa_Pendaftaran AS T4 ON T3.id_siswa = T4.id_student	pelacakan_transkrip_siswa
SELECT T2.tanggal_transkrip , T1.id_transkrip FROM Transkrip_Isi AS T1 JOIN Transkrip AS T2 ON T1.id_transkrip = T2.id_transkrip GROUP BY T1.id_transkrip HAVING count (*) >= 2	pelacakan_transkrip_siswa
SELECT T2.tanggal_transkrip , T1.id_transkrip FROM Transkrip_Isi AS T1 JOIN Transkrip AS T2 ON T1.id_transkrip = T2.id_transkrip GROUP BY T1.id_transkrip HAVING count (*) >= 2	pelacakan_transkrip_siswa
SELECT nomor_ponsel_ponsel FROM Siswa WHERE nama_depan = 'Timotius' AND nama_belakang = 'Bangsal'	pelacakan_transkrip_siswa
select nomor_ponsel_ponsel from siswa where nama_depan = "timmothy" and nama_belakang = "bangsal"	pelacakan_transkrip_siswa
SELECT nama_depan , nama_tengah , nama_belakang FROM Siswa ORDER BY tanggal_pertama_terdaftar ASC LIMIT 1	pelacakan_transkrip_siswa
SELECT nama_depan , nama_tengah , nama_belakang FROM Siswa ORDER BY tanggal_pertama_terdaftar ASC LIMIT 1	pelacakan_transkrip_siswa
SELECT nama_depan , nama_tengah , nama_belakang FROM Siswa ORDER BY tanggal_kiri ASC LIMIT 1	pelacakan_transkrip_siswa
SELECT nama_depan , nama_tengah , nama_belakang FROM Siswa ORDER BY tanggal_kiri ASC LIMIT 1	pelacakan_transkrip_siswa
SELECT nama_depan FROM Siswa WHERE id_alamat_saat_ini != id_alamat_permanen	pelacakan_transkrip_siswa
SELECT nama_depan FROM Siswa WHERE id_alamat_saat_ini != id_alamat_permanen	pelacakan_transkrip_siswa
SELECT T1.id_address , T1.line_1 , T1.line_2 FROM Alamat AS T1 JOIN Siswa AS T2 ON T1.id_address = T2.id_current_address GROUP BY T1.id_address ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT T1.id_address , T1.line_1 , T1.line_2 FROM Alamat AS T1 JOIN Siswa AS T2 ON T1.id_address = T2.id_current_address GROUP BY T1.id_address ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT avg (tanggal_transkrip) FROM Transkrip	pelacakan_transkrip_siswa
SELECT avg (tanggal_transkrip) FROM Transkrip	pelacakan_transkrip_siswa
SELECT tanggal_transkrip , detail_lainnya FROM Transkrip ORDER BY tanggal_transkrip ASC LIMIT 1	pelacakan_transkrip_siswa
SELECT tanggal_transkrip , detail_lainnya FROM Transkrip ORDER BY tanggal_transkrip ASC LIMIT 1	pelacakan_transkrip_siswa
SELECT count (*) FROM Transkrip	pelacakan_transkrip_siswa
SELECT count (*) FROM Transkrip	pelacakan_transkrip_siswa
SELECT tanggal_transkrip FROM Transkrip ORDER BY tanggal_transkrip DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT tanggal_transkrip FROM Transkrip ORDER BY tanggal_transkrip DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT count (*) , ID_kursus_siswa FROM Transkrip_Isi GROUP BY ID_kursus_siswa ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT count (*) , ID_kursus_siswa FROM Transkrip_Isi GROUP BY ID_kursus_siswa ORDER BY count (*) DESC LIMIT 1	pelacakan_transkrip_siswa
SELECT T2.tanggal_transkrip , T1.id_transkrip FROM Transkrip_Isi AS T1 JOIN Transkrip AS T2 ON T1.id_transkrip = T2.id_transkrip GROUP BY T1.id_transkrip ORDER BY count (*) ASC LIMIT 1	pelacakan_transkrip_siswa
SELECT T2.tanggal_transkrip , T1.id_transkrip FROM Transkrip_Isi AS T1 JOIN Transkrip AS T2 ON T1.id_transkrip = T2.id_transkrip GROUP BY T1.id_transkrip ORDER BY count (*) ASC LIMIT 1	pelacakan_transkrip_siswa
SELECT DISTINCT T2.id_semester FROM Gelar_Program AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_derajat_program = T2.id_derajat_program WHERE gelar_ringkasan_nama = 'Menguasai' INTERSECT SELECT DISTINCT T2.id_semester FROM Gelar_Program AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_derajat_program = T2.id_derajat_program WHERE gelar_ringkasan_nama = 'Sarjana'	pelacakan_transkrip_siswa
SELECT DISTINCT T2.id_semester FROM Gelar_Program AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_derajat_program = T2.id_derajat_program WHERE gelar_ringkasan_nama = 'Menguasai' INTERSECT SELECT DISTINCT T2.id_semester FROM Gelar_Program AS T1 JOIN Siswa_Pendaftaran AS T2 ON T1.id_derajat_program = T2.id_derajat_program WHERE gelar_ringkasan_nama = 'Sarjana'	pelacakan_transkrip_siswa
SELECT count (DISTINCT id_alamat_saat_ini) FROM Siswa	pelacakan_transkrip_siswa
SELECT count (DISTINCT id_alamat_saat_ini) FROM Siswa	pelacakan_transkrip_siswa
SELECT detail_siswa_lainnya FROM Siswa ORDER BY detail_siswa_lainnya DESC	pelacakan_transkrip_siswa
SELECT detail_siswa_lainnya FROM Siswa ORDER BY detail_siswa_lainnya DESC	pelacakan_transkrip_siswa
SELECT bagian_deskripsi FROM Bagian WHERE nama_bagian = 'H'	pelacakan_transkrip_siswa
SELECT bagian_deskripsi FROM Bagian WHERE nama_bagian = 'H'	pelacakan_transkrip_siswa
select t1.nama_depan from siswa as t1 join alamat as t2 on t1.id_alamat_permanen = t2.id_address where t2.negara = "Haiti" or t1.cell_mobile_number = "09700166582"	pelacakan_transkrip_siswa
select t1.nama_depan from siswa as t1 join alamat as t2 on t1.id_alamat_permanen = t2.id_address where t2.negara = "Haiti" or t1.cell_mobile_number = "09700166582"	pelacakan_transkrip_siswa
SELECT Title FROM Kartun ORDER BY title	acara_TV
SELECT Title FROM Kartun ORDER BY title	acara_TV
SELECT Title FROM Kartun WHERE Disutradarai_oleh = 'Ben Jones';	acara_TV
SELECT Title FROM Kartun WHERE Disutradarai_oleh = 'Ben Jones';	acara_TV
SELECT count (*) FROM Kartun WHERE Ditulis_oleh = 'Yusuf Kuhr';	acara_TV
SELECT count (*) FROM Kartun WHERE Ditulis_oleh = 'Yusuf Kuhr';	acara_TV
SELECT title , Disutradarai_oleh FROM Kartun ORDER BY Tanggal_udara_asli	acara_TV
SELECT title , Disutradarai_oleh FROM Kartun ORDER BY Tanggal_udara_asli	acara_TV
SELECT Title FROM Kartun WHERE Disutradarai_oleh = 'Ben Jones' OR Disutradarai_oleh = 'Brandon Vietnam';	acara_TV
SELECT Title FROM Kartun WHERE Disutradarai_oleh = 'Ben Jones' OR Disutradarai_oleh = 'Brandon Vietnam';	acara_TV
SELECT Negara , count (*) FROM TV_Saluran GROUP BY Negara ORDER BY count (*) DESC LIMIT 1;	acara_TV
SELECT Negara , count (*) FROM TV_Saluran GROUP BY Negara ORDER BY count (*) DESC LIMIT 1;	acara_TV
SELECT count (DISTINCT nama_seri) , count (DISTINCT content) FROM TV_Saluran;	acara_TV
SELECT count (DISTINCT nama_seri) , count (DISTINCT content) FROM TV_Saluran;	acara_TV
SELECT Content FROM TV_Saluran WHERE nama_seri = 'Langit Radio';	acara_TV
SELECT Content FROM TV_Saluran WHERE nama_seri = 'Langit Radio';	acara_TV
SELECT Paket_Opsi FROM TV_Saluran WHERE nama_seri = 'Langit Radio';	acara_TV
SELECT Paket_Opsi FROM TV_Saluran WHERE nama_seri = 'Langit Radio';	acara_TV
SELECT count (*) FROM TV_Saluran WHERE LANGUAGE = 'Bahasa_inggris';	acara_TV
SELECT count (*) FROM TV_Saluran WHERE LANGUAGE = 'Bahasa_inggris';	acara_TV
SELECT LANGUAGE , count (*) FROM TV_Saluran GROUP BY LANGUAGE ORDER BY count (*) ASC LIMIT 1;	acara_TV
SELECT LANGUAGE , count (*) FROM TV_Saluran GROUP BY LANGUAGE ORDER BY count (*) ASC LIMIT 1;	acara_TV
SELECT LANGUAGE , count (*) FROM TV_Saluran GROUP BY LANGUAGE	acara_TV
SELECT LANGUAGE , count (*) FROM TV_Saluran GROUP BY LANGUAGE	acara_TV
SELECT T1.nama_seri FROM TV_Saluran AS T1 JOIN Kartun AS T2 ON T1.id = T2.Saluran WHERE T2.Judul = `` Itu Bangkit of itu Biru Kumbang ! ``;	acara_TV
SELECT T1.nama_seri FROM TV_Saluran AS T1 JOIN Kartun AS T2 ON T1.id = T2.Saluran WHERE T2.Judul = `` Itu Bangkit of itu Biru Kumbang ! ``;	acara_TV
SELECT T2.Judul FROM TV_Saluran AS T1 JOIN Kartun AS T2 ON T1.id = T2.Saluran WHERE T1.nama_seri = 'Langit Radio';	acara_TV
SELECT T2.Judul FROM TV_Saluran AS T1 JOIN Kartun AS T2 ON T1.id = T2.Saluran WHERE T1.nama_seri = 'Langit Radio';	acara_TV
SELECT Episode FROM TV_series ORDER BY peringkat	acara_TV
SELECT Episode FROM TV_series ORDER BY peringkat	acara_TV
SELECT Episode , Peringkat FROM TV_series ORDER BY Peringkat DESC LIMIT 3;	acara_TV
SELECT Episode , Peringkat FROM TV_series ORDER BY Peringkat DESC LIMIT 3;	acara_TV
SELECT max (SHARE) , min (SHARE) FROM TV_series;	acara_TV
SELECT max (SHARE) , min (SHARE) FROM TV_series;	acara_TV
SELECT Tanggal_Udara FROM TV_series WHERE Episode = 'A Cinta of A Seumur_hidup';	acara_TV
SELECT Tanggal_Udara FROM TV_series WHERE Episode = 'A Cinta of A Seumur_hidup';	acara_TV
SELECT Peringkat_Mingguan FROM TV_series WHERE Episode = 'A Cinta of A Seumur_hidup';	acara_TV
SELECT Peringkat_Mingguan FROM TV_series WHERE Episode = 'A Cinta of A Seumur_hidup';	acara_TV
SELECT T1.nama_seri FROM TV_Saluran AS T1 JOIN TV_series AS T2 ON T1.id = T2.Saluran WHERE T2.Episode = 'A Cinta of A Seumur_hidup';	acara_TV
SELECT T1.nama_seri FROM TV_Saluran AS T1 JOIN TV_series AS T2 ON T1.id = T2.Saluran WHERE T2.Episode = 'A Cinta of A Seumur_hidup';	acara_TV
SELECT T2.Episode FROM TV_Saluran AS T1 JOIN TV_series AS T2 ON T1.id = T2.Saluran WHERE T1.nama_seri = 'Langit Radio';	acara_TV
SELECT T2.Episode FROM TV_Saluran AS T1 JOIN TV_series AS T2 ON T1.id = T2.Saluran WHERE T1.nama_seri = 'Langit Radio';	acara_TV
SELECT count (*) , Disutradarai_oleh FROM kartun GROUP BY Disutradarai_oleh	acara_TV
SELECT count (*) , Disutradarai_oleh FROM kartun GROUP BY Disutradarai_oleh	acara_TV
select kode_produksi , saluran from kartun order by tanggal_udara_asli desc limit 1	acara_TV
select kode_produksi , saluran from kartun order by tanggal_udara_asli desc limit 1	acara_TV
SELECT paket_pilihan , nama_seri FROM TV_Saluran WHERE definisi_tinggi_TV = 'yes'	acara_TV
SELECT paket_pilihan , nama_seri FROM TV_Saluran WHERE definisi_tinggi_TV = 'yes'	acara_TV
SELECT T1.negara FROM TV_Saluran AS T1 JOIN kartun AS T2 ON T1.id = T2.Saluran WHERE T2.ditulis_oleh = 'Todd Casey'	acara_TV
SELECT T1.negara FROM TV_Saluran AS T1 JOIN kartun AS T2 ON T1.id = T2.Saluran WHERE T2.ditulis_oleh = 'Todd Casey'	acara_TV
SELECT negara FROM TV_Saluran EXCEPT SELECT T1.negara FROM TV_Saluran AS T1 JOIN kartun AS T2 ON T1.id = T2.Saluran WHERE T2.ditulis_oleh = 'Todd Casey'	acara_TV
SELECT negara FROM TV_Saluran EXCEPT SELECT T1.negara FROM TV_Saluran AS T1 JOIN kartun AS T2 ON T1.id = T2.Saluran WHERE T2.ditulis_oleh = 'Todd Casey'	acara_TV
SELECT T1.nama_seri , T1.negara FROM TV_Saluran AS T1 JOIN kartun AS T2 ON T1.id = T2.Saluran WHERE T2.directed_by = 'Michael Perubahan' INTERSECT SELECT T1.nama_seri , T1.negara FROM TV_Saluran AS T1 JOIN kartun AS T2 ON T1.id = T2.Saluran WHERE T2.directed_by = 'Ben Jones'	acara_TV
SELECT T1.nama_seri , T1.negara FROM TV_Saluran AS T1 JOIN kartun AS T2 ON T1.id = T2.Saluran WHERE T2.directed_by = 'Michael Perubahan' INTERSECT SELECT T1.nama_seri , T1.negara FROM TV_Saluran AS T1 JOIN kartun AS T2 ON T1.id = T2.Saluran WHERE T2.directed_by = 'Ben Jones'	acara_TV
SELECT Rasio_aspek_piksel_PAR , negara FROM saluran_tv WHERE LANGUAGE != 'Bahasa_inggris'	acara_TV
SELECT Rasio_aspek_piksel_PAR , negara FROM saluran_tv WHERE LANGUAGE != 'Bahasa_inggris'	acara_TV
SELECT id FROM saluran_tv GROUP BY negara HAVING count (*) > 2	acara_TV
SELECT id FROM saluran_tv GROUP BY negara HAVING count (*) > 2	acara_TV
SELECT id FROM TV_Saluran EXCEPT SELECT saluran FROM kartun WHERE diarahkan_oleh = 'Ben Jones'	acara_TV
SELECT id FROM TV_Saluran EXCEPT SELECT saluran FROM kartun WHERE diarahkan_oleh = 'Ben Jones'	acara_TV
SELECT paket_pilihan FROM TV_Saluran WHERE id NOT IN (SELECT saluran FROM kartun WHERE diarahkan_oleh = 'Ben Jones')	acara_TV
SELECT paket_pilihan FROM TV_Saluran WHERE id NOT IN (SELECT saluran FROM kartun WHERE diarahkan_oleh = 'Ben Jones')	acara_TV
SELECT count (*) FROM poker_player	poker_player
SELECT count (*) FROM poker_player	poker_player
SELECT Pendapatan FROM poker_player ORDER BY Pendapatan DESC	poker_player
SELECT Pendapatan FROM poker_player ORDER BY Pendapatan DESC	poker_player
SELECT Final_Table_Made , Terbaik_Selesai FROM poker_player	poker_player
SELECT Final_Table_Made , Terbaik_Selesai FROM poker_player	poker_player
SELECT avg (Pendapatan) FROM poker_player	poker_player
SELECT avg (Pendapatan) FROM poker_player	poker_player
SELECT Uang_Peringkat FROM poker_player ORDER BY Pendapatan DESC LIMIT 1	poker_player
SELECT Uang_Peringkat FROM poker_player ORDER BY Pendapatan DESC LIMIT 1	poker_player
SELECT max (Final_Table_Made) FROM poker_player WHERE Pendapatan < 200000	poker_player
SELECT max (Final_Table_Made) FROM poker_player WHERE Pendapatan < 200000	poker_player
SELECT T1.Nama FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang	poker_player
SELECT T1.Nama FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang	poker_player
SELECT T1.Nama FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang WHERE T2.Penghasilan > 300000	poker_player
SELECT T1.Nama FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang WHERE T2.Penghasilan > 300000	poker_player
SELECT T1.Nama FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang ORDER BY T2.Final_Table_Made	poker_player
SELECT T1.Nama FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang ORDER BY T2.Final_Table_Made	poker_player
SELECT T1.Tanggal_Lahir FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang ORDER BY T2.Penghasilan ASC LIMIT 1	poker_player
SELECT T1.Tanggal_Lahir FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang ORDER BY T2.Penghasilan ASC LIMIT 1	poker_player
SELECT T2.Uang_Peringkat FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang ORDER BY T1.Tinggi DESC LIMIT 1	poker_player
SELECT T2.Uang_Peringkat FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang ORDER BY T1.Tinggi DESC LIMIT 1	poker_player
SELECT avg (T2.Penghasilan) FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang WHERE T1.Tinggi > 200	poker_player
SELECT avg (T2.Penghasilan) FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang WHERE T1.Tinggi > 200	poker_player
SELECT T1.Nama FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang ORDER BY T2.Penghasilan DESC	poker_player
SELECT T1.Nama FROM rakyat AS T1 JOIN poker_player AS T2 ON T1.ID_Orang = T2.ID_Orang ORDER BY T2.Penghasilan DESC	poker_player
SELECT Kebangsaan , COUNT (*) FROM rakyat GROUP BY Kebangsaan	poker_player
SELECT Kebangsaan , COUNT (*) FROM rakyat GROUP BY Kebangsaan	poker_player
SELECT Kebangsaan FROM rakyat GROUP BY Kebangsaan ORDER BY COUNT (*) DESC LIMIT 1	poker_player
SELECT Kebangsaan FROM rakyat GROUP BY Kebangsaan ORDER BY COUNT (*) DESC LIMIT 1	poker_player
SELECT Kebangsaan FROM rakyat GROUP BY Kebangsaan HAVING COUNT (*) >= 2	poker_player
SELECT Kebangsaan FROM rakyat GROUP BY Kebangsaan HAVING COUNT (*) >= 2	poker_player
SELECT Name , Tanggal_Lahir FROM rakyat ORDER BY Name ASC	poker_player
SELECT Name , Tanggal_Lahir FROM rakyat ORDER BY Name ASC	poker_player
SELECT Name FROM rakyat WHERE Kebangsaan != 'Rusia'	poker_player
SELECT Name FROM rakyat WHERE Kebangsaan != 'Rusia'	poker_player
SELECT Name FROM rakyat WHERE ID_Orang NOT IN (SELECT ID_Orang FROM poker_player)	poker_player
SELECT Name FROM rakyat WHERE ID_Orang NOT IN (SELECT ID_Orang FROM poker_player)	poker_player
SELECT count (DISTINCT Kebangsaan) FROM rakyat	poker_player
SELECT count (DISTINCT Kebangsaan) FROM rakyat	poker_player
SELECT count (*) FROM area_code_state	pemilih_1
SELECT nomor_kontestan , nama_kontestan FROM kontestan ORDER BY nama_kontestan DESC	pemilih_1
SELECT id_suara , nomor_telepon , state FROM suara	pemilih_1
SELECT max (kode_area) , min (kode_area) FROM area_code_state	pemilih_1
SELECT max (dibuat) FROM suara WHERE state = 'CA'	pemilih_1
SELECT nama_kontestan FROM kontestan WHERE nama_kontestan != 'Jessie Izin'	pemilih_1
SELECT DISTINCT state , dibuat FROM suara	pemilih_1
SELECT T1.nomor_kontestan , T1.nama_kontestan FROM kontestan AS T1 JOIN suara AS T2 ON T1.nomor_kontestan = T2.nomor_kontestan GROUP BY T1.nomor_kontestan HAVING count (*) >= 2	pemilih_1
SELECT T1.nomor_kontestan , T1.nama_kontestan FROM kontestan AS T1 JOIN suara AS T2 ON T1.nomor_kontestan = T2.nomor_kontestan GROUP BY T1.nomor_kontestan ORDER BY count (*) ASC LIMIT 1	pemilih_1
SELECT count (*) FROM suara WHERE state = 'NY' OR state = 'CA'	pemilih_1
SELECT count (*) FROM kontestan WHERE nomor_kontestan NOT IN (SELECT nomor_kontestan FROM suara)	pemilih_1
SELECT T1.area_code FROM area_code_state AS T1 JOIN suara AS T2 ON T1.negara_bagian = T2.negara_bagian GROUP BY T1.area_code ORDER BY count (*) DESC LIMIT 1	pemilih_1
SELECT T2.dibuat , T2.negara_bagian , T2.nomor_telepon FROM kontestan AS T1 JOIN suara AS T2 ON T1.nomor_kontestan = T2.nomor_kontestan WHERE T1.nama_kontestan = 'Tabata Gehling'	pemilih_1
SELECT T3.area_code FROM kontestan AS T1 JOIN suara AS T2 ON T1.nomor_kontestan = T2.nomor_kontestan JOIN area_code_state AS T3 ON T2.negara_bagian = T3.negara_bagian WHERE T1.nama_kontestan = 'Tabata Gehling' INTERSECT SELECT T3.area_code FROM kontestan AS T1 JOIN suara AS T2 ON T1.nomor_kontestan = T2.nomor_kontestan JOIN area_code_state AS T3 ON T2.negara_bagian = T3.negara_bagian WHERE T1.nama_kontestan = 'kelly Klausa'	pemilih_1
select nama_kontestan from kontestan where nama_kontestan like "%al%"	pemilih_1
SELECT Name FROM negara WHERE Tahun_Indep > 1950	dunia_1
SELECT Name FROM negara WHERE Tahun_Indep > 1950	dunia_1
SELECT count (*) FROM negara WHERE Formulir_Pemerintah = 'Republik'	dunia_1
SELECT count (*) FROM negara WHERE Formulir_Pemerintah = 'Republik'	dunia_1
SELECT sum (Luas_Permukaan) FROM negara WHERE Wilayah = 'Karibia'	dunia_1
SELECT sum (Luas_Permukaan) FROM negara WHERE Wilayah = 'Karibia'	dunia_1
SELECT Benua FROM negara WHERE Name = 'Angola'	dunia_1
SELECT Benua FROM negara WHERE Name = 'Angola'	dunia_1
SELECT Wilayah FROM negara AS T1 JOIN kota AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Nama = 'Kabul'	dunia_1
SELECT Wilayah FROM negara AS T1 JOIN kota AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Nama = 'Kabul'	dunia_1
SELECT T2.Bahasa FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T1.Nama = 'Aruba' ORDER BY Persentase DESC LIMIT 1	dunia_1
SELECT T2.Bahasa FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T1.Nama = 'Aruba' ORDER BY Persentase DESC LIMIT 1	dunia_1
SELECT Populasi , Harapan_Hidup FROM negara WHERE Name = 'Brazil'	dunia_1
SELECT Populasi , Harapan_Hidup FROM negara WHERE Name = 'Brazil'	dunia_1
SELECT Populasi , Wilayah FROM negara WHERE Name = 'Angola'	dunia_1
SELECT Populasi , Wilayah FROM negara WHERE Name = 'Angola'	dunia_1
SELECT avg (Harapan_Hidup) FROM negara WHERE Wilayah = 'Pusat Afrika'	dunia_1
SELECT avg (Harapan_Hidup) FROM negara WHERE Wilayah = 'Pusat Afrika'	dunia_1
SELECT Name FROM negara WHERE Benua = 'Asia' ORDER BY Harapan_Hidup LIMIT 1	dunia_1
SELECT Name FROM negara WHERE Benua = 'Asia' ORDER BY Harapan_Hidup LIMIT 1	dunia_1
SELECT sum (Populasi) , max (GNP) FROM negara WHERE Benua = 'Asia'	dunia_1
SELECT sum (Populasi) , max (GNP) FROM negara WHERE Benua = 'Asia'	dunia_1
SELECT avg (Harapan_Hidup) FROM negara WHERE Benua = 'Afrika' AND Formulir_Pemerintah = 'Republik'	dunia_1
SELECT avg (Harapan_Hidup) FROM negara WHERE Benua = 'Afrika' AND Formulir_Pemerintah = 'Republik'	dunia_1
SELECT sum (Luas_Permukaan) FROM negara WHERE Benua = 'Asia' OR Benua = 'Eropa'	dunia_1
SELECT sum (Luas_Permukaan) FROM negara WHERE Benua = 'Asia' OR Benua = 'Eropa'	dunia_1
SELECT sum (Populasi) FROM kota WHERE Daerah = 'Gelderland'	dunia_1
SELECT sum (Populasi) FROM kota WHERE Daerah = 'Gelderland'	dunia_1
SELECT avg (GNP) , sum (populasi) FROM negara WHERE Formulir_Pemerintah = 'KITA Wilayah'	dunia_1
SELECT avg (GNP) , sum (populasi) FROM negara WHERE Formulir_Pemerintah = 'KITA Wilayah'	dunia_1
SELECT count (DISTINCT LANGUAGE) FROM bahasa_negara	dunia_1
SELECT count (DISTINCT LANGUAGE) FROM bahasa_negara	dunia_1
SELECT count (DISTINCT Formulir_Pemerintah) FROM negara WHERE Benua = 'Afrika'	dunia_1
SELECT count (DISTINCT Formulir_Pemerintah) FROM negara WHERE Benua = 'Afrika'	dunia_1
SELECT COUNT (T2.Bahasa) FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T1.Nama = 'Aruba'	dunia_1
SELECT COUNT (T2.Bahasa) FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T1.Nama = 'Aruba'	dunia_1
SELECT COUNT (*) FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T1.Nama = 'Afganistan' AND Resmi = 'T'	dunia_1
SELECT COUNT (*) FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T1.Nama = 'Afganistan' AND Resmi = 'T'	dunia_1
SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara GROUP BY T1.Nama ORDER BY COUNT (*) DESC LIMIT 1	dunia_1
SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara GROUP BY T1.Nama ORDER BY COUNT (*) DESC LIMIT 1	dunia_1
SELECT T1.Benua FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara GROUP BY T1.Benua ORDER BY COUNT (*) DESC LIMIT 1	dunia_1
SELECT T1.Benua FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara GROUP BY T1.Benua ORDER BY COUNT (*) DESC LIMIT 1	dunia_1
SELECT COUNT (*) FROM (SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' INTERSECT SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Belanda')	dunia_1
SELECT COUNT (*) FROM (SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' INTERSECT SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Belanda')	dunia_1
SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' INTERSECT SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Perancis'	dunia_1
SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' INTERSECT SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Perancis'	dunia_1
SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' AND T2.IsResmi = 'T' INTERSECT SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Perancis' AND T2.IsResmi = 'T'	dunia_1
SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' AND T2.IsResmi = 'T' INTERSECT SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Perancis' AND T2.IsResmi = 'T'	dunia_1
SELECT COUNT (DISTINCT Benua) FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Cina'	dunia_1
SELECT COUNT (DISTINCT Benua) FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Cina'	dunia_1
SELECT DISTINCT T1.Wilayah FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' OR T2.Bahasa = 'Belanda'	dunia_1
SELECT DISTINCT T1.Wilayah FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' OR T2.Bahasa = 'Belanda'	dunia_1
select t1.nama from negara as t1 join bahasa_negara as t2 on t1.kode = t2.kode_negara where t2.bahasa = "bahasa_inggris" and resmi = "T" union select t1.nama from negara as t1 join bahasa_negara as t2 on t1.kode = t2.kode_negara where t2.bahasa = "Belanda" and resmi = "T"	dunia_1
SELECT * FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' AND Resmi = 'T' UNION SELECT * FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Belanda' AND Resmi = 'T'	dunia_1
SELECT T2.Bahasa FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T1.Benua = 'Asia' GROUP BY T2.Bahasa ORDER BY COUNT (*) DESC LIMIT 1	dunia_1
SELECT T2.Bahasa FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T1.Benua = 'Asia' GROUP BY T2.Bahasa ORDER BY COUNT (*) DESC LIMIT 1	dunia_1
SELECT T2.Bahasa FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T1.Formulir_Pemerintah = 'Republik' GROUP BY T2.Bahasa HAVING COUNT (*) = 1	dunia_1
SELECT T2.Bahasa FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T1.Formulir_Pemerintah = 'Republik' GROUP BY T2.Bahasa HAVING COUNT (*) = 1	dunia_1
SELECT T1.Nama , T1.Populasi FROM kota AS T1 JOIN bahasa_negara AS T2 ON T1.Kode_Negara = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' ORDER BY T1.Populasi DESC LIMIT 1	dunia_1
SELECT T1.Nama , T1.Populasi FROM kota AS T1 JOIN bahasa_negara AS T2 ON T1.Kode_Negara = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' ORDER BY T1.Populasi DESC LIMIT 1	dunia_1
SELECT Name , Populasi , Harapan_Hidup FROM negara WHERE Benua = 'Asia' ORDER BY Luas_Permukaan DESC LIMIT 1	dunia_1
SELECT Name , Populasi , Harapan_Hidup FROM negara WHERE Benua = 'Asia' ORDER BY Luas_Permukaan DESC LIMIT 1	dunia_1
SELECT avg (Harapan_Hidup) FROM negara WHERE Name NOT IN (SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' AND T2.IsResmi = 'T')	dunia_1
SELECT avg (Harapan_Hidup) FROM negara WHERE Name NOT IN (SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris' AND T2.IsResmi = 'T')	dunia_1
SELECT sum (Populasi) FROM negara WHERE Name NOT IN (SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris')	dunia_1
SELECT sum (Populasi) FROM negara WHERE Name NOT IN (SELECT T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T2.Bahasa = 'Bahasa_inggris')	dunia_1
SELECT T2.Bahasa FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T1.KepalaNegara = 'Beatrix' AND T2.IsResmi = 'T'	dunia_1
SELECT T2.Bahasa FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE T1.KepalaNegara = 'Beatrix' AND T2.IsResmi = 'T'	dunia_1
SELECT count (DISTINCT T2.Bahasa) FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE Tahun_Indep < 1930 AND T2.IsResmi = 'T'	dunia_1
SELECT count (DISTINCT T2.Bahasa) FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara WHERE Tahun_Indep < 1930 AND T2.IsResmi = 'T'	dunia_1
SELECT Name FROM negara WHERE Luas_Permukaan > (SELECT min (Luas_Permukaan) FROM negara WHERE Benua = 'Eropa')	dunia_1
SELECT Name FROM negara WHERE Luas_Permukaan > (SELECT min (Luas_Permukaan) FROM negara WHERE Benua = 'Eropa')	dunia_1
SELECT Name FROM negara WHERE Benua = 'Afrika' AND populasi < (SELECT max (populasi) FROM negara WHERE Benua = 'Asia')	dunia_1
SELECT Name FROM negara WHERE Benua = 'Afrika' AND populasi < (SELECT min (populasi) FROM negara WHERE Benua = 'Asia')	dunia_1
SELECT Name FROM negara WHERE Benua = 'Asia' AND populasi > (SELECT max (populasi) FROM negara WHERE Benua = 'Afrika')	dunia_1
SELECT Name FROM negara WHERE Benua = 'Asia' AND populasi > (SELECT min (populasi) FROM negara WHERE Benua = 'Afrika')	dunia_1
SELECT Kode_Negara FROM bahasa_negara EXCEPT SELECT Kode_Negara FROM bahasa_negara WHERE LANGUAGE = 'Bahasa_inggris'	dunia_1
SELECT Kode_Negara FROM bahasa_negara EXCEPT SELECT Kode_Negara FROM bahasa_negara WHERE LANGUAGE = 'Bahasa_inggris'	dunia_1
SELECT DISTINCT Kode_Negara FROM bahasa_negara WHERE LANGUAGE != 'Bahasa_inggris'	dunia_1
SELECT DISTINCT Kode_Negara FROM bahasa_negara WHERE LANGUAGE != 'Bahasa_inggris'	dunia_1
SELECT Code FROM negara WHERE Formulir_Pemerintah != 'Republik' EXCEPT SELECT Kode_Negara FROM bahasa_negara WHERE LANGUAGE = 'Bahasa_inggris'	dunia_1
SELECT Code FROM negara WHERE Formulir_Pemerintah != 'Republik' EXCEPT SELECT Kode_Negara FROM bahasa_negara WHERE LANGUAGE = 'Bahasa_inggris'	dunia_1
SELECT DISTINCT T2.Nama FROM negara AS T1 JOIN kota AS T2 ON T2.Kode_Negara = T1.Kode WHERE T1.Benua = 'Eropa' AND T1.Nama NOT IN (SELECT T3.Nama FROM negara AS T3 JOIN bahasa_negara AS T4 ON T3.Kode = T4.Kode_Negara WHERE T4.IsResmi = 'T' AND T4.Bahasa = 'Bahasa_inggris')	dunia_1
SELECT DISTINCT T2.Nama FROM negara AS T1 JOIN kota AS T2 ON T2.Kode_Negara = T1.Kode WHERE T1.Benua = 'Eropa' AND T1.Nama NOT IN (SELECT T3.Nama FROM negara AS T3 JOIN bahasa_negara AS T4 ON T3.Kode = T4.Kode_Negara WHERE T4.IsResmi = 'T' AND T4.Bahasa = 'Bahasa_inggris')	dunia_1
select distinct t3.nama from negara as t1 join bahasa_negara as t2 on t1.kode = t2.kode_negara join kota as t3 on t1.kode = t3.kode_negara where t2.resmi = "T" and t2.bahasa = "Cina" and t1.benua = "Asia"	dunia_1
SELECT DISTINCT T3.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara JOIN kota AS T3 ON T1.Kode = T3.Kode_Negara WHERE T2.IsResmi = 'T' AND T2.Bahasa = 'Cina' AND T1.Benua = 'Asia'	dunia_1
SELECT Name , Luas_Permukaan , Tahun_Indep FROM negara ORDER BY Populasi LIMIT 1	dunia_1
SELECT Name , Luas_Permukaan , Tahun_Indep FROM negara ORDER BY Populasi LIMIT 1	dunia_1
SELECT Name , populasi , Kepala_Negara FROM negara ORDER BY Luas_Permukaan DESC LIMIT 1	dunia_1
SELECT Name , populasi , Kepala_Negara FROM negara ORDER BY Luas_Permukaan DESC LIMIT 1	dunia_1
SELECT COUNT (T2.Bahasa) , T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara GROUP BY T1.Nama HAVING COUNT (*) > 2	dunia_1
SELECT COUNT (T2.Bahasa) , T1.Nama FROM negara AS T1 JOIN bahasa_negara AS T2 ON T1.Kode = T2.Kode_Negara GROUP BY T1.Nama HAVING COUNT (*) > 2	dunia_1
SELECT count (*) , Daerah FROM kota WHERE Populasi > (SELECT avg (Populasi) FROM kota) GROUP BY Daerah	dunia_1
SELECT count (*) , Daerah FROM kota WHERE Populasi > (SELECT avg (Populasi) FROM kota) GROUP BY Daerah	dunia_1
SELECT sum (Populasi) , Formulir_Pemerintah FROM negara GROUP BY Formulir_Pemerintah HAVING avg (Harapan_Hidup) > 72	dunia_1
SELECT sum (Populasi) , Formulir_Pemerintah FROM negara GROUP BY Formulir_Pemerintah HAVING avg (Harapan_Hidup) > 72	dunia_1
SELECT sum (Populasi) , avg (Harapan_Hidup) , Benua FROM negara GROUP BY Benua HAVING avg (Harapan_Hidup) < 72	dunia_1
SELECT sum (Populasi) , avg (Harapan_Hidup) , Benua FROM negara GROUP BY Benua HAVING avg (Harapan_Hidup) < 72	dunia_1
SELECT Name , Luas_Permukaan FROM negara ORDER BY Luas_Permukaan DESC LIMIT 5	dunia_1
SELECT Name , Luas_Permukaan FROM negara ORDER BY Luas_Permukaan DESC LIMIT 5	dunia_1
SELECT Name FROM negara ORDER BY Populasi DESC LIMIT 3	dunia_1
SELECT Name FROM negara ORDER BY Populasi DESC LIMIT 3	dunia_1
SELECT Name FROM negara ORDER BY Populasi ASC LIMIT 3	dunia_1
SELECT Name FROM negara ORDER BY Populasi ASC LIMIT 3	dunia_1
SELECT count (*) FROM negara WHERE benua = 'Asia'	dunia_1
SELECT count (*) FROM negara WHERE benua = 'Asia'	dunia_1
SELECT Name FROM negara WHERE benua = 'Eropa' AND Populasi = '80000'	dunia_1
SELECT Name FROM negara WHERE benua = 'Eropa' AND Populasi = '80000'	dunia_1
select sum (populasi) , avg (luas_permukaan) from negara where benua = "Amerika_Utara" and luas_permukaan > 3000	dunia_1
select sum (populasi) , avg (luas_permukaan) from negara where benua = "Amerika_Utara" and luas_permukaan > 3000	dunia_1
SELECT nama FROM kota WHERE Populasi BETWEEN 160000 AND 900000	dunia_1
select nama from kota where populasi between 160000 and 900000	dunia_1
SELECT LANGUAGE FROM bahasa_negara GROUP BY LANGUAGE ORDER BY count (*) DESC LIMIT 1	dunia_1
SELECT LANGUAGE FROM bahasa_negara GROUP BY LANGUAGE ORDER BY count (*) DESC LIMIT 1	dunia_1
SELECT LANGUAGE , Kode_Negara , max (Persentase) FROM bahasa_negara GROUP BY Kode_Negara	dunia_1
SELECT LANGUAGE , Kode_Negara , max (Persentase) FROM bahasa_negara GROUP BY Kode_Negara	dunia_1
SELECT count (*) , max (Persentase) FROM bahasa_negara WHERE LANGUAGE = 'Spanyol' GROUP BY Kode_Negara	dunia_1
SELECT count (*) , max (Persentase) FROM bahasa_negara WHERE LANGUAGE = 'Spanyol' GROUP BY Kode_Negara	dunia_1
SELECT Kode_Negara , max (Persentase) FROM bahasa_negara WHERE LANGUAGE = 'Spanyol' GROUP BY Kode_Negara	dunia_1
SELECT Kode_Negara , max (Persentase) FROM bahasa_negara WHERE LANGUAGE = 'Spanyol' GROUP BY Kode_Negara	dunia_1
SELECT count (*) FROM konduktor	orkestra
SELECT count (*) FROM konduktor	orkestra
SELECT Name FROM konduktor ORDER BY Usia ASC	orkestra
SELECT Name FROM konduktor ORDER BY Usia ASC	orkestra
SELECT Name FROM konduktor WHERE Kebangsaan != 'Amerika_Serikat'	orkestra
SELECT Name FROM konduktor WHERE Kebangsaan != 'Amerika_Serikat'	orkestra
SELECT Rekam_Perusahaan FROM orkestra ORDER BY Tahun_Didirikan DESC	orkestra
SELECT Rekam_Perusahaan FROM orkestra ORDER BY Tahun_Didirikan DESC	orkestra
SELECT avg (Kehadiran) FROM SHOW	orkestra
SELECT avg (Kehadiran) FROM SHOW	orkestra
SELECT max (SHARE) , min (SHARE) FROM pertunjukan WHERE TYPE != 'Hidup final'	orkestra
SELECT max (SHARE) , min (SHARE) FROM pertunjukan WHERE TYPE != 'Hidup final'	orkestra
SELECT count (DISTINCT Kebangsaan) FROM konduktor	orkestra
SELECT count (DISTINCT Kebangsaan) FROM konduktor	orkestra
SELECT Name FROM konduktor ORDER BY Tahun_Pekerjaan DESC	orkestra
SELECT Name FROM konduktor ORDER BY Tahun_Pekerjaan DESC	orkestra
SELECT Name FROM konduktor ORDER BY Tahun_Pekerjaan DESC LIMIT 1	orkestra
SELECT Name FROM konduktor ORDER BY Tahun_Pekerjaan DESC LIMIT 1	orkestra
SELECT T1.Nama , T2.Orkestra FROM konduktor AS T1 JOIN orkestra AS T2 ON T1.ID_Konduktor = T2.ID_Konduktor	orkestra
SELECT T1.Nama , T2.Orkestra FROM konduktor AS T1 JOIN orkestra AS T2 ON T1.ID_Konduktor = T2.ID_Konduktor	orkestra
SELECT T1.Nama FROM konduktor AS T1 JOIN orkestra AS T2 ON T1.ID_Konduktor = T2.ID_Konduktor GROUP BY T2.ID_Konduktor HAVING COUNT (*) > 1	orkestra
SELECT T1.Nama FROM konduktor AS T1 JOIN orkestra AS T2 ON T1.ID_Konduktor = T2.ID_Konduktor GROUP BY T2.ID_Konduktor HAVING COUNT (*) > 1	orkestra
SELECT T1.Nama FROM konduktor AS T1 JOIN orkestra AS T2 ON T1.ID_Konduktor = T2.ID_Konduktor GROUP BY T2.ID_Konduktor ORDER BY COUNT (*) DESC LIMIT 1	orkestra
SELECT T1.Nama FROM konduktor AS T1 JOIN orkestra AS T2 ON T1.ID_Konduktor = T2.ID_Konduktor GROUP BY T2.ID_Konduktor ORDER BY COUNT (*) DESC LIMIT 1	orkestra
SELECT T1.Nama FROM konduktor AS T1 JOIN orkestra AS T2 ON T1.ID_Konduktor = T2.ID_Konduktor WHERE Tahun_Didirikan > 2008	orkestra
SELECT T1.Nama FROM konduktor AS T1 JOIN orkestra AS T2 ON T1.ID_Konduktor = T2.ID_Konduktor WHERE Tahun_Didirikan > 2008	orkestra
SELECT Rekam_Perusahaan , COUNT (*) FROM orkestra GROUP BY Rekam_Perusahaan	orkestra
SELECT Rekam_Perusahaan , COUNT (*) FROM orkestra GROUP BY Rekam_Perusahaan	orkestra
SELECT Major_Record_Format FROM orkestra GROUP BY Major_Record_Format ORDER BY COUNT (*) ASC	orkestra
SELECT Major_Record_Format FROM orkestra GROUP BY Major_Record_Format ORDER BY COUNT (*) ASC	orkestra
SELECT Rekam_Perusahaan FROM orkestra GROUP BY Rekam_Perusahaan ORDER BY COUNT (*) DESC LIMIT 1	orkestra
SELECT Rekam_Perusahaan FROM orkestra GROUP BY Rekam_Perusahaan ORDER BY COUNT (*) DESC LIMIT 1	orkestra
SELECT Orkestra FROM orkestra WHERE ID_Orkestra NOT IN (SELECT ID_Orkestra FROM pertunjukan)	orkestra
SELECT Orkestra FROM orkestra WHERE ID_Orkestra NOT IN (SELECT ID_Orkestra FROM pertunjukan)	orkestra
SELECT Rekam_Perusahaan FROM orkestra WHERE Tahun_Didirikan < 2003 INTERSECT SELECT Rekam_Perusahaan FROM orkestra WHERE Tahun_Didirikan > 2003	orkestra
SELECT Rekam_Perusahaan FROM orkestra WHERE Tahun_Didirikan < 2003 INTERSECT SELECT Rekam_Perusahaan FROM orkestra WHERE Tahun_Didirikan > 2003	orkestra
SELECT COUNT (*) FROM orkestra WHERE Major_Record_Format = 'CD' OR Major_Record_Format = 'DVD'	orkestra
SELECT COUNT (*) FROM orkestra WHERE Major_Record_Format = 'CD' OR Major_Record_Format = 'DVD'	orkestra
SELECT Tahun_Didirikan FROM orkestra AS T1 JOIN pertunjukan AS T2 ON T1.ID_Orkestra = T2.ID_Orkestra GROUP BY T2.ID_Orkestra HAVING COUNT (*) > 1	orkestra
SELECT Tahun_Didirikan FROM orkestra AS T1 JOIN pertunjukan AS T2 ON T1.ID_Orkestra = T2.ID_Orkestra GROUP BY T2.ID_Orkestra HAVING COUNT (*) > 1	orkestra
SELECT count (*) FROM Siswa_sekolah_menengah	jaringan_1
SELECT count (*) FROM Siswa_sekolah_menengah	jaringan_1
SELECT nama , nilai FROM Siswa_sekolah_menengah	jaringan_1
SELECT nama , nilai FROM Siswa_sekolah_menengah	jaringan_1
SELECT nilai FROM Siswa_sekolah_menengah	jaringan_1
SELECT nilai FROM Siswa_sekolah_menengah	jaringan_1
SELECT nilai FROM Siswa_sekolah_menengah WHERE nama = 'Kyle'	jaringan_1
SELECT nilai FROM Siswa_sekolah_menengah WHERE nama = 'Kyle'	jaringan_1
SELECT nama FROM Siswa_sekolah_menengah WHERE nilai = 10	jaringan_1
SELECT nama FROM Siswa_sekolah_menengah WHERE nilai = 10	jaringan_1
SELECT ID FROM Siswa_sekolah_menengah WHERE nama = 'Kyle'	jaringan_1
SELECT ID FROM Siswa_sekolah_menengah WHERE nama = 'Kyle'	jaringan_1
SELECT count (*) FROM Siswa_sekolah_menengah WHERE nilai = 9 OR nilai = 10	jaringan_1
SELECT count (*) FROM Siswa_sekolah_menengah WHERE nilai = 9 OR nilai = 10	jaringan_1
SELECT nilai , count (*) FROM Siswa_sekolah_menengah GROUP BY nilai	jaringan_1
SELECT nilai , count (*) FROM Siswa_sekolah_menengah GROUP BY nilai	jaringan_1
SELECT nilai FROM Siswa_sekolah_menengah GROUP BY nilai ORDER BY count (*) DESC LIMIT 1	jaringan_1
SELECT nilai FROM Siswa_sekolah_menengah GROUP BY nilai ORDER BY count (*) DESC LIMIT 1	jaringan_1
SELECT nilai FROM Siswa_sekolah_menengah GROUP BY nilai HAVING count (*) >= 4	jaringan_1
SELECT nilai FROM Siswa_sekolah_menengah GROUP BY nilai HAVING count (*) >= 4	jaringan_1
SELECT id_siswa , count (*) FROM Teman GROUP BY id_siswa	jaringan_1
SELECT id_siswa , count (*) FROM Teman GROUP BY id_siswa	jaringan_1
SELECT T2.nama , count (*) FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id GROUP BY T1.id_siswa	jaringan_1
SELECT T2.nama , count (*) FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id GROUP BY T1.id_siswa	jaringan_1
SELECT T2.nama FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id GROUP BY T1.id_siswa ORDER BY count (*) DESC LIMIT 1	jaringan_1
SELECT T2.nama FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id GROUP BY T1.id_siswa ORDER BY count (*) DESC LIMIT 1	jaringan_1
SELECT T2.nama FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id GROUP BY T1.id_siswa HAVING count (*) >= 3	jaringan_1
SELECT T2.nama FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id GROUP BY T1.id_siswa HAVING count (*) >= 3	jaringan_1
SELECT T3.nama FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id JOIN Siswa_sekolah_menengah AS T3 ON T1.id_teman = T3.id WHERE T2.nama = 'Kyle'	jaringan_1
SELECT T3.nama FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id JOIN Siswa_sekolah_menengah AS T3 ON T1.id_teman = T3.id WHERE T2.nama = 'Kyle'	jaringan_1
SELECT count (*) FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id WHERE T2.nama = 'Kyle'	jaringan_1
SELECT count (*) FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id WHERE T2.nama = 'Kyle'	jaringan_1
SELECT id FROM Siswa_sekolah_menengah EXCEPT SELECT id_siswa FROM Teman	jaringan_1
SELECT id FROM Siswa_sekolah_menengah EXCEPT SELECT id_siswa FROM Teman	jaringan_1
SELECT nama FROM Siswa_sekolah_menengah EXCEPT SELECT T2.nama FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id	jaringan_1
SELECT nama FROM Siswa_sekolah_menengah EXCEPT SELECT T2.nama FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id	jaringan_1
SELECT id_siswa FROM Teman INTERSECT SELECT id_menyukai FROM Suka	jaringan_1
SELECT id_siswa FROM Teman INTERSECT SELECT id_menyukai FROM Suka	jaringan_1
SELECT T2.nama FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id INTERSECT SELECT T2.nama FROM Suka AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_like = T2.id	jaringan_1
SELECT T2.nama FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id INTERSECT SELECT T2.nama FROM Suka AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_like = T2.id	jaringan_1
SELECT id_siswa , count (*) FROM Suka GROUP BY id_siswa	jaringan_1
SELECT id_siswa , count (*) FROM Suka GROUP BY id_siswa	jaringan_1
SELECT T2.nama , count (*) FROM Suka AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id GROUP BY T1.id_siswa	jaringan_1
SELECT T2.nama , count (*) FROM Suka AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id GROUP BY T1.id_siswa	jaringan_1
SELECT T2.nama FROM Suka AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id GROUP BY T1.id_siswa ORDER BY count (*) DESC LIMIT 1	jaringan_1
SELECT T2.nama FROM Suka AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id GROUP BY T1.id_siswa ORDER BY count (*) DESC LIMIT 1	jaringan_1
SELECT T2.nama FROM Suka AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id GROUP BY T1.id_siswa HAVING count (*) >= 2	jaringan_1
SELECT T2.nama FROM Suka AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id GROUP BY T1.id_siswa HAVING count (*) >= 2	jaringan_1
SELECT T2.nama FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id WHERE T2.kelas > 5 GROUP BY T1.id_siswa HAVING count (*) >= 2	jaringan_1
SELECT T2.nama FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id WHERE T2.kelas > 5 GROUP BY T1.id_siswa HAVING count (*) >= 2	jaringan_1
SELECT count (*) FROM Suka AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id WHERE T2.nama = 'Kyle'	jaringan_1
SELECT count (*) FROM Suka AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id WHERE T2.nama = 'Kyle'	jaringan_1
SELECT avg (nilai) FROM Siswa_sekolah_menengah WHERE id IN (SELECT T1.id_siswa FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id)	jaringan_1
SELECT avg (nilai) FROM Siswa_sekolah_menengah WHERE id IN (SELECT T1.id_siswa FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id)	jaringan_1
SELECT min (nilai) FROM Siswa_sekolah_menengah WHERE id NOT IN (SELECT T1.id_siswa FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id)	jaringan_1
SELECT min (nilai) FROM Siswa_sekolah_menengah WHERE id NOT IN (SELECT T1.id_siswa FROM Teman AS T1 JOIN Siswa_sekolah_menengah AS T2 ON T1.id_siswa = T2.id)	jaringan_1
SELECT state FROM Pemilik INTERSECT SELECT state FROM Profesional	kandang_anjing
SELECT state FROM Pemilik INTERSECT SELECT state FROM Profesional	kandang_anjing
SELECT avg (usia) FROM Anjing WHERE id_dog IN (SELECT id_dog FROM Perawatan)	kandang_anjing
SELECT avg (usia) FROM Anjing WHERE id_dog IN (SELECT id_dog FROM Perawatan)	kandang_anjing
SELECT id_professional , nama_belakang , nomor_sel FROM Profesional WHERE state = 'Indiana' UNION SELECT T1.id_profesional , T1.nama_belakang , T1.nomor_sel FROM Profesional AS T1 JOIN Perawatan AS T2 ON T1.id_profesional = T2.id_profesional GROUP BY T1.id_profesional HAVING count (*) > 2	kandang_anjing
SELECT id_professional , nama_belakang , nomor_sel FROM Profesional WHERE state = 'Indiana' UNION SELECT T1.id_profesional , T1.nama_belakang , T1.nomor_sel FROM Profesional AS T1 JOIN Perawatan AS T2 ON T1.id_profesional = T2.id_profesional GROUP BY T1.id_profesional HAVING count (*) > 2	kandang_anjing
select nama from anjing where id_dog not in (select id_dog from perawatan group by id_dog having sum (biaya_pengobatan) > 1000)	kandang_anjing
select nama from anjing where id_dog not in (select id_dog from perawatan group by id_dog having sum (biaya_pengobatan) > 1000)	kandang_anjing
SELECT nama_depan FROM Profesional UNION SELECT nama_depan FROM Pemilik EXCEPT SELECT nama FROM Anjing	kandang_anjing
SELECT nama_depan FROM Profesional UNION SELECT nama_depan FROM Pemilik EXCEPT SELECT nama FROM Anjing	kandang_anjing
SELECT id_professional , kode_peran , alamat_email FROM Profesional EXCEPT SELECT T1.id_profesional , T1.kode_peran , T1.alamat_email FROM Profesional AS T1 JOIN Perawatan AS T2 ON T1.id_profesional = T2.id_profesional	kandang_anjing
SELECT id_professional , kode_peran , alamat_email FROM Profesional EXCEPT SELECT T1.id_profesional , T1.kode_peran , T1.alamat_email FROM Profesional AS T1 JOIN Perawatan AS T2 ON T1.id_profesional = T2.id_profesional	kandang_anjing
SELECT T1.id_pemilik , T2.nama_depan , T2.nama_belakang FROM Anjing AS T1 JOIN Pemilik AS T2 ON T1.id_pemilik = T2.id_owner GROUP BY T1.id_pemilik ORDER BY count (*) DESC LIMIT 1	kandang_anjing
SELECT T1.id_pemilik , T2.nama_depan , T2.nama_belakang FROM Anjing AS T1 JOIN Pemilik AS T2 ON T1.id_pemilik = T2.id_owner GROUP BY T1.id_pemilik ORDER BY count (*) DESC LIMIT 1	kandang_anjing
SELECT T1.id_profesional , T1.kode_peran , T1.nama_depan FROM Profesional AS T1 JOIN Perawatan AS T2 ON T1.id_profesional = T2.id_profesional GROUP BY T1.id_profesional HAVING count (*) >= 2	kandang_anjing
SELECT T1.id_profesional , T1.kode_peran , T1.nama_depan FROM Profesional AS T1 JOIN Perawatan AS T2 ON T1.id_profesional = T2.id_profesional GROUP BY T1.id_profesional HAVING count (*) >= 2	kandang_anjing
SELECT T1.nama_breed FROM berkembang_biak AS T1 JOIN Anjing AS T2 ON T1.breed_code = T2.breed_code GROUP BY T1.nama_breed ORDER BY count (*) DESC LIMIT 1	kandang_anjing
SELECT T1.nama_breed FROM berkembang_biak AS T1 JOIN Anjing AS T2 ON T1.breed_code = T2.breed_code GROUP BY T1.nama_breed ORDER BY count (*) DESC LIMIT 1	kandang_anjing
SELECT T1.id_pemilik , T1.nama_belakang FROM Pemilik AS T1 JOIN Anjing AS T2 ON T1.id_pemilik = T2.id_owner JOIN Perawatan AS T3 ON T2.id_dog = T3.id_dog GROUP BY T1.id_pemilik ORDER BY count (*) DESC LIMIT 1	kandang_anjing
SELECT T1.id_pemilik , T1.nama_belakang FROM Pemilik AS T1 JOIN Anjing AS T2 ON T1.id_pemilik = T2.id_owner JOIN Perawatan AS T3 ON T2.id_dog = T3.id_dog GROUP BY T1.id_pemilik ORDER BY count (*) DESC LIMIT 1	kandang_anjing
SELECT T1.deskripsi_tipe_pengobatan FROM Jenis_pengobatan AS T1 JOIN Perawatan AS T2 ON T1.kode_tipe_pengobatan = T2.kode_tipe_pengobatan GROUP BY T1.kode_tipe_pengobatan ORDER BY sum (biaya_pengobatan) ASC LIMIT 1	kandang_anjing
SELECT T1.deskripsi_tipe_pengobatan FROM Jenis_pengobatan AS T1 JOIN Perawatan AS T2 ON T1.kode_tipe_pengobatan = T2.kode_tipe_pengobatan GROUP BY T1.kode_tipe_pengobatan ORDER BY sum (biaya_pengobatan) ASC LIMIT 1	kandang_anjing
SELECT T1.id_pemilik , T1.zip_code FROM Pemilik AS T1 JOIN Anjing AS T2 ON T1.id_pemilik = T2.id_owner JOIN Perawatan AS T3 ON T2.id_dog = T3.id_dog GROUP BY T1.id_pemilik ORDER BY sum (T3.biaya_pengobatan) DESC LIMIT 1	kandang_anjing
SELECT T1.id_pemilik , T1.zip_code FROM Pemilik AS T1 JOIN Anjing AS T2 ON T1.id_pemilik = T2.id_owner JOIN Perawatan AS T3 ON T2.id_dog = T3.id_dog GROUP BY T1.id_pemilik ORDER BY sum (T3.biaya_pengobatan) DESC LIMIT 1	kandang_anjing
SELECT T1.id_profesional , T1.nomor_sel FROM Profesional AS T1 JOIN Perawatan AS T2 ON T1.id_profesional = T2.id_profesional GROUP BY T1.id_profesional HAVING count (*) >= 2	kandang_anjing
SELECT T1.id_profesional , T1.nomor_sel FROM Profesional AS T1 JOIN Perawatan AS T2 ON T1.id_profesional = T2.id_profesional GROUP BY T1.id_profesional HAVING count (*) >= 2	kandang_anjing
SELECT DISTINCT T1.nama_depan , T1.nama_belakang FROM Profesional AS T1 JOIN Perawatan AS T2 WHERE biaya_pengobatan < (SELECT avg (biaya_pengobatan) FROM Perawatan)	kandang_anjing
SELECT DISTINCT T1.nama_depan , T1.nama_belakang FROM Profesional AS T1 JOIN Perawatan AS T2 WHERE biaya_pengobatan < (SELECT avg (biaya_pengobatan) FROM Perawatan)	kandang_anjing
SELECT T1.tanggal_pengobatan , T2.nama_depan FROM Perawatan AS T1 JOIN Profesional AS T2 ON T1.id_profesional = T2.id_profesional	kandang_anjing
SELECT T1.tanggal_pengobatan , T2.nama_depan FROM Perawatan AS T1 JOIN Profesional AS T2 ON T1.id_profesional = T2.id_profesional	kandang_anjing
SELECT T1.biaya_pengobatan , T2.deskripsi_tipe_pengobatan FROM Perawatan AS T1 JOIN tipe_pengobatan AS T2 ON T1.kode_tipe_pengobatan = T2.kode_tipe_pengobatan	kandang_anjing
SELECT T1.biaya_pengobatan , T2.deskripsi_tipe_pengobatan FROM Perawatan AS T1 JOIN tipe_pengobatan AS T2 ON T1.kode_tipe_pengobatan = T2.kode_tipe_pengobatan	kandang_anjing
SELECT T1.nama_depan , T1.nama_belakang , T2.ukuran_kode FROM Pemilik AS T1 JOIN Anjing AS T2 ON T1.id_pemilik = T2.id_owner	kandang_anjing
SELECT T1.nama_depan , T1.nama_belakang , T2.ukuran_kode FROM Pemilik AS T1 JOIN Anjing AS T2 ON T1.id_pemilik = T2.id_owner	kandang_anjing
SELECT T1.nama_depan , T2.nama FROM Pemilik AS T1 JOIN Anjing AS T2 ON T1.id_pemilik = T2.id_owner	kandang_anjing
SELECT T1.nama_depan , T2.nama FROM Pemilik AS T1 JOIN Anjing AS T2 ON T1.id_pemilik = T2.id_owner	kandang_anjing
SELECT T1.nama , T2.tanggal_pengobatan FROM Anjing AS T1 JOIN Perawatan AS T2 ON T1.id_dog = T2.id_dog WHERE T1.breed_code = (SELECT kode_breed FROM Anjing GROUP BY kode_breed ORDER BY count (*) ASC LIMIT 1)	kandang_anjing
SELECT T1.nama , T2.tanggal_pengobatan FROM Anjing AS T1 JOIN Perawatan AS T2 ON T1.id_dog = T2.id_dog WHERE T1.breed_code = (SELECT kode_breed FROM Anjing GROUP BY kode_breed ORDER BY count (*) ASC LIMIT 1)	kandang_anjing
SELECT T1.nama_depan , T2.nama FROM Pemilik AS T1 JOIN Anjing AS T2 ON T1.id_pemilik = T2.id_owner WHERE T1.negara_bagian = 'Virginia'	kandang_anjing
SELECT T1.nama_depan , T2.nama FROM Pemilik AS T1 JOIN Anjing AS T2 ON T1.id_pemilik = T2.id_owner WHERE T1.negara_bagian = 'Virginia'	kandang_anjing
SELECT DISTINCT T1.tanggal_tiba , T1.tanggal_berangkat FROM Anjing AS T1 JOIN Perawatan AS T2 ON T1.id_dog = T2.id_dog	kandang_anjing
SELECT DISTINCT T1.tanggal_tiba , T1.tanggal_berangkat FROM Anjing AS T1 JOIN Perawatan AS T2 ON T1.id_dog = T2.id_dog	kandang_anjing
SELECT T1.nama_belakang FROM Pemilik AS T1 JOIN Anjing AS T2 ON T1.id_pemilik = T2.id_owner WHERE T2.usia = (SELECT max (usia) FROM Anjing)	kandang_anjing
SELECT T1.nama_belakang FROM Pemilik AS T1 JOIN Anjing AS T2 ON T1.id_pemilik = T2.id_owner WHERE T2.usia = (SELECT max (usia) FROM Anjing)	kandang_anjing
SELECT alamat_email FROM Profesional WHERE state = 'Hawai' OR state = 'Wisconsin'	kandang_anjing
SELECT alamat_email FROM Profesional WHERE state = 'Hawai' OR state = 'Wisconsin'	kandang_anjing
SELECT tanggal_tiba , tanggal_berangkat FROM Anjing	kandang_anjing
SELECT tanggal_tiba , tanggal_berangkat FROM Anjing	kandang_anjing
SELECT count (DISTINCT id_dog) FROM Perawatan	kandang_anjing
SELECT count (DISTINCT id_dog) FROM Perawatan	kandang_anjing
SELECT count (DISTINCT id_professional) FROM Perawatan	kandang_anjing
SELECT count (DISTINCT id_professional) FROM Perawatan	kandang_anjing
SELECT kode_peran , jalan , kota , state FROM profesional WHERE kota LIKE '%Barat%'	kandang_anjing
SELECT kode_peran , jalan , kota , state FROM profesional WHERE kota LIKE '%Barat%'	kandang_anjing
SELECT nama_depan , nama_belakang , alamat_email FROM Pemilik WHERE state LIKE '%Utara%'	kandang_anjing
SELECT nama_depan , nama_belakang , alamat_email FROM Pemilik WHERE state LIKE '%Utara%'	kandang_anjing
SELECT count (*) FROM Anjing WHERE usia < (SELECT avg (usia) FROM Anjing)	kandang_anjing
SELECT count (*) FROM Anjing WHERE usia < (SELECT avg (usia) FROM Anjing)	kandang_anjing
SELECT biaya_pengobatan FROM Perawatan ORDER BY tanggal_pengobatan DESC LIMIT 1	kandang_anjing
SELECT biaya_pengobatan FROM Perawatan ORDER BY tanggal_pengobatan DESC LIMIT 1	kandang_anjing
SELECT count (*) FROM Anjing WHERE id_dog NOT IN (SELECT id_dog FROM Perawatan)	kandang_anjing
select count (*) from anjing where id_dog not in (select id_dog from perawatan)	kandang_anjing
SELECT count (*) FROM Pemilik WHERE id_pemilik NOT IN (SELECT id_pemilik FROM Anjing)	kandang_anjing
SELECT count (*) FROM Pemilik WHERE id_pemilik NOT IN (SELECT id_pemilik FROM Anjing)	kandang_anjing
SELECT count (*) FROM Profesional WHERE id_professional NOT IN (SELECT id_professional FROM Perawatan)	kandang_anjing
SELECT count (*) FROM Profesional WHERE id_professional NOT IN (SELECT id_professional FROM Perawatan)	kandang_anjing
SELECT nama , usia , berat FROM Anjing WHERE ditinggalkan_yn = 1	kandang_anjing
SELECT nama , usia , berat FROM Anjing WHERE ditinggalkan_yn = 1	kandang_anjing
SELECT avg (usia) FROM Anjing	kandang_anjing
SELECT avg (usia) FROM Anjing	kandang_anjing
SELECT max (usia) FROM Anjing	kandang_anjing
SELECT max (usia) FROM Anjing	kandang_anjing
SELECT jenis_biaya , biaya_jumlah FROM Biaya	kandang_anjing
SELECT jenis_biaya , biaya_jumlah FROM Biaya	kandang_anjing
SELECT max (biaya_jumlah) FROM Biaya	kandang_anjing
SELECT max (biaya_jumlah) FROM Biaya	kandang_anjing
SELECT alamat_email , nomor_sel , telepon_rumah FROM profesional	kandang_anjing
SELECT alamat_email , nomor_sel , telepon_rumah FROM profesional	kandang_anjing
SELECT DISTINCT kode_breed , kode_ukuran FROM anjing	kandang_anjing
SELECT DISTINCT kode_breed , kode_ukuran FROM anjing	kandang_anjing
SELECT DISTINCT T1.nama_depan , T3.deskripsi_tipe_pengobatan FROM profesional AS T1 JOIN Perawatan AS T2 ON T1.id_profesional = T2.id_profesional JOIN Jenis_pengobatan AS T3 ON T2.kode_tipe_pengobatan = T3.kode_tipe_pengobatan	kandang_anjing
SELECT DISTINCT T1.nama_depan , T3.deskripsi_tipe_pengobatan FROM profesional AS T1 JOIN Perawatan AS T2 ON T1.id_profesional = T2.id_profesional JOIN Jenis_pengobatan AS T3 ON T2.kode_tipe_pengobatan = T3.kode_tipe_pengobatan	kandang_anjing
SELECT count (*) FROM penyanyi	penyanyi
SELECT count (*) FROM penyanyi	penyanyi
SELECT Name FROM penyanyi ORDER BY Net_Worth_Jutaan ASC	penyanyi
SELECT Name FROM penyanyi ORDER BY Net_Worth_Jutaan ASC	penyanyi
SELECT Lahir_Tahun , Kewarganegaraan FROM penyanyi	penyanyi
SELECT Lahir_Tahun , Kewarganegaraan FROM penyanyi	penyanyi
SELECT Name FROM penyanyi WHERE Kewarganegaraan != 'Perancis'	penyanyi
SELECT Name FROM penyanyi WHERE Kewarganegaraan != 'Perancis'	penyanyi
SELECT Name FROM penyanyi WHERE Lahir_Tahun = 1948 OR Lahir_Tahun = 1949	penyanyi
SELECT Name FROM penyanyi WHERE Lahir_Tahun = 1948 OR Lahir_Tahun = 1949	penyanyi
SELECT Name FROM penyanyi ORDER BY Net_Worth_Jutaan DESC LIMIT 1	penyanyi
SELECT Name FROM penyanyi ORDER BY Net_Worth_Jutaan DESC LIMIT 1	penyanyi
SELECT Kewarganegaraan , COUNT (*) FROM penyanyi GROUP BY Kewarganegaraan	penyanyi
SELECT Kewarganegaraan , COUNT (*) FROM penyanyi GROUP BY Kewarganegaraan	penyanyi
SELECT Kewarganegaraan FROM penyanyi GROUP BY Kewarganegaraan ORDER BY COUNT (*) DESC LIMIT 1	penyanyi
select kewarganegaraan from penyanyi group by kewarganegaraan order by count (*) desc limit 1	penyanyi
SELECT Kewarganegaraan , max (Net_Worth_Jutaan) FROM penyanyi GROUP BY Kewarganegaraan	penyanyi
SELECT Kewarganegaraan , max (Net_Worth_Jutaan) FROM penyanyi GROUP BY Kewarganegaraan	penyanyi
SELECT T2.Judul , T1.Nama FROM penyanyi AS T1 JOIN lagu AS T2 ON T1.ID_Penyanyi = T2.ID_Penyanyi	penyanyi
SELECT T2.Judul , T1.Nama FROM penyanyi AS T1 JOIN lagu AS T2 ON T1.ID_Penyanyi = T2.ID_Penyanyi	penyanyi
SELECT DISTINCT T1.Nama FROM penyanyi AS T1 JOIN lagu AS T2 ON T1.ID_Penyanyi = T2.ID_Penyanyi WHERE T2.Penjualan > 300000	penyanyi
SELECT DISTINCT T1.Nama FROM penyanyi AS T1 JOIN lagu AS T2 ON T1.ID_Penyanyi = T2.ID_Penyanyi WHERE T2.Penjualan > 300000	penyanyi
SELECT T1.Nama FROM penyanyi AS T1 JOIN lagu AS T2 ON T1.ID_Penyanyi = T2.ID_Penyanyi GROUP BY T1.Nama HAVING COUNT (*) > 1	penyanyi
SELECT T1.Nama FROM penyanyi AS T1 JOIN lagu AS T2 ON T1.ID_Penyanyi = T2.ID_Penyanyi GROUP BY T1.Nama HAVING COUNT (*) > 1	penyanyi
SELECT T1.Nama , sum (T2.Penjualan) FROM penyanyi AS T1 JOIN lagu AS T2 ON T1.ID_Penyanyi = T2.ID_Penyanyi GROUP BY T1.Nama	penyanyi
SELECT T1.Nama , sum (T2.Penjualan) FROM penyanyi AS T1 JOIN lagu AS T2 ON T1.ID_Penyanyi = T2.ID_Penyanyi GROUP BY T1.Nama	penyanyi
SELECT Name FROM penyanyi WHERE ID_Penyanyi NOT IN (SELECT ID_Penyanyi FROM lagu)	penyanyi
SELECT Name FROM penyanyi WHERE ID_Penyanyi NOT IN (SELECT ID_Penyanyi FROM lagu)	penyanyi
SELECT Kewarganegaraan FROM penyanyi WHERE Lahir_Tahun < 1945 INTERSECT SELECT Kewarganegaraan FROM penyanyi WHERE Lahir_Tahun > 1955	penyanyi
SELECT Kewarganegaraan FROM penyanyi WHERE Lahir_Tahun < 1945 INTERSECT SELECT Kewarganegaraan FROM penyanyi WHERE Lahir_Tahun > 1955	penyanyi
SELECT count (*) FROM Fitur_Tersedia_Lainnya	real_estate_properties
SELECT T2.fitur_tipe_nama FROM Fitur_Tersedia_Lainnya AS T1 JOIN Ref_Fitur_Jenis AS T2 ON T1.fitur_tipe_kode = T2.fitur_tipe_kode WHERE T1.nama_fitur = 'AC'	real_estate_properties
SELECT T2.property_type_description FROM Properti AS T1 JOIN Ref_Property_Types AS T2 ON T1.property_type_code = T2.property_type_code GROUP BY T1.property_type_code	real_estate_properties
SELECT nama_properti FROM Properti WHERE kode_tipe_properti = 'Rumah' UNION SELECT nama_properti FROM Properti WHERE kode_tipe_properti = 'Apartemen' AND jumlah_kamar > 1	real_estate_properties
