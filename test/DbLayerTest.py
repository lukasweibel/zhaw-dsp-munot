import unittest

from backend.layers.db_layer import generate_sql


class DbLayerTest(unittest.TestCase):
    def test_barren_expect_ergebnisse_vgt(self):
        actual = generate_sql("Wer wurde erster in der Disziplin Barren?")
        self.assertTrue("ergebnisse_vgt" in actual)

    def test_boden_expect_ergebnisse_vgt(self):
        actual = generate_sql("Wer wurde erster in der Disziplin Boden?")
        self.assertTrue("ergebnisse_vgt" in actual)

    def test_reck_expect_ergebnisse_vgt(self):
        actual = generate_sql("Wer wurde erster in der Disziplin Reck?")
        self.assertTrue("ergebnisse_vgt" in actual)

    def test_sprung_expect_ergebnisse_vgt(self):
        actual = generate_sql("Wer wurde erster in der Disziplin Sprung?")
        self.assertTrue("ergebnisse_vgt" in actual)

    def test_schaukelringe_expect_ergebnisse_vgt(self):
        actual = generate_sql("Wer wurde erster in der Disziplin Schaukelringe?")
        self.assertTrue("ergebnisse_vgt" in actual)

    def test_schulstuffenbarren_expect_ergebnisse_vgt(self):
        actual = generate_sql("Wer wurde erster in der Disziplin Schulstuffenbarren?")
        self.assertTrue("ergebnisse_vgt" in actual)

    def test_gerätekombination_expect_ergebnisse_vgt(self):
        actual = generate_sql("Wer wurde erster in der Disziplin Gerätekombination?")
        self.assertTrue("ergebnisse_vgt" in actual)

    def test_teamaerobic_expect_ergebnisse_vgt(self):
        actual = generate_sql("Wer wurde erster in der Disziplin Team Aerobic?")
        self.assertTrue("ergebnisse_gy" in actual)

    def test_gymnastikvereins_expect_ergebnisse_vgt(self):
        actual = generate_sql("Wer wurde erster in der Disziplin Gymnastik Verein S?")
        self.assertTrue("ergebnisse_gy" in actual)
