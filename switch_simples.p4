// Definição dos cabeçalhos
header ethernet_t {
    mac_addr dstAddr;
    mac_addr srcAddr;
    ethertype ethType;
}

header ipv4_t {
    bit<4> version;
    bit<4> ihl;
    bit<8> tos;
    bit<16> totalLen;
    bit<16> ident;
    bit<3> flags;
    bit<13> fragOffset;
    bit<8> ttl;
    bit<8> protocol;
    bit<16> hdrChecksum;
    bit<32> srcAddr;
    bit<32> dstAddr;
}

// Definição do parser
parser MyParser(packet_in packet, out ethernet_t eth_hdr, out ipv4_t ipv4_hdr) {
    state start {
        packet.extract(eth_hdr);
        transition select(eth_hdr.ethType) {
            0x0800 : parse_ipv4;
            default : accept;
        }
    }
    state parse_ipv4 {
        packet.extract(ipv4_hdr);
        transition accept;
    }
}

// Definição da tabela de encaminhamento
table my_forwarding_table {
    key = {
        ipv4_hdr.dstAddr : exact;
    }
    actions = {
        forward;
        drop;
    }
    size = 1024;
}

// Definição da ação de encaminhamento
action forward() {
    // Código para encaminhar o pacote para uma porta específica
}

// Processo de controle
control MyControl(inout ethernet_t eth_hdr, inout ipv4_t ipv4_hdr) {
    apply {
        my_forwarding_table.apply();
    }
}

