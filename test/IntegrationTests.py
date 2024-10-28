import unittest

from test.TestingHelper import assert_meaning, ask_question


class IntegrationTest(unittest.TestCase):
    def test_hegi_barren_expect_eight(self):
        actual = ask_question("Auf welchem Rang war Hegi im Barren?")
        a = assert_meaning("Hegi war auf dem 8. Rang im Barren.", actual)
        self.assertTrue(a)

    def test_first_boden_excute_xyz(self):
        actual = ask_question("Welcher Verein war erster im Boden turnen?")
        a = assert_meaning("Keine Daten vorhanden", actual)
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

    def test_abkürzung_boden(self):
        actual = ask_question(
            "Was ist die Abkürzung für die Disziplin Team Aerobic?")
        a = assert_meaning("Die abkürzung ist TAE.", actual)
        self.assertTrue(a)
