import os
import unittest
from functools import partial
from backend.db.db_accessor import get_tests_by_type, get_test_by_id, set_result_by_id
from test.TestingHelper import assert_meaning, ask_question


def run_tests():
    tests = get_tests_by_type()
    for doc in tests:
        actual = ask_question(doc['question'])
        a = assert_meaning(
            doc['expected'], actual)
        print(a)


def run_test_by_id(id):
    test = get_test_by_id(id)
    if test['type'] == 'IntegrationTest':
        success, actual = run_integration_test(test)
    set_result_by_id(id, actual, success)
    return success, actual


def run_integration_test(test):
    actual = ask_question(test['question'])
    actual = actual.replace('"', '')
    a = assert_meaning(
        test['expected'], actual)
    return a, actual
