import Foundation
import SwiftyModbus

let modbusQueue = DispatchQueue(label: "queue.modbus")

modbusQueue.async {
    modbusIO()
}
RunLoop.main.run()

func modbusIO() {
    let modbus = SwiftyModbusResult(address: "127.0.0.1", port: 503)
    modbus.responseTimeout = 1.5      // Set response timeout for 1.5 sec
    print("Modbus responce timeout:", modbus.responseTimeout)

    if case let .failure(error) = modbus.connect() {
        print(error.message)
        exit(1)
    }

    do {
        let registers = try modbus.readRegisters(addr: 102, count: 10).get()
        print(registers)
        try modbus.writeRegisters(addr: 102, data: [1,2,3,4,5,6,7,8,9,10]).get()
        let inputRegisters = try modbus.readInputRegisters(addr: 102, count: 10).get()
        print(inputRegisters)
        try modbus.writeBits(addr: 104, status: [0,1,0,1]).get()
        let bits = try modbus.readBits(addr: 104, count: 4).get()
        print(bits)
        modbus.disconnect()
        exit(0)
    } catch {
        print(error)
        exit(1)
    }
}
