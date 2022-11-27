"""Test module"""
import argparse
from pymodbus.client import ModbusTcpClient  # pylint: disable-msg=E0611


def cb_write_test(ip_add, value):
    """test cd"""
    client = ModbusTcpClient(ip_add, 502)
    client.write_coil(0, value)
    client.close()


def cb_read_test(ip_add):
    """read test"""
    client = ModbusTcpClient(ip_add, 502)
    result = client.read_coils(1, 1)
    print("Result: " + str(result.bits[0]))
    client.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Modbus Server to manage CB \
        status variable')
    required_named = parser.add_argument_group('required named arguments')
    required_named.add_argument('--ip', help='IP address', required=True)
    parser.add_argument('-t', '--true', help='set True to CB (default)',
                        action='store_true')
    parser.add_argument('-f', '--false', dest='true', help='set False to CB',
                        action='store_false')
    parser.add_argument('-w', '--write', help='set True to CB (default)',
                        action='store_true')
    parser.add_argument('-r', '--read', dest='write', help='set False to CB',
                        action='store_false')
    parser.set_defaults(true=True)
    parser.set_defaults(write=True)
    args = parser.parse_args()

    if args.write:
        cb_write_test(args.ip, args.true)
    else:
        cb_read_test(args.ip)
