import unittest

from test.TestingHelper import assert_meaning, ask_question


class IntegrationTest(unittest.TestCase):
    def test_first(self):
        actual= ask_question("Auf welchem Rang war Hegi im Barren?")
        # answer_question
        assert_meaning(self, "8ter Rang", actual)