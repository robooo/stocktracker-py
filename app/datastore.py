import csv
import os


class DataStore:

    def __init__(self, filename):
        self._filename = filename

    def load(self):
        exists = os.path.isfile(self._filename)
        if not exists:
            return {}

        with open(self._filename, 'r') as file_stream:
            return self._load_dict_from_stream(file_stream)

    def save(self, port):
        self._validate_is_a_dict(port)
        with open(self._filename, 'w') as outfile:
            self._save_dict_to_stream(outfile, port)

    @staticmethod
    def _load_dict_from_stream(stream):
        reader = csv.reader(stream)
        stream_as_dict = {row[0]: int(row[1]) for row in reader if row}
        return stream_as_dict

    @staticmethod
    def _validate_is_a_dict(input):
        if not isinstance(input, dict):
            raise ValueError('Portfolio not a dict: {}'.format(input))

    @staticmethod
    def _save_dict_to_stream(stream, a_dict):
        writer = csv.writer(stream)
        for item in a_dict.items():
            writer.writerow(item)
