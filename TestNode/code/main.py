"""Test module"""
import argparse
from pymodbus.client import ModbusTcpClient  # pylint: disable-msg=E0611


def cb_test(cb_index, value):
    """test cd"""
    if cb_index == 0:
        client = ModbusTcpClient('10.0.0.24', 502)
        client.write_coil(1, value)
    elif cb_index == 3:
        client = ModbusTcpClient('10.0.0.22', 502)
        client.write_coil(3, value)
    elif cb_index == 4:
        client = ModbusTcpClient('10.0.0.23', 502)
        client.write_coil(3, value)
    elif cb_index == 5:
        client = ModbusTcpClient('10.0.0.23', 502)
        client.write_coil(2, value)
    elif cb_index == 7:
        client = ModbusTcpClient('10.0.0.22', 502)
        client.write_coil(4, value)
    elif cb_index == 8:
        client = ModbusTcpClient('10.0.0.22', 502)
        client.write_coil(5, value)
    elif cb_index == 9:
        client = ModbusTcpClient('10.0.0.21', 502)
        client.write_coil(4, value)
    elif cb_index == 10:
        client = ModbusTcpClient('10.0.0.21', 502)
        client.write_coil(5, value)
    elif cb_index == 11:
        client = ModbusTcpClient('10.0.0.21', 502)
        client.write_coil(6, value)
    elif cb_index == 12:
        client = ModbusTcpClient('10.0.0.21', 502)
        client.write_coil(7, value)
    else:
        print('qualcosa')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Modbus Server to manage CB \
        status variable')
    required_named = parser.add_argument_group('required named arguments')
    required_named.add_argument('--cb', help='CB index number',
                                type=int, required=True)
    parser.add_argument('-t', '--true', help='set True to CB (default)',
                        action='store_true')
    parser.add_argument('-f', '--false', dest='true', help='set False to CB',
                        action='store_false')
    parser.set_defaults(true=True)
    args = parser.parse_args()
    cb_test(args.cb, args.true)
