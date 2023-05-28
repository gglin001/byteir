// RUN: byteir-opt %s -byre-host="device-file-name=your_file target=cuda entry-func=forward" | FileCheck %s

// CHECK-LABEL: func.func @forward

module attributes {byre.container_module, gpu.container_module, torch.debug_module_name = "GraphModule"} {
  gpu.module @unified {
    gpu.func @Unknown2(%arg0: memref<10xf32>, %arg1: memref<2x10xf32>, %arg2: memref<2x10xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c20 = arith.constant 20 : index
      %c10 = arith.constant 10 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c20 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c10 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c10 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c10 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg1[%15, %9] : memref<2x10xf32>
        %17 = memref.load %arg0[%9] : memref<10xf32>
        %18 = arith.addf %16, %17 : f32
        memref.store %18, %arg2[%15, %9] : memref<2x10xf32>
      }
      gpu.return
    }
    gpu.func @Unknown1(%arg0: memref<20xf32>, %arg1: memref<2x20xf32>, %arg2: memref<2x20xf32>) kernel {
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c40 = arith.constant 40 : index
      %c20 = arith.constant 20 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c40 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c20 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c20 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c20 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg1[%15, %9] : memref<2x20xf32>
        %17 = memref.load %arg0[%9] : memref<20xf32>
        %18 = arith.addf %16, %17 : f32
        %19 = arith.maxf %18, %cst : f32
        memref.store %19, %arg2[%15, %9] : memref<2x20xf32>
      }
      gpu.return
    }
    gpu.func @Unknown0(%arg0: memref<20xf32>, %arg1: memref<2x20xf32>, %arg2: memref<2x20xf32>) kernel {
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c40 = arith.constant 40 : index
      %c20 = arith.constant 20 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c40 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c20 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c20 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c20 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg1[%15, %9] : memref<2x20xf32>
        %17 = memref.load %arg0[%9] : memref<20xf32>
        %18 = arith.addf %16, %17 : f32
        %19 = arith.maxf %18, %cst : f32
        memref.store %19, %arg2[%15, %9] : memref<2x20xf32>
      }
      gpu.return
    }
  }
  func.func @forward(%arg0: memref<2x10xf32, "cuda"> {byre.argname = "Input0", byre.argtype = 1 : i32}, %arg1: memref<2x10xf32, "cuda"> {byre.argname = "Output0", byre.argtype = 2 : i32}) attributes {byre.entry_point} {
    %alloc = memref.alloc() : memref<160xi8, "cuda">
    %alloc_0 = memref.alloc() : memref<160xi8, "cuda">
    %alloc_1 = memref.alloc() : memref<20xf32, "cuda">
    byre.compute @FillOp(%alloc_1) {memory_effects = [2 : i32], value = dense<[0.101879634, -0.178835288, -0.0953023583, -0.0698504745, -0.19658649, -0.297641844, -0.223349303, 0.168986112, 9.007710e-02, 0.101534814, -0.0601868108, -0.0958566219, -0.243612081, 0.198881537, -0.293788224, -0.240900397, 0.184188008, 0.210917979, 0.121171109, -0.155078679]> : tensor<20xf32>} : memref<20xf32, "cuda">
    %alloc_2 = memref.alloc() : memref<20xf32, "cuda">
    byre.compute @FillOp(%alloc_2) {memory_effects = [2 : i32], value = dense<[0.124238588, -0.0375917405, -0.178324029, 2.1018261E-4, -0.0708629936, 0.179958493, 0.201986402, -0.0302014686, -0.0842267424, 0.0796111747, 0.0201944318, -0.183529228, -0.133614406, -0.0192934573, 0.193412527, 0.219010666, -0.0464102961, 0.00334274326, -0.0029087835, 0.0903228372]> : tensor<20xf32>} : memref<20xf32, "cuda">
    %alloc_3 = memref.alloc() : memref<10xf32, "cuda">
    byre.compute @FillOp(%alloc_3) {memory_effects = [2 : i32], value = dense<[0.0670170113, 0.0825609341, -0.125343189, -0.0073415176, -0.100303039, -0.214000896, 0.114002995, 0.21737574, 0.166609675, -0.119800359]> : tensor<10xf32>} : memref<10xf32, "cuda">
    %alloc_4 = memref.alloc() : memref<20x10xf32, "cuda">
    byre.compute @FillOp(%alloc_4) {memory_effects = [2 : i32], value = dense<"0xD60ED23D6677593EEDD4253D579F523E952583BD454F62BE2C2AB53D827CF4BD7F4D41BD15896C3DDEFF3B3D5270AF3D461635BC07D5B8BDB82761BE33120CBE692C35BCDB70183EED6F4D3E271EAD3DFBC1653B77D0473E7920B43C2135C43C1780C2BBD145D43C15B1203DAAD3623C9A1808BECF144D3E7AFAC43D933CF8BDFE637BBD21BE53BEADCA233E250529BD4576FABD2B7B84BCCCB48FBC84B3D6BDAB54263EC31061BEF81913BE3E001C3E4D7A0E3EE4CE4EBE2119CFBDC6B6123EB3CA01BEB506BF3DDA0774BD37FD1E3D1EB44BBE38E409BE994A1FBE74FFDB3DBB05A93D29209A3D756B01BDEAA162BD602A03BE522F3FBE9C1DDC3D486F1EBEB99D21BEE05813BE074943BE4233E33C32BBFA3D81F31ABE747C53BEC1814A3EA77B363E551E113E65E5673D0EDAC4BDC9732E3DD45C3C3E1BCB113E9DD61DBDC754B93DC9CB88BCB5D84DBEF14E443ED54E1EBE659C343E349F62BEF5BBD73D1042FDBDBFDD4EBD306D813DE33C16BE39B00EBE946CD7BDB97CC9BD08A411BDC933103EDE725FBEF3C1553D830E3B3CBFD7253ECFBD0D3EDC6CD83DA6EA563D9238C53C1405B2BD4948D83C0A72B03DEC8AD93DD04F3A3E96216E3C0351123E034807BE0929E7BDD3E3453DCD388B3D68C034BCE7650E3E41C70D3E392C32BEEA885CBC19FFD9BD8B68F83C6FE3B5BCC302633E736E193ED8D1503EBEB64B3EE0263C3EAC4E223DB90511BE36A5443E86AA713C3698A3BCB129A93D517218BEA7BB51BECA19393E8948043E5DE08BBDA1F012BED3483E3EB3F664BEEB093DBEEF2FB7BC3243F6BC2EFA283EB41EF5BDF16A573D19E6E83DDCF4F23DA4D8C3BD4877DFBC1B13303B60330D3ECA5569BD97A090BD3A5E9C3D3565B63DE54F6BBDAC1B29BDDEB4CD3D6C5006BE61B08FBC5AD9DA3B80340EBE933AD83D6334E93CE5F18EBDCC3D73BD128D2ABD46CA34BDDDA5BABDE0C404BD533F223D3072B4BD7D7C413EB831DABD3359BBBB0A69993D6024AD3D0D0EE9BDBD5A80BC7FA6E83D400BFBBD616438BE34CBC73D4769D73D4E295EBEECBE843C838E9CBDA171FA3DDCED3EBE9FEDA6BDAD78A8BDD19702BD18B3043E39CF873C46E602BCD0CBC33D"> : tensor<20x10xf32>} : memref<20x10xf32, "cuda">
    %alloc_5 = memref.alloc() : memref<20x20xf32, "cuda">
    byre.compute @FillOp(%alloc_5) {memory_effects = [2 : i32], value = dense<"0x32A148BE93869BBDDF0E313EADAE1EBD5C52443E3506E7BBF2CFB3BD4CF5A13DBC209B3D697E213D4A14543DAB303B3EB6C1FA3B3524DBBCE1C81ABE9DDF51BEBF11173EFFDA4C3E6E8A2DBEF9F5013E6D99D1BDBEED34BDA2CFA0BCBFCE46BE85B19BBC4D7659BE398863BEC7A3DD3D590C1ABE4A942DBE9EB929BE6A0D20BE941C90BD097A76BC0640443EAE5B30BE723C573EC0EE403E0F2024BE3D24D53D3C565A3E62E5843DA45CAF3C41EC6DBBE2019E3D1D3A013E42C74CBE4E3CE63D734E60BE530B01BECD1844BEEC38BE3C19E862BEFC6F0DBEE58D4F3D03A7AA3D1DCF543C756D503E81D23BBEE0D914BE614360BCC40D4F3E5A313E3E34D6FDBD9C3519BE72500C3D1B39AABD9B2983BD110010BDAFAD27BCEAFFB5BD4A82103D8E7AD13CD2693FBE3E6125BE03FD743D3B3825BEB7FCD53DCCDA58BE2B3A4CBE1E9BDF3BFF38F73CC33C35BD40D157BEDD478A3CD1E6373E436BEEBD04BE2E3EBD5F2B3D1D7813BE0EF101BE0369A1BD8FF8D93D829D3A3E85CB2EBC6A2B023EEF8C273EB6F3C2BD27F955BDAE3B4ABC265A9D3D45B35D3E112654BB8BEEB6BDBD70993D7DDE62BEDB8017BEE2AC4FBE9F8E213E592C1B3E809B3DBE7DF30B3ED463133D672DEB3DEB5A44BEFFA2B03C894A33BE8A2935BE93A6223EE10741BEBD5F18BEDE0A0EBEEDE673BD23F447BEB37F3BBE052B503E5683343E13D6283EC693A03D751BB5BDF94F243E5014C23C003410BEEBBD613ECADD55BE56C2C3BD8922313DA41CF7BD0CF8D5BD13AA29BE8FE25B3ECC6652BE20FF4CBED78823BD32E5003E392A323DE1BAA13DFB3A9BBD9FF356BD3C4FE13DFDFA51BDB60E2C3EBEE61D3EC5EFDA3DE721A0BD13E8F3BC0C34F5BD3E911D3EFD7F38BD3C54933DC201E4BC35B79BBD09665BBE2F2FC8BDBEFA293E668CEDBD0F397ABDC1675D3EC0F1E03D164A5FBDAA43353C19AC2FBE1A2E90BC3881E6BDC3EA5EBE550D21BEB6B3023E1E97B0BD500C6DBD9577BB3D085E783C9044093D916844BE162F39BE955128BEB6F210BDA4C90BBDCD44643E511B3DBE8941593E30FEC73CBEC5D73D8FF2A2BDCB4F4B3E4F6DC2BB2249463E35888ABC80299C3D70BAFEBD40F617BEA941FFBDF13E123E4C305C3E5C838CBDF44A6EBD2A505EBEF0BFA83A8BC9E03DD0DA303D64522C3E58A96FBD7211593EC3BEA6BC14EF8ABDFE5949BE43880FBE46CE16BD097B633D7775193EB7E90F3ED2D3953DC271633D6BF8053DA6DFECBD5728953DB72E1DBD2B345DBD7053E83CE305B1BDF2F3013E0DE876BD8F1098BD7232E23D4CDE0C3DAF43A93D1A34DE3DFB1247BD569B3F3E09619BBD54502A3E6BA636BC17C3273EBE032E3E34F4173C54B10A3E9452EB3D82FDD33D005014BE578D51BDF3E116BE4EDE0F3E47BF58BEC35E793D7195303ED3A822BEA331963A9CF9403E1FD32DBD4EFCBB3DB47251BDD3A570BD3C32473E614DAD3A6978643EC49A543E02AA16BEDFDE243D7ADBE9BDE1224FBE6C6826BE5EC4083E7B00783D9E975C3EEF3A1FBDC7AD1DBDCB200EBDE55E993D734D97BC4C6E543E762EE83DBF6DFBBD5F161E3CB941F3BDF40BB2BD4C2E6ABD3B33963D7B3507BE3344553ED50454BD689A233E263939BE1D60D1BB4E3959BE0BAF203C719EC8BD48F3273EFB4B103D7943B0BDA66038BEC91500BE50263FBE52262FBE207BA93D661E823DEC4B56BE58CF3A3E913828BED66E42BE57F2B2BDFFB9503EE2FD4A3E2F23A43C542B493EE2CA34BE2966513EBB4B1FBD391127BEC942A7BD196DD9BD8AC012BD6514C1BC1F9E173EA59780BD511514BD9AB8F4BD339719BEB72639BE38C9D73CB5062F3E895743BD413055BE423D12BC402404BEB4A8463E4EA9F0BD57EA383C2432453C9611263ED58B283E6313C13DC2C95FBEA30B07BE15F2E4BD611C4BBE4FEF053CC73E013E9DF7B5BDED4160BE917CFDBD7FC9523E0A8B643EC300013E966686BDD0DC1ABE05B535BECD8A573E475E283DCECB5EBDFDE8B13D367E3EBEFCD7B43D3C7D24BECE26BD3D48BF20BEF7F0D7BB421F193E85BA77BDCAE272BAB0FD9CBD487E3FBEBBF9603D8B5E24BE27A9C33D95A2063E6DD0BC3DA359173EDA01A5BD505B97BDDEE6713D5283B43DE477DBBC674E2CBED5E3593DBCCB2FBED7D1303EA9753FBE017FC43DA94A9B3DE74A0E3E2FFC273EA596B2BDD8554A3C703E19BE04CF7BBD9155863D65FA1EBE144C573E709798BBF860CA3CC63F44BE"> : tensor<20x20xf32>} : memref<20x20xf32, "cuda">
    %alloc_6 = memref.alloc() : memref<10x20xf32, "cuda">
    byre.compute @FillOp(%alloc_6) {memory_effects = [2 : i32], value = dense<"0xEDAEFD3D6B88963E1051E33DFC7732BE055CEE3C07F9413E080B9CBE9B2F4ABE5608BD3BF8E6DFBD507F46BEC61183BEACE23ABEF010903E824129BEAFB6D83C779721BE953B2B3E8B44CB3BB09383BE2456463EA8E7983ECE3D9EBC690042BEF0D34CBD5AFCAB3DCC1AF13D8E3CF43B0BF2583EC82B583D658D653C79C131BE9AEF24BD85B4B03D46DBAF3DEB4013BD26A9693EB17CC43CEDAF77BEA24E5BBE409C203EA0BE27BCA3380BBEC03C5A3E2775633D62069C3E0DF3963D259F883E7AAD743EEB5AC8BD4B210F3ECE1F303E3D4983BDA3A3F63D3D993FBE868FF1BC89B98ABE13D72E3D5012703E826D35BE725C76BECA748B3ED59EA23D63F6103E2F3527BE354722BECE329DBE39E496BE46C71CBDC849E83D8BD2ADBD2596A73DF2DA0ABED46BA03D752989BDB8624CBE971808BEB1C184BDCC23743E36B4AB3C7D51683E7ADA4B3EDA6EDD3D2DFDF1BDC9A5D5BD948E7E3ECFCE7FBE6E9E813D85DBE43B6543143D379970BEA80F16BED17C18BD05E9193E0F403B3D26EDA43B808C9ABEA6A2823D08D786BE2314AABCD8D783BE562D9ABE2B60943E88C91ABEB2DC513E136825BEBB0DBD3D8E26E7BDF4464EBDD9E68E3E5B5115BE3FCF123E1E194FBE2CACBF3DC71E153D96F24B3E53E9E9BD407141BE714361BE4D2E963DA67B8F3EB62B78BE0D424E3D5EBB7F3D056098BEC5F011BDCB26033E1656DD3C60B90DBE7EFF583DE9C118BDDDF5673E451A58BD8E0C32BE121C05BC8D148E3ED80AEA3DBE27AA3A1F534B3E97023EBD85C231BEEB7CF33BF5FF363D32DCDBBDFBFED83DB640623D66E5EA3D785D2B3E4E7470BE651C673EDC57473E601A24BECF5FFABD38AA14BE9EFC60BCE3E5983E10EE7D3E2BE0453ECE3C41BE0A3B753E4225383D967059BDC197B8BD4FA407BE5C0C17BE0F16953E9884E7BC2E6CF6BDAF01453EB6F466BE37968ABE5BC056BECBD28E3ED9AC493DACC7103D46EB73BEBB39213DFD30F0BD835CD4BD426F4FBD620472BE67FB97BEFBAE8CBDF08F553EFAB77D3EFCC7D3BC76249D3EA2C404BE937B9B3E14197E3D30212D3E262F63BD7899D1BDF72C993E7537DE3D6FD39D3E988D4B3DDB132B3E097461BD8461313C"> : tensor<10x20xf32>} : memref<10x20xf32, "cuda">
    %0 = "byre.alias"(%alloc_0) {offset = 0 : i64} : (memref<160xi8, "cuda">) -> memref<2x20xf32, "cuda">
    byre.compute @MatmulOp_f32f32_f32(%arg0, %alloc_6, %0) {lhs_contracting_dimension = 1 : i64, memory_effects = [1 : i32, 1 : i32, 2 : i32], rhs_contracting_dimension = 0 : i64} : memref<2x10xf32, "cuda">, memref<10x20xf32, "cuda">, memref<2x20xf32, "cuda">
    %1 = "byre.alias"(%alloc) {offset = 0 : i64} : (memref<160xi8, "cuda">) -> memref<2x20xf32, "cuda">
    byre.compute @PTXOp(%alloc_1, %0, %1) {BlockSize.x = 128 : i32, GridSize.x = 1 : i32, arg_ranks = [1 : i32, 2 : i32, 2 : i32], kernel_name = "Unknown0", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<20xf32, "cuda">, memref<2x20xf32, "cuda">, memref<2x20xf32, "cuda">
    byre.compute @MatmulOp_f32f32_f32(%1, %alloc_5, %0) {lhs_contracting_dimension = 1 : i64, memory_effects = [1 : i32, 1 : i32, 2 : i32], rhs_contracting_dimension = 0 : i64} : memref<2x20xf32, "cuda">, memref<20x20xf32, "cuda">, memref<2x20xf32, "cuda">
    byre.compute @PTXOp(%alloc_2, %0, %1) {BlockSize.x = 128 : i32, GridSize.x = 1 : i32, arg_ranks = [1 : i32, 2 : i32, 2 : i32], kernel_name = "Unknown1", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<20xf32, "cuda">, memref<2x20xf32, "cuda">, memref<2x20xf32, "cuda">
    %2 = "byre.alias"(%alloc_0) {offset = 0 : i64} : (memref<160xi8, "cuda">) -> memref<2x10xf32, "cuda">
    byre.compute @MatmulOp_f32f32_f32(%1, %alloc_4, %2) {lhs_contracting_dimension = 1 : i64, memory_effects = [1 : i32, 1 : i32, 2 : i32], rhs_contracting_dimension = 0 : i64} : memref<2x20xf32, "cuda">, memref<20x10xf32, "cuda">, memref<2x10xf32, "cuda">
    byre.compute @PTXOp(%alloc_3, %2, %arg1) {BlockSize.x = 128 : i32, GridSize.x = 1 : i32, arg_ranks = [1 : i32, 2 : i32, 2 : i32], kernel_name = "Unknown2", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<10xf32, "cuda">, memref<2x10xf32, "cuda">, memref<2x10xf32, "cuda">
    return
  }
}