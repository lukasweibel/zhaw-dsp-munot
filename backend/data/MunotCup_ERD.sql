----------------------------------------------------
-- CREATE Tables
----------------------------------------------------
CREATE TABLE `disziplinen` (
  `id` int(9) NOT NULL,
  `name` varchar(300) NOT NULL,
  `kuerzel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ergebnisse_gy` (
  `id` int(9) NOT NULL,
  `rang` int(11) NOT NULL DEFAULT '999',
  `verein` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `pnote_1dg` double NOT NULL DEFAULT '-1',
  `tnote_1dg` double NOT NULL DEFAULT '-1',
  `ordabzuege_1dg` double NOT NULL DEFAULT '-1',
  `besvork_1dg` double NOT NULL DEFAULT '-1',
  `note_1dg` double NOT NULL DEFAULT '-1',
  `rang_1dg` int(11) NOT NULL DEFAULT '999',
  `pnote_2dg` double NOT NULL DEFAULT '-1',
  `tnote_2dg` double NOT NULL DEFAULT '-1',
  `ordabzuege_2dg` double NOT NULL DEFAULT '-1',
  `besvork_2dg` double NOT NULL DEFAULT '-1',
  `note_2dg` double NOT NULL DEFAULT '-1',
  `total` double NOT NULL DEFAULT '-1',
  `anzahl_turnende` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ergebnisse_vgt` (
  `id` int(9) NOT NULL,
  `rang` int(11) NOT NULL DEFAULT '999',
  `verein` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `einzelausfuehrung_1dg` double NOT NULL DEFAULT '-1',
  `synchronitaet_1dg` double NOT NULL DEFAULT '-1',
  `programm_1dg` double NOT NULL DEFAULT '-1',
  `ordabzuege_1dg` double NOT NULL DEFAULT '-1',
  `note_1dg` double NOT NULL DEFAULT '-1',
  `rang_1dg` int(11) NOT NULL DEFAULT '999',
  `einzelausfuehrung_2dg` double NOT NULL DEFAULT '-1',
  `synchronitaet_2dg` double NOT NULL DEFAULT '-1',
  `programm_2dg` double NOT NULL DEFAULT '-1',
  `ordabzuege_2dg` double NOT NULL DEFAULT '-1',
  `note_2dg` double NOT NULL DEFAULT '-1',
  `total` double NOT NULL DEFAULT '-1',
  `anzahl_turnende` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `materialien` (
  `id` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `bezeichnung` varchar(300) NOT NULL,
  `vorhanden` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `session` (
  `id` int(9) NOT NULL,
  `verein` int(9) NOT NULL,
  `cookie` varchar(100) NOT NULL,
  `started` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `closed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `settings` (
  `thekey` varchar(20) NOT NULL,
  `thevalue` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `verein` (
  `id` int(9) NOT NULL,
  `vereinsname` varchar(300) NOT NULL,
  `vereinsname_suffix` varchar(300) DEFAULT NULL,
  `startetunterjugend` tinyint(1) NOT NULL,
  `gruendungsjahr` int(4) DEFAULT NULL,
  `anzahlaktivemitglieder` int(4) DEFAULT NULL,
  `prominente` varchar(500) DEFAULT '',
  `saisonziele` varchar(500) DEFAULT '',
  `homepage` varchar(100) DEFAULT NULL,
  `kontaktvorname` varchar(100) NOT NULL,
  `kontaktnachname` varchar(100) NOT NULL,
  `kontaktadresse` varchar(100) NOT NULL,
  `kontaktplz` varchar(100) NOT NULL,
  `kontaktort` varchar(100) NOT NULL,
  `kontakttelefon` varchar(100) NOT NULL,
  `abhaengigkeiten` varchar(500) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `passwort` varchar(300) NOT NULL,
  `unsubscribed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vereinmachtdisziplin` (
  `verein` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `anzahlturner` int(4) NOT NULL,
  `dauer` time NOT NULL,
  `erfolge` varchar(500) DEFAULT '',
  `leitung` varchar(300) DEFAULT '',
  `vorfuehrungerstmalwettkampf` tinyint(1) DEFAULT NULL,
  `wieoftdisziplinmunotcup` int(4) DEFAULT NULL,
  `besonderheiten` varchar(500) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vereinmachtdisziplinmaterialien` (
  `verein` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `material` int(9) NOT NULL,
  `anzahl` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vereinmachtisziplinzusatzangaben` (
  `verein` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `zusatzangabe` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `zusatzangaben` (
  `id` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `angabe` varchar(300) NOT NULL,
  `exclusive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

----------------------------------------------------
-- ALTER Tables (INDEX)
----------------------------------------------------
ALTER TABLE `ergebnisse_gy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verein_gyfk_constraint` (`verein`),
  ADD KEY `disziplin_gyfk_constraint` (`disziplin`);

ALTER TABLE `ergebnisse_vgt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verein_fk_constraint` (`verein`),
  ADD KEY `disziplin_fk_constraint` (`disziplin`);

ALTER TABLE `materialien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disziplin_materialfk_constraint` (`disziplin`);

ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verein_sessionfk_constraint` (`verein`);

ALTER TABLE `settings`
  ADD PRIMARY KEY (`thekey`);

ALTER TABLE `verein`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `vereinmachtdisziplin`
  ADD PRIMARY KEY (`verein`,`disziplin`),
  ADD KEY `disziplin_vmdfk_constraint` (`disziplin`),
  ADD KEY `verein_vmdfk_constraint` (`verein`);

ALTER TABLE `vereinmachtdisziplinmaterialien`
  ADD PRIMARY KEY (`verein`,`disziplin`,`material`),
  ADD KEY `disziplin_vmdmfk_constraint` (`disziplin`),
  ADD KEY `verein_vmdmfk_constraint` (`verein`),
  ADD KEY `material_vmdmfk_constraint` (`material`);

ALTER TABLE `vereinmachtisziplinzusatzangaben`
  ADD PRIMARY KEY (`verein`,`disziplin`,`zusatzangabe`),
  ADD KEY `disziplin_vmdzfk_constraint` (`disziplin`),
  ADD KEY `verein_vmdzfk_constraint` (`verein`),
  ADD KEY `zusatzangabe_vmdzfk_constraint` (`zusatzangabe`);

ALTER TABLE `zusatzangaben`
  ADD PRIMARY KEY (`id`);

----------------------------------------------------
-- ALTER Tables (CONSTRAINTS)
----------------------------------------------------
ALTER TABLE `ergebnisse_gy`
  ADD CONSTRAINT `disziplin_gyfk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`),
  ADD CONSTRAINT `verein_gyfk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`);

ALTER TABLE `ergebnisse_vgt`
  ADD CONSTRAINT `disziplin_fk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`),
  ADD CONSTRAINT `verein_fk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`);

ALTER TABLE `materialien`
  ADD CONSTRAINT `disziplin_materialfk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `session`
  ADD CONSTRAINT `verein_sessionfk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `vereinmachtdisziplin`
  ADD CONSTRAINT `disziplin_vmdfk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `verein_vmdfk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `vereinmachtdisziplinmaterialien`
  ADD CONSTRAINT `disziplin_vmdmfk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `material_vmdmfk_constraint` FOREIGN KEY (`material`) REFERENCES `materialien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `verein_vmdmfk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `vereinmachtisziplinzusatzangaben`
  ADD CONSTRAINT `disziplin_vmdzfk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `verein_vmdzfk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zusatzangabe_vmdzfk_constraint` FOREIGN KEY (`zusatzangabe`) REFERENCES `zusatzangaben` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
