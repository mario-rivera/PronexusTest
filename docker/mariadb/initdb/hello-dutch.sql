/* HELLO DUTCH */

CREATE TABLE province (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UNQ_PROVINCE_NAME (name)
);

INSERT INTO province (id, name)
VALUES
	(1, 'Groningen'),
	(2, 'Fryslân'),
	(3, 'Drenthe'),
	(4, 'Overijssel'),
	(5, 'Flevoland'),
	(6, 'Gelderland'),
	(7, 'Utrecht'),
	(8, 'Noord-Holland'),
	(9, 'Zuid-Holland'),
	(10, 'Zeeland'),
	(11, 'Noord-Brabant'),
	(12, 'Limburg');

CREATE TABLE category (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UNQ_CATEGORY_NAME (name)
);

INSERT INTO category (id, name)
VALUES
	(1, 'Ontbijt'),
	(2, 'Toetje'),
	(3, 'Avondeten'),
	(4, 'Lunch');

CREATE TABLE recipe (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  category_id int(11) unsigned NOT NULL,
  title varchar(255) NOT NULL,
  description longtext NOT NULL,
  prep_time time DEFAULT NULL,
  wait_time time DEFAULT NULL,
  servings int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UNQ_RECIPE_TITLE (title),
  KEY IDX_RECIPE_CATEGORY (category_id)
);

