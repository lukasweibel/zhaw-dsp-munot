import unittest
import csv
import os
from datetime import datetime

test_classes = ['DbLayerTest.py']

csv_file_name = 'results.csv'


def run_all_tests():
    user_input = "No comment"

    results = []
    loader = unittest.TestLoader()

    for test_class in test_classes:
        suite = loader.discover(start_dir='.', pattern=test_class)

        runner = unittest.TextTestRunner()
        result = runner.run(suite)

        number_of_tests = result.testsRun
        number_of_errors = len(result.errors)
        number_of_failures = len(result.failures)

        successful = number_of_tests - (number_of_errors + number_of_failures)

        print(f"{test_class}: {successful}/{number_of_tests} "
              f"(Failures: {number_of_failures}, Errors: {number_of_errors})")

        results.append(test_class)
        results.append(successful)
        results.append(number_of_tests)

    results.insert(0, user_input)
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    results.insert(0, timestamp)

    write_to_csv(results)


def write_to_csv(results):
    file_exists = os.path.isfile(csv_file_name)

    with open(csv_file_name, mode='a', newline='') as file:
        writer = csv.writer(file)

        if not file_exists:
            fieldnames = ['Timestamp', 'Notes']
            for test_class in test_classes:
                fieldnames.extend([test_class, 'Successful', 'Total'])
            writer.writerow(fieldnames)

        writer.writerow(results)


if __name__ == "__main__":
    run_all_tests()
