use Boost13Db;

-- string fonksiyonlari

print len('naber');

print upper('Naber');
print lower('Naber');

print 'X' + Ltrim('                       oley             ') + 'X';          
print 'X' + rtrim('                       oley             ') + 'X';          
print 'X' + trim('                       oley             ') + 'X';       


print replace(N'Ankara''nin baglari' collate TURKISH_CS_AS,'a','@');
print replace(N'ANKARA''NIN BAGLARI' collate TURKISH_CS_AS,'a','@');
print replace(N'Ankara''nin baglari' collate TURKISH_CI_AS,'a','@');


print replace(N'Pokémon' collate TURKISH_CI_AI,'e','3'); -- accent insensitive yapinca boyle oluyor


print upper(N'yigit' collate turkish_ci_as); -- bendeki ingilizceyi kullaniyor
print upper(N'yigit' collate latin1_general_ci_as); -- burdaki benim ki gibi ancak ben hicbir sey yazmadan da bunu yapabiliyorum cunku benimki bunu zaten kullaniyor


print substring(N'afyonkarahisar', 6, 4);

print concat('can',',','cem',',','ece',',', 'alp')
print concat_ws(',','can','cem','ece', 'alp')


select 'Gilgames, dostu Enkidunun ölümünden sonra büyük bir yas içine düstü. Içsel bir çikmazla bogusurken, ölümsüzlügü arayisi onu büyülü bir yolculuga sürükledi. Uzun bir yolculuktan sonra, Cennet Nehrinin sularina ulasti ve orada Utnapistim adinda bir kahramanla karsilasti. Utnapistim, Büyük Tufandan sag kurtulan tek insandi ve ölümsüzlügün sirrina vakifti. Gilgames, Utnapistime ölümsüzlük hakkinda bilgi vermesini rica etti, ancak Utnapistim, ölümsüzlügün sadece tanrilara ait oldugunu ve insanlarin ölümlü olduklarini söyledi. Buna ragmen Gilgames, ölümsüzlügü arayisini sürdürdü ve sonunda hayatin gerçek anlaminin kendisiyle barisik olmak oldugunu kesfetti.';


-- yukaridaki cumledeki kelimmeleri bir tabloda tek sutun halinde listeleyebilirmisiniz


select distinct *, len(value) from string_split(N'Gilgames, dostu Enkidunun ölümünden sonra büyük bir yas içine düstü. Içsel bir çikmazla bogusurken, ölümsüzlügü arayisi onu büyülü bir yolculuga sürükledi. Uzun bir yolculuktan sonra, Cennet Nehrinin sularina ulasti ve orada Utnapistim adinda bir kahramanla karsilasti. Utnapistim, Büyük Tufandan sag kurtulan tek insandi ve ölümsüzlügün sirrina vakifti. Gilgames, Utnapistime ölümsüzlük hakkinda bilgi vermesini rica etti, ancak Utnapistim, ölümsüzlügün sadece tanrilara ait oldugunu ve insanlarin ölümlü olduklarini söyledi. Buna ragmen Gilgames, ölümsüzlügü arayisini sürdürdü ve sonunda hayatin gerçek anlaminin kendisiyle barisik olmak oldugunu kesfetti.', N' ')
order by len(value);

declare @cumler nvarchar(max) = N'Gilgames, dostu Enkidunun ölümünden sonra büyük bir yas içine düstü. Içsel bir çikmazla bogusurken, ölümsüzlügü arayisi onu büyülü bir yolculuga sürükledi. Uzun bir yolculuktan sonra, Cennet Nehrinin sularina ulasti ve orada Utnapistim adinda bir kahramanla karsilasti. Utnapistim, Büyük Tufandan sag kurtulan tek insandi ve ölümsüzlügün sirrina vakifti. Gilgames, Utnapistime ölümsüzlük hakkinda bilgi vermesini rica etti, ancak Utnapistim, ölümsüzlügün sadece tanrilara ait oldugunu ve insanlarin ölümlü olduklarini söyledi. Buna ragmen Gilgames, ölümsüzlügü arayisini sürdürdü ve sonunda hayatin gerçek anlaminin kendisiyle barisik olmak oldugunu kesfetti.';

select distinct * from string_split(@cumler,N' ');


-- nvarchar ile varchar arasindaki fark nedir

-- nvarchar(10) ile nchar(10) arasindaki fark nedir

-- nvarchar da 10 un altindaysa 6 ise 6 tutar 10 degil ve stringin uzunlugunu tutar

-- nchar ise her zaman 10 karakteri tutar girilen string 10 dan daha kisa ise geri kalan alanlari null veya bosluk olarak tutar


print ascii('a'); -- 65

print unicode(N'a'); -- 65

print char(65);

print nchar(66);

print charindex(N'ka',N'ankara'); --3



PRINT YEAR(GETDATE());
PRINT MONTH(GETDATE());
PRINT DAY(GETDATE());
PRINT DATEPART(MONTH, GETDATE());
PRINT DATEPART(DAY, GETDATE());
PRINT DATEPART(YEAR, GETDATE());
PRINT DATEPART(YYYY, GETDATE());
PRINT DATEPART(YY, GETDATE());
PRINT DATEPART(M, GETDATE());
PRINT DATEPART(D, GETDATE());

