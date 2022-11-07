"""Modbus server module"""
import asyncio
from pymodbus.datastore import (ModbusSequentialDataBlock, ModbusSlaveContext,
                                ModbusServerContext)
from pymodbus.server import StartAsyncTcpServer  # pylint: disable-msg=E0611


datablock = ModbusSequentialDataBlock(0x00, [0] * 100)
context = ModbusSlaveContext(
            di=datablock,
            co=datablock,
            hr=datablock,
            ir=datablock,
        )
SINGLE = True
store = ModbusServerContext(slaves=context, single=SINGLE)


async def run_async_server():
    """Run server"""
    server = await StartAsyncTcpServer(
        context=store,  # Data storage
        address=("", 5020),  # Listen address
    )
    return server


if __name__ == "__main__":
    print(type())
    asyncio.run(run_async_server())
