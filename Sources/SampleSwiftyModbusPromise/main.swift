import Foundation
import SwiftyModbusPromise
import PromiseKit

let modbus = SwiftyModbusPromise(address: "127.0.0.1", port: 503)
modbus.responseTimeout = 1.5      // Set timeout for 1.5 sec
print(modbus.responseTimeout)

firstly {
    modbus.connect()
}.then {
    modbus.readRegisters(addr: 102, count: 10)
}.done { registers in
    print(registers)
}.then {
    modbus.writeRegisters(addr: 102, data: [1,2,3,4,5,6,7,8,9,10])
}.then {
    modbus.readInputRegisters(addr: 102, count: 10)
}.done { registers in
    print(registers)
}.then {
    modbus.writeBits(addr: 104, status: [0,1,0,1])
}.then {
    modbus.readBits(addr: 104, count: 4)
}.done { bits in
    print(bits)
}.then {
    modbus.disconnect()
}.catch { error in
    print(error)
}.finally {
    exit(0)
}

RunLoop.main.run()
