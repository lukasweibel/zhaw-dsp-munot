import unittest

from test.TestingHelper import assert_meaning, ask_question


class IntegrationTest(unittest.TestCase):
    def test_hegi_barren_expect_eight(self):
        actual = ask_question("Auf welchem Rang war Hegi im Barren?")
        a = assert_meaning("Hegi war auf dem 8. Rang im Barren.", actual)
        self.assertTrue(a)

    def test_first_boden_excute_xyz(self):
        actual = ask_question("Welcher Verein war erster im Boden turnen?")
        a = assert_meaning(
            "Der erste Verein im Bodenturnen war der GTT Tägerwilen.", actual)
        self.assertTrue(a)

    def test_timetable_egg(self):
        actual = ask_question(
            "Um welche Zeit turnt der TV Egg in der Disziplin GYR?")
        a = assert_meaning(
            "Der TV Egg turnt um 10:20 Uhr und 11:05 Uhr in der Disziplin GYR.", actual)
        self.assertTrue(a)

    def test_weisungen_note(self):
        actual = ask_question(
            "Was ist die maximal Note einer Aufführung und aus welchen Teilnoten besteht die Endnote?")
        a = assert_meaning(
            "Die maximal Note ist eine 10.00 und die Endnote besteht aus den Teilnoten Einzelausführung, Synchronität und Programm.", actual)
        self.assertTrue(a)

    def test_gruendungsjahr_TV_Egg(self):
        actual = ask_question("Was ist das Grundüngsjahr der TV Egg?")
        a = assert_meaning("Das Gründungsjahr der TV Egg ist 1902", actual)
        self.assertTrue(a)

    def test_rang_und_disziplin_russikon(self):
        # TODO: expected herausfinden
        actual = ask_question(
            "Auf welchem Rang war Russikon? Und in welcher Disziplin?")
        a = assert_meaning(
            "Russikon war auf dem 6. Rang in der Disziplin XY", actual)
        self.assertTrue(a)

    def test_rang_russikon_team_aerobic_und_maximalpunktzahl(self):
        # TODO: expected herausfinden
        actual = ask_question(
            "Auf welchem Rang war Russikon in der Disziplin Team Aerobic und was ist die maximale Punktzahl?")
        a = assert_meaning(
            "Russikon war auf dem ersten Rang in der Disziplin Team Aerobic. Die maximale Punktzahl beträgt X.", actual)
        self.assertTrue(a)

    def test_zeit_TV_Egg_BA(self):
        # TODO: expected herausfinden
        actual = ask_question("Wann turnt der TV Egg BA?")
        a = assert_meaning("Der Verein TV Egg BA turnt um XY", actual)
        self.assertTrue(a)

    def test_abzug_verstoss(self):
        actual = ask_question(
            "Wieviel Abzug gibt Verstoss gegen die Teilnahmeberechtigung?")
        a = assert_meaning(
            "Ein Verstoss gegen die Teilnahmeberechtigung führt zu einem Abzug von 1.0 Punkt.", actual)
        self.assertTrue(a)

    def test_zeit_TSV_Rohrdorf_Kategorie_RE(self):
        # TODO: expected herausfinden
        actual = ask_question(
            "Wann turnt der TSV Rohrdorf in der Kategorie RE?")
        a = assert_meaning(
            "Der Verein TSV Rohrdorf turnt um XY in der Kategorie RE", actual)
        self.assertTrue(a)

    def test_disziplin_TV_Andelfingen_Zeit(self):
        actual = ask_question(
            "Welche Disziplin turnt der Verein TV Andelfingen um 13:40?")
        a = assert_meaning(
            "Der Verein TV Andelfingen turn um 13:40 die Disziplin BA", actual)
        self.assertTrue(a)
