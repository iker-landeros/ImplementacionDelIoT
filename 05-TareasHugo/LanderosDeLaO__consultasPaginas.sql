-- Iker Landeros, A01423214, 03/11/2023
-- Base de datos Páginas Web

-- DROP database paginasWeb;

CREATE DATABASE paginasWeb;

USE paginasWeb;

-- Tablas independientes
CREATE TABLE webpage(
	webID INT,
    webTitle VARCHAR(20),
    url VARCHAR(70),
    base INT,
    hits INT,
    PRIMARY KEY(webID)
);

CREATE TABLE graphic(
	gID INT,
    gName VARCHAR(15),
    gType VARCHAR(3),
    gLocation VARCHAR(40),
    PRIMARY KEY(gID)
);

CREATE TABLE courseware(
	cID VARCHAR(4),
    cDescription VARCHAR(40),
    ftpLocation VARCHAR(70),
    category VARCHAR(1),
    PRIMARY KEY(cID)
);

CREATE TABLE httpLink(
	sourceWebID INT,
    targetWebID INT,
    PRIMARY KEY (sourceWebID, targetWebID)
);

CREATE TABLE display(
	webID INT,
    gID INT,
    PRIMARY KEY (webID,gID),
    CONSTRAINT fk_webpage_display1
		FOREIGN KEY (webID) REFERENCES webpage(webID),
	CONSTRAINT fk_graphic_display1
		FOREIGN KEY (gID) REFERENCES graphic(gID)
);

CREATE TABLE ftpLink(
	webID INT,
    cID VARCHAR(4),
    PRIMARY KEY (webID, cID),
    CONSTRAINT fk_webpage_ftpLink1
		FOREIGN KEY (webID) REFERENCES webpage(webID),
	CONSTRAINT fk_courseware_ftpLink1
		FOREIGN KEY (cID) REFERENCES courseware(cID)
);

-- INSERTS

INSERT INTO webpage(webID, webTitle, url, base, hits)
VALUES(01, "CSE412 Web", "http://www.eas.asu.edu/~cse412/", 01, 20),
	  (02, "Syllabus", "gen_syllabus.html", 01, 10),
      (03, "Calendar", "fall98/calendar.html", 01, 18),
      (04, "Publications", "pub.html", 01, 5),
      (05, "WinRDBI", "winRDBI.html", 01, 1),
      (06, "Group Projects", "projects.html", 01, 20),
      (07, "FAQs", "faqs.html", 01, 1),
      (08, "Links", "links.html", 01, 10),
      (09, "CSE510 Web", "http://www.eas.asu.edu/~cse510/", 09, 8),
      (10, "Syllabus", "gen_syllabus.html", 09, 8),
      (11, "Calendar", "fall98/calendar.html", 09, 8),
      (12, "Notes", "notes.html", 09, 8),
      (13, "CSE513 Home", "http://www.eas.asu.edu/~cse513", 13, 21),
      (14, "Syllabus", "syllabus.html", 13, 15),
      (15, "Notes", "class_notes.html", 13, 11),
      (16, "HyperNews", "hypernews.html", 13, 21);
      
INSERT INTO graphic(gID, gName, gType, gLocation)
VALUES(01, "background", "gif", "cse412/www/graphics/"),
	  (02, "bar", "gif", "cse412/www/graphics/"),
      (03, "button1", "jpg", "cse412/www/graphics/"),
      (04, "button2", "jpg", "cse412/www/graphics/"),
      (05, "button3", "gif", "cse412/www/graphics/"),
      (06, "ieeelogo", "bmp", "cse412/www/graphics/logos"),
      (07, "acmlogo", "jpg", "cse412/www/graphics/logos"),
      (08, "asulogo", "gif", "cse412/www/graphics/logos"),
      (09, "clouds", "bmp", "cse412/www/graphics/"),
      (10, "books", "gif", "cse412/www/graphics/"),
      (11, "lock", "jpg", "cse412/www/graphics/"),
      (12, "stone", "bmp", "cse412/www/graphics/");
      
INSERT INTO courseware(cID, cDescription, ftpLocation, category)
VALUES("doc1", "WinRDBI Setup", "uh/ftp/pub/class/cse412/winrdbi/", "D"),
	  ("doc2", "WinRDBI User Guide", "uh/ftp/pub/class/cse412/winrdbi/", "D"),
      ("exe1", "WinRDBI Setup", "uh/ftp/pub/class/cse412/winrdbi/", "E"),
      ("mdb1", "Company Database", "uh/ftp/pub/class/cse412/projects/", "M"),
      ("not1", "Class Notes Chapter 1", "uh/ftp/pub/class/cse412/notes/", "N"),
      ("not2", "Class Notes Chapter 2", "uh/ftp/pub/class/cse412/notes/", "N"),
      ("pub1", "WinRDBI Implementation", "uh/ftp/pub/class/cse412/winrdbi/", "P"),
      ("pub2", "Company Theory", "uh/ftp/pub/class/cse412/projects/", "P"),
      ("pub3", "A Co-operative Learning Approach", "uh/ftp/pub/class/cse412/pubs/", "P");
      
INSERT INTO display(webID, gID)
VALUES(01,01),
	  (06,01),
      (07,01),
      (01,02),
      (02,02),
      (06,02),
      (01,03),
      (07,03),
      (01,04),
      (04,06),
      (04,07),
      (01,08),
      (03,08),
      (01,09),
      (03,09),
      (09,09),
      (08,11),
      (04,12);
      
INSERT INTO httpLink(sourceWebID, targetWebID)
VALUES(02,01),
	  (03,01),
      (01,02),
      (01,03),
      (01,04),
      (01,05),
      (04,05),
      (06,05),
      (01,06),
      (01,07),
      (04,07),
      (01,08),
      (08,09),
      (11,09),
      (09,10),
      (09,11),
      (09,12),
      (11,12),
      (08,13),
      (14,13),
      (13,14),
      (13,15),
      (14,15),
      (13,16);
      
INSERT INTO ftpLink(webID, cID)
VALUES(04,"doc1"),
	  (05,"doc2"),
      (05,"exe1"),
      (06,"mdb1"),
      (04,"not1"),
      (06,"not1"),
      (12,"not1"),
      (15,"not1"),
      (08,"not2"),
      (15,"not2"),
      (04,"pub1"),
      (05,"pub1"),
      (06,"pub1"),
      (12,"pub1"),
      (04,"pub2"),
      (05,"pub2"),
      (04,"pub3"),
      (05,"pub3");
      
      
USE paginasWeb;
SELECT * FROM webpage;
SELECT * FROM graphic;
SELECT * FROM courseware;
SELECT * FROM display;
SELECT * FROM httpLink;
SELECT * FROM ftpLink;


-- CONSULTAS

-- ¿Qué páginas contienen enlaces ftp a contenidos en la categoría N?
SELECT w.webID, w.webTitle
FROM webpage w
JOIN ftpLink f ON w.webID = f.webID
JOIN courseWare c ON f.cID = c.cID
WHERE category = "N";

-- ¿Qué páginas muestran imágenes (graphics) con el nombre 'asulogo'?
SELECT w.webID, w.webTitle
FROM graphic g
JOIN display d ON g.gID = d.gID
JOIN webpage w ON d.webID = w.webID
WHERE g.gName = "asulogo";

-- ¿Qué páginas no muestran imágenes (graphics)?
SELECT webID, webTitle
FROM webpage
WHERE webID NOT IN 
(SELECT w.webID
FROM graphic g
JOIN display d ON g.gID = d.gID
JOIN webpage w ON d.webID = w.webID);

-- ¿Qué páginas usan imágenes jpg pero no gif?
SELECT w.webID, w.webTitle
FROM graphic g
JOIN display d ON g.gID = d.gID
JOIN webpage w ON d.webID = w.webID
WHERE g.gType = "jpg";

-- ¿Qué páginas contienen solo un enlace http a otra página?
SELECT w.webID, w.webTitle
FROM webpage w
JOIN httpLink h ON w.webID = h.sourceWebID
GROUP BY h.sourceWebID
HAVING COUNT(h.targetWebID) = 1;

-- ¿Qué página tiene la mayor cantidad de visitas (hits)?
SELECT webID, webTitle, hits FROM webpage
WHERE hits = (SELECT MAX(hits) FROM webpage);

-- ¿Qué páginas contienen enlaces ftp a contenidos en la categoría P?
SELECT w.webID, w.webTitle, c.category
FROM webpage w
JOIN ftpLink f ON w.webID = f.webID
JOIN courseware c ON f.cID = c.cID
WHERE category = "P"
GROUP BY w.webID;