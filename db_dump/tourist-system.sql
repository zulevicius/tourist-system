-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2016 at 02:02 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourist-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_tourist_event`
--

CREATE TABLE `app_tourist_event` (
  `tour_object_id` int(11) NOT NULL,
  `event_date` datetime NOT NULL,
  `event_end_date` datetime NOT NULL,
  `is_concert` tinyint(1) NOT NULL,
  `is_festival` tinyint(1) NOT NULL,
  `is_exhibition` tinyint(1) NOT NULL,
  `min_ticket_price` double
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_tourist_event`
--

INSERT INTO `app_tourist_event` (`tour_object_id`, `event_date`, `event_end_date`, `is_concert`, `is_festival`, `is_exhibition`, `min_ticket_price`) VALUES
(42, '2016-11-28 10:00:00', '2016-11-28 11:00:00', 1, 0, 0, NULL),
(43, '2016-12-18 17:00:00', '2016-12-18 18:10:00', 1, 0, 0, NULL),
(44, '2017-01-18 17:00:00', '2017-01-20 19:00:00', 0, 1, 0, 5),
(45, '2016-12-27 16:00:00', '2016-12-27 17:00:00', 1, 0, 0, 9.2),
(46, '2017-01-12 16:00:00', '2017-01-12 17:00:00', 1, 0, 0, 4.1),
(47, '2016-12-28 13:00:00', '2016-12-28 14:00:00', 1, 0, 0, 8),
(49, '2017-08-19 07:00:00', '2017-08-20 16:00:00', 0, 1, 0, 0),
(50, '2016-12-18 09:00:00', '2016-12-18 10:00:00', 0, 0, 1, NULL),
(51, '2016-12-15 15:00:00', '2016-12-15 16:00:00', 0, 0, 1, NULL),
(52, '2016-12-27 09:00:00', '2016-12-27 10:00:00', 0, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_tourist_image`
--

CREATE TABLE `app_tourist_image` (
  `id` int(11) NOT NULL,
  `tour_object_id` int(11) NOT NULL,
  `image` varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_tourist_place`
--

CREATE TABLE `app_tourist_place` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `address` varchar(64) NOT NULL,
  `city` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_tourist_place`
--

INSERT INTO `app_tourist_place` (`id`, `title`, `address`, `city`) VALUES
(1, 'Aušros Vartai', 'Aušros Vartų g. 12', 'Vilnius'),
(2, 'Arkikatedra bazilika', 'Katedros a. 1', 'Vilnius'),
(3, 'Šv. Jonų bažnyčia', 'Šv. Jono g. 12', 'Vilnius'),
(4, 'Šv. Onos bažnyčia', 'Maironio g. 8', 'Vilnius'),
(5, 'Bernardinų bažnyčia', 'Maironio g. 10', 'Vilnius'),
(6, 'Šv. Kazimiero bažnyčia', 'Didžioji g. 34', 'Vilnius'),
(7, 'Šv. Kotrynos bažnyčia', 'Vilniaus g. 30', 'Vilnius'),
(8, 'Šv. Mikalojaus bažnyčia', 'Šv. Mikalojaus g. 4', 'Vilnius'),
(9, 'Pranciškonų bažnyčia', 'Trakų g. 9', 'Vilnius'),
(10, 'Visų šventųjų bažnyčia', 'Rūdninkų g. 20', 'Vilnius'),
(11, 'Šv. Baltramiejaus bažnyčia', 'Užupio g. 17A', 'Vilnius'),
(12, 'Šv. Ignoto bažnyčia', 'Šv. Ignoto g. 6', 'Vilnius'),
(13, 'Gedimino pilies bokštas', 'Arsenalo g. 5', 'Vilnius'),
(14, 'LDK Valdovų rūmai', 'Katedros a. 4', 'Vilnius'),
(15, 'Vilniaus katedros varpinė', 'Katedros a.', 'Vilnius'),
(16, 'Lietuvos nacionalinis muziejus, Naujasis arsenalas', 'Arsenalo g. 1', 'Vilnius'),
(17, 'Lietuvos nacionalinis muziejus, Senasis arsenalas', 'Arsenalo g. 3', 'Vilnius'),
(18, 'Signatarų namai', 'Pilies g. 26', 'Vilnius'),
(19, 'Taikomosios dailės ir dizaino muziejus', 'Arsenalo g. 3A', 'Vilnius'),
(20, 'Televizijos bokštas', 'Sausio 13-osios g. 10', 'Vilnius'),
(21, 'Nacionalinė dailės galerija', 'Konstitucijos pr. 22', 'Vilnius'),
(22, 'Pinigų muziejus', 'Totorių g. 2/8', 'Vilnius'),
(23, 'Energetikos ir technikos muziejus', 'Rinktinės g. 2', 'Vilnius'),
(24, 'Karo technikos ir transporto muziejus', 'Olandų g. 21 A', 'Vilnius'),
(25, 'Vilniaus gynybinės sienos bastėja', 'Bokšto g. 20', 'Vilnius'),
(26, 'Valstybės pažinimo centras', 'Totorių g. 28', 'Vilnius'),
(27, 'Lietuvos geležinkelių muziejus', 'Geležinkelio g. 16', 'Vilnius'),
(28, 'Lietuvos kulinarinio paveldo muziejus', 'Bokšto g. 9', 'Vilnius'),
(29, 'Muitinės muziejus', 'Jeruzalės g. 25', 'Vilnius'),
(30, 'Žaislų muziejus', 'Šiltadaržio g. 2', 'Vilnius'),
(31, 'Trijų kryžių kalnas', 'T. Kosciuškos g.', 'Vilnius'),
(32, 'Subačiaus gatvės apžvalgos aikštelė', 'Subačiaus g.', 'Vilnius'),
(33, 'Liepkalnis', 'Minsko pl. 2', 'Vilnius'),
(35, 'Bernardinų sodas', 'Maironio g.', 'Vilnius'),
(36, 'Botanikos sodas', 'Kairėnų g. 43', 'Vilnius'),
(37, 'Čiunes Sugiharos Sakurų Sodas', 'Upės g.', 'Vilnius'),
(38, 'Europos parkas', '15148', 'Vilniaus raj., Joneikiškių k.'),
(39, 'Kalnų parkas', 'T. Kosciuškos g.', 'Vilnius'),
(40, 'Pavilnių regioninis parkas', '01206', 'Vilnius'),
(41, 'Vingio parkas', 'M. K. Čiurlionio g. 100', 'Vilnius'),
(42, 'TAMSTA', 'A. Strazdelio g. 1', 'Vilnius'),
(43, 'Vilniaus Kongresų rūmai', 'Vilniaus g. 6', 'Vilnius'),
(44, 'Trakų pilis', '21142', 'Trakai'),
(45, 'Menų fabrikas Loftas', 'Švitrigailos g. 29', 'Vilnius');

-- --------------------------------------------------------

--
-- Table structure for table `app_tourist_tourobject`
--

CREATE TABLE `app_tourist_tourobject` (
  `id` int(11) NOT NULL,
  `ticket_price` double NOT NULL,
  `last_update` datetime NOT NULL,
  `link` varchar(200) DEFAULT NULL,
  `extra_info` longtext,
  `place_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `main_photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_tourist_tourobject`
--

INSERT INTO `app_tourist_tourobject` (`id`, `ticket_price`, `last_update`, `link`, `extra_info`, `place_id`, `title`, `main_photo`) VALUES
(1, 0, '2016-11-17 20:27:53', 'http://www.ausrosvartai.lt', 'Aušros Vartai – statinys Vilniuje, vienas svarbiausių istorinių, kultūrinių ir religinių monumentų Vilniuje, pasaulietinio ir religinio turizmo objektas, istorijos ir architektūros paminklas. Dėl Aušros Vartuose įsikūrusioje Aušros Vartų Švč. Mergelės Marijos, Gailestingumo Motinos, koplyčioje laikomo paveikslo, kuris garbinamas kaip stebuklingas, plačiai žinoma ne tik Lietuvoje, bet ir Lenkijoje bei kituose kultūriškai artimuose kraštuose.', 1, 'Aušros Vartai', './1.jpg'),
(2, 0, '2016-11-17 20:31:03', 'http://www.katedra.lt/', 'Švento Stanislovo ir švento Vladislovo arkikatedra bazilika – tai svarbiausia visos šalies katalikų šventovė, didžiųjų krikščioniškų, tautinių ir valstybinių iškilmių vieta. Bazilikos statusas Arkikatedrai suteiktas 1922 metais. „Bazilika“ reiškia „karališka“. Tai aukščiausia bažnyčių kategorija, kurią Romos popiežius suteikia tik ypatingoms bažnyčioms.\r\n\r\nArkikatedros požemiuose buvo laidojami žymūs Lietuvos Didžiosios Kunigaikštystės žmonės: didikai, vyskupai, kunigaikščiai. Karališkajame mauzoliejuje po šventojo Kazimiero koplyčia ilsisi Lietuvos didysis kunigaikštis ir Lenkijos karalius Aleksandras. Tai vienintelis Lenkijos ir Lietuvos valdovas, palaidotas Vilniuje. Arkikatedros požemiuose palaidotas Gedimino anūkas ir galingiausias Lietuvos valdovas Vytautas Didysis bei jo žmona Ona. Taip pat dvi karalienės, Žygimanto Augusto žmonos: Elžbieta Habsburgaitė ir Barbora Radvilaitė, kartais vadinama net gražiausia savo meto Europos moterimi. Arkikatedros mūrai priglaudė ir urną su karaliaus Vladislovo Vazos širdimi.\r\n\r\nPožemiuose išlikę seniausi XIII – XV amžiaus šventyklų mūrai ir seniausia Lietuvos freska, nutapyta XIV amžiuje.', 2, 'Arkikatedra bazilika', './2.JPG'),
(3, 0, '2016-11-17 20:32:54', 'http://www.jonai.lt', 'Viena vaizdingiausių universiteto komplekso dalių yra Šventų Jonų bažnyčia su varpine. Visas bažnyčios pavadinimas – „Švento Jono Krikštytojo ir Švento Jono Apaštalo ir Evangelisto bažnyčia“. Iš čia kilęs sutrumpintas pavadinimas – Šventų Jonų bažnyčia. Šventų Jonų bažnyčios statybos užtruko beveik 40 metų ir baigėsi 1426-aisiais. Anuomet tai buvo gotikinis pastatas. 1571 metais bažnyčia perėjo jėzuitų ordino žinion, ir nuo tada ji laikoma universiteto komplekso dalimi.\r\n\r\nŠventų Jonų bažnyčia yra mačiusi ne tik šventų mišių, bet ir studentų protestų, ir teatro spektaklių, ir karalių sutikimų. Sovietmečiu šie maldos namai buvo paversti sandėliu. Vėliau čia buvo įkurtas Universiteto muziejus.\r\n\r\nŠiandien Šventų Jonų bažnyčia vėl atlieka pagrindinę savo funkciją. 1993 metais joje lankėsi popiežius Jonas Paulius II. Šventų Jonų bažnyčios varpinė yra vienas aukščiausių senamiesčio pastatų. Jos aukštis – 68 metrai. Dabartinį Šventų Jonų bažnyčios fasadą XVIII a. projektavo žymiausias Vilniaus baroko architektas Jonas Kristupas Glaubicas.', 3, 'Šv. Jonų bažnyčia', './3.jpg'),
(4, 0, '2016-11-17 20:33:25', 'http://www.onosbaznycia.lt', 'Šv. Onos bažnyčia yra vienas gražiausių ir, ko gero, garsiausių Vilniaus statinių. Tai vėlyvosios gotikos šedevras. Ją gaubia daug legendų. Žymiausia jų pasakoja, jog Napoleonas pamatęs Šv. Onos bažnyčią norėjo ant delno nusinešti ją į Paryžių. Gaila, bet tikrovė ne tokia romantiška: Napoleono žygio per Lietuvą metu bažnyčia buvo atiduota prancūzų kavalerijos žiniai. Visgi Napoleonas savo laiške žmonai yra paminėjęs, kad „Vilnius – labai gražus miestas“…\r\n\r\nDėl jos autoriaus ir statybos laikotarpio vieningos nuomonės nėra. Ši bažnyčia buvo pastatyta apie 1495–1501 m., po 1564 m. gaisro atstatyta Lvovo arkivyskupo D. Solikovskio ir Radvilų lėšomis. Vėliau bažnyčia ne kartą remontuota, tačiau jos išorė nuo XVI a. pabaigos beveik nepakito. 1580 m. buvo pabaigti pagrindiniai bažnyčios atstatymo darbai, pastatyti altoriai. Vėliau bažnyčia buvo remontuojama ir rekonstruojama kelis kartus. Per penkis šimtmečius beveik nepakitusi Šv. Onos bažnyčia sulaukė mūsų dienų ir tapo vienu iš Vilniaus simbolių. Šalia bažnyčios – XIX amžiuje pastatyta varpinė, imituojanti gotikos stilių.\r\n\r\n1902-1909 m. buvo atlikti ypač didelės apimties bažnyčios restauravimo ir atstatymo darbai.', 4, 'Šv. Onos bažnyčia', './4.jpg'),
(5, 0, '2016-11-17 20:34:49', 'http://www.bernardinuansamblis.lt', 'Šv. Pranciškaus Asyžiečio, arba Bernardinų, bažnyčia yra vienas didžiausių gotikinių sakralinių pastatų. XV a. Vilniuje įsikūrę bernardinai pastatė medinę bažnyčią, kuri vėliau buvo perstatyta į mūrinę. Po to bažnyčia buvo dar keletą kartų atnaujinama. XVII–XVIII a. ji įgijo renesanso ir baroko bruožų. Sovietinės okupacijos metais bažnyčia buvo uždaryta ir perduota Dailės institutui. 1994 m. į ją vėl grįžo Šv. Pranciškaus mažesnieji broliai.\r\n\r\nBažnyčios fasade išsiskiria gotikiniai smailiaarkiai langai ir kontraforsai. Virš jų kyla frontonas su aštuoniakampiais bokšteliais iš šonų ir Nukryžiuotojo freska. Seniausioji bažnyčios dalis – gotikinė presbiterija. Bažnyčią puošia lieknas, aštuoniasienis varpinės bokštas. Labai vertingas yra šios bažnyčios interjeras. Šoninėse navose yra išlikę gotikiniai krištoliniai ir žvaigždiniai skliautai. Navų sienas puošia gotikinės polichrominės freskos, kurios 1981 m. buvo iš dalies atidengtos. Tai spalvingos figūrinės kompozicijos Biblijos ir hagiografinėmis temomis, vietomis su gotikinio šrifto užrašais, augaliniais ornamentais, heraldiniais ženklais. Ši tapyba sukurta XVI a. ir laikoma unikalia.\r\n\r\nBažnyčioje yra vienuolika altorių, visi jie mediniai, vėlyvojo baroko stiliaus, natūralios medžio spalvos. Čia saugoma seniausia žinoma Lietuvoje XV a. Nukryžiuotojo skulptūra, taip pat du vertingi marmuriniai antkapiai: barokinis Petro Veselovskio ir renesansinis Stanislovo Radvilos Pamaldžiojo. Pastarasis – seniausia Lietuvos profesionalioji apvaliosios skulptūros memorialinė kompozicija.', 5, 'Bernardinų bažnyčia', './5.jpg'),
(6, 0, '2016-11-17 20:35:53', 'http://www.kazimiero.lt', 'Bažnyčios statybą 1604 m. pradėjo jėzuitai. Ji buvo skirta šventojo karalaičio Kazimiero atminimui. Pasak legendos, kertinį akmenį iš Antakalnio į miesto centrą rideno 700 žmonių. Šiandien akmenį vis dar galima pamatyti fasado sienoje.\r\n\r\nBažnyčia baigta statyti apie 1616 m., vidus įrengtas 1618 m. Šv. Kazimiero bažnyčia – vienas ankstyviausių baroko statinių mieste. Manoma, kad bažnyčią projektavo Povilas Bokša, o darbus atliko Jonas Frankevičius. Bažnyčia pasižymi tuo, kad XVIII a. vadovaujant Tomui Žebrauskui buvo pastatytas kelių pakopų kupolas su aukštu žibintu, vainikuotu karūna. Tai vienintelis tokio dydžio kupolas visose buvusiose LDK žemėse. 1812 m. bažnyčia buvo smarkiai apgadinta., paversta sandėliu. Po 1830–1831 m. buvo perstatyta į cerkvę. Vėliau čia buvo įrengtas Mikalojaus soboras. Šioje cerkvėje yra meldęsis garsusis rusų rašytojas Fiodoras Dostojevskis. XX a. pirmoje pusėje bažnyčia buvo grąžinta katalikams, bet Antrojo pasaulinio karo metais vėl nukentėjo, buvo uždaryta. 1961 m. čia įrengtas ateizmo muziejus. Bažnyčia grąžinta tikintiesiems 1989 m.', 6, 'Šv. Kazimiero bažnyčia', './6.jpg'),
(7, 0, '2016-11-17 20:36:35', 'http://www.kultura.lt', 'Šv. Kotrynos bažnyčia yra pirmoji šalies nepriklausomybės laikotarpiu kompleksiškai restauruota Vilniaus bažnyčia. Bažnyčia buvo kapitaliai suremontuota, interjere atlikti sudėtingi restauracijos darbai. Visiškai restauruotas centrinis bažnyčios altorius.\r\n\r\n2006 metais Vilniaus miesto savivaldybė Šv. Kotrynos bažnyčios administravimo teises perdavė Vilniaus mokytojų namams. Šv. Kotrynos bažnyčios pagrindinė nava pritaikyta koncertinei veiklai. Puikios akustikos bažnyčioje vyksta kultūros renginiai, repetuoja ir koncertuoja Šv. Kristoforo kamerinis orkestras, choras „Jauna muzika”, berniukų ir jaunuolių choras „Ąžuoliukas” ir kiti meno kolektyvai bei atlikėjai.', 7, 'Šv. Kotrynos bažnyčia', './7.jpg'),
(8, 0, '2016-11-17 20:37:17', 'http://www.mikalojus.lt/', 'Švento Mikalojaus bažnyčia – seniausia išlikusi bažnyčia Lietuvoje. Ji išsaugojo beveik nepakitusius gotikos bruožus. Švento Mikalojaus bažnyčią paskutiniaisiais pagonybės metais pastatė Vilniuje įsikūrusi vokiečių bendruomenė.\r\n\r\nŠvento Mikalojaus gotikinė bažnyčia XVIII ir XIX amžiuje įgijo baroko bruožų. Buvo iškirsti nauji langai, pristatytas bokštas, zakristija, įrengti baroko altoriai, vargonai ir rokokinis vargonų choras.\r\n\r\nNuo 1901-ųjų iki 1939-ųjų metų Švento Mikalojaus bažnyčia buvo vienintelė Vilniuje, kurioje pamaldos vykdavo lietuvių kalba. Taip pat ji buvo ir lietuvių kultūros centras.\r\n\r\nSovietų okupacijos laikais šalia bažnyčios buvo pastatyta skulptoriaus Antano Kmieliausko sukurta Vilniaus globėjo Švento Kristoforo skulptūra. Tai buvo rezistencijos aktas, nes miesto herbą, kuriame vaizduojamas šventas Kristoforas, sovietų režimas buvo uždraudęs.', 8, 'Šv. Mikalojaus bažnyčia', './8.jpg'),
(9, 0, '2016-11-17 20:38:04', 'http://www.pranciskonai.lt/', 'Pranciškonų bažnyčia – vienas seniausių miesto statinių, jo istorija siekia XIV amžių. Bažnyčia yra gotikinė, bet XVIII a. ji įgijo ir baroko formų. 1812 m. bažnyčia buvo apgriauta, joje įrengtas grūdų sandėlis. Vėliau ji buvo paversta archyvu ir tik XX a. pradžioje grąžinta pranciškonams. Tačiau sovietmečiu bažnyčia vėl buvo paversta archyvu. Dabar ji priklauso tikintiesiems ir yra restauruojama. Neseniai joje atidengta stebuklinga laikoma Švč. Mergelės Marijos (Baltosios Dievo Motinos) statula.', 9, 'Pranciškonų bažnyčia', './9.jpg'),
(10, 0, '2016-11-17 20:40:23', 'http://vvsventujuparapija.lt/', 'Bažnyčia statyta 1620–1630 m., ji yra ankstyvojo baroko, vadinamojo karmelitų baroko, stiliaus. Bažnyčios frontone stovėjo dvi medinės polichromuotos pirmųjų Karmelio atsiskyrėlių ir karmelitų vienuolijos pradininkų šv. Elijo bei šv. Eliziejaus statulos. Greta bažnyčios esanti stambi penkių tarpsnių varpinė pastatyta 1743 m. Tais pačiais metais pristatytas dviaukštis priestatas, kurio pirmajame aukšte buvo įrengta zakristija, o antrajame – XVIII a. garsėjusi biblioteka. Po bažnyčios ir vienuolyno uždarymo 1832–1886 m. daugelis meno vertybių buvo išblaškytos.\r\n\r\n1904 m. kunigo L. Čudovskio iniciatyva bažnyčia restauruota. Šios restauracijos metu ypač nukentėjo sieninė tapyba, kurios būta ir bažnyčios rūsiuose. 1991 m. grąžinus bažnyčią tikintiesiems, šventovė atnaujinta, sugrąžinti kai kurie jai priklausę paveikslai. Sovietiniais laikais bažnyčioje buvo liaudies meno muziejus. Dabar ji vėl grąžinta tikintiesiems ir yra atvira lankytojams.', 10, 'Visų šventųjų bažnyčia', './10.jpg'),
(11, 0, '2016-11-17 20:43:04', '', 'Užupyje ant Vilnios šlaito pastatyta nedidelė Šv. Baltramiejaus bažnyčia. Einant arčiau ji tarsi slepiasi, glaudžiasi už namų prie gatvės, vedančios Bernardinų kapinių link.\r\n\r\nTik pastatytą bažnyčią karo su Maskva metais sunaikino gaisras. 1778 m. pagal architekto Martyno Knakfuso projektą vienuoliai pastatė oratoriją, kuri tėvo Augustino Stodolniko rūpesčiu 1823-1824 m. buvo perstatyta į bažnyčią. Ši bažnyčia išliko iki mūsų dienų (1881 m. pristatytas bokštas).\r\n\r\n1949 m. bažnyčia uždaryta. Tarybų valdžios metais čia buvo įrengtos skulptorių dirbtuvės. 1997 m. Šv. Baltramiejaus bažnyčia perduota Vilniaus baltarusių katalikų bendruomenei.', 11, 'Šv. Baltramiejaus bažnyčia', './11.jpg'),
(12, 0, '2016-11-17 20:43:38', 'http://www.svignotas.lt', 'Šv. Ignoto bažnyčia pastatyta 1622-1647 m. Kaip ir kitos jėzuitų bažnyčios Lietuvoje, ji buvo bazilikinė, su kupolu ir dviem bokštais abipus presbiterijos. Bažnyčia nukentėjo per gaisrus ir XVIII a. viduryje buvo rekonstruota vadovaujant architektui T. Žebrauskui. Caro laikais bažnyčia buvo paversta karininkų klubu ir labai apnaikinta. Tikintiesiems grąžinta 1925 m. ir pritaikyta religinėms reikmėms. Sovietinės okupacijos laikais paversta kino studijos sandėliu.\r\n\r\nBažnyčia turi puošnų ankstyvojo baroko formų pagrindinį fasadą.', 12, 'Šv. Ignoto bažnyčia', './12.jpg'),
(13, 5, '2016-11-17 20:46:01', 'http://www.lnm.lt', 'Pilies muziejus buvo atidarytas 1960 m., nuo 1968 m. jis tapo Lietuvos nacionalinio muziejaus padaliniu. Gedimino pilies ekspozicija supažindina su XIV a. II pusės bei XVII a. pradžios Vilniaus pilių rekonstrukciniais maketais, ginkluote, ikonografine senojo Vilniaus medžiaga. Bokšto viršuje įrengta apžvalgos aikštelė, nuo kurios atsiveria nuostabi Vilniaus panorama.\r\n\r\nBilietų kaina: suaugusiems – 5 Eur, moksleiviams, studentams, pensininkams – 2,5 Eur.\r\nNemokamai su Vilnius City Card.', 13, 'Gedimino pilies bokštas', './13.jpg'),
(14, 0, '2016-11-17 20:47:34', '', 'Skulptorius: Antanas Vivulskis. 1916. Atstatymas: Kęstutis Šilgalis. 1989\r\n\r\nAnkstyvuosiuose šaltiniuose Trijų kryžių kalnas dar buvo vadinamas Kreivuoju arba Plikuoju. Kalnas esantis dešinėje Vilnios pusėje prie santakos su Nerimi yra iškilęs 162 m virš jūros lygio.\r\n\r\nManoma, kad ant Trijų kryžių kalno pagonys kadaise nukankino septynis pranciškonus, jie buvo prikalti prie kryžių ir įmesti į upę. Dabar toje vietoje stovi architekto ir skulptoriaus A. Vivulskio pastatytas Trijų kryžių paminklas. 1950 m. sovietų valdžios nugriautas paminklas buvo atstatytas Lietuvoje prasidėjus atgimimui.', 31, 'Trijų kryžių kalnas', './14.jpg'),
(15, 2.5, '2016-11-17 20:48:25', 'http://www.muziejus.vu.lt', 'Pavasarį ir rudenį: kasa 10.00 – 18.30\r\nVasarą: kasa 11.00 – 19.30\r\n\r\nŠv. Jonų bažnyčios varpinė lauks lankytojų nuo 2016 m. balandžio 18 d.\r\n\r\nSvarbi Vilniaus universiteto architektūrinio ansamblio dalis yra Šv. Jonų bažnyčios varpinė, kuri buvo statyta 1600-1610 m. ir pasižymi renesanso bei vėlyvojo baroko architektūra.\r\n\r\nŠiltuoju metų laiku sostinės panorama galima grožėtis nuo aukščiausio senamiesčio pastato – Šv. Jonų bažnyčios varpinės. Istorinėje varpinėje veikia modernus liftas ir lankytojai nevargindami kojų gali užkilti į 45 m aukštyje įrengtą apžvalgos aikštelę. Iš čia užkopus autentiškais mediniais laiptais į baliustradas senamiesčiu ir neaprėpiamais Vilniaus toliais galima gėrėtis tarsi iš paukščio skrydžio.\r\n\r\nLankytojus domina ir Fuko švytuoklė, kuri demonstruoja Žemės sukimosi aplink savo ašį efektą. Švytuoklės įtvirtinimo lizdas įrengtas varpinės bokšto antrajame aukšte. Nuo specialios pakylos galima stebėti, kaip švytuoja švytuoklė, kaip juda ratu ant plono lyno virš marmurinio ciferblato pagrindo pakabintas keliasdešimties kilogramų rutulys. Per dieną siūbuodamas rutulys keičia savo padėtį ir tai įrodo, kad Žemė sukasi aplink savo ašį.', 3, 'Šv. Jonų varpinė', './15.jpg'),
(16, 4.5, '2016-11-17 20:52:19', 'http://www.bpmuziejus.lt', 'Suaugusiems – 4,50 Eur; moksleiviams, studentams, pensininkams – 2,50 Eur\r\nNemokamai su Vilnius City Card\r\n\r\nIš varpinės – vieno seniausių ir aukščiausių senamiesčio bokštų – atsiveria graži panorama. Vilniečiai ir miesto svečiai gali apžiūrėti varpų ekspoziciją, senąjį miesto laikrodį, patyrinėti istorines varpinės ir katedros vaizdų rekonstrukcijas. Komiksų mėgėjai gali susipažinti su Vilniaus įkūrimo legenda žaisdami edukacinį kompiuterinį žaidimą „Gedimino sapnas“. Virtuali kelionė „Vilniaus panorama: pamatyk, priartink, įsiamžink!“ pro viršutiniame varpinės aukšte įmontuotas vaizdo stebėjimo kameras padės lankytojams susipažinti su miesto panorama ir žymiais architektūros paminklais.\r\n\r\nBažnytinio paveldo muziejus varpinėje organizuoja ekskursijas, edukacines programas, šviečiamojo pobūdžio renginius. Čia dirba Vilniaus katedros požemių administracija.\r\n\r\nGegužės–rugsėjo mėnesiais varpinė bus atvira lankytojams darbo dienomis ir šeštadieniais nuo 10 iki 19 val., šaltuoju metų laiku – viena valanda trumpiau.', 15, 'Vilniaus katedros varpinė', './16.jpg'),
(17, 6, '2016-11-17 20:53:33', 'http://www.tvbokstas.lt', 'Įėjimas (nepasikeliant į restoraną „Paukščių takas“) – nemokamas. Suaugusiems – 6 Eur; moksleiviams, neįgaliems asmenims – 2,60 Eur; vaikams iki 5 metų – nemokamai\r\n\r\nVilniaus TV bokštas yra aukščiausias statinys šalyje ir teisėtai užima garbingą vietą tarp aukščiausių pasaulio televizijos bokštų. Pagal aukštį jis yra 8-as Europoje ir 26-as pasaulyje. Aukštis – 326,5 metrai. Besisukanti apžvalgos aikštelė įkurta 165 m aukštyje esančioje TV bokšto žiedinėje dalyje – 19-ame bokšto aukšte (55-ame aukšte lyginant su daugiabučiais pastatais). Esant giedram orui Vilniaus miestas ir jo apylinkės pro restorano langus matomos net 50 km spinduliu.\r\n\r\nTV bokšte įrengta Sausio 13-osios muziejinė ekspozicija – Laisvės kovų muziejus, 2 konferencijų ir pobūvių salės, restoranas „Paukščių takas”.', 20, 'Televizijos bokštas', './17.jpg'),
(18, 0, '2016-11-17 20:56:21', '', 'Netoli nuo Subačiaus ir Markučių g. sankryžos yra specialiai įrengta apžvalgos vieta, iš kurios atsiveria Vilniaus senamiesčio panorama. Apžvalgos vietoje įrengta informacinė lenta parodo, kokie senamiesčio kultūros, istorijos, architektūros objektai yra matomi.\r\n\r\nNetoliese veikia kavinė (šiltojo sezono metu).', 32, 'Subačiaus gatvės apžvalgos aikštelė', './18.jpg'),
(19, 0, '2016-11-17 20:57:29', 'http://www.liepkalnis.lt', 'Liepkalnis labiausiai žinomas žiemą kaip slidinėjimo centras. Žiemą čia veikia slidinėjimo trasa.\r\n\r\nLiepkalnyje esantis Laimio kalnas įrašytas į Lietuvos rekordų knygą. 235 metrų aukščio Laimio kalnas – aukščiausia vieta sostinėje. Nuo jos matyti žaliosios miesto zonos, sodai, namai, ir tolumoje – senamiestis.\r\n\r\n1982 m. kalnų slidinėjimo entuziastas Laimis Janutėnas sumanė čia įkurti slidinėjimo trasą, jo iniciatyva buvo sutvarkytas kalnas ir paaukšintas apie 16 metrų. Ant kalno yra akmuo su užrašu “Laimio kalnas”.', 33, 'Liepkalnis', './19.jpg'),
(20, 0, '2016-11-17 20:58:59', '', 'Pačiame Vilniaus centre, tarp Gedimino pilies kalno, Vilnelės ir Bernardinų vienuolyno įsikūręs Bernardinų sodas (anksčiau vadintas Sereikiškių parku). Po ilgiau nei metus trukusios rekonstrukcijos 2013 m. parke atkurta autentiška XIX amžiaus aplinka pagal dailininko Vladislovo Štrauso projektą.\r\n\r\nParkas atgavo istorinį Bernardinų sodo pavadinimą, nes, istorikų teigimu, kelis šimtmečius didžiojoje dalyje šios teritorijos buvo įrengtas būtent bernardinams priklausęs sodas. Jam atminti sukurta vienuolių sodo ekspozicija su vaistiniais, prieskoniniais, maistiniais ir arbatiniais augalais. Parke galima apžiūrėti atkurtus senuosius parko elementus: alpinariumą, tvenkinį, Belvederio kalnelį, centrinę aikštę, pasivaikščioti takais palei Vilnelę, pasigrožėti istorinėse vietose įrengtais fontanais, kurių vienas yra muzikinis. Parke taip pat yra rožynas, vaikų žaidimo aikštelės.\r\n\r\nYpatinga parko erdvė – Botanikos ekspozicija, skirta įamžinti XVIII a. čia buvusį vieną didžiausių Rytų Europoje Botanikos sodų. Ekspozicijoje pamatysite ginkmedį, geltonąją sedulą, kanadinę pocugę, juodąją pušį, tris vienus seniausių Vilniuje ąžuolus. Beje, šalia įėjimo nuo šv.Brunono gatvės auga seniausias Vilniaus ąžuolas, kurio amžius siekia 400 šimtus metų.', 36, 'Bernardinų sodas', './20.jpg'),
(21, 3, '2016-11-17 20:59:45', 'http://www.botanikos-sodas.vu.lt', 'Suaugusiam – 3 Eur, studentui, moksleiviui, pensininkui, neįgaliam asmeniui – 1,5 Eur, šeimai (2 suaugę + vaikai) – 7 Eur\r\nNemokamai su Vilnius City Card\r\n\r\nVU Botanikos sodas yra ne tik didžiausias Lietuvoje (bendras plotas 199 ha), bet ir turtingiausias augalų kolekcijomis: čia auginama apie 9 000 pavadinimų augalų, priklausančių 886 gentims, o gausiausios ir įspūdingiausios kolekcijos – tai rododendrų, alyvų, lianų, bijūnų, jurginų ir svogūninių gėlių. VU Botanikos sodas įdomus ir kaip paveldo objektas – Kairėnuose išlikusi ir lankytojams pritaikyta ūkinė seno dvaro dalis ir senasis parkas su tvenkiniais. Sode vyksta įvairūs kultūriniai renginiai (koncertai, meno parodos). Galima pajodinėti ar pasivažinėti karietomis.', 36, 'Botanikos sodas', './21.jpg'),
(22, 0, '2016-11-17 21:01:22', '', 'Sakurų sodas Vilniuje įkurtas 2001 m. minint Japonijos diplomato Čijunės Sugiharos, rezidavusio Kaune ir karo metais išsaugojusio maždaug 10 tūkst. Lietuvos, Lenkijos ir Vokietijos žydų gyvybių, 100-osios gimimo metinės. Kasmet vis pasodinama daugiau medelių. Dabar sakurų sode prie Neries jų daugiau kaip 100. Sode auga šalčiui atspari sibirinė sakura. Ji ne tik gausiai žydi, bet ir rudenį jos lapeliai paraudonuoja.', 37, 'Čiunes Sugiharos Sakurų Sodas', './22.jpg'),
(23, 8, '2016-11-17 21:03:18', 'http://www.europosparkas.lt', 'Dirba iki saulėlydžio, dėl to darbo laiko pabaiga nėra tiksli.\r\n\r\nSuaugusiems – 8 Eur, studentams – 6 Eur, moksleiviams su grupe – 4 Eur, vaikams – 2,30 Eur\r\nNuolaida su Vilnius City Card\r\n\r\nNuvykę apie 19 kilometrų nuo Vilniaus centro galite rasti vieną įspūdingiausių šiuolaikinio meno muziejų, kur susilieja menas ir gamta. Europos parkas įkurtas 1991 m., siekiant meno kalba įprasminti geografinį Europos centrą. Čia eksponuojama apie 100 įvairių pasaulio menininkų skulptūrų. Tarp jų yra tokių pripažintų kūrėjų kaip Dennisas Oppenheimas, Magdalena Abakanowicz, Solas Le Wittas darbų.\r\n\r\nParke galite pamatyti didžiausią skulptūrą iš televizorių, sukurtą Gintaro Karoso, užfiksuotą „Guinness“ rekordų agentūros bei daug kitų išradingų meno kūrinių, eksponuojamų po atviru dangumi. Čia taip pat veikia muziejaus restoranas, suvenyrų parduotuvė, unikalus paštas, yra galimybė išsinuomoti dviračius.', 38, 'Europos parkas', './23.jpg'),
(24, 0, '2016-11-17 21:04:38', '', 'Kalnų parką patogiausia aplankyti iš T. Kosciuškos gatvės pusės; iš čia užkopus į kalną, patenkama į estradą. Vasarą joje vyksta įvairūs koncertai, šventės. Parko teritorija ribojasi su Užupiu (Krivių g.) ir Vilnele. Kalnų parką sudaro keli kalnai. Žymiausias iš jų – Trijų kryžių kalnas.\r\n\r\nManoma, kad ant Trijų kryžių kalno pagonys kadaise nukankino septynis pranciškonus, jie buvo prikalti prie kryžių ir įmesti į upę. Dabar toje vietoje stovi architekto ir skulptoriaus A. Vivulskio pastatytas Trijų kryžių paminklas. 1950 m. sovietų valdžios nugriautas paminklas buvo atstatytas Lietuvoje prasidėjus atgimimui.\r\n\r\nTrijų kryžių kalnas kartais dar vadinamas Plikuoju, Kreivuoju (manoma, kad čia stovėjo Kreivoji pilis) ar Tauro kalnu.\r\n\r\nStalo kalnas pavadinimą gavo dėl savo formos – viršūnėje jis lygus kaip stalas.\r\n\r\nGedimino kapo kalnas – žymi kunigaikščio palaidojimo vietą. Ant kalno susirenka ne tik norintieji pasigrožėti atsiveriančia miesto panorama, bet ir baltų religinių bendruomenių nariai, kurie švenčia savo šventes prie pagoniško aukuro.\r\n\r\nBekešo kalnas vardą gavo nuo to, kad ant jo 1580 m. buvo palaidotas vienas žymiausių to meto Lietuvos ir Lenkijos valstybės karo vadų Kasparas Bekešas, kilęs iš garsios vengrų didikų giminės. Jį čia laidojo dėl to, kad velionis buvo arijonų tikėjimo ir jo palaikų į katalikų kapines nepriėmė. XIX a. viduryje paminklas kartu su K. Bekešo kapu nuvirto į Vilnią.', 39, 'Kalnų parkas', './24.jpg'),
(25, 0, '2016-11-17 21:05:29', 'http://www.pavilniai-verkiai.lt', 'Pavilnių regioninio parko širdis – Vilnios slėnis. Pūčkorių atodanga – tai unikalus geologinis paminklas. Jau 17 a. priešais atodangą buvo didelė, gerai įrengta ginklų gamykla. Šalia galite aplankyti buvusio vandens malūno teritoriją, kur šiuo metu čia veikia restoranų ir pramogų tinklas „Belmontas“,  šalia teka Belmonto kriokliai. Mėgstantys aktyvų poilsį gali apsilankyti žirgyne, pasivažinėti keturračiais motociklais.\r\n\r\nŠalia Pūčkorių atodangos, jaukioje Vilnios pakrantėje stovi saulės laikrodis. Norintys laiką praleisti gamtoje, pažvejoti renkasi prie Vilnios Saulės laikrodžio ekspozicijos ar prie Pūčkorių užtvankos. Lankytojams čia įrengtas pažintinis-istorinis takas, nusidriekiantis palei Vilnelę nuo Pūčkorių užtvankos. Pavasarį ir rudenį parko direkcija kviečia į pažintinius pėsčiųjų žygius.\r\n\r\nBūdami Pavilnių regioniniame parke galite aplankyti ir Ribiškių labirintą. Nuo Liepkalnio kalno, esančio greta Minsko plento, atsiveria nuostabu vaizdas. Liepkalnio kalnas žiemos metu ypač mėgstamas slidininkų.', 40, 'Pavilnių regioninis parkas', './25.jpg'),
(26, 0, '2016-11-17 21:07:37', 'http://www.vilniausparkai.lt', 'Neries upės vingyje 160 hektarų plote įsikūręs Vingio parkas. XV – XVI a. jis priklausė Radviloms, vėliau – vyskupui Ignui Masalskiui, dar vėliau – Vilniaus generalgubernatoriui Leontijui Beningsenui, kuris pasistatė pušyne puošnius vasaros rūmus. 1919 m. atgimus Vilniaus universitetui, buvusio dvaro rūmuose Vingio parke buvo įkurtas Botanikos sodas. XX a. viduryje sodą nuniokojo potvynis ir karas. Didžioji atkuriamo sodo dalis buvo perkelta į kitą vietą.\r\n\r\nVingio parke įrengti du įėjimai iš M. K. Čiurlionio ir iš Birutės gatvės. Netoli nuo įėjimo į Vingio parką iš M. K. Čiurlionio gatvės pusės stovi klasicistinė koplyčia, o šalia jos yra vokiečių karių kapai.\r\n\r\nVingio parkas – mėgstama vilniečių pasivaikščiojimų, pasivažinėjimų dviračiais ar riedučiais vieta. Parką pamėgę ne tik sportininkai. Parko centre esančioje estradoje vyksta įvairūs koncertai, renginiai, šventės. 1988 m. stadione prie estrados vyko Sąjūdžio mitingai, o 1993 m. popiežius Jonas Paulius II laikė mišias.\r\n\r\nVasaros metu parkas pagyvėja, jo centre veikia vaikams skirti atrakcionai, kelios kavinės, sportinio inventoriaus nuomos punktas ir nedidelis zoologijos sodas', 41, 'Vingio parkas', './26.jpg'),
(27, 3, '2016-11-17 21:10:25', 'http://www.valdovurumai.lt', 'Suaugusiems – 3 Eur, moksleiviams, studentams, pensininkams – 1,50 Eur\r\nNemokamai su Vilnius City Card\r\n\r\nŠioje istorinėje vietoje IV–VIII a. buvo medinė gyvenvietė, XIII a. II p. dalis gyvenvietės virto mūro pilimi. XIV a. I p. ji tapo svarbiausiu statiniu mūro siena juosiamoje didelėje Vilniaus Žemutinės pilies teritorijoje. Nuo pirmųjų Gediminaičių laikų čia rezidavo beveik visi Lietuvos valdovai. Jie ne kartą plėtė mūro pilį, o XV a. pab. pradėjo jos esminę rekonstrukciją. Iš pradžių turėjusi gotikos bruožų, XVI a. reprezentacinė Lietuvos didžiųjų kunigaikščių rezidencija tapo ištaigingais renesansiniais rūmais. XVII a. I p. jie įgijo ir ankstyvojo baroko požymių. Vilnius tuo metu buvo vienu iš didžiausių Vidurio Rytų Europos centrų. XVII a. vid. okupantai rūmus nuniokojo, o XVIII a. pab. – XIX a. pr. ir visiškai sugriovė.\r\n\r\n2000 m. Lietuvos Respublikos seimas priėmė įstatymą dėl Valdovų rūmų atkūrimo ir paskirties. Po dvejų metų pradėti statybos darbai. 2013 m.  du iš keturių Valdovų rūmų korpusų atverti lankytojams,  juose įsikūrė nuo 2009 m. veikiantis Nacionalinis muziejus – Lietuvos Didžiosios Kunigaikštystės valdovų rūmai.', 14, 'LDK Valdovų rūmai', './27.jpg'),
(28, 2, '2016-11-17 21:11:55', 'http://www.lnm.lt', 'Suaugusiems – 2 Eur, moksleiviams, studentams, pensininkams – 1 Eur\r\nNemokamai su Vilnius City Card\r\n\r\nLietuvos nacionalinis muziejus – didžiausia šalyje Lietuvos istorinio kultūros paveldo saugykla. Tai seniausias muziejus Lietuvoje. Jo ištakos – 1855 m. įkurtas Senienų muziejus Vilniuje. Ekspozicijoje autentiškais eksponatais atspindėta Lietuvos istorija, pristatoma tradicinė lietuvių kultūra, papročiai.\r\n\r\nMuziejaus ekspozicijoje autentiškais eksponatais atspindėta Lietuvos istorija, pristatoma tradicinė lietuvių kultūra, papročiai. Netoliese yra įsikūręs Senasis arsenalas. Iš šio muziejaus uždarojo kiemo keltuvas kelia į Gedimino kalną. Šalia muziejaus – didingas paminklas Mindaugui. Mindaugas – pirmas visos Lietuvos didysis kunigaikštis ir pirmas bei vienintelis Lietuvos karalius. Karūnuotas 1253-iais metais. Mindaugas sujungė Lietuvos žemes į vieningą valstybę ir iškovojo Lietuvai tarptautinį pripažinimą.', 16, 'Lietuvos nacionalinis muziejus, Naujasis arsenalas', './28.jpg'),
(29, 2, '2016-11-17 21:13:04', 'http://www.lnm.lt', 'Suaugusiems – 2 Eur, moksleiviams, studentams, pensininkams – 1 Eur\r\nNemokamai su Vilnius City Card\r\n\r\nNuo kovo 17 dienos iki gegužės 7 d. Nacionalinio muziejaus senasis arsenalas uždaromas remontui.\r\nLIETUVOS PROISTORĖS EKSPOZICIJA\r\n\r\nArcheologiniai radiniai nuo pirmųjų žmonių pasirodymo Lietuvos teritorijoje XI tūkst. pr. Kristų iki valstybės susidarymo XIII a. Muziejus atviras visiems norintiems labiau pažinti ir suprasti Lietuvos archeologiją, istoriją ir etninę kultūrą arba tiesiog pasigrožėti lietuvių protėvių dirbiniais.\r\n\r\nMuziejuje pristatoma Lietuvos proistorė: nuo pirmųjų gyventojų pasirodymo dabartinėje šalies teritorijoje iki valstybės susikūrimo. Ekspozicijose – pirmųjų Lietuvos gyventojų darbo ir buities įrankiai; baltų kultūros formavimosi istorija.', 17, 'Lietuvos nacionalinis muziejus, Senasis arsenalas', './29.jpg'),
(30, 10, '2016-11-17 21:14:47', 'http://www.lnm.lt', 'Nemokamai su Vilnius City Card\r\n\r\nSignatarų namai – istorijos ir architektūros paminklas, kuriame 1918 m. vasario 16 d. buvo pasirašytas Nepriklausomos Lietuvos valstybės atkūrimo Aktas.\r\n\r\nPo trečiojo Lenkijos ir Lietuvos valstybės padalijimo 1795 m. visa Lietuva, išskyrus Užnemunę, atiteko carinei Rusijai. Lietuvos vardas išnyko iš pasaulio žemėlapio. Kelias į nepriklausomybę – ilga 123 metų kova dėl lietuviško rašto, dėl lietuviškų pamaldų bažnyčioje, dėl teisės mokytis ir kalbėti gimtąja kalba, dėl teisės naudotis tautine simbolika, būti nepriklausoma tauta.\r\n\r\nSignatarų namų ekspozicija – XX a. pradžios tautinio atgimimo ir modernios Lietuvos valstybės atkūrimo istorija (1904–1918 m.) – prasideda pasakojimu apie vykusį tautinį atgimimą Vilniuje, ir tolesnę lietuvių tautos nuoseklią kultūrinę ir politinę veiklą, kuri atvedė į nepriklausomybės paskelbimą 1918 m. vasario 16 d.\r\n\r\nKaizerinės Vokietijos okupacijos (1915-1918 m.) sąlygomis paskelbtas Lietuvos Nepriklausomybės Aktas – konceptualus, lakoniškas 122 žodžių dokumentas, kuris vėliau, visus okupacijų metus, žadino nepriklausomybės viltį, kuris niekada nebuvo nustojęs teisinės galios ir buvo Lietuvos Valstybės konstitucinis pamatas, atkuriant 1990 m. Lietuvos nepriklausomybę.', 18, 'Signatarų namai', './30.jpg'),
(31, 1.8, '2016-11-17 21:16:13', 'http://www.ldm.lt/TDM/Index.htm', 'Suaugusiam – 1,80 Eur, moksleiviui, studentui, pensininkui – 0,90 Eur\r\nNemokamai su Vilnius City Card\r\n\r\nTaikomosios dailės muziejus įkurtas 1987 m., atstatytame Vilniaus Žemutinės pilies Senajame arsenale. Jis pastatytas ant XII–XIV a. medinių pastatų, grindinių ir Žemutinės pilies gynybinių sienų liekanų. Arsenalo rūsyje įrengta ekspozicija – čia galima pamatyti išlikusių ankstyvųjų Vilniaus miesto kultūrinių sluoksnių fragmentų. Šiuo metu muziejuje eksponuojama lietuvių liaudies sakralinio meno dirbinių, sakralinės dailės kūrinių, sentikių, stačiatikių ir unitų ikonų bei metalo dirbinių. Taikomosios dailės muziejuje taip pat veikia ilgalaikė paroda „Lietuvos didžiosios kunigaikštystės valdovų rūmų radiniai“.', 19, 'Taikomosios dailės ir dizaino muziejus', './31.jpg'),
(32, 1.8, '2016-11-17 21:17:48', 'http://www.ndg.lt', 'Suaugusiam – 1,80 Eur, moksleiviui, studentui – 0,90 Eur, vaikams iki 7 metų nemokamai\r\nNemokamai su Vilnius City Card\r\n\r\nNacionalinė dailės galerija – šiuolaikiškas daugiafunkcinis meno ir kultūros centras, siekiantis dialogo su visuomene. Čia žiūrovai susipažįsta su nuolatine ekspozicija (pristanti XX–XXI a. modernią ir šiuolaikinę Lietuvos tapybą, skulptūrą, grafiką, fotografiją, objektus, instaliacijas, videomeną), keičiamomis parodomis, dalyvauja kultūros renginiuose, paskaitose ir edukacinėse programose. Čia veikia ir didžiausias Lietuvoje informacijos apie XX–XXI a. Lietuvos dailininkus archyvas bei biblioteka-skaitykla.', 21, 'Nacionalinė dailės galerija', './32.jpg'),
(33, 2, '2016-11-17 21:20:17', 'http://www.pinigumuziejus.lt', 'Muziejus veiklą pradėjo prieš 16 metų, o 2010 m. pabaigoje atvėrė duris Gedimino prospekto ir Totorių gatvės sankirtoje. Čia, per du aukštus išsidėsčiusiose penkiose salėse, lankytojai gali susipažinti su pasaulio pinigų ir bankininkystės istorija, Lietuvos pinigais, bankininkystės raida mūsų šalyje nuo pirmųjų kredito įstaigų atsiradimo iki šių dienų. Ekspozicijose gausu interaktyvių mokomųjų priemonių, teminių filmų, žaidimų.', 22, 'Pinigų muziejus', './33.jpg'),
(34, 3, '2016-11-17 21:20:58', 'http://www.emuziejus.lt', 'Pirmoji Vilniaus centrinė elektrinė šiandien labiau nei bet kada traukia praeivių žvilgsnius ir griauna nusistovėjusius tradicinio muziejaus stereotipus. 2003-aisiais atsidaręs muziejus užėmė vos 17% šio industrinio paveldo objekto patalpų, tačiau po 2008 m. rudenį užbaigtos rekonstrukcijos, kurią rėmė ES struktūriniai fondai, muziejaus erdvės išsiplėtė nuo 800 m² iki 5000 m². Kartu su plotu išaugo ekspozicijų skaičius bei pakito tematika – muziejus savo turiniu tapo didžiausiu technikos muziejumi Lietuvoje.\r\n\r\nIšplėsta energetikos ekspozicija lankytojams leidžia susipažinti su autentiška dar neseniai veikusios elektrinės įranga, o pasivaikščiojimas tarp garo katilų, turbinų, generatorių, kondensatorių ir sudėtingų vamzdynų – pajusti tokio pobūdžio industrinių objektų dvasią. Ant muziejaus stogo veikianti vėjo ir saulės jėgainė pristato visuomenei kasdien vis aktualesnę alternatyviąją energetiką. Energetikos ekspoziciją papildo informaciniai terminalai bei veikiantys Kruonio hidroakumuliacinės ir Ignalinos atominės elektrinių maketai.', 23, 'Energetikos ir technikos muziejus', './34.jpg'),
(35, 0, '2016-11-17 21:22:05', 'http://www.muziejai.lt/vilnius/karo_technikos.htm', 'Vytauto Didžiojo karo muziejaus Karo technikos ir transporto Vilniaus skyriaus ekspozicija atidaryta 2008 m. lapkričio 4 d. Šiuo metu lankytojai gali išvysti per šimtą Lietuvos kariuomenės technikos pavyzdžių, atspindinčių laikotarpį nuo 1990 metų iki šių dienų.\r\n\r\nEksponuojami pirmieji karinių jūrų pajėgų kateriai „Vytis“ ir „Kiras“, karo laivų ginkluotė, torpedų paleidimo aparatai, Lietuvos kariuomenės motociklai, įvairi ratinė ir vikšrinė technika: šarvuočiai, automobiliai „Dodge“, mažieji visureigiai, benzinvežiai, tankai T-55 ir T-72, kuriuos 2006 metais muziejui padovanojo Lenkijos gynybos ministerija. Tankai T-72 buvo naudojami 1991-ųjų sausį šturmuojant Vilniaus televizijos bokštą. Šalia grėsmingos karinės technikos yra ir šarvuotas „Mercedes-Benz“ markės automobilis, kuriuo važinėjo pirmasis atkurtos valstybės ginkluotųjų pajėgų vadas, Vyriausybės, kuriai tuo metu vadovavo Gediminas Vagnorius. Kai kariuomenės vadovybės įsakymu pasenusi technika yra nurašoma ar keičiama nauja, po du kiekvieno tipo technikos egzempliorius patenka į šį muziejaus skyrių.\r\n\r\nLankytojams apie eksponatus suteikiama išsami informacija. Beveik kiekvienas eksponatas yra trumpai aprašytas: kur buvo gaminamas, kiek vienetų pagaminta, iš kur atkeliavo į Lietuvą. Muziejaus darbuotojai lankytojams eksponatus leidžia liesti rankomis, o į kai kuriuos netgi įlipti. Ekspozicija nuolat papildoma. Teritorija Olandų gatvėje kariškiams priklauso nuo XVIII a. pabaigos. Iš pradžių čia buvo parako ir ginklų saugykla. 1832 m. pastatai buvo perduoti Vilniaus tvirtovei. Tarpukariu iki 1939 m. jie priklausė Lenkijos sandėlių tarnybai, o atgavus Vilnių čia įsikūrė Lietuvos kariuomenės šarvuočių ir autorinktinė. Sovietmečiu teritorijoje šeimininkavo sovietų armija, o jai išėjus įsikūrė Krašto apsaugos savanorių pajėgų Didžiosios kovos apygardos 8-oji rinktinė.', 24, 'Karo technikos ir transporto muziejus', './35.jpg'),
(36, 4, '2016-11-17 21:23:19', 'http://www.lnm.lt', 'Suaugusiems – 4 Eur, moksleiviams, studentams, pensininkams – 2 Eur\r\nNemokamai su Vilnius City Card\r\n\r\nTai Vilniaus gynybinės sistemos dalis, neretai dar vadinama „barbakanu“. Bastėja – originalios konstrukcijos Renesanso epochos gynybinės architektūros statinys. Jį sudaro bokštas, įrengtas miesto gynybinėje sienoje, požeminės patrankų patalpos ir jas jungiantis koridorius, virstantis 48 metrų ilgio tuneliu. Bastėją XVII a. pirmojoje pusėje pastatė karo inžinierius, vokietis Fridrichas Getkantas. Šis statinys smarkiai nukentėjo per XVII a. vidurio karus su Maskva. Pirmojo ir Antrojo pasaulinių karų metu čia buvo įkurti vokiečių kariuomenės ginklų sandėliai. Nuo Bastėjos terasos atsiveria puikus vaizdas į Vilniaus senamiestį.', 25, 'Vilniaus gynybinės sienos bastėja', './36.jpg'),
(37, 0, '2016-11-17 21:25:36', 'http://pazinkvalstybe.lt', 'Tai pirmas Lietuvoje modernus edukacinis centras detaliai pristatantis, kaip veikia valstybė ir kaip demokratinės valstybės kūrime ir valdyme dalyvauja svarbiausias jos elementas – pilietis. Šiuo metu tai bene interaktyviausias muziejus Lietuvoje. Visos ekspozicijos konstravimo principas paremtas grįžtamuoju ryšiu. Centro lankytojai yra ne tik supažindinami su pateikiama informacija, bet ir kviečiami tapti ekspozicijos bendraautoriais ir centro kūrėjais.\r\n\r\nEkspozicijoje pasitelkiamos įvairios tiek taktilinės (liečiamos), tiek skaitmeninių technologijų, taip pat ir „papildytos realybės“ (augmented reality) priemonės. Turinio pristatymui sukurtas interaktyvusis vedlys, papildantis tradicinius eksponavimo būdus ir išplečiantis eksponuojamo turinio prieinamumą ir įtaigumą.\r\n\r\nEkspozicijoje galima išklausyti staiga atgyjančio istoriko komentarų ar apžiūrėti atgijusį balsuoti už Sąjūdžio kandidatus agitavusį plakatais išklijuotą žiguliuką. Google maps pagalba lankytojas gali apkeliauti visą Lietuvą ir pažymėti jam gražiausią šalies vietą bei palikti savo komentarą, kurti per pastaruosius 100 metų gimusių aktyvių prie valstybės kūrimo prisidėjusių žmonių gimtinių žemėlapį, susikurti savo šeimos, bendruomenės ar klasės herbą ir t.t. Šiuolaikinės technologijos padės susipažinti su hipotetine prezidento diena ar giliau suprasti Prezidento rūmų istoriją, taktilinių priemonių pagalba kiekvienas lankytojas galės pamėginti subalansuoti valstybės biudžetą.', 26, 'Valstybės pažinimo centras', './37.jpg'),
(38, 1.5, '2016-11-17 21:26:27', 'http://www.litrail.lt/muziejus-veikla', 'Suaugusiems – 1,5 Eur; moksleiviams, studentams, pensininkams, geležinkelininkams – 0,8 Eur.\r\nNemokamai su Vilnius City Card\r\n\r\nGeležinkelių muziejus kviečia apsilankyti visus, norinčius susipažinti su Lietuvos geležinkelių istorija ir dabartimi.\r\n\r\nGeležinkelių muziejus savo metus skaičiuoja nuo1966 m. Muziejus įsikūręs istoriniuose 19 a. pastatytuose Vilniaus geležinkelio stoties keleivių rūmuose. Muziejaus salėse rasite autentiškų eksponatų ir modelių, o žaismingai riedantys mažučiai traukinukai vaikams suteiks daug džiaugsmo.\r\n\r\nLankytojų grupėms rengiamos ekskursijos. Geležinkelių muziejus taip pat kviečia apsilankyti lauko ekspozicijoje!\r\n\r\nMuziejuje prekiaujama knygomis bei suvenyrais su Lietuvos geležinkelių simbolika.', 27, 'Lietuvos geležinkelių muziejus', './38.jpg'),
(39, 4, '2016-11-17 21:27:35', 'http://www.culinarymuseumvilnius.eu', 'Lietuvos kulinarinio paveldo muziejus – pirmasis tokio tipo muziejus Lietuvos Respublikoje ir kaimyninėse šalyse. Šiuo metu muziejaus patalpose Vilniaus senamiestyje eksponuojami Lietuvos meninkų darbai bei meno galerija.\r\nKPM kviečia pasižiūrėti meno kūrinių, baldų, ypač vertingų lėkščių, sriubinių, padažinių, pasidabruotų indų bei kulinarinių knygų ekspozicijų, kurių didelė dalis mena XVIII-XX amžius.\r\n\r\nEkskursijos rengiamos I-V 13:00 – 15:00 iš anksto susitarus telefonu.', 28, 'Lietuvos kulinarinio paveldo muziejus', './39.png'),
(40, 0, '2016-11-17 21:28:19', 'http://www.cust.lt/web/guest/apiemus/muziejus', 'Muziejuje kaupiama ir saugoma istorinė, dokumentinė ir kita medžiaga, susijusi su muitinės istorija. Muziejuje veikia keturios ekspozicijos.\r\n\r\nPirmojoje iš jų galima susipažinti su muitinės istorija Lietuvos Didžiosios Kunigaikštystės ir Rusijos imperijos laikotarpiais bei 1918 m. atkūrus nepriklausomą Lietuvos valstybę.\r\n\r\nAntroji ekspozicija apima laikotarpį nuo 1940 m. birželio mėnesio, kai Sovietų valstybės kariuomenei okupavus Lietuvą jos muitinės veikla buvo nutraukta. Po Antrojo pasaulinio karo Sovietų valstybės okupacinis periodas truko iki 1990 m. Tada Lietuvos valstybės teritorijoje veikė sovietinės muitinės.\r\n\r\nTrečioji ekspozicija pasakoja apie muitinės veiklą po 1990 m. kovo 11 d. Lietuvos nepriklausomybės atkūrimo ir po 2004 m. gegužės 1 d. Lietuvos įstojimo į Europos Sąjungą. Lankytojai gali pamatyti peršautą Lietuvos Respublikos vėliavą, kabojusią Lavoriškių poste, pirmąsias Lietuvos pareigūnų – Savanorių krašto apsaugos tarnybos, muitinės, pasienio policijos, dabartinę muitininko ir mobiliosios grupės specialiąją uniformas, dabartinio Lietuvos pasienio stulpo kopiją, plombas ir plombavimo priemones.\r\n\r\nKetvirtojoje ekspozicijoje galima pasigrožėti iš daugelio pasaulio šalių įvairiomis progomis gautais įdomiais suvenyrais ir dovanomis.', 29, 'Muitinės muziejus', './40.jpg'),
(41, 4, '2016-11-17 21:29:02', 'http://zaislumuziejus.lt', 'Suaugusiems 4 Eur, vaikams nuo 2 iki 18 metų, studentams, pensininkams – 3 Eur, vaikams iki 2 metų – nemokamai\r\n\r\nVilniaus senamiestyje, netoli Katedros, B. Radvilaitės g. 7/2, lapkričio viduryje atsidarytas pirmasis Lietuvoje Žaislų muziejus. Muziejus  suskirstytas į archeologinę erdvę, kuri apima pačius seniausius žaislus, etnografinę, skirtą 19–20 a. pr. žaislams, o trečioji erdvė pristato šių dienų žaislus. Kolekciją sudaro originalai ir kopijos. Pastarosioms skirtas ypatingas dėmesys, nes būtent jos leis įgyvendinti pagrindinę muziejaus idėją – liesti – imti – pažinti.\r\n\r\nMuziejuje vyksta ekskursijos ir edukacinės programos.\r\n\r\nValstybinių švenčių dienomis muziejus nedirba.', 30, 'Žaislų muziejus', './41.jpg'),
(42, 2, '2016-11-18 09:22:32', 'http://valdovurumai.lt/lankytojams/edukacija/aktualijos/edukacinis-koncertas-seimoms-angelu-giesmes-cecilijai#.WC7IbH2giNz', 'Vokalinis ansamblis „In Campo Aperto“\r\n\r\nVilniaus Balio Dvariono dešimtmetės muzikos mokyklos išilginių fleitų konsortas (mokytoja Ieva Baublytė)\r\n\r\nĮėjimas į koncertą – su Valdovų rūmų muziejaus edukaciniu bilietu. Bilietai parduodami nuo 11 val.\r\n\r\nEdukacinio užsiėmimo kainos (kitų mokesčių nėra)\r\nBilietas 5–7 metų vaikui – 0,30 €\r\nBilietas mokiniui, studentui, senjorui – 0,80 €\r\nSuaugusiesiems – 2,50 €\r\nMažos šeimos (1 suaugusysis + nepilnamečiai vaikai) bilietas – 3,00 €\r\nDidelės šeimos (2 suaugusieji + nepilnamečiai vaikai) bilietas – 5,50 €\r\nVaikų globos namų auklėtiniams, neįgaliesiems – nemokamai', 14, 'Angelų giesmės Cecilijai', './42.jpg'),
(43, 10, '2016-11-18 09:27:46', 'http://valdovurumai.lt/lankytojams/renginiai/eat-the-sun-and-drink-the-rain#.WC7JT32giNx', 'Atlikėjai:\r\nŠiaulių valstybinis kamerinis choras „Polifonija“\r\nDirigentas Gintautas Venislovas\r\nKompozitorius Sven Helbig\r\n\r\nPirmą kartą Lietuvoje, inovatyvių kompozicijų gurmanai turės galimybę gyvai išvysti vokiečių kompozitorių ir elektroninės muzikos DJ‘jų Sven Helbig, kuris laužo tradicinius barjerus tarp klasikinio stiliaus, eksperimentinio meno ir populiariosios muzikos. Kompozitorius visa tai darniai apjungia ir kuria sinerginį efektą.', 14, 'I Eat the Sun and Drink the Rain', './43.jpg'),
(44, 59, '2016-11-18 09:34:07', 'http://renginiai.kasvyksta.lt/33874/vilnius-mama-jazz-2016', 'Vilnius Mama Jazz festivalis sostinėje vyksta nuo 2002-ųjų metų. Tai spalvinga, jokių stiliaus rėmų nevaržomos muzikos fiesta, akcentuojanti tris svarbiausius aspektus: kokybę, originalumą bei atkaklumą.\r\n\r\nPer keturioliką metų festivalyje dalyvavo daugybė iškilių pasaulio muzikantų ir pradedančių džiazo meistrų. \r\n\r\nLapkričio 17 d., ketvirtadienis / November 17, Thursday\r\nUmiastovskių rūmai (Trakų g. 2) / Umiastovskiai palace (Trakų st. 2)\r\n19.00 Atidarymo koncertas Jacques Kuba Seguin (CAN, PL) (įėjimas tik su festivalio pasais / Entrance with Festival Pass only)\r\nMuzikos klubas Tamsta / Music club Tamsta (Strazdelio g. 1)\r\n21.00 Showcase Stage programa\r\n–––––––––––––––––––––––––––––––––––––\r\nLapkričio 18 d., penktadienis / November 18, Friday\r\nLietuvos nacionalinis dramos teatras / Lithuanian National Drama Theatre\r\n19.00 Richardas Banys (LT)\r\nChina Moses (LT, USA, UK)\r\nMuzikos klubas Tamsta / Music club Tamsta (Strazdelio g. 1)\r\n21.00 Showcase Stage programa\r\n–––––––––––––––––––––––––––––––––––––\r\nLapkričio 19 d., šeštadienis / November 19, Saturday\r\nLietuvos nacionalinis dramos teatras / Lithuanian National Drama Theatre\r\n19.00 Phronesis (UK, DK, NO)\r\nOregon (band) (USA)\r\n22.00 jam session\r\n–––––––––––––––––––––––––––––––––––––\r\nLapkričio 20 d., sekmadienis / November 20, Sunday\r\nLietuvos nacionalinis dramos teatras / Lithuanian National Drama Theatre\r\n19.00 CHASSOL (FR)\r\nAmbrose Akinmusire 4-tet (USA)', 42, 'Vilnius Mama Jazz', './44.jpg'),
(45, 13.2, '2016-11-18 09:45:14', 'http://renginiai.kasvyksta.lt/32305/andrius-kaniava-laivas-restoranas', 'Geros muzikos ekspertai „Bardai LT“ skelbia didžią naujieną – Andrius Kaniava pristatys naują kompaktinę plokštelę „Laivas – restoranas“. Po beveik metus užtrukusių įrašų studijoje (garso režisierius Ignas Juzokas), dienos šviesą išvys naujasis dainuojančio aktoriaus darbas, kuris bus pristatytas visuomenei didžiuosiuose Lietuvos miestuose. 2016 m. lapkričio 27 dieną, 18 val. Panevėžio muzikiniame teatre.\r\n\r\nSpecialiai pristatymo koncertams ruošiamoje programoje gros visas būrys prie šio albumo dirbusių muzikantų: Andrius Kaniava (gitara, fortepijonas, vokalas), Aleksander Ten (gitara, mandolina, bandža), Nerijus Bakula (akordeonas), Sigitas Mickis (fortepijonas), Žydrūnas Mockūnas (perkusijas, mušamieji), Ignas Juzokas (kontrabosas).\r\nTai, kas laukia koncertuose, težino vienas Andrius. Tai, ką išvys žiūrovai, težino Andrius ir muzikantai. Tai, ko laukti koncertuose, sužinosite tik apsilankę juose. O pats Andrius Kaniava apie tai, ko tikėtis albume, sako taip: „Pasijuskite senų laikų restorane, alsuojančiame anų laikų madinga prabanga ir virtuvės kvapais, tikrai puikioje vietoje, kur mūsų amžininkas galėdavo atšokti vestuves, gedulingai pavakarieniauti, esant gerai nuotaikai - pavakaroti su draugais, o užplūdus blogai - duoti kam nors į snukį. Ir rūkyti\r\nIšgirskite muziką, kurios reikėdavo ieškoti.\r\n\r\nGrįžkite į laiką, kai muzika buvo paslaptis, o vinilo plokštelėse ir manetofonų juostose skambantys atlikėjai buvo tolimi, paslaptingi, neapčiuopiami ir nepasiekiami\r\nIr, prieš pareikšdami savo nuomonę apie tai, ką išgirdote, suskaičiuokite iki dešimt“.', 7, 'Andriaus Kaniavos koncertas „Laivas - restoranas“', './45.jpg'),
(46, 9.1, '2016-11-18 09:47:27', 'http://renginiai.kasvyksta.lt/31092/koncertas-jungtines-pajegos', 'SOSTINĖS VARIO KVINTETAS ir ŠV. KRISTUPO MEDINIŲ PUČIAMŲJŲ KVINTETAS\r\n\r\nProgramoje:\r\n\r\nR. Giedraitis. „Vasaros muzika“\r\nF. List. Vengriška rapsodija Nr. 2 (aranž. I. H. Cartwright)\r\nH. Villa-Lobos. Gedulingas kvintetas W231\r\nJ. S. Bach. Tokata ir fūga d-moll (aranž. F. Mills)\r\nS. Barber. „Vasaros muzika“\r\nL. Bernstein. Siuita „Vestsaido istorija“ (versija decetui)\r\n\r\nPučiamųjų garsai nuo seniausių laikų siejami su didybe – jiems vieninteliams buvo leidžiama skelbti šventę ir pavojų, džiaugsmą ir gedulą. Šiame koncerte savo jėgas suvienys du garsūs kameriniai pučiamųjų ansambliai – Sostinės vario kvintetas ir Šv. Kristupo kvintetas, pateiksiantys savo klausytojams net 8 skirtingų pučiamųjų instrumentų garsų paletę.\r\n\r\nSostinės vario kvintetas (įkurtas 1997 m.) po savo stogu subūrė dviejų didžiausių Lietuvos simfoninių orkestrų – Lietuvos valstybinio ir Lietuvos nacionalinio – koncertmeisterius ir muzikantus. Tai vienas iš daugiausiai koncertuojančių kamerinių ansamblių Lietuvoje, nuolatinis stambiausių Lietuvos kultūros renginių dalyvis, surengęs savo koncertus Italijoje, Švedijoje, Portugalijoje, Ispanijoje ir Japonijoje. Ansamblio programa įvairialypė – nuo renesanso iki šių dienų, nuo klasikos, džiazo iki pramoginės muzikos.', 43, 'Koncertas „Jungtinės pajėgos“', './46.jpg'),
(47, 10, '2016-11-18 09:54:32', 'http://renginiai.kasvyksta.lt/33704/koncertas-uzburiancios-melodijos', 'ČIURLIONIO KVARTETAS LIETUVOS MUZIKOS IR TEATRO AKADEMIJOS DAINAVIMO KATEDROS STUDENTAI\r\n\r\nPrograma\r\n\r\nŽymiausių operų ir operečių arijos, dainos bei instrumentinė muzika\r\n\r\nNacionalinės premijos laureatas Čiurlionio kvartetas yra parengęs ne vieną programą ne tik su garsiausiais Europos muzikais, bet ir su scenos karjerą pradedančiais talentais – Lietuvos muzikos ir teatro akademijos Dainavimo katedros studentais Milda Baronaite, Kristina Petrauskas ir Denisu Bessmertnyj. Šios nepaprastos profesijos juos moko iškilūs scenos meistrai, Nacionalinės premijos laureatai prof. Virgilijus Noreika ir prof. Asta Krikščiūnaitė. Po Trakų pilies skliautais šį kartą skamba bendras kvarteto ir keturių solistų koncertas, kuriame pateikiamos Wolfgango Amadeaus Mozarto, Piotro Čaikovskio, Charles’o Gounod, Giacomo Puccini, Luigi Denza, Francesco Sartori, Stanislao Gastaldonio arijos ir dainos bei instrumentinė muzika.', 44, 'Koncertas „Užburiančios melodijos“', './47.jpg'),
(48, 6, '2016-11-18 09:56:52', 'http://trakaimuziejus.lt/', 'Trakų salos pilis – gotikinė pilis Trakų mieste, Galvės ežero Pilies saloje, į kurią nutiestas pėsčiųjų tiltas. Pastatyta kunigaikščių Kęstučio ir Vytauto iniciatyva XIV a. II pusėje – XV a. 1-ajame dešimtmetyje. XV a. ši pilis (kaip ir Trakų pusiasalio pilis) buvo viena iš LDK valdovų rezidencijų. Dabar pilis atstatyta ir yra vienas populiariausių Lietuvoje turistų lankomų objektų; pilyje vyksta įvairios šventės, veikia archeologinė ir istorinė ekspozicijos, medžioklės muziejus.', 44, 'Trakų salos pilis', './48.jpg'),
(49, 0, '2016-11-18 10:02:23', 'http://www.trakaimuziejus.lt/news/139/125/Senuju-amatu-dienos-salos-pilyje', 'Š. m. rugpjūčio 19-20 d. Trakų Salos pilyje jau dvyliktą kartą vyks renginys „Senųjų amatų dienos“. Dvi dienas amatininkai bei amatų rekonstruktoriai demonstruos per dvidešimt amatų, vyks edukaciniai užsiėmimai, kūrybinės dirbtuvės, riterių ir muzikinių kolektyvų pasirodymai. Šiemet į salos pilį sugužės daugiau nei 100 dalyvių iš Lietuvos, Lenkijos, Baltarusijos ir Rusijos. Renginį organizuoja Trakų istorijos muziejus.', 44, 'Senųjų amatų dienos', './49.jpg');
INSERT INTO `app_tourist_tourobject` (`id`, `ticket_price`, `last_update`, `link`, `extra_info`, `place_id`, `title`, `main_photo`) VALUES
(50, 5, '2016-11-18 10:50:59', 'http://renginiai.kasvyksta.lt/26351/ekskursija-vilniaus-legendu-labirintais', 'Ar žinote, kad Vilniaus miestą gaubia paslaptingos legendos? Legendose yra užšifruota daug svarbios informacijos apie miesto istoriją. Jos yra miesto vaizdinė iliustracija. Kiekviena legenda turi ir racionalųjį grūdą, todėl jos taip domina ir traukia mažus ir didelius klausytojus...\r\n\r\nJums nusibodo sausi istorijos faktai? Jums reikia spalvingo pasakojimo? Tuomet ši ekskursija kaip tik Jums.\r\n\r\nAr žinote kur grandine buvo prirakinta garsioji burtininko Tvardausko juodosios magijos knyga? Ar teko girdėti, kad minėtas magas buvo iškvietęs jau mirusios Barboros Radvilaitės vėlę? Ar žinote, kad nuėjus į Arsenalo kiemą kartais pavyksta išvysti buvusios karalienės mylimojo šmėklą?\r\n\r\nKur miega šv. Kazimiero kariuomenė? Ir kur buvo deginami Lietuvos didieji kunigaikščiai bei didikai? Ką slepia savyje garsioji legenda apie Gedimino sapną? Kodėl Šv. Onos bažnyčia raudonos spalvos? Slibinų jau nebebijome, bet buvo ir kitaip...\r\n\r\nBūtina išankstinė rezervacija!', 16, 'Ekskursija Vilniaus Legendų Labirintais', './50.jpg'),
(51, 0, '2016-11-18 10:54:36', 'http://renginiai.kasvyksta.lt/34640/kurybiniu-dirbtuviu-aukstamiescio-viesosios-erdves-finalas', 'Kūrybinių industrijų parkas „Architektūros centras“ kartu su Menų fabriku LOFTAS ir Vilniaus miesto savivaldybe 2016 metais organizuoja kūrybines dirbtuves „Aukštamiesčio viešosios erdvės“, kurias remia Lietuvos kultūros taryba, Lietuvos Respublikos kultūros ministerija ir UB „Vilbra“.\r\n\r\nJau netrukus — lapkričio 20 dieną, menų fabrike „Loftas“ — visi Aukštamiesčio gyventojai, neabejingi savo aplinkai ir gyvenimo kokybei, kviečiami įvertinti architektų pastangas padaryti mikrorajoną patrauklesniu, patogesniu ir kūrybiškesniu!', 45, 'Kūrybinių dirbtuvių „Aukštamiesčio viešosios erdvės“ finalas', './51.png'),
(52, 6, '2016-11-18 10:57:18', 'http://renginiai.kasvyksta.lt/26353/ekskursija-senuju-vilnieciu-buitis-ir-kasdienybe', 'Būtina išankstinė registracija!\r\n\r\nEkskursijos metu sužinosite:\r\n\r\nKodėl XVIII a. padorios moterys nė už ką nebūtų apsimovusios kelnaičių?\r\n\r\nKokie žiedai puikavosi ne ant valdovų, o ant pirklių ir amatininkų moterų rankų?\r\n\r\nKodėl plikbajorių puotose servetėlių galus prisiūdavo prie staltiesių arba kodėl tostams skirtas taures gamintojai kiek įpjaudavo?\r\n\r\nKodėl kiekvienoje parduotuvėje galėjai rasti gyvsidabrio?\r\n\r\nKas tais laikais atstodavo tualetinį popierių?\r\n\r\nKoks buvo „mėšlo mokestis“ ir kiek prisireikdavo vežimų ir kastuvų tiems nešvarumams iškuopti?\r\n\r\nKokios baudos numatytos pirmadieniais pagiriotis pratusiems meistrams?\r\n\r\nKą veikė elgetų cecho bizūnininkai arba... Kuo pasibaigė gatvių kautynės Vilniuje 1635 m. kovą, kai prieš žydų kvartalą siaubusią minią magistratas metė jungtinę įvairių cechų – auksakalių, siuvėjų, kalvių „armiją“?\r\n\r\nAr norite sužinoti daugiau?\r\nKviečiame prisijungti ir viską pamatyti, išgirsti ir pajusti kartu!', 2, 'Ekskursija Senųjų vilniečių buitis ir kasdienybė', './52.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `app_tourist_visitplace`
--

CREATE TABLE `app_tourist_visitplace` (
  `tour_object_id` int(11) NOT NULL,
  `always_available` tinyint(1) NOT NULL,
  `mondayWorkingHoursStart` time DEFAULT NULL,
  `mondayWorkingHoursEnd` time DEFAULT NULL,
  `tuesdayWorkingHoursStart` time DEFAULT NULL,
  `tuesdayWorkingHoursEnd` time DEFAULT NULL,
  `wednesdayWorkingHoursStart` time DEFAULT NULL,
  `wednesdayWorkingHoursEnd` time DEFAULT NULL,
  `thursdayWorkingHoursStart` time DEFAULT NULL,
  `thursdayWorkingHoursEnd` time DEFAULT NULL,
  `fridayWorkingHoursStart` time DEFAULT NULL,
  `fridayWorkingHoursEnd` time DEFAULT NULL,
  `saturdayWorkingHoursStart` time DEFAULT NULL,
  `saturdayWorkingHoursEnd` time DEFAULT NULL,
  `sundayWorkingHoursStart` time DEFAULT NULL,
  `sundayWorkingHoursEnd` time DEFAULT NULL,
  `is_museum` tinyint(1) NOT NULL,
  `is_park_or_square` tinyint(1) NOT NULL,
  `is_monument` tinyint(1) NOT NULL,
  `is_palace` tinyint(1) NOT NULL,
  `is_nature_object` tinyint(1) NOT NULL,
  `is_panorama` tinyint(1) NOT NULL,
  `is_church` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_tourist_visitplace`
--

INSERT INTO `app_tourist_visitplace` (`tour_object_id`, `always_available`, `mondayWorkingHoursStart`, `mondayWorkingHoursEnd`, `tuesdayWorkingHoursStart`, `tuesdayWorkingHoursEnd`, `wednesdayWorkingHoursStart`, `wednesdayWorkingHoursEnd`, `thursdayWorkingHoursStart`, `thursdayWorkingHoursEnd`, `fridayWorkingHoursStart`, `fridayWorkingHoursEnd`, `saturdayWorkingHoursStart`, `saturdayWorkingHoursEnd`, `sundayWorkingHoursStart`, `sundayWorkingHoursEnd`, `is_museum`, `is_park_or_square`, `is_monument`, `is_palace`, `is_nature_object`, `is_panorama`, `is_church`) VALUES
(1, 0, '06:00:00', '19:00:00', '06:00:00', '19:00:00', '06:00:00', '19:00:00', '06:00:00', '19:00:00', '06:00:00', '19:00:00', '06:00:00', '19:00:00', '06:00:00', '19:00:00', 0, 0, 1, 0, 0, 0, 1),
(2, 0, '07:00:00', '19:00:00', '07:00:00', '19:00:00', '07:00:00', '19:00:00', '07:00:00', '19:00:00', '07:00:00', '19:00:00', '07:00:00', '19:00:00', '07:00:00', '19:00:00', 1, 0, 0, 0, 0, 0, 1),
(3, 0, '10:00:00', '17:00:00', '10:00:00', '17:00:00', '10:00:00', '17:00:00', '10:00:00', '17:00:00', '10:00:00', '17:00:00', '10:00:00', '17:00:00', '10:00:00', '17:00:00', 0, 1, 0, 0, 0, 0, 1),
(4, 0, '17:00:00', '19:00:00', '17:00:00', '19:00:00', '17:00:00', '19:00:00', '17:00:00', '19:00:00', '17:00:00', '19:00:00', '17:00:00', '19:00:00', '17:00:00', '19:00:00', 0, 0, 0, 0, 0, 0, 1),
(5, 0, '07:00:00', '19:00:00', '07:00:00', '19:00:00', '07:00:00', '19:00:00', '07:00:00', '19:00:00', '07:00:00', '19:00:00', '08:00:00', '19:00:00', '08:00:00', '19:00:00', 0, 0, 0, 0, 0, 0, 1),
(6, 0, '16:00:00', '18:30:00', '16:00:00', '18:30:00', '16:00:00', '18:30:00', '16:00:00', '18:30:00', '16:00:00', '18:30:00', '08:00:00', '14:00:00', '08:00:00', '14:00:00', 0, 0, 0, 0, 0, 0, 1),
(7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 1),
(8, 0, '13:00:00', '18:30:00', '13:00:00', '18:30:00', '13:00:00', '18:30:00', '13:00:00', '18:30:00', '13:00:00', '18:30:00', NULL, NULL, '07:30:00', '15:00:00', 0, 0, 0, 0, 0, 0, 1),
(9, 0, '10:00:00', '20:00:00', '10:00:00', '20:00:00', '10:00:00', '20:00:00', '10:00:00', '20:00:00', '10:00:00', '20:00:00', '10:00:00', '20:00:00', '10:00:00', '20:00:00', 0, 0, 0, 0, 0, 0, 1),
(10, 0, '09:00:00', '19:00:00', '09:00:00', '19:00:00', '09:00:00', '19:00:00', '09:00:00', '19:00:00', '09:00:00', '19:00:00', '09:00:00', '19:00:00', '09:00:00', '19:00:00', 0, 0, 0, 0, 0, 0, 1),
(11, 0, '16:00:00', '19:00:00', '16:00:00', '19:00:00', '16:00:00', '19:00:00', '16:00:00', '19:00:00', '16:00:00', '19:00:00', '16:00:00', '19:00:00', '16:00:00', '19:00:00', 0, 0, 0, 0, 0, 0, 1),
(12, 0, '08:00:00', '18:00:00', '08:00:00', '18:00:00', '08:00:00', '18:00:00', '08:00:00', '18:00:00', '08:00:00', '18:00:00', '16:00:00', '18:00:00', '09:00:00', '13:00:00', 0, 0, 0, 0, 0, 0, 1),
(13, 0, '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', 1, 0, 1, 1, 0, 1, 0),
(14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 1, 0),
(15, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0),
(16, 0, '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', NULL, NULL, 1, 0, 0, 0, 0, 1, 0),
(17, 0, '11:00:00', '21:00:00', '11:00:00', '21:00:00', '11:00:00', '21:00:00', '11:00:00', '21:00:00', '11:00:00', '22:00:00', '11:00:00', '22:00:00', '11:00:00', '21:00:00', 1, 0, 0, 0, 0, 1, 0),
(18, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0),
(19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 0),
(20, 0, '07:00:00', '22:00:00', '07:00:00', '22:00:00', '07:00:00', '22:00:00', '07:00:00', '22:00:00', '07:00:00', '22:00:00', '07:00:00', '22:00:00', '07:00:00', '22:00:00', 0, 1, 0, 0, 0, 0, 0),
(21, 0, '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '16:00:00', NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0),
(22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0),
(23, 0, '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', 0, 1, 0, 0, 0, 0, 0),
(24, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 1, 0),
(25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 0),
(26, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0),
(27, 0, '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '20:00:00', '10:00:00', '20:00:00', '10:00:00', '20:00:00', '10:00:00', '20:00:00', 1, 0, 1, 1, 0, 0, 0),
(28, 0, NULL, NULL, '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', 1, 0, 0, 0, 0, 0, 0),
(29, 0, NULL, NULL, '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', 1, 0, 0, 0, 0, 0, 0),
(30, 0, NULL, NULL, '10:00:00', '17:00:00', '10:00:00', '17:00:00', '10:00:00', '17:00:00', '10:00:00', '17:00:00', '10:00:00', '17:00:00', NULL, NULL, 1, 0, 1, 0, 0, 0, 0),
(31, 0, NULL, NULL, '11:00:00', '18:00:00', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '11:00:00', '16:00:00', 1, 0, 0, 0, 0, 0, 0),
(32, 0, NULL, NULL, '11:00:00', '19:00:00', '11:00:00', '19:00:00', '12:00:00', '20:00:00', '11:00:00', '19:00:00', '11:00:00', '19:00:00', '11:00:00', '17:00:00', 1, 0, 0, 0, 0, 0, 0),
(33, 0, NULL, NULL, '09:00:00', '18:00:00', '09:00:00', '18:00:00', '09:00:00', '18:00:00', '09:00:00', '18:00:00', '10:00:00', '17:00:00', NULL, NULL, 1, 0, 0, 0, 0, 0, 0),
(34, 0, NULL, NULL, '10:00:00', '17:00:00', '10:00:00', '17:00:00', '10:00:00', '19:00:00', '10:00:00', '17:00:00', '10:00:00', '17:00:00', NULL, NULL, 1, 0, 0, 0, 0, 0, 0),
(35, 0, NULL, NULL, '10:00:00', '17:00:00', '10:00:00', '17:00:00', '10:00:00', '17:00:00', '10:00:00', '17:00:00', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0),
(36, 0, NULL, NULL, NULL, NULL, '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', 1, 0, 0, 1, 0, 1, 0),
(37, 0, NULL, NULL, '09:00:00', '16:00:00', '09:00:00', '16:00:00', '09:00:00', '16:00:00', '09:00:00', '16:00:00', '11:00:00', '18:00:00', '11:00:00', '18:00:00', 1, 0, 0, 0, 0, 0, 0),
(38, 0, NULL, NULL, '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '16:00:00', NULL, NULL, 1, 0, 0, 0, 0, 0, 0),
(39, 0, '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0),
(40, 0, '08:30:00', '16:00:00', '08:30:00', '16:00:00', '08:30:00', '16:00:00', '08:30:00', '16:00:00', '08:30:00', '15:00:00', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0),
(41, 0, NULL, NULL, '14:00:00', '18:00:00', '14:00:00', '18:00:00', '14:00:00', '20:00:00', '14:00:00', '20:00:00', '11:00:00', '16:00:00', '11:00:00', '16:00:00', 1, 0, 0, 0, 0, 0, 0),
(48, 0, NULL, NULL, '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', 1, 1, 0, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add Vietovė', 7, 'add_place'),
(20, 'Can change Vietovė', 7, 'change_place'),
(21, 'Can delete Vietovė', 7, 'delete_place'),
(22, 'Can add Turistinis objektas', 8, 'add_tourobject'),
(23, 'Can change Turistinis objektas', 8, 'change_tourobject'),
(24, 'Can delete Turistinis objektas', 8, 'delete_tourobject'),
(25, 'Can add Lankytina vieta', 9, 'add_visitplace'),
(26, 'Can change Lankytina vieta', 9, 'change_visitplace'),
(27, 'Can delete Lankytina vieta', 9, 'delete_visitplace'),
(28, 'Can add Renginys', 10, 'add_event'),
(29, 'Can change Renginys', 10, 'change_event'),
(30, 'Can delete Renginys', 10, 'delete_event'),
(31, 'Can add Paveiksliukas', 11, 'add_image'),
(32, 'Can change Paveiksliukas', 11, 'change_image'),
(33, 'Can delete Paveiksliukas', 11, 'delete_image');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$24000$bkbpJdTfNqhR$LV7GpgAxhZSJ428PTAEV0Wcjyk6E4tvGyejcaHddMsQ=', '2016-11-18 09:12:02', 1, 'root', '', '', 'z.ulevicius@gmail.com', 1, 1, '2016-11-16 20:27:29'),
(2, 'pbkdf2_sha256$24000$Ll52Yo93qUfM$cArAgneR5schd4jM+nHeGNqCztxJZrCwPhdWM5FW+/U=', '2016-11-17 08:46:21', 0, 'user', '', '', 'user@user.com', 0, 1, '2016-11-17 08:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2016-11-17 15:59:24', '3', 'naujas', 3, '', 4, 1),
(2, '2016-11-17 15:59:24', '4', 'roots', 3, '', 4, 1),
(3, '2016-11-17 16:53:41', '1', 'Aušros Vartai', 1, 'Pridėta.', 7, 1),
(4, '2016-11-17 16:54:18', '2', 'Arkikatedra bazilika', 1, 'Pridėta.', 7, 1),
(5, '2016-11-17 16:54:42', '3', 'Šv. Jonų bažnyčia', 1, 'Pridėta.', 7, 1),
(6, '2016-11-17 16:55:04', '4', 'Šv. Onos bažnyčia', 1, 'Pridėta.', 7, 1),
(7, '2016-11-17 16:55:29', '5', 'Bernardinų bažnyčia', 1, 'Pridėta.', 7, 1),
(8, '2016-11-17 16:55:56', '6', 'Šv. Kazimiero bažnyčia', 1, 'Pridėta.', 7, 1),
(9, '2016-11-17 16:57:32', '7', 'Šv. Kotrynos bažnyčia', 1, 'Pridėta.', 7, 1),
(10, '2016-11-17 16:58:05', '8', 'Šv. Mikalojaus bažnyčia', 1, 'Pridėta.', 7, 1),
(11, '2016-11-17 16:58:38', '9', 'Pranciškonų bažnyčia', 1, 'Pridėta.', 7, 1),
(12, '2016-11-17 16:59:11', '10', 'Visų šventųjų bažnyčia', 1, 'Pridėta.', 7, 1),
(13, '2016-11-17 16:59:53', '11', 'Šv. Baltramiejaus bažnyčia', 1, 'Pridėta.', 7, 1),
(14, '2016-11-17 17:00:14', '12', 'Šv. Ignoto bažnyčia', 1, 'Pridėta.', 7, 1),
(15, '2016-11-17 17:01:43', '13', 'Gedimino pilies bokštas', 1, 'Pridėta.', 7, 1),
(16, '2016-11-17 17:02:19', '14', 'LDK Valdovų rūmai', 1, 'Pridėta.', 7, 1),
(17, '2016-11-17 17:03:02', '15', 'Vilniaus katedros varpinė', 1, 'Pridėta.', 7, 1),
(18, '2016-11-17 17:03:34', '5', 'Bernardinų bažnyčia', 2, 'Pakeistas address.', 7, 1),
(19, '2016-11-17 17:03:43', '7', 'Šv. Kotrynos bažnyčia', 2, 'Pakeistas address.', 7, 1),
(20, '2016-11-17 17:03:47', '8', 'Šv. Mikalojaus bažnyčia', 2, 'Pakeistas address.', 7, 1),
(21, '2016-11-17 17:03:50', '9', 'Pranciškonų bažnyčia', 2, 'Pakeistas address.', 7, 1),
(22, '2016-11-17 17:04:19', '10', 'Visų šventųjų bažnyčia', 2, 'Pakeistas address.', 7, 1),
(23, '2016-11-17 17:04:32', '11', 'Šv. Baltramiejaus bažnyčia', 2, 'Pakeistas address.', 7, 1),
(24, '2016-11-17 17:05:05', '12', 'Šv. Ignoto bažnyčia', 2, 'Pakeistas address.', 7, 1),
(25, '2016-11-17 17:05:14', '13', 'Gedimino pilies bokštas', 2, 'Pakeistas address.', 7, 1),
(26, '2016-11-17 17:05:24', '14', 'LDK Valdovų rūmai', 2, 'Pakeistas address.', 7, 1),
(27, '2016-11-17 17:07:20', '9', 'Pranciškonų bažnyčia', 2, 'Pakeistas address.', 7, 1),
(28, '2016-11-17 17:08:05', '16', 'Lietuvos nacionalinis muziejus, Naujasis arsenalas', 1, 'Pridėta.', 7, 1),
(29, '2016-11-17 17:08:31', '17', 'Lietuvos nacionalinis muziejus, Senasis arsenalas', 1, 'Pridėta.', 7, 1),
(30, '2016-11-17 17:09:49', '18', 'Signatarų namai', 1, 'Pridėta.', 7, 1),
(31, '2016-11-17 17:10:15', '19', 'Taikomosios dailės ir dizaino muziejus', 1, 'Pridėta.', 7, 1),
(32, '2016-11-17 17:10:39', '20', 'Televizijos bokštas', 1, 'Pridėta.', 7, 1),
(33, '2016-11-17 17:11:59', '21', 'Nacionalinė dailės galerija', 1, 'Pridėta.', 7, 1),
(34, '2016-11-17 17:12:35', '22', 'Pinigų muziejus', 1, 'Pridėta.', 7, 1),
(35, '2016-11-17 17:12:52', '23', 'Energetikos ir technikos muziejus', 1, 'Pridėta.', 7, 1),
(36, '2016-11-17 17:13:14', '24', 'Karo technikos ir transporto muziejus', 1, 'Pridėta.', 7, 1),
(37, '2016-11-17 17:13:40', '25', 'Vilniaus gynybinės sienos bastėja', 1, 'Pridėta.', 7, 1),
(38, '2016-11-17 17:14:04', '26', 'Valstybės pažinimo centras', 1, 'Pridėta.', 7, 1),
(39, '2016-11-17 17:14:16', '27', 'Lietuvos geležinkelių muziejus', 1, 'Pridėta.', 7, 1),
(40, '2016-11-17 17:15:13', '28', 'Lietuvos kulinarinio paveldo muziejus', 1, 'Pridėta.', 7, 1),
(41, '2016-11-17 17:15:30', '29', 'Muitinės muziejus', 1, 'Pridėta.', 7, 1),
(42, '2016-11-17 17:15:55', '30', 'Žaislų muziejus', 1, 'Pridėta.', 7, 1),
(43, '2016-11-17 17:36:24', '31', 'Trijų kryžių kalnas', 1, 'Pridėta.', 7, 1),
(44, '2016-11-17 17:42:57', '32', 'Subačiaus gatvės apžvalgos aikštelė', 1, 'Pridėta.', 7, 1),
(45, '2016-11-17 17:44:44', '33', 'Liepkalnis', 1, 'Pridėta.', 7, 1),
(46, '2016-11-17 17:45:34', '34', 'Rokantiškių piliakalnis', 1, 'Pridėta.', 7, 1),
(47, '2016-11-17 17:48:18', '34', 'Rokantiškių piliakalnis', 3, '', 7, 1),
(48, '2016-11-17 17:54:12', '35', 'Bernardinų sodas', 1, 'Pridėta.', 7, 1),
(49, '2016-11-17 17:54:36', '36', 'Botanikos sodas', 1, 'Pridėta.', 7, 1),
(50, '2016-11-17 17:54:57', '37', 'Čiunes Sugiharos Sakurų Sodas', 1, 'Pridėta.', 7, 1),
(51, '2016-11-17 17:57:25', '38', 'Europos parkas', 1, 'Pridėta.', 7, 1),
(52, '2016-11-17 17:57:57', '39', 'Kalnų parkas', 1, 'Pridėta.', 7, 1),
(53, '2016-11-17 17:58:44', '40', 'Pavilnių regioninis parkas', 1, 'Pridėta.', 7, 1),
(54, '2016-11-17 17:59:09', '41', 'Vingio parkas', 1, 'Pridėta.', 7, 1),
(55, '2016-11-17 20:29:04', '1', 'TourObject object', 1, 'Pridėta.', 8, 1),
(56, '2016-11-17 20:30:08', '1', 'TourObject object', 2, 'Nei vienas laukas nepakeistas', 8, 1),
(57, '2016-11-17 20:31:42', '2', 'TourObject object', 1, 'Pridėta.', 8, 1),
(58, '2016-11-17 20:32:57', '3', 'TourObject object', 1, 'Pridėta.', 8, 1),
(59, '2016-11-17 20:34:14', '4', 'TourObject object', 1, 'Pridėta.', 8, 1),
(60, '2016-11-17 20:35:18', '5', 'TourObject object', 1, 'Pridėta.', 8, 1),
(61, '2016-11-17 20:36:11', '6', 'TourObject object', 1, 'Pridėta.', 8, 1),
(62, '2016-11-17 20:36:47', '7', 'TourObject object', 1, 'Pridėta.', 8, 1),
(63, '2016-11-17 20:37:35', '8', 'TourObject object', 1, 'Pridėta.', 8, 1),
(64, '2016-11-17 20:39:33', '9', 'TourObject object', 1, 'Pridėta.', 8, 1),
(65, '2016-11-17 20:40:37', '10', 'TourObject object', 1, 'Pridėta.', 8, 1),
(66, '2016-11-17 20:43:17', '11', 'TourObject object', 1, 'Pridėta.', 8, 1),
(67, '2016-11-17 20:43:49', '12', 'TourObject object', 1, 'Pridėta.', 8, 1),
(68, '2016-11-17 20:47:07', '13', 'TourObject object', 1, 'Pridėta.', 8, 1),
(69, '2016-11-17 20:47:49', '14', 'TourObject object', 1, 'Pridėta.', 8, 1),
(70, '2016-11-17 20:48:48', '15', 'TourObject object', 1, 'Pridėta.', 8, 1),
(71, '2016-11-17 20:51:24', '15', 'TourObject object', 2, 'Pakeistas extra_info.', 8, 1),
(72, '2016-11-17 20:52:44', '16', 'TourObject object', 1, 'Pridėta.', 8, 1),
(73, '2016-11-17 20:53:52', '17', 'TourObject object', 1, 'Pridėta.', 8, 1),
(74, '2016-11-17 20:56:34', '18', 'TourObject object', 1, 'Pridėta.', 8, 1),
(75, '2016-11-17 20:57:42', '19', 'TourObject object', 1, 'Pridėta.', 8, 1),
(76, '2016-11-17 20:59:23', '20', 'TourObject object', 1, 'Pridėta.', 8, 1),
(77, '2016-11-17 21:00:38', '21', 'TourObject object', 1, 'Pridėta.', 8, 1),
(78, '2016-11-17 21:02:37', '22', 'TourObject object', 1, 'Pridėta.', 8, 1),
(79, '2016-11-17 21:03:21', '23', 'TourObject object', 1, 'Pridėta.', 8, 1),
(80, '2016-11-17 21:03:43', '23', 'TourObject object', 2, 'Pakeistas extra_info.', 8, 1),
(81, '2016-11-17 21:04:57', '24', 'TourObject object', 1, 'Pridėta.', 8, 1),
(82, '2016-11-17 21:06:00', '25', 'TourObject object', 1, 'Pridėta.', 8, 1),
(83, '2016-11-17 21:08:05', '26', 'TourObject object', 1, 'Pridėta.', 8, 1),
(84, '2016-11-17 21:11:17', '27', 'TourObject object', 1, 'Pridėta.', 8, 1),
(85, '2016-11-17 21:12:29', '28', 'TourObject object', 1, 'Pridėta.', 8, 1),
(86, '2016-11-17 21:13:52', '29', 'TourObject object', 1, 'Pridėta.', 8, 1),
(87, '2016-11-17 21:15:23', '30', 'TourObject object', 1, 'Pridėta.', 8, 1),
(88, '2016-11-17 21:17:01', '31', 'TourObject object', 1, 'Pridėta.', 8, 1),
(89, '2016-11-17 21:18:29', '32', 'TourObject object', 1, 'Pridėta.', 8, 1),
(90, '2016-11-17 21:20:32', '33', 'TourObject object', 1, 'Pridėta.', 8, 1),
(91, '2016-11-17 21:21:15', '34', 'TourObject object', 1, 'Pridėta.', 8, 1),
(92, '2016-11-17 21:22:36', '35', 'TourObject object', 1, 'Pridėta.', 8, 1),
(93, '2016-11-17 21:23:29', '36', 'TourObject object', 1, 'Pridėta.', 8, 1),
(94, '2016-11-17 21:24:10', '36', 'TourObject object', 2, 'Pakeistas extra_info.', 8, 1),
(95, '2016-11-17 21:25:54', '37', 'TourObject object', 1, 'Pridėta.', 8, 1),
(96, '2016-11-17 21:27:09', '38', 'TourObject object', 1, 'Pridėta.', 8, 1),
(97, '2016-11-17 21:27:52', '39', 'TourObject object', 1, 'Pridėta.', 8, 1),
(98, '2016-11-17 21:28:46', '40', 'TourObject object', 1, 'Pridėta.', 8, 1),
(99, '2016-11-17 21:29:46', '41', 'TourObject object', 1, 'Pridėta.', 8, 1),
(100, '2016-11-17 21:36:18', '1', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(101, '2016-11-17 21:37:45', '2', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(102, '2016-11-17 21:39:14', '3', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(103, '2016-11-17 21:40:38', '5', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(104, '2016-11-17 21:42:10', '6', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(105, '2016-11-17 21:43:12', '7', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(106, '2016-11-17 21:44:33', '8', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(107, '2016-11-17 21:45:06', '7', 'VisitPlace object', 2, 'Pakeistas is_museum ir is_church.', 9, 1),
(108, '2016-11-17 21:46:56', '9', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(109, '2016-11-17 21:47:46', '10', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(110, '2016-11-17 21:48:43', '11', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(111, '2016-11-17 21:49:51', '12', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(112, '2016-11-17 21:51:22', '13', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(113, '2016-11-17 21:52:14', '14', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(114, '2016-11-17 21:53:29', '15', 'Šv. Jonų varpinė', 2, 'Pakeistas extra_info.', 8, 1),
(115, '2016-11-17 21:54:18', '15', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(116, '2016-11-17 21:55:44', '16', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(117, '2016-11-17 21:57:25', '17', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(118, '2016-11-17 21:57:51', '18', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(119, '2016-11-17 21:58:16', '19', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(120, '2016-11-17 21:59:12', '20', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(121, '2016-11-17 22:00:33', '21', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(122, '2016-11-17 22:01:08', '22', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(123, '2016-11-17 22:02:56', '23', 'Europos parkas', 2, 'Pakeistas extra_info.', 8, 1),
(124, '2016-11-17 22:03:13', '23', 'Europos parkas', 2, 'Pakeistas extra_info.', 8, 1),
(125, '2016-11-17 22:03:18', '23', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(126, '2016-11-17 22:03:41', '24', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(127, '2016-11-17 22:04:56', '25', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(128, '2016-11-17 22:05:26', '26', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(129, '2016-11-17 22:06:54', '27', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(130, '2016-11-17 22:09:38', '28', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(131, '2016-11-17 22:10:19', '29', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(132, '2016-11-17 22:11:09', '30', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(133, '2016-11-17 22:12:28', '31', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(134, '2016-11-17 22:14:11', '32', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(135, '2016-11-17 22:15:27', '33', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(136, '2016-11-17 22:16:57', '34', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(137, '2016-11-17 22:17:40', '35', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(138, '2016-11-17 22:19:28', '36', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(139, '2016-11-17 22:19:48', '36', 'VisitPlace object', 2, 'Pakeistas is_palace.', 9, 1),
(140, '2016-11-17 22:20:43', '37', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(141, '2016-11-17 22:21:46', '38', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(142, '2016-11-17 22:22:37', '39', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(143, '2016-11-17 22:23:31', '40', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(144, '2016-11-17 22:24:49', '41', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(145, '2016-11-17 22:37:59', '4', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(146, '2016-11-18 09:24:40', '42', 'Angelų giesmės Cecilijai', 1, 'Pridėta.', 8, 1),
(147, '2016-11-18 09:25:00', '42', 'Angelų giesmės Cecilijai', 2, 'Pakeistas extra_info.', 8, 1),
(148, '2016-11-18 09:26:00', '42', 'Event object', 1, 'Pridėta.', 10, 1),
(149, '2016-11-18 09:28:25', '43', 'I Eat the Sun and Drink the Rain', 1, 'Pridėta.', 8, 1),
(150, '2016-11-18 09:29:02', '43', 'Event object', 1, 'Pridėta.', 10, 1),
(151, '2016-11-18 09:31:09', '42', 'TAMSTA | A. Strazdelio g. 1', 1, 'Pridėta.', 7, 1),
(152, '2016-11-18 09:33:53', '44', 'Vilnius Mama Jazz', 1, 'Pridėta.', 8, 1),
(153, '2016-11-18 09:34:09', '44', 'Vilnius Mama Jazz', 2, 'Pakeistas last_update.', 8, 1),
(154, '2016-11-18 09:34:50', '44', 'Event object', 1, 'Pridėta.', 10, 1),
(155, '2016-11-18 09:38:01', '44', 'Event object', 2, 'Pakeistas min_ticket_price.', 10, 1),
(156, '2016-11-18 09:44:54', '45', 'Andriaus Kaniavos koncertas „Laivas - restoranas“', 1, 'Pridėta.', 8, 1),
(157, '2016-11-18 09:45:15', '45', 'Andriaus Kaniavos koncertas „Laivas - restoranas“', 2, 'Pakeistas last_update.', 8, 1),
(158, '2016-11-18 09:46:08', '45', 'Event object', 1, 'Pridėta.', 10, 1),
(159, '2016-11-18 09:47:01', '43', 'Vilniaus Kongresų rūmai | Vilniaus g. 6', 1, 'Pridėta.', 7, 1),
(160, '2016-11-18 09:47:46', '46', 'Koncertas „Jungtinės pajėgos“', 1, 'Pridėta.', 8, 1),
(161, '2016-11-18 09:48:31', '46', 'Event object', 1, 'Pridėta.', 10, 1),
(162, '2016-11-18 09:54:16', '44', 'Trakų pilis | 21142', 1, 'Pridėta.', 7, 1),
(163, '2016-11-18 09:54:56', '47', 'Koncertas „Užburiančios melodijos“', 1, 'Pridėta.', 8, 1),
(164, '2016-11-18 09:55:37', '47', 'Event object', 1, 'Pridėta.', 10, 1),
(165, '2016-11-18 09:59:57', '48', 'Trakų salos pilis', 1, 'Pridėta.', 8, 1),
(166, '2016-11-18 10:00:59', '48', 'VisitPlace object', 1, 'Pridėta.', 9, 1),
(167, '2016-11-18 10:03:20', '49', 'Senųjų amatų dienos', 1, 'Pridėta.', 8, 1),
(168, '2016-11-18 10:04:11', '49', 'Event object', 1, 'Pridėta.', 10, 1),
(169, '2016-11-18 10:04:37', '47', 'Event object', 2, 'Nei vienas laukas nepakeistas', 10, 1),
(170, '2016-11-18 10:20:53', '49', 'Senųjų amatų dienos (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(171, '2016-11-18 10:40:12', '49', 'Senųjų amatų dienos (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(172, '2016-11-18 10:51:22', '50', 'Ekskursija Vilniaus Legendų Labirintais', 1, 'Pridėta.', 8, 1),
(173, '2016-11-18 10:53:13', '50', 'Event object', 1, 'Pridėta.', 10, 1),
(174, '2016-11-18 10:54:28', '45', 'Menų fabrikas Loftas | Švitrigailos g. 29', 1, 'Pridėta.', 7, 1),
(175, '2016-11-18 10:54:48', '51', 'Kūrybinių dirbtuvių „Aukštamiesčio viešosios erdvės“ finalas', 1, 'Pridėta.', 8, 1),
(176, '2016-11-18 10:56:00', '51', 'Event object', 1, 'Pridėta.', 10, 1),
(177, '2016-11-18 10:57:50', '52', 'Ekskursija Senųjų vilniečių buitis ir kasdienybė', 1, 'Pridėta.', 8, 1),
(178, '2016-11-18 10:58:31', '52', 'Event object', 1, 'Pridėta.', 10, 1),
(179, '2016-11-18 12:32:25', '52', 'Ekskursija Senųjų vilniečių buitis ir kasdienybė (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(180, '2016-11-18 12:32:35', '51', 'Kūrybinių dirbtuvių „Aukštamiesčio viešosios erdvės“ finalas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(181, '2016-11-18 12:32:42', '50', 'Ekskursija Vilniaus Legendų Labirintais (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(182, '2016-11-18 12:32:51', '49', 'Senųjų amatų dienos (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(183, '2016-11-18 12:33:05', '48', 'Trakų salos pilis (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(184, '2016-11-18 12:33:18', '47', 'Koncertas „Užburiančios melodijos“ (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(185, '2016-11-18 12:33:33', '46', 'Koncertas „Jungtinės pajėgos“ (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(186, '2016-11-18 12:33:45', '45', 'Andriaus Kaniavos koncertas „Laivas - restoranas“ (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(187, '2016-11-18 12:34:10', '44', 'Vilnius Mama Jazz (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(188, '2016-11-18 12:34:22', '43', 'I Eat the Sun and Drink the Rain (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(189, '2016-11-18 12:34:33', '42', 'Angelų giesmės Cecilijai (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(190, '2016-11-18 12:34:44', '41', 'Žaislų muziejus (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(191, '2016-11-18 12:35:00', '40', 'Muitinės muziejus (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(192, '2016-11-18 12:35:11', '39', 'Lietuvos kulinarinio paveldo muziejus (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(193, '2016-11-18 12:35:20', '38', 'Lietuvos geležinkelių muziejus (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(194, '2016-11-18 12:35:42', '37', 'Valstybės pažinimo centras (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(195, '2016-11-18 12:35:53', '36', 'Vilniaus gynybinės sienos bastėja (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(196, '2016-11-18 12:36:03', '35', 'Karo technikos ir transporto muziejus (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(197, '2016-11-18 12:36:15', '34', 'Energetikos ir technikos muziejus (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(198, '2016-11-18 12:36:24', '33', 'Pinigų muziejus (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(199, '2016-11-18 12:36:33', '32', 'Nacionalinė dailės galerija (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(200, '2016-11-18 12:36:40', '31', 'Taikomosios dailės ir dizaino muziejus (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(201, '2016-11-18 12:36:50', '30', 'Signatarų namai (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(202, '2016-11-18 12:36:58', '29', 'Lietuvos nacionalinis muziejus, Senasis arsenalas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(203, '2016-11-18 12:37:06', '28', 'Lietuvos nacionalinis muziejus, Naujasis arsenalas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(204, '2016-11-18 12:37:14', '27', 'LDK Valdovų rūmai (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(205, '2016-11-18 12:37:42', '26', 'Vingio parkas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(206, '2016-11-18 12:38:17', '25', 'Pavilnių regioninis parkas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(207, '2016-11-18 12:38:30', '24', 'Kalnų parkas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(208, '2016-11-18 12:38:50', '23', 'Europos parkas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(209, '2016-11-18 12:39:01', '22', 'Čiunes Sugiharos Sakurų Sodas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(210, '2016-11-18 12:39:12', '21', 'Botanikos sodas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(211, '2016-11-18 12:39:22', '20', 'Bernardinų sodas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(212, '2016-11-18 12:39:31', '19', 'Liepkalnis (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(213, '2016-11-18 12:39:41', '18', 'Subačiaus gatvės apžvalgos aikštelė (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(214, '2016-11-18 12:40:00', '17', 'Televizijos bokštas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(215, '2016-11-18 12:40:11', '16', 'Vilniaus katedros varpinė (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(216, '2016-11-18 12:40:18', '15', 'Šv. Jonų varpinė (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(217, '2016-11-18 12:40:35', '14', 'Trijų kryžių kalnas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(218, '2016-11-18 12:40:48', '13', 'Gedimino pilies bokštas (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(219, '2016-11-18 12:40:55', '12', 'Šv. Ignoto bažnyčia (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(220, '2016-11-18 12:41:03', '11', 'Šv. Baltramiejaus bažnyčia (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(221, '2016-11-18 12:41:11', '10', 'Visų šventųjų bažnyčia (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(222, '2016-11-18 12:41:19', '9', 'Pranciškonų bažnyčia (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(223, '2016-11-18 12:41:29', '8', 'Šv. Mikalojaus bažnyčia (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(224, '2016-11-18 12:41:36', '7', 'Šv. Kotrynos bažnyčia (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(225, '2016-11-18 12:41:44', '6', 'Šv. Kazimiero bažnyčia (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(226, '2016-11-18 12:41:51', '5', 'Bernardinų bažnyčia (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(227, '2016-11-18 12:42:00', '4', 'Šv. Onos bažnyčia (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(228, '2016-11-18 12:42:21', '3', 'Šv. Jonų bažnyčia (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(229, '2016-11-18 12:42:25', '2', 'Arkikatedra bazilika (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1),
(230, '2016-11-18 12:42:29', '1', 'Aušros Vartai (Priskirtas)', 2, 'Pakeistas main_photo.', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(10, 'app_tourist', 'event'),
(11, 'app_tourist', 'image'),
(7, 'app_tourist', 'place'),
(8, 'app_tourist', 'tourobject'),
(9, 'app_tourist', 'visitplace'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-11-11 14:23:08'),
(2, 'auth', '0001_initial', '2016-11-11 14:23:09'),
(3, 'admin', '0001_initial', '2016-11-11 14:23:09'),
(4, 'admin', '0002_logentry_remove_auto_add', '2016-11-11 14:23:09'),
(5, 'contenttypes', '0002_remove_content_type_name', '2016-11-11 14:23:10'),
(6, 'auth', '0002_alter_permission_name_max_length', '2016-11-11 14:23:11'),
(7, 'auth', '0003_alter_user_email_max_length', '2016-11-11 14:23:11'),
(8, 'auth', '0004_alter_user_username_opts', '2016-11-11 14:23:11'),
(9, 'auth', '0005_alter_user_last_login_null', '2016-11-11 14:23:11'),
(10, 'auth', '0006_require_contenttypes_0002', '2016-11-11 14:23:11'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2016-11-11 14:23:11'),
(12, 'sessions', '0001_initial', '2016-11-11 14:23:11'),
(13, 'app_tourist', '0001_initial', '2016-11-16 20:00:52'),
(14, 'app_tourist', '0002_auto_20161117_1925', '2016-11-17 17:25:38'),
(15, 'app_tourist', '0003_auto_20161117_1933', '2016-11-17 17:33:55'),
(16, 'app_tourist', '0004_auto_20161117_1941', '2016-11-17 17:41:06'),
(17, 'app_tourist', '0005_auto_20161117_2242', '2016-11-17 20:42:13'),
(18, 'app_tourist', '0006_visitplace_is_church', '2016-11-17 21:33:27'),
(19, 'app_tourist', '0007_auto_20161118_1136', '2016-11-18 09:37:00'),
(20, 'app_tourist', '0008_auto_20161118_1143', '2016-11-18 09:43:20'),
(21, 'app_tourist', '0009_tourobject_main_photo', '2016-11-18 10:08:18'),
(22, 'app_tourist', '0010_auto_20161118_1213', '2016-11-18 10:13:56'),
(23, 'app_tourist', '0011_auto_20161118_1238', '2016-11-18 10:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('fr2rxihfty9qxs3bkkqfvkrrjyhed5rp', 'OGExODQzZDk3NzAwZGIwZDg3YWNhMGQ4ZDE2NzBhY2Q1MTExMjcyNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDliZDkxNjA5NDI4NzVhNzVkN2YzMzdkMDQxYWM1YWQyYmQ0NjdhNiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-12-02 09:12:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_tourist_event`
--
ALTER TABLE `app_tourist_event`
  ADD PRIMARY KEY (`tour_object_id`);

--
-- Indexes for table `app_tourist_image`
--
ALTER TABLE `app_tourist_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_tourist_image_e746cc96` (`tour_object_id`);

--
-- Indexes for table `app_tourist_place`
--
ALTER TABLE `app_tourist_place`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_tourist_tourobject`
--
ALTER TABLE `app_tourist_tourobject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_tourist_tourobject_62becf4a` (`place_id`);

--
-- Indexes for table `app_tourist_visitplace`
--
ALTER TABLE `app_tourist_visitplace`
  ADD PRIMARY KEY (`tour_object_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_tourist_image`
--
ALTER TABLE `app_tourist_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_tourist_place`
--
ALTER TABLE `app_tourist_place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `app_tourist_tourobject`
--
ALTER TABLE `app_tourist_tourobject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_tourist_event`
--
ALTER TABLE `app_tourist_event`
  ADD CONSTRAINT `app_tourist_tour_object_id_7c9a18c2_fk_app_tourist_tourobject_id` FOREIGN KEY (`tour_object_id`) REFERENCES `app_tourist_tourobject` (`id`);

--
-- Constraints for table `app_tourist_image`
--
ALTER TABLE `app_tourist_image`
  ADD CONSTRAINT `app_tourist_tour_object_id_ae7396c8_fk_app_tourist_tourobject_id` FOREIGN KEY (`tour_object_id`) REFERENCES `app_tourist_tourobject` (`id`);

--
-- Constraints for table `app_tourist_tourobject`
--
ALTER TABLE `app_tourist_tourobject`
  ADD CONSTRAINT `app_tourist_tourobject_place_id_2557a763_fk_app_tourist_place_id` FOREIGN KEY (`place_id`) REFERENCES `app_tourist_place` (`id`);

--
-- Constraints for table `app_tourist_visitplace`
--
ALTER TABLE `app_tourist_visitplace`
  ADD CONSTRAINT `app_tourist_tour_object_id_72268343_fk_app_tourist_tourobject_id` FOREIGN KEY (`tour_object_id`) REFERENCES `app_tourist_tourobject` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
