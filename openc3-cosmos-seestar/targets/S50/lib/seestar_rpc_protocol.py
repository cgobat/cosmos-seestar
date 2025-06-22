
import json
from openc3.utilities.logger import Logger
from openc3.interfaces.protocols.burst_protocol import BurstProtocol


class SeestarRpcProtocol(BurstProtocol):

    def __init__(self):
        super().__init__()
        self.rpc_id_value = 0

    def read_data(self, data, extra=None):
        packet_data, extra = super().read_data(data, extra)
        if isinstance(packet_data, (bytes, bytearray)) and packet_data.startswith(b'{'):
        #     packet_data = packet_data.rstrip(b'\r\n')
            data_dict = json.loads(packet_data)
            try:
                Logger.info(f"Received '{data_dict['Event']}' event ({len(packet_data)}B)")
            except KeyError:
                if data_dict["method"] == "test_connection":
                    pass
                else:
                    Logger.info(f"Received '{data_dict['method']}' method response ({len(packet_data)}B)")
        # Logger.info(f"Got data: {packet_data}")
        return packet_data, extra

    def write_data(self, data, extra=None):
        data, extra = super().write_data(data, extra)
        if isinstance(data, (bytes, bytearray)) and data.startswith(b'{'):
            data_dict = json.loads(data)
            data_dict["id"] = self.rpc_id_value
            self.rpc_id_value += 1
            data = bytearray(json.dumps(data_dict).encode())
        # Logger.info(f"Sending data: {data}")
        return data, extra
