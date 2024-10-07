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

ALTER TABLE `ergebnisse_gy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verein_gyfk_constraint` (`verein`),
  ADD KEY `disziplin_gyfk_constraint` (`disziplin`);

ALTER TABLE `ergebnisse_gy`
  ADD CONSTRAINT `disziplin_gyfk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`),
  ADD CONSTRAINT `verein_gyfk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`);