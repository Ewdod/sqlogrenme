use Boost13Db;


-- soru harflere gore ismi o harfle baslayan ogrenci sayilari

-- 3. sutundada ismi o harfle baslayanlari virgul ile koyunuz



select
	harf,
	(select count(*) from ogrenciler where left(ad,1) = harf) adet,
	(select string_agg(ad,N', ') from ogrenciler where left(ad,1) = harf) adlar


from harfler;

-- adedi 0 dan buyuk olanlari goster

SELECT
	harf,
	adet,
	adlar
FROM
	(
		SELECT
			harf,
			(
				SELECT COUNT(*) FROM ogrenciler WHERE LEFT(ad, 1) = harf
			) AS adet,
			(
				SELECT STRING_AGG(ad, N', ') FROM ogrenciler WHERE LEFT(ad, 1) = harf
			) AS adlar
		FROM harfler
	) AS t
WHERE adet > 0;


SELECT *
FROM
(
	SELECT
		harf,
		(
			SELECT STRING_AGG(ad, N'-') FROM ogrenciler WHERE ad LIKE N'%' + harf + N'%'
		) AS adlar
	FROM harfler
) AS t
WHERE adlar IS NOT NULL;



select * from harfler
inner join ogrenciler on harf = left(soyad,1);