INSERT INTO recipe (id, category_id, title, description, prep_time, wait_time, servings)
VALUES
		(1, 3, 'Lin­zen­scho­tel met spek, rook­worst en kool', '<ol>\n<li>Spoel de linzen in een vergiet af met koud water en laat uitlekken. Verhit boter in een ruime braadpan. Bak Snijd de witte kool. Snijd de appel in grove stukken. Bak de koolreepjes 1 min. al omscheppend. Schep de appel door de kool. Breng op smaak met peper en zout en stoofgaar in 15 min. Snipper de ui. Verhit de boter in een hapjespan en fruit 2 min. zachtjes de ui. Voeg de spekreepjes toe en bak 2 min. mee. </li>\n<li>Schep de linzen door het ui-spekmengsel. Neem de rookworst uit de verpakking en leg op de linzen. Scheutje water toevoegen en laat met deksel op de pan 10 min zachtjes stoven. Neem de rookworst uit de pan en snijd in 4 stukken. Verdeel de linzen over diepe borden. Leg de rookworst erop en de kool ernaast. </li>\n</ol>', '00:20:00', '00:10:00', 4),
		(2, 3, 'Ru­co­la­stamp­pot met ge­rook­te ma­kreel', '<ol>\n<li>Kook de aardappelen in water met zout volgens de aanwijzingen op de verpakking gaar. Verdeel de gerookte makreelfilets in stukjes. Snijd de tomaten in parten. Meng de tomaat met de olie, tijm, peper en zout.</li>\n<li>Giet de aardappelen af, vang een kopje kookvocht op. Stamp de aardappelen fijn met de pureestamper.</li>\n<li>Voeg de zuivelspread en zo veel kookvocht toe tot een romige puree ontstaat. Snipper de ui. Schep de makreel, rucola en ui door de puree. Voeg peper toe.</li>\n<li>Schep de stamppot op 4 borden. Serveer met de tomatensalade.</li>\n</ol>', '00:00:20', NULL, 4),
		(3, 1, 'Boe­ren­kool­pan­nen­koek­jes met spek', '<ol>\n<li>Kook de boerenkool op laag vuur in weinig water in 10 min. gaar. Verhit een koekenpan en bak de spekblokjes in 6 min. uit. Snipper ondertussen de sjalotten. Voeg de sjalot halverwege toe. </li>\n<li>Klop de eieren los en meng met de melk en pannenkoekenmix tot een dik en glad beslag. Breng op smaak met peper en zout. Giet de boerenkool af in een vergiet, laat afkoelen en druk het overtollige vocht eruit. Roer de boerenkool, spekblokjes en sjalotten met het braadvet door het beslag. Laat het beslag 15 min. rusten. </li>\n<li>Verhit 1 el olie in een pan met antiaanbaklaag. Schep 3 bergjes beslag in de pan en bak de pannenkoekjes op middelhoog vuur in 6 min. gaar. Keer halverwege. Houd de pannenkoekjes warm op een bord onder aluminiumfolie. Herhaal tot het beslag op is. Serveer warm.</li>\n</ol>\n<div class=\"tip\">\n<h4>bereidingstip:</h4>\n<p>Je kunt de pannenkoekjes \'s ochtends al bakken. Bewaar ze tot gebruik afgedekt in de koelkast. Doe de pannenkoekjes \'s avonds in een ovenschaal. Dek deze af met aluminiumfolie en zet de schaal ca. 10 min. in een voorverwarmde oven van 190 °C.</p>\n</div>\n<div class=\"tip\">\n<h4>combinatietip:</h4>\n<p>Lekker met kaas. </p>\n</div>\n', '00:00:15', '00:50:00', 4),
		(4, 2, 'IJ­staart met bit­ter­koek­jes en li­keur', '<ol>\n<li>Roomijs uit diepvries nemen. In steelpan likeur verwarmen. Bitterkoekjes in kom doen en 1/2 dl warme likeur erover schenken. Bodem van vorm bekleden met plasticfolie. Lange vingers met ongesuikerde zijde kort in rest van warme likeur dopen en met besuikerde zijde rondom tegen wand in vorm zetten. Helft van roomijs in vorm scheppen en gladstrijken. Bitterkoekjes over roomijs verdelen, rest van roomijs erop scheppen en gladstrijken. (Indien lange vingers boven roomijs uitsteken, koekjes met scherp mes tot hoogte van roomijs afsnijden.) IJs tot gebruik (minimaal 1 uur) in diepvries zetten. Met dunschiller over smalle zijde van chocoladereep chocoladekrullen trekken.</li>\n<li>IJs uit diepvries nemen. Schaal op vorm leggen, samen keren en ijs uit vorm laten glijden. Plasticfolie verwijderen. Witte-chocoladekrullen over ijstaart verdelen en bestuiven met poedersuiker. IJstaart aan tafel in punten snijden en over vier borden verdelen.</li>\n</ol>', '00:20:00', '01:00:00', 4),
		(5, 2, 'Pe­ren-bos­bes­sen­crum­ble met port', '<ol>\n<li>Verwarm de oven voor op 200 °C. Doe het zelfrijzend bakmeel in een ruime kom en meng met de basterdsuiker, vanillesuiker en een mespunt zout. Snijd de boter in blokjes, doe in de kom en kneed er met koele handen een kruimeldeeg van. Zet tot gebruik in de koelkast.</li>\n<li>Schil de peren en snijd in stukjes. Rasp de gele schil van de citroen en pers de vrucht uit. Doe de peer, bosbessen, het citroensap en rasp in de ovenschaal. Schenk de port erover.</li>\n<li>Neem het kruimeldeeg uit de koelkast en verdeel over de schaal. Zet de schaal in het midden van oven en bak de crumble in ca. 35 min. goudbruin en gaar. Verlaag de temperatuur na 10 min. tot 180 °C. Serveer de crumble warm. Lekker met een bolletje vanilleroomijs.</li>\n</ol>', '00:20:00', '00:35:00', 6);

CREATE TABLE province_recipe (
  province_id int(11) unsigned NOT NULL,
  recipe_id int(11) unsigned NOT NULL,
  PRIMARY KEY (province_id, recipe_id),
  KEY IDX_PROVRECI_PROVINCE (province_id),
  KEY IDX_PROVRECI_RECIPE (recipe_id),
  CONSTRAINT FK_PROVRECI_PROVINCE FOREIGN KEY (province_id) REFERENCES province (id) ON DELETE CASCADE,
  CONSTRAINT FK_PROVRECI_RECIPE FOREIGN KEY (recipe_id) REFERENCES recipe (id) ON DELETE CASCADE
);

INSERT INTO province_recipe (province_id, recipe_id)
VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 2),
	(7, 2),
	(6, 3),
	(8, 4),
	(9, 4),
	(10, 2),
	(11, 5),
	(12, 5),
	(12, 4),
	(7, 3),
	(11, 3);

CREATE TABLE `user` (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  email varchar(180),
  enabled tinyint(1) NOT NULL,
  password varchar(255) NOT NULL,
  last_login datetime DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UNQ_USER_EMAIL (email)
);
