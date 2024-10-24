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
