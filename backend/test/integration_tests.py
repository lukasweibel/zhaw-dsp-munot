from functools import partial
from backend.db.db_accessor import get_tests_by_type, get_test_by_id, set_result_by_id, create_testrun, get_types
from test.TestingHelper import assert_meaning, ask_question


def run_tests_by_type(type):
    tests = []
    print(type)
    print(type == 'all')
    if type == 'all':
        types = get_types()
        print(types)
        for t in types:
            tests += get_tests_by_type(t['name'])
    else:
        tests = get_tests_by_type(type)

    results = []
    testrun = {
        'type': type
    }
    run_id = create_testrun(testrun)
    for test in tests:
        success, actual = run_integration_test(test)
        set_result_by_id(test['_id'], actual, success, run_id)
        results.append({
            "id": test['_id'],
            "success": success,
            "actual": actual,
            "question": test['question'],
            "expected": test['expected']
        })
    return results


def run_test_by_id(id):
    test = get_test_by_id(id)
    success, actual = run_integration_test(test)
    set_result_by_id(id, actual, success, None)
    return success, actual


def run_integration_test(test):
    actual = ask_question(test['question'])
    actual = actual.replace('"', '')
    a = assert_meaning(
        test['expected'], actual)
    return a, actual
