"""General IED module"""
import argparse


CB_STATUS = 0
CB_INDEX = "0"


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Modbus Server to manage CB \
        status variable')
    required_named = parser.add_argument_group('required named arguments')
    required_named.add_argument('-cb', '--cb', help='cb number', required=True)
    args = parser.parse_args()

    CB_INDEX = args.cb
