//
//  swift
//  SOL Ponto
//
//  Created by Sósthenes Oliveira Lima on 02/10/23.
//

import Foundation

enum TipoData {
    case horario, dataEHorario
}

struct FormatadorDeData {
        
    func getData(_ data: Date) -> String {
        let formatador = DateFormatter()
        formatador.timeZone = TimeZone(abbreviation: "GMT-3")
        formatador.dateFormat = "dd/MM/yyyy HH:mm"
        
        return formatador.string(from: data)
    }
    
    func getHorario(_ data: Date) -> String {
        let formatador = DateFormatter()
        formatador.timeZone = TimeZone(abbreviation: "GMT-3")
        formatador.dateFormat = "HH:mm"
        
        return formatador.string(from: data)
    }
}
