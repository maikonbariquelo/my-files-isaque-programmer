unit UDMNFe;

interface

uses
  // UFuncoesRede,

  Windows, SysUtils, Classes, ACBrNFeDANFEClass, ACBrNFeDANFERave, ACBrNFe, DB,
  IBCustomDataSet, IBQuery, frxClass, frxDBSet, frxExportRTF, frxExportXLS,
  frxExportPDF, frxExportMail, UGeConfigurarNFeACBr,

  ACBrUtil, pcnConversao, pcnNFeW, pcnNFeRTXT, pcnAuxiliar, ACBrNFeUtil, SHDocVw,
  IBUpdateSQL, IBSQL, frxDesgn;

type
  TDMNFe = class(TDataModule)
    ACBrNFe: TACBrNFe;
    rvDANFE: TACBrNFeDANFERave;
    qryDestinatario: TIBQuery;
    qryDestinatarioCODIGO: TIntegerField;
    qryDestinatarioPESSOA_FISICA: TSmallintField;
    qryDestinatarioCNPJ: TIBStringField;
    qryDestinatarioNOME: TIBStringField;
    qryDestinatarioINSCEST: TIBStringField;
    qryDestinatarioINSCMUN: TIBStringField;
    qryDestinatarioFONE: TIBStringField;
    qryDestinatarioEMAIL: TIBStringField;
    qryDestinatarioSITE: TIBStringField;
    qryDestinatarioTLG_TIPO: TSmallintField;
    qryDestinatarioTLG_DESCRICAO: TIBStringField;
    qryDestinatarioTLG_SIGLA: TIBStringField;
    qryDestinatarioLOG_COD: TIntegerField;
    qryDestinatarioLOG_NOME: TIBStringField;
    qryDestinatarioCOMPLEMENTO: TIBStringField;
    qryDestinatarioNUMERO_END: TIBStringField;
    qryDestinatarioCEP: TIBStringField;
    qryDestinatarioBAI_COD: TIntegerField;
    qryDestinatarioBAI_NOME: TIBStringField;
    qryDestinatarioCID_COD: TIntegerField;
    qryDestinatarioCID_NOME: TIBStringField;
    qryDestinatarioCID_SIAFI: TIntegerField;
    qryDestinatarioCID_IBGE: TIntegerField;
    qryDestinatarioCID_DDD: TSmallintField;
    qryDestinatarioEST_COD: TSmallintField;
    qryDestinatarioEST_NOME: TIBStringField;
    qryDestinatarioEST_SIGLA: TIBStringField;
    qryDestinatarioEST_SIAFI: TIntegerField;
    qryDestinatarioPAIS_ID: TIBStringField;
    qryDestinatarioPAIS_NOME: TIBStringField;
    qryDuplicatas: TIBQuery;
    qryDuplicatasANOLANC: TSmallintField;
    qryDuplicatasNUMLANC: TIntegerField;
    qryDuplicatasPARCELA: TSmallintField;
    qryDuplicatasDTEMISS: TDateField;
    qryDuplicatasDTVENC: TDateField;
    qryDuplicatasVALORREC: TIBBCDField;
    qryDuplicatasVALORMULTA: TIBBCDField;
    qryDuplicatasPERCENTDESCONTO: TIBBCDField;
    qryDadosProduto: TIBQuery;
    frdEmpresa: TfrxDBDataset;
    frdCliente: TfrxDBDataset;
    frrVenda: TfrxReport;
    frdVenda: TfrxDBDataset;
    frdItens: TfrxDBDataset;
    frdTitulo: TfrxDBDataset;
    frxPDF: TfrxPDFExport;
    frxXLS: TfrxXLSExport;
    frxRTF: TfrxRTFExport;
    frxMailExport: TfrxMailExport;
    qryEmitente: TIBDataSet;
    qryEmitenteCODIGO: TIntegerField;
    qryEmitentePESSOA_FISICA: TSmallintField;
    qryEmitenteCNPJ: TIBStringField;
    qryEmitenteRZSOC: TIBStringField;
    qryEmitenteNMFANT: TIBStringField;
    qryEmitenteIE: TIBStringField;
    qryEmitenteIM: TIBStringField;
    qryEmitenteFONE: TIBStringField;
    qryEmitenteLOGO: TBlobField;
    qryEmitenteTLG_TIPO: TSmallintField;
    qryEmitenteTLG_DESCRICAO: TIBStringField;
    qryEmitenteTLG_SIGLA: TIBStringField;
    qryEmitenteLOG_COD: TIntegerField;
    qryEmitenteLOG_NOME: TIBStringField;
    qryEmitenteCOMPLEMENTO: TIBStringField;
    qryEmitenteNUMERO_END: TIBStringField;
    qryEmitenteCEP: TIBStringField;
    qryEmitenteBAI_COD: TIntegerField;
    qryEmitenteBAI_NOME: TIBStringField;
    qryEmitenteCID_COD: TIntegerField;
    qryEmitenteCID_NOME: TIBStringField;
    qryEmitenteCID_SIAFI: TIntegerField;
    qryEmitenteCID_IBGE: TIntegerField;
    qryEmitenteCID_DDD: TSmallintField;
    qryEmitenteEST_COD: TSmallintField;
    qryEmitenteEST_NOME: TIBStringField;
    qryEmitenteEST_SIGLA: TIBStringField;
    qryEmitenteEST_SIAFI: TIntegerField;
    qryEmitenteEMAIL: TIBStringField;
    qryEmitenteHOME_PAGE: TIBStringField;
    qryEmitenteCHAVE_ACESSO_NFE: TIBStringField;
    qryEmitenteTIPO_REGIME_NFE: TSmallintField;
    qryEmitenteSERIE_NFE: TSmallintField;
    qryEmitenteNUMERO_NFE: TIntegerField;
    qryEmitenteLOTE_ANO_NFE: TSmallintField;
    qryEmitenteLOTE_NUM_NFE: TIntegerField;
    qryEmitentePAIS_ID: TIBStringField;
    qryEmitentePAIS_NOME: TIBStringField;
    qryCalculoImporto: TIBDataSet;
    IBSQL: TIBSQL;
    qryEmitenteCNAE: TIBStringField;
    FrECFPooler: TfrxReport;
    qryFormaPagtos: TIBQuery;
    frdFormaPagtos: TfrxDBDataset;
    qryFormaPagtosFORMAPAGTO_COD: TSmallintField;
    qryFormaPagtosDESCRI: TIBStringField;
    qryFormaPagtosACRESCIMO: TFloatField;
    qryFormaPagtosCONDICAOPAGTO_COD: TSmallintField;
    qryFormaPagtosCOND_DESCRICAO: TIBStringField;
    qryFormaPagtosCOND_DESCRICAO_FULL: TIBStringField;
    qryFormaPagtosVENDA_PRAZO: TSmallintField;
    qryFormaPagtosVALOR_FPAGTO: TIBBCDField;
    qryFormaPagtosPRAZO_01: TSmallintField;
    qryFormaPagtosPRAZO_02: TSmallintField;
    qryFormaPagtosPRAZO_03: TSmallintField;
    qryFormaPagtosPRAZO_04: TSmallintField;
    qryFormaPagtosPRAZO_05: TSmallintField;
    qryFormaPagtosPRAZO_06: TSmallintField;
    qryFormaPagtosPRAZO_07: TSmallintField;
    qryFormaPagtosPRAZO_08: TSmallintField;
    qryFormaPagtosPRAZO_09: TSmallintField;
    qryFormaPagtosPRAZO_10: TSmallintField;
    qryFormaPagtosPRAZO_11: TSmallintField;
    qryFormaPagtosPRAZO_12: TSmallintField;
    qryFornecedorDestinatario: TIBQuery;
    frdFornecedor: TfrxDBDataset;
    qryFornecedorDestinatarioCODIGO: TIntegerField;
    qryFornecedorDestinatarioPESSOA_FISICA: TSmallintField;
    qryFornecedorDestinatarioCNPJ: TIBStringField;
    qryFornecedorDestinatarioNOME: TIBStringField;
    qryFornecedorDestinatarioINSCEST: TIBStringField;
    qryFornecedorDestinatarioINSCMUN: TIBStringField;
    qryFornecedorDestinatarioFONE: TIBStringField;
    qryFornecedorDestinatarioEMAIL: TIBStringField;
    qryFornecedorDestinatarioSITE: TIBStringField;
    qryFornecedorDestinatarioTLG_TIPO: TSmallintField;
    qryFornecedorDestinatarioTLG_DESCRICAO: TIBStringField;
    qryFornecedorDestinatarioTLG_SIGLA: TIBStringField;
    qryFornecedorDestinatarioLOG_COD: TIntegerField;
    qryFornecedorDestinatarioLOG_NOME: TIBStringField;
    qryFornecedorDestinatarioCOMPLEMENTO: TIBStringField;
    qryFornecedorDestinatarioNUMERO_END: TIBStringField;
    qryFornecedorDestinatarioCEP: TIBStringField;
    qryFornecedorDestinatarioBAI_COD: TIntegerField;
    qryFornecedorDestinatarioBAI_NOME: TIBStringField;
    qryFornecedorDestinatarioCID_COD: TIntegerField;
    qryFornecedorDestinatarioCID_NOME: TIBStringField;
    qryFornecedorDestinatarioCID_SIAFI: TIntegerField;
    qryFornecedorDestinatarioCID_IBGE: TIntegerField;
    qryFornecedorDestinatarioCID_DDD: TSmallintField;
    qryFornecedorDestinatarioEST_COD: TSmallintField;
    qryFornecedorDestinatarioEST_NOME: TIBStringField;
    qryFornecedorDestinatarioEST_SIGLA: TIBStringField;
    qryFornecedorDestinatarioEST_SIAFI: TIntegerField;
    qryFornecedorDestinatarioPAIS_ID: TIBStringField;
    qryFornecedorDestinatarioPAIS_NOME: TIBStringField;
    frdEntrada: TfrxDBDataset;
    qryEntradaCalculoImporto: TIBDataSet;
    qryEntradaCalculoImportoANO: TSmallintField;
    qryEntradaCalculoImportoCODCONTROL: TIntegerField;
    qryEntradaCalculoImportoCODEMP: TIBStringField;
    qryEntradaCalculoImportoCODFORN: TIntegerField;
    qryEntradaCalculoImportoDTENT: TDateField;
    qryEntradaCalculoImportoSTATUS: TSmallintField;
    qryEntradaCalculoImportoDESCONTO: TIBBCDField;
    qryEntradaCalculoImportoDTFINALIZACAO_COMPRA: TDateTimeField;
    qryEntradaCalculoImportoOBS: TMemoField;
    qryEntradaCalculoImportoSERIE: TIBStringField;
    qryEntradaCalculoImportoNF: TIntegerField;
    qryEntradaCalculoImportoLOTE_NFE_ANO: TSmallintField;
    qryEntradaCalculoImportoLOTE_NFE_NUMERO: TIntegerField;
    qryEntradaCalculoImportoNFE_ENVIADA: TSmallintField;
    qryEntradaCalculoImportoDATAEMISSAO: TDateField;
    qryEntradaCalculoImportoHORAEMISSAO: TTimeField;
    qryEntradaCalculoImportoCANCEL_USUARIO: TIBStringField;
    qryEntradaCalculoImportoCANCEL_DATAHORA: TDateTimeField;
    qryEntradaCalculoImportoCANCEL_MOTIVO: TMemoField;
    qryEntradaCalculoImportoCFOP: TIntegerField;
    qryEntradaCalculoImportoCFOP_DESCRICAO: TIBStringField;
    qryEntradaCalculoImportoVERIFICADOR_NFE: TIBStringField;
    qryEntradaCalculoImportoXML_NFE_FILENAME: TIBStringField;
    qryEntradaCalculoImportoXML_NFE: TMemoField;
    qryEntradaCalculoImportoUSUARIO: TIBStringField;
    qryEntradaCalculoImportoUSUARIO_NOME_COMPLETO: TIBStringField;
    qryEntradaCalculoImportoUSUARIO_FUNCAO: TIBStringField;
    qryEntradaCalculoImportoFORMA_PAGO: TIBStringField;
    qryEntradaCalculoImportoCOND_PAGO: TIBStringField;
    qryEntradaCalculoImportoCOND_PAGO_FULL: TIBStringField;
    qryEntradaCalculoImportoCOMPRA_PRAZO: TSmallintField;
    qryEntradaCalculoImportoNFE_VALOR_BASE_ICMS: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_ICMS: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_BASE_ICMS_SUBST: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_ICMS_SUBST: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_TOTAL_PRODUTO: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_FRETE: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_SEGURO: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_DESCONTO: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_TOTAL_II: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_TOTAL_IPI: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_PIS: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_COFINS: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_OUTROS: TIBBCDField;
    qryEntradaCalculoImportoNFE_VALOR_TOTAL_NOTA: TIBBCDField;
    qryEntradaDadosProduto: TIBQuery;
    frdEntradaItens: TfrxDBDataset;
    qryEntradaCalculoImportoCODFORN_CNPJ: TIBStringField;
    qryEntradaDadosProdutoANO: TSmallintField;
    qryEntradaDadosProdutoCODCONTROL: TIntegerField;
    qryEntradaDadosProdutoSEQ: TSmallintField;
    qryEntradaDadosProdutoCODPROD: TIBStringField;
    qryEntradaDadosProdutoCODBARRA_EAN: TIBStringField;
    qryEntradaDadosProdutoDESCRI: TIBStringField;
    qryEntradaDadosProdutoAPRESENTACAO: TIBStringField;
    qryEntradaDadosProdutoDESCRI_APRESENTACAO: TIBStringField;
    qryEntradaDadosProdutoMODELO: TIBStringField;
    qryEntradaDadosProdutoREFERENCIA: TIBStringField;
    qryEntradaDadosProdutoNCM_SH: TIBStringField;
    qryEntradaDadosProdutoCODORIGEM: TIBStringField;
    qryEntradaDadosProdutoCODTRIBUTACAO: TIBStringField;
    qryEntradaDadosProdutoCST: TIBStringField;
    qryEntradaDadosProdutoCSOSN: TIBStringField;
    qryEntradaDadosProdutoCST_PIS: TIBStringField;
    qryEntradaDadosProdutoCST_COFINS: TIBStringField;
    qryEntradaDadosProdutoCST_PIS_INDICE_ACBR: TIntegerField;
    qryEntradaDadosProdutoCST_COFINS_INDICE_ACBR: TIntegerField;
    qryEntradaDadosProdutoCODEMP: TIBStringField;
    qryEntradaDadosProdutoCODFORN: TIntegerField;
    qryEntradaDadosProdutoCODFORN_CNPJ: TIBStringField;
    qryEntradaDadosProdutoDTENT: TDateField;
    qryEntradaDadosProdutoQTDE: TSmallintField;
    qryEntradaDadosProdutoPUNIT: TIBBCDField;
    qryEntradaDadosProdutoDESCONTO: TIBBCDField;
    qryEntradaDadosProdutoDESCONTO_VALOR: TIBBCDField;
    qryEntradaDadosProdutoPFINAL: TIBBCDField;
    qryEntradaDadosProdutoQTDEFINAL: TIntegerField;
    qryEntradaDadosProdutoUNID_COD: TSmallintField;
    qryEntradaDadosProdutoUNP_DESCRICAO: TIBStringField;
    qryEntradaDadosProdutoUNP_SIGLA: TIBStringField;
    qryEntradaDadosProdutoCFOP_COD: TIntegerField;
    qryEntradaDadosProdutoALIQUOTA: TIBBCDField;
    qryEntradaDadosProdutoALIQUOTA_CSOSN: TIBBCDField;
    qryEntradaDadosProdutoALIQUOTA_PIS: TIBBCDField;
    qryEntradaDadosProdutoALIQUOTA_COFINS: TIBBCDField;
    qryEntradaDadosProdutoVALOR_IPI: TIBBCDField;
    qryEntradaDadosProdutoPERCENTUAL_REDUCAO_BC: TIBBCDField;
    qryEntradaDadosProdutoVALOR_REDUCAO_BC: TIBBCDField;
    qryEntradaDadosProdutoTOTAL_DESCONTO: TIBBCDField;
    qryEntradaDadosProdutoESTOQUE: TIntegerField;
    qryEntradaDadosProdutoRESERVA: TIntegerField;
    qryEntradaDadosProdutoPRODUTO_NOVO: TSmallintField;
    qryEntradaDadosProdutoCOR_VEICULO: TIBStringField;
    qryEntradaDadosProdutoCOR_VEICULO_DESCRICAO: TIBStringField;
    qryEntradaDadosProdutoCOMBUSTIVEL_VEICULO: TIBStringField;
    qryEntradaDadosProdutoCOMBUSTIVEL_VEICULO_DESCRICAO: TIBStringField;
    qryEntradaDadosProdutoANO_FABRICACAO_VEICULO: TSmallintField;
    qryEntradaDadosProdutoANO_MODELO_VEICULO: TSmallintField;
    qryEntradaDadosProdutoANO_FAB_MODELO_VEICULO: TIBStringField;
    qryEntradaDadosProdutoTIPO_VEICULO: TIBStringField;
    qryEntradaDadosProdutoTIPO_VEICULO_DESCRICAO: TIBStringField;
    qryEntradaDadosProdutoRENAVAM_VEICULO: TIBStringField;
    qryEntradaDadosProdutoCHASSI_VEICULO: TIBStringField;
    qryEntradaDadosProdutoKILOMETRAGEM_VEICULO: TIntegerField;
    qryEntradaDadosProdutoDISPONIVEL: TLargeintField;
    qryEntradaDuplicatas: TIBQuery;
    frdEntradaDuplicata: TfrxDBDataset;
    qryEntradaDuplicatasANOLANC: TSmallintField;
    qryEntradaDuplicatasNUMLANC: TIntegerField;
    qryEntradaDuplicatasPARCELA: TSmallintField;
    qryEntradaDuplicatasDTEMISS: TDateField;
    qryEntradaDuplicatasDTVENC: TDateField;
    qryEntradaDuplicatasVALORPAG: TIBBCDField;
    qryEntradaDuplicatasVALORMULTA: TIBBCDField;
    qryEntradaDuplicatasPERCENTDESCONTO: TIBBCDField;
    qryEntradaDadosProdutoTOTAL_BRUTO: TIBBCDField;
    qryEntradaDadosProdutoTOTAL_LIQUIDO: TIBBCDField;
    qryCalculoImportoANO: TSmallintField;
    qryCalculoImportoCODCONTROL: TIntegerField;
    qryCalculoImportoCODEMP: TIBStringField;
    qryCalculoImportoCODCLI: TIBStringField;
    qryCalculoImportoDTVENDA: TDateTimeField;
    qryCalculoImportoSTATUS: TSmallintField;
    qryCalculoImportoDTFINALIZACAO_VENDA: TDateField;
    qryCalculoImportoOBS: TMemoField;
    qryCalculoImportoSERIE: TIBStringField;
    qryCalculoImportoNFE: TLargeintField;
    qryCalculoImportoLOTE_NFE_ANO: TSmallintField;
    qryCalculoImportoLOTE_NFE_NUMERO: TIntegerField;
    qryCalculoImportoNFE_ENVIADA: TSmallintField;
    qryCalculoImportoDATAEMISSAO: TDateField;
    qryCalculoImportoHORAEMISSAO: TTimeField;
    qryCalculoImportoCANCEL_USUARIO: TIBStringField;
    qryCalculoImportoCANCEL_DATAHORA: TDateTimeField;
    qryCalculoImportoCANCEL_MOTIVO: TMemoField;
    qryCalculoImportoCFOP: TIntegerField;
    qryCalculoImportoCFOP_DESCRICAO: TIBStringField;
    qryCalculoImportoVERIFICADOR_NFE: TIBStringField;
    qryCalculoImportoXML_NFE_FILENAME: TIBStringField;
    qryCalculoImportoXML_NFE: TMemoField;
    qryCalculoImportoVENDEDOR_COD: TIntegerField;
    qryCalculoImportoVENDEDOR_NOME: TIBStringField;
    qryCalculoImportoVENDEDOR_CPF: TIBStringField;
    qryCalculoImportoUSUARIO: TIBStringField;
    qryCalculoImportoLISTA_FORMA_PAGO: TMemoField;
    qryCalculoImportoLISTA_COND_PAGO: TMemoField;
    qryCalculoImportoLISTA_COND_PAGO_FULL: TMemoField;
    qryCalculoImportoVENDA_PRAZO: TSmallintField;
    qryCalculoImportoNFE_VALOR_BASE_ICMS: TIBBCDField;
    qryCalculoImportoNFE_VALOR_ICMS: TIBBCDField;
    qryCalculoImportoNFE_VALOR_BASE_ICMS_SUBST: TIBBCDField;
    qryCalculoImportoNFE_VALOR_ICMS_SUBST: TIBBCDField;
    qryCalculoImportoNFE_VALOR_TOTAL_PRODUTO: TIBBCDField;
    qryCalculoImportoNFE_VALOR_FRETE: TIBBCDField;
    qryCalculoImportoNFE_VALOR_SEGURO: TIBBCDField;
    qryCalculoImportoNFE_VALOR_DESCONTO: TIBBCDField;
    qryCalculoImportoNFE_VALOR_TOTAL_II: TIBBCDField;
    qryCalculoImportoNFE_VALOR_TOTAL_IPI: TIBBCDField;
    qryCalculoImportoNFE_VALOR_PIS: TIBBCDField;
    qryCalculoImportoNFE_VALOR_COFINS: TIBBCDField;
    qryCalculoImportoNFE_VALOR_OUTROS: TIBBCDField;
    qryCalculoImportoNFE_VALOR_TOTAL_NOTA: TIBBCDField;
    qryCalculoImportoTOTALVENDABRUTA: TIBBCDField;
    qryCalculoImportoDESCONTO: TIBBCDField;
    qryCalculoImportoTOTALVENDA: TIBBCDField;
    qryDadosProdutoANO: TSmallintField;
    qryDadosProdutoCODCONTROL: TIntegerField;
    qryDadosProdutoSEQ: TSmallintField;
    qryDadosProdutoCODPROD: TIBStringField;
    qryDadosProdutoCODBARRA_EAN: TIBStringField;
    qryDadosProdutoDESCRI: TIBStringField;
    qryDadosProdutoAPRESENTACAO: TIBStringField;
    qryDadosProdutoDESCRI_APRESENTACAO: TIBStringField;
    qryDadosProdutoMODELO: TIBStringField;
    qryDadosProdutoREFERENCIA: TIBStringField;
    qryDadosProdutoNCM_SH: TIBStringField;
    qryDadosProdutoCODORIGEM: TIBStringField;
    qryDadosProdutoCODTRIBUTACAO: TIBStringField;
    qryDadosProdutoCST: TIBStringField;
    qryDadosProdutoCSOSN: TIBStringField;
    qryDadosProdutoCST_PIS: TIBStringField;
    qryDadosProdutoCST_COFINS: TIBStringField;
    qryDadosProdutoCST_PIS_INDICE_ACBR: TIntegerField;
    qryDadosProdutoCST_COFINS_INDICE_ACBR: TIntegerField;
    qryDadosProdutoCODEMP: TIBStringField;
    qryDadosProdutoCODCLI: TIBStringField;
    qryDadosProdutoDTVENDA: TDateTimeField;
    qryDadosProdutoQTDE: TIntegerField;
    qryDadosProdutoPUNIT: TIBBCDField;
    qryDadosProdutoPUNIT_PROMOCAO: TIBBCDField;
    qryDadosProdutoDESCONTO: TIBBCDField;
    qryDadosProdutoDESCONTO_VALOR: TIBBCDField;
    qryDadosProdutoPFINAL: TIBBCDField;
    qryDadosProdutoQTDEFINAL: TIntegerField;
    qryDadosProdutoUNID_COD: TSmallintField;
    qryDadosProdutoUNP_DESCRICAO: TIBStringField;
    qryDadosProdutoUNP_SIGLA: TIBStringField;
    qryDadosProdutoCFOP_COD: TIntegerField;
    qryDadosProdutoALIQUOTA: TIBBCDField;
    qryDadosProdutoALIQUOTA_CSOSN: TIBBCDField;
    qryDadosProdutoALIQUOTA_PIS: TIBBCDField;
    qryDadosProdutoALIQUOTA_COFINS: TIBBCDField;
    qryDadosProdutoVALOR_IPI: TIBBCDField;
    qryDadosProdutoPERCENTUAL_REDUCAO_BC: TIBBCDField;
    qryDadosProdutoVALOR_REDUCAO_BC: TIBBCDField;
    qryDadosProdutoTOTAL_BRUTO: TIBBCDField;
    qryDadosProdutoTOTAL_DESCONTO: TIBBCDField;
    qryDadosProdutoTOTAL_LIQUIDO: TIBBCDField;
    qryDadosProdutoESTOQUE: TIntegerField;
    qryDadosProdutoRESERVA: TIntegerField;
    qryDadosProdutoPRODUTO_NOVO: TSmallintField;
    qryDadosProdutoCOR_VEICULO: TIBStringField;
    qryDadosProdutoCOR_VEICULO_DESCRICAO: TIBStringField;
    qryDadosProdutoCOMBUSTIVEL_VEICULO: TIBStringField;
    qryDadosProdutoCOMBUSTIVEL_VEICULO_DESCRICAO: TIBStringField;
    qryDadosProdutoANO_FABRICACAO_VEICULO: TSmallintField;
    qryDadosProdutoANO_MODELO_VEICULO: TSmallintField;
    qryDadosProdutoANO_FAB_MODELO_VEICULO: TIBStringField;
    qryDadosProdutoTIPO_VEICULO: TIBStringField;
    qryDadosProdutoTIPO_VEICULO_DESCRICAO: TIBStringField;
    qryDadosProdutoRENAVAM_VEICULO: TIBStringField;
    qryDadosProdutoCHASSI_VEICULO: TIBStringField;
    qryDadosProdutoKILOMETRAGEM_VEICULO: TIntegerField;
    qryDadosProdutoDISPONIVEL: TLargeintField;
    qryNFeEmitida: TIBQuery;
    qryNFeEmitidaANOVENDA: TSmallintField;
    qryNFeEmitidaNUMVENDA: TIntegerField;
    qryNFeEmitidaDATAEMISSAO: TDateField;
    qryNFeEmitidaHORAEMISSAO: TTimeField;
    qryNFeEmitidaSERIE: TIBStringField;
    qryNFeEmitidaNUMERO: TIntegerField;
    qryNFeEmitidaCHAVE: TIBStringField;
    qryNFeEmitidaPROTOCOLO: TIBStringField;
    qryNFeEmitidaRECIBO: TIBStringField;
    qryNFeEmitidaXML_FILENAME: TIBStringField;
    qryNFeEmitidaXML_FILE: TMemoField;
    qryNFeEmitidaLOTE_ANO: TSmallintField;
    qryNFeEmitidaLOTE_NUM: TIntegerField;
    procedure SelecionarCertificado(Sender : TObject);
    procedure TestarServico(Sender : TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure FrECFPoolerGetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
    frmACBr : TfrmGeConfigurarNFeACBr;
    fr3Designer: TfrxDesigner;
    
    procedure GerarTabela_CST_PIS;
    procedure GerarTabela_CST_COFINS;

    procedure UpdateNumeroNFe(const sCNPJEmitente : String; const Serie, Numero : Integer);
    procedure UpdateLoteNFe(const sCNPJEmitente : String; const Ano, Numero : Integer);

    procedure GerarNFEACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer;
      var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String);
    procedure GerarNFEEntradaACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
      var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String);
  public
    { Public declarations }
    property ConfigACBr : TfrmGeConfigurarNFeACBr read frmACBr write frmACBr;
    procedure LoadXML(MyMemo: TStringList; MyWebBrowser: TWebBrowser);

    procedure LerConfiguracao;
    procedure GravarConfiguracao;

    procedure AbrirEmitente(sCNPJ : String);
    procedure AbrirDestinatario(sCNPJ : String);
    procedure AbrirDestinatarioFornecedor(iCodigo : Integer);
    procedure AbrirVenda(AnoVenda, NumeroVenda : Integer);
    procedure AbrirNFeEmitida(AnoVenda, NumeroVenda : Integer);
    procedure AbrirCompra(AnoCompra, NumeroCompra : Integer);

    function GerarNFeOnLine : Boolean;
    function GetInformacaoFisco : String;

    function GerarNFeOnLineACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
      const Imprimir : Boolean = TRUE) : Boolean;

    function GerarNFeOffLineACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE : String;
      const Imprimir : Boolean = TRUE) : Boolean;

    function CancelarNFeACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer; const Motivo : String) : Boolean;

    function CancelarNFeEntradaACBr(const sCNPJEmitente : String; const iCodFornecedor, iAnoCompra, iNumCompra : Integer; const Motivo : String) : Boolean;

    function ImprimirDANFEACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer;
      const IsPDF : Boolean = FALSE) : Boolean;

    function ImprimirDANFEEntradaACBr(const sCNPJEmitente : String; const CodFornecedor: Integer; const iAnoCompra, iNumCompra : Integer;
      const IsPDF : Boolean = FALSE) : Boolean;

    function GerarNFeEntradaOnLineACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
      const Imprimir : Boolean = TRUE) : Boolean;

    function GerarNFeEntradaOffLineACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE : String;
      const Imprimir : Boolean = TRUE) : Boolean;
  end;

var
  DMNFe: TDMNFe;

const
  SELDIRHELP   = 1000;
  FILENAME_NFE = 'Report\NotaFiscalEletronica.rav';
  
  DIRECTORY_CANCEL = 'NFe\Canceladas\';
  DIRECTORY_PRINT  = 'NFe\Imprimir\';
  DIRECTORY_CLIENT = 'NFe\Clientes\';

  procedure ConfigurarNFeACBr;

implementation

uses UDMBusiness, Forms, FileCtrl, ACBrNFeConfiguracoes,
  ACBrNFeNotasFiscais, ACBrNFeWebServices, StdCtrls, pcnNFe, UFuncoes,
  UConstantesDGE;

{$R *.dfm}

procedure ConfigurarNFeACBr;
var
 I : Integer;
begin
  try

    I := ID_ABORT;

    with DMNFe do
    begin

      if ( not Assigned(ConfigACBr) ) then
        ConfigACBr := TfrmGeConfigurarNFeACBr.Create(Application);

      LerConfiguracao;

      if ( not ConfigACBr.Showing ) then
        I := ConfigACBr.ShowModal;

      ConfigACBr.pgcGuias.ActivePageIndex := 0;

      if ( I = ID_OK ) then
      begin
        GravarConfiguracao;
        LerConfiguracao;
      end;

    end;

  finally
  end;
end;

procedure TDMNFe.AbrirEmitente(sCNPJ: String);
begin
  with qryEmitente do
  begin
    Close;
    ParamByName('Cnpj').AsString := sCNPJ;
    Open;

    if ( not qryEmitenteLOGO.IsNull ) then
      qryEmitenteLOGO.SaveToFile(ExtractFilePath(Application.ExeName) + sCNPJ + '.bmp');
  end;
end;

procedure TDMNFe.AbrirDestinatario(sCNPJ : String);
begin
  with qryDestinatario do
  begin
    Close;
    ParamByName('Cnpj').AsString := sCNPJ;
    Open;
  end;
end;

procedure TDMNFe.AbrirVenda(AnoVenda, NumeroVenda : Integer);
begin
  with qryCalculoImporto do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;

  with qryFormaPagtos do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;

  with qryDadosProduto do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;

  with qryDuplicatas do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;
end;

procedure TDMNFe.AbrirNFeEmitida(AnoVenda, NumeroVenda: Integer);
begin
  with qryNFeEmitida do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;
end;

procedure TDMNFe.DataModuleCreate(Sender: TObject);
begin
  AbrirEmitente( GetEmpresaIDDefault );
  ConfigACBr := TfrmGeConfigurarNFeACBr.Create(Application);

  ConfigACBr.sbtnGetCert.OnClick := SelecionarCertificado;
  ConfigACBr.btnServico.OnClick  := TestarServico;
  
  rvDANFE.Sistema := GetCompanyName + ' - Contato(s): ' + GetContacts;

  LerConfiguracao;

  fr3Designer := TfrxDesigner.Create(Self);

  GerarTabela_CST_PIS;
  GerarTabela_CST_COFINS;
end;

procedure TDMNFe.GravarConfiguracao;
Var
  StreamMemo : TMemoryStream;
begin
  try

    with ConfigACBr, FileINI do
    begin
      WriteString( 'Certificado', 'Caminho' , edtCaminho.Text) ;
      WriteString( 'Certificado', 'Senha'   , edtSenha.Text) ;
      WriteString( 'Certificado', 'NumSerie', edtNumSerie.Text) ;

      WriteInteger( 'Geral', 'DANFE'       , rgTipoDanfe.ItemIndex) ;
      WriteInteger( 'Geral', 'FormaEmissao', rgFormaEmissao.ItemIndex) ;
      WriteString ( 'Geral', 'LogoMarca'   , edtLogoMarca.Text) ;
      WriteBool   ( 'Geral', 'Salvar'      , ckSalvar.Checked) ;
      WriteString ( 'Geral', 'PathSalvar'  , edtPathLogs.Text) ;
      WriteInteger( 'Geral', 'ModoGerarNFe', rgModoGerarNFe.ItemIndex) ;

      WriteString ( 'WebService', 'UF'        ,cbUF.Text) ;
      WriteInteger( 'WebService', 'Ambiente'  ,rgTipoAmb.ItemIndex) ;
      WriteBool   ( 'WebService', 'Visualizar',ckVisualizar.Checked) ;

      WriteString( 'Proxy', 'Host'   , edtProxyHost.Text) ;
      WriteString( 'Proxy', 'Porta'  , edtProxyPorta.Text) ;
      WriteString( 'Proxy', 'User'   , edtProxyUser.Text) ;
      WriteString( 'Proxy', 'Pass'   , edtProxySenha.Text) ;

      WriteString( 'Emitente', 'CNPJ'       , edtEmitCNPJ.Text) ;
      WriteString( 'Emitente', 'IE'         , edtEmitIE.Text) ;
      WriteString( 'Emitente', 'RazaoSocial', edtEmitRazao.Text) ;
      WriteString( 'Emitente', 'Fantasia'   , edtEmitFantasia.Text) ;
      WriteString( 'Emitente', 'Fone'       , edtEmitFone.Text) ;
      WriteString( 'Emitente', 'CEP'        , edtEmitCEP.Text) ;
      WriteString( 'Emitente', 'Logradouro' , edtEmitLogradouro.Text) ;
      WriteString( 'Emitente', 'Numero'     , edtEmitNumero.Text) ;
      WriteString( 'Emitente', 'Complemento', edtEmitComp.Text) ;
      WriteString( 'Emitente', 'Bairro'     , edtEmitBairro.Text) ;
      WriteString( 'Emitente', 'CodCidade'  , edtEmitCodCidade.Text) ;
      WriteString( 'Emitente', 'Cidade'     , edtEmitCidade.Text) ;
      WriteString( 'Emitente', 'UF'         , edtEmitUF.Text) ;
      WriteString( 'Emitente', 'InfoFisco'  , edInfoFisco.Text) ;

      WriteString( 'Email', 'Host'    ,edtSmtpHost.Text) ;
      WriteString( 'Email', 'Port'    ,edtSmtpPort.Text) ;
      WriteString( 'Email', 'User'    ,edtSmtpUser.Text) ;
      WriteString( 'Email', 'Pass'    ,edtSmtpPass.Text) ;
      WriteString( 'Email', 'Assunto' ,edtEmailAssunto.Text) ;
      WriteBool(   'Email', 'SSL'     ,cbEmailSSL.Checked ) ;

      StreamMemo := TMemoryStream.Create;

      mmEmailMsg.Lines.SaveToStream(StreamMemo);
      StreamMemo.Seek(0,soFromBeginning);

      WriteBinaryStream( 'Email', 'Mensagem',StreamMemo) ;

      StreamMemo.Free;
    end;

  finally
  end;
end;

procedure TDMNFe.LerConfiguracao;
Var
  Ok : Boolean;
  StreamMemo : TMemoryStream;
  sFileNFE : String;
begin
  try

    with ConfigACBr, FileINI do
    begin

      {$IFDEF ACBrNFeOpenSSL}
         edtCaminho.Text  := ReadString( 'Certificado', 'Caminho' , '') ;
         edtSenha.Text    := ReadString( 'Certificado', 'Senha'   , '') ;
         ACBrNFe.Configuracoes.Certificados.Certificado  := edtCaminho.Text;
         ACBrNFe.Configuracoes.Certificados.Senha        := edtSenha.Text;
         edtNumSerie.Visible := False;
         Label25.Visible     := False;
         sbtnGetCert.Visible := False;
      {$ELSE}
         edtNumSerie.Text := ReadString( 'Certificado', 'NumSerie', '') ;
         ACBrNFe.Configuracoes.Certificados.NumeroSerie := edtNumSerie.Text;
         edtNumSerie.Text := ACBrNFe.Configuracoes.Certificados.NumeroSerie;
         lbltCaminho.Caption := 'Informe o n�mero de s�rie do certificado'#13+
                                'Dispon�vel no Internet Explorer no menu'#13+
                                'Ferramentas - Op��es da Internet - Conte�do '#13+
                                'Certificados - Exibir - Detalhes - '#13+
                                'N�mero do certificado';
         lbltSenha.Visible  := False;
         edtCaminho.Visible := False;
         edtSenha.Visible   := False;
         sbtnCaminhoCert.Visible := False;
      {$ENDIF}

      rgFormaEmissao.ItemIndex := ReadInteger( 'Geral', 'FormaEmissao', 0) ;
      rgModoGerarNFe.ItemIndex := 1; NetWorkActive; // ReadInteger( 'Geral', 'ModoGerarNFe', 1) ;

      ckSalvar.Checked := ReadBool  ( 'Geral', 'Salvar'      ,True) ;
      edtPathLogs.Text := ReadString( 'Geral', 'PathSalvar'  ,'') ;

      ACBrNFe.Configuracoes.Geral.FormaEmissao := StrToTpEmis(OK, IntToStr(rgFormaEmissao.ItemIndex + 1));
      ACBrNFe.Configuracoes.Geral.Salvar       := ckSalvar.Checked;
      ACBrNFe.Configuracoes.Geral.PathSalvar   := edtPathLogs.Text;

      cbUF.ItemIndex       := cbUF.Items.IndexOf(ReadString( 'WebService','UF','SP')) ;
      rgTipoAmb.ItemIndex  := ReadInteger( 'WebService', 'Ambiente'  , 0) ;
      ckVisualizar.Checked := ReadBool   ( 'WebService', 'Visualizar', False) ;

      ACBrNFe.Configuracoes.WebServices.UF         := cbUF.Text;
      ACBrNFe.Configuracoes.WebServices.Ambiente   := StrToTpAmb(Ok,IntToStr(rgTipoAmb.ItemIndex + 1));
      ACBrNFe.Configuracoes.WebServices.Visualizar := ckVisualizar.Checked;

      edtProxyHost.Text  := ReadString( 'Proxy', 'Host'  , '') ;
      edtProxyPorta.Text := ReadString( 'Proxy', 'Porta' , '') ;
      edtProxyUser.Text  := ReadString( 'Proxy', 'User'  , '') ;
      edtProxySenha.Text := ReadString( 'Proxy', 'Pass'  , '') ;

      ACBrNFe.Configuracoes.WebServices.ProxyHost := edtProxyHost.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyPort := edtProxyPorta.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyUser := edtProxyUser.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyPass := edtProxySenha.Text;

      rgTipoDanfe.ItemIndex := ReadInteger( 'Geral', 'DANFE'     , 0) ;
      edtLogoMarca.Text     := ReadString ( 'Geral', 'LogoMarca' , '') ;

      if ACBrNFe.DANFE <> nil then
      begin
        ACBrNFe.DANFE.TipoDANFE := StrToTpImp(OK, IntToStr(rgTipoDanfe.ItemIndex + 1));

        if ( FilesExists(Trim(edtLogoMarca.Text)) ) then
          ACBrNFe.DANFE.Logo := Trim(edtLogoMarca.Text)
        else
          ACBrNFe.DANFE.Logo := EmptyStr;  
      end;

      edtEmitCNPJ.Text       := ReadString( 'Emitente', 'CNPJ'       , '' ) ;
      edtEmitIE.Text         := ReadString( 'Emitente', 'IE'         , '' ) ;
      edtEmitRazao.Text      := ReadString( 'Emitente', 'RazaoSocial', '' ) ;
      edtEmitFantasia.Text   := ReadString( 'Emitente', 'Fantasia'   , '' ) ;
      edtEmitFone.Text       := ReadString( 'Emitente', 'Fone'       , '' ) ;
      edtEmitCEP.Text        := ReadString( 'Emitente', 'CEP'        , '' ) ;
      edtEmitLogradouro.Text := ReadString( 'Emitente', 'Logradouro' , '' ) ;
      edtEmitNumero.Text     := ReadString( 'Emitente', 'Numero'     , '' ) ;
      edtEmitComp.Text       := ReadString( 'Emitente', 'Complemento', '' ) ;
      edtEmitBairro.Text     := ReadString( 'Emitente', 'Bairro'     , '' ) ;
      edtEmitCodCidade.Text  := ReadString( 'Emitente', 'CodCidade'  , '' ) ;
      edtEmitCidade.Text     := ReadString( 'Emitente', 'Cidade'     , '' ) ;
      edtEmitUF.Text         := ReadString( 'Emitente', 'UF'         , '' ) ;
      edInfoFisco.Text       := ReadString( 'Emitente', 'InfoFisco'  , 'EMPRESA OPTANTE PELO SIMPLES DE ACORDO COM A LEI COMPLEMENTAR 123, DE DEZEMBRO DE 2006' ) ;

      edtSmtpHost.Text      := ReadString( 'Email', 'Host'   ,'') ;
      edtSmtpPort.Text      := ReadString( 'Email', 'Port'   ,'') ;
      edtSmtpUser.Text      := ReadString( 'Email', 'User'   ,'') ;
      edtSmtpPass.Text      := ReadString( 'Email', 'Pass'   ,'') ;
      edtEmailAssunto.Text  := ReadString( 'Email', 'Assunto','') ;
      cbEmailSSL.Checked    := ReadBool(   'Email', 'SSL'    ,False) ;

      StreamMemo := TMemoryStream.Create;

      ReadBinaryStream( 'Email', 'Mensagem', StreamMemo ) ;

      mmEmailMsg.Lines.LoadFromStream(StreamMemo);
      StreamMemo.Free;

      if ( (Trim(edtEmitCNPJ.Text) = EmptyStr) and (not qryEmitente.IsEmpty) ) then
      begin
        edtEmitCNPJ.Text       := qryEmitenteCNPJ.AsString;
        edtEmitIE.Text         := qryEmitenteIE.AsString;
        edtEmitRazao.Text      := qryEmitenteRZSOC.AsString;
        edtEmitFantasia.Text   := qryEmitenteNMFANT.AsString;
        edtEmitFone.Text       := qryEmitenteFONE.AsString;
        edtEmitCEP.Text        := qryEmitenteCEP.AsString;
        edtEmitLogradouro.Text := qryEmitenteTLG_SIGLA.AsString + ' ' + qryEmitenteLOG_NOME.AsString;
        edtEmitNumero.Text     := qryEmitenteNUMERO_END.AsString;
        edtEmitComp.Text       := qryEmitenteCOMPLEMENTO.AsString;
        edtEmitBairro.Text     := qryEmitenteBAI_NOME.AsString;
        edtEmitCodCidade.Text  := qryEmitenteCID_IBGE.AsString;
        edtEmitCidade.Text     := qryEmitenteCID_NOME.AsString;
        edtEmitUF.Text         := qryEmitenteEST_SIGLA.AsString;
      end;
    end;

    sFileNFE := ExtractFilePath(ParamStr(0)) + FILENAME_NFE;

    if ( not FileExists(sFileNFE) ) then
      ShowError( 'Arquivo ' + QuotedStr(sFileNFE) + ' n�o encontrado!' );

    rvDANFE.Email := qryEmitenteEMAIL.AsString;
    rvDANFE.Site  := qryEmitenteHOME_PAGE.AsString;
    rvDANFE.TamanhoFonte_RazaoSocial := 10;
    rvDANFE.RavFile                  := sFileNFE;

  finally
  end;
end;

procedure TDMNFe.SelecionarCertificado(Sender: TObject);
begin
  {$IFNDEF ACBrNFeOpenSSL}
  ConfigACBr.edtNumSerie.Text := ACBrNFe.Configuracoes.Certificados.SelecionarCertificado;
  {$ENDIF}
end;

procedure TDMNFe.TestarServico(Sender: TObject);
var
  memResp  ,
  memRespWS,
  memInfo : TStringList;
begin
  memResp   := TStringList.Create;
  memRespWS := TStringList.Create;
  memInfo   := TStringList.Create;
  try

    with ConfigACBr, ACBrNFe, memInfo do
    begin

      WebServices.StatusServico.Executar;

      memResp.Add  ( UTF8Encode(WebServices.StatusServico.RetWS) );
      memRespWS.Add( UTF8Encode(WebServices.StatusServico.RetornoWS) );

      LoadXML(memResp, WBResposta);

      Add('');
      Add('Status Servi�o');
      Add('tpAmb : '    + TpAmbToStr(WebServices.StatusServico.tpAmb));
      Add('verAplic : ' + WebServices.StatusServico.verAplic);
      Add('cStat : '    + IntToStr(WebServices.StatusServico.cStat));
      Add('xMotivo : '  + WebServices.StatusServico.xMotivo);
      Add('cUF : '      + IntToStr(WebServices.StatusServico.cUF));
      Add('dhRecbto : ' + DateTimeToStr(WebServices.StatusServico.dhRecbto));
      Add('tMed : '     + IntToStr(WebServices.StatusServico.TMed));
      Add('dhRetorno : '+ DateTimeToStr(WebServices.StatusServico.dhRetorno));
      Add('xObs : '     + WebServices.StatusServico.xObs);
      Add('');

    end;

    ShowInformation( memInfo.Text );
  finally
    memResp.Free;
    memRespWS.Free;
    memInfo.Free;
  end;
end;

procedure TDMNFe.LoadXML(MyMemo: TStringList; MyWebBrowser: TWebBrowser);
begin
  MyMemo.SaveToFile( PathWithDelim(ExtractFileDir(application.ExeName))     + 'temp.xml' );
  MyWebBrowser.Navigate( PathWithDelim(ExtractFileDir(application.ExeName)) + 'temp.xml' );
end;

function TDMNFe.GerarNFeOnLine : Boolean;
begin
  Result := ( ConfigACBr.rgModoGerarNFe.ItemIndex = 1 );
end;

function TDMNFe.GetInformacaoFisco : String;
begin
  Result := ( ConfigACBr.edInfoFisco.Text );
end;

function TDMNFe.GerarNFeOnLineACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda: Integer;
  var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
  const Imprimir : Boolean = TRUE): Boolean;
var
  DtHoraEmiss : TDateTime;
begin

  try

    GerarNFEACBr(sCNPJEmitente, sCNPJDestinatario, iAnoVenda, iNumVenda, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML);

    iNumeroLote := GetNextID('TBEMPRESA', 'LOTE_NUM_NFE', 'where CNPJ = ' + QuotedStr(sCNPJEmitente) + ' and LOTE_ANO_NFE = ' + qryEmitenteLOTE_ANO_NFE.AsString);

    Result := ACBrNFe.Enviar( iNumeroLote, Imprimir );

    if ( Result ) then
    begin
      ChaveNFE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
      ProtocoloNFE := ACBrNFe.WebServices.Retorno.Protocolo;
      ReciboNFE    := ACBrNFe.WebServices.Retorno.Recibo;

      UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
      UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar gerar NF-e.' + #13#13 + 'GerarNFeOnLineACBr() --> ' + E.Message);
      Result := False;
    end;
  end;

end;

function TDMNFe.GerarNFeOffLineACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer;
  var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE : String;
  const Imprimir : Boolean = TRUE) : Boolean;
var
  DtHoraEmiss : TDateTime;
begin

  try

    GerarNFEACBr(sCNPJEmitente, sCNPJDestinatario, iAnoVenda, iNumVenda, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML);

    Result := True;

    if ( Imprimir ) then
      ACBrNFe.NotasFiscais.Imprimir;
      
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar gerar NF-e.' + #13#13 + 'GerarNFeOffLineACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

function TDMNFe.CancelarNFeACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer; const Motivo : String) : Boolean;
var
  FileNameXML ,
  ChaveNFE    : String;
  iNumeroLote : Integer;
begin

  try

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( sCNPJDestinatario );
    AbrirVenda( iAnoVenda, iNumVenda );
    AbrirNFeEmitida( iAnoVenda, iNumVenda );

    FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CANCEL + qryCalculoImportoXML_NFE_FILENAME.AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    qryCalculoImportoXML_NFE.SaveToFile( FileNameXML );

    with ACBrNFe do
    begin
      NotasFiscais.Clear;

      (* Linhas de Cancelamento da NF-e em 09/04/2013
      NotasFiscais.LoadFromFile( FileNameXML );

      Result := Cancelamento( Motivo );
      *)

      // Numero do Lote de Envio
      iNumeroLote := StrToInt(FormatDateTime('yymmddhhmm', GetDateTimeDB));
      if not NotasFiscais.LoadFromFile( FileNameXML ) then
        raise Exception.Create('N�o foi poss�vel carregar o XML da Nota Fiscal Eletr�nica correspondente!' + #13 + FileNameXML);

      // Criar o Cancelamento
      EventoNFe.Evento.Clear;
      EventoNFe.idLote := iNumeroLote;

      with EventoNFe.Evento.Add do
      begin
        infEvento.chNFe      := qryNFeEmitidaCHAVE.AsString;
        infEvento.CNPJ       := sCNPJEmitente;
        infEvento.dhEvento   := GetDateTimeDB;
        infEvento.tpEvento        := teCancelamento;
        infEvento.detEvento.nProt := qryNFeEmitidaPROTOCOLO.AsString;
        infEvento.detEvento.xJust := Copy(Motivo, 1, 255);
      end;

      // Enviar o evento de cancelamento
      if ACBrNFe.EnviarEventoNFe(iNumeroLote) then
      begin
        with ACBrNFe.WebServices.EnvEvento do
        begin
          Result := (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135); // Evento registrado e vinculado a NF-e

          if EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
          begin
            raise Exception.CreateFmt(
              'Ocorreu o seguinte erro ao cancelar a Nota Fiscal Eletr�nica:'  + sLineBreak +
              'C�digo: %d' + sLineBreak +
              'Motivo: %s', [
                EventoRetorno.retEvento.Items[0].RetInfEvento.cStat,
                EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo
            ]);
          end;

          // Retornos
          (* Implementar grava��o de retorno em tabela do banco
          
          DataHoraEvento  := EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento;
          NumeroProtocolo := EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;
          XMLCancelamento := EventoRetorno.retEvento.Items[0].RetInfEvento.XML;
          CodigoStatus    := EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
          MotivoStatus    := EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;
          *)
        end;
      end
      else
      begin
        with ACBrNFe.WebServices.EnvEvento do
        begin
          raise Exception.Create(
            'Ocorreram erros ao tentar efetuar o Cancelamento:' + sLineBreak +
            'Lote: '     + IntToStr(EventoRetorno.idLote)  + sLineBreak +
            'Ambiente: ' + TpAmbToStr(EventoRetorno.tpAmb) + sLineBreak +
            'Orgao: '    + IntToStr(EventoRetorno.cOrgao)  + sLineBreak + sLineBreak +
            'Status: '   + IntToStr(EventoRetorno.cStat)   + sLineBreak +
            'Motivo: '   + EventoRetorno.xMotivo
          );
        end;
      end;

    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar cancelar NF-e de Sa�da.'+ #13#13 + 'CancelarNFeACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

function TDMNFe.ImprimirDANFEACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer;
  const IsPDF : Boolean = FALSE) : Boolean;
var
  FileNameXML : String;
begin

  try

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( sCNPJDestinatario );
    AbrirVenda( iAnoVenda, iNumVenda );

    if ( IsPDF ) then
      FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CLIENT + qryCalculoImportoXML_NFE_FILENAME.AsString
    else
      FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_PRINT  + qryCalculoImportoXML_NFE_FILENAME.AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    qryCalculoImportoXML_NFE.SaveToFile( FileNameXML );

    with ACBrNFe do
    begin
      NotasFiscais.Clear;
      NotasFiscais.LoadFromFile( FileNameXML );

      if NotasFiscais.Items[0].NFe.Ide.tpEmis = teDPEC then
      begin
        WebServices.ConsultaDPEC.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
        WebServices.ConsultaDPEC.Executar;

        DANFE.ProtocoloNFe := WebServices.ConsultaDPEC.nRegDPEC + ' ' + DateTimeToStr(WebServices.ConsultaDPEC.dhRegDPEC);
      end;

      if ( IsPDF ) then
        NotasFiscais.ImprimirPDF
      else
        NotasFiscais.Imprimir;

      Result := True;
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar imprimir DANFE da Sa�da.' + #13#13 + 'ImprimirDANFEACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

procedure TDMNFe.UpdateLoteNFe(const sCNPJEmitente : String; const Ano, Numero: Integer);
begin
  try
    with IBSQL do
    begin
      SQL.Clear;
      SQL.Add('Update TBEMPRESA Set');
      SQL.Add('    LOTE_ANO_NFE = ' + FormatFloat('####', Ano));
      SQL.Add('  , LOTE_NUM_NFE = ' + FormatFloat('#########', Numero));
      SQL.Add('Where CNPJ = ' + QuotedStr(sCNPJEmitente));

      ExecQuery;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('UpdateLoteNFe > ' + E.Message);
  end;
end;

procedure TDMNFe.UpdateNumeroNFe(const sCNPJEmitente : String; const Serie, Numero: Integer);
begin
  try
    with IBSQL do
    begin
      SQL.Clear;
      SQL.Add('Update TBEMPRESA Set');
      SQL.Add('    SERIE_NFE  = ' + FormatFloat('####', Serie));
      SQL.Add('  , NUMERO_NFE = ' + FormatFloat('#########', Numero));
      SQL.Add('Where CNPJ = ' + QuotedStr(sCNPJEmitente));

      ExecQuery;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('UpdateNumeroNFe > ' + E.Message);
  end;
end;

procedure TDMNFe.GerarNFEACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer;
  var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String);
begin

  try

    LerConfiguracao;

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( sCNPJDestinatario );
    AbrirVenda( iAnoVenda, iNumVenda );

    if not NetWorkActive(True) then
      Exit;

    iSerieNFe   := qryEmitenteSERIE_NFE.AsInteger;
    iNumeroNFe  := GetNextID('TBEMPRESA', 'NUMERO_NFE',   'where CNPJ = ' + QuotedStr(sCNPJEmitente) + ' and SERIE_NFE = '    + qryEmitenteSERIE_NFE.AsString);
    DtHoraEmiss := GetDateTimeDB;

    ACBrNFe.NotasFiscais.Clear;
    
    with ACBrNFe.NotasFiscais.Add.NFe do
    begin
      Ide.cNF       := iNumeroNFe; // Caso n�o seja preenchido ser� gerado um n�mero aleat�rio pelo componente
      Ide.natOp     := qryCalculoImportoCFOP_DESCRICAO.AsString;

      if ( qryCalculoImportoVENDA_PRAZO.AsInteger = 0 ) then
        Ide.indPag  := ipVista
      else
        Ide.indPag  := ipPrazo;

      Ide.modelo    := 55;
      Ide.serie     := iSerieNFe;
      Ide.nNF       := iNumeroNFe;
      Ide.dEmi      := GetDateDB; // StrToDate( FormatDateTime('dd/mm/yyyy', DtHoraEmiss) );
      Ide.tpNF      := tnSaida;
      Ide.tpEmis    := ACBrNFe.Configuracoes.Geral.FormaEmissao;
      Ide.tpAmb     := ACBrNFe.Configuracoes.WebServices.Ambiente;
      Ide.verProc   := GetExeVersion( ParamStr(0) ); // Vers�o do seu sistema
      Ide.cUF       := NotaUtil.UFtoCUF( qryEmitenteEST_SIGLA.AsString );
      Ide.cMunFG    := qryEmitenteCID_IBGE.AsInteger ;
      Ide.finNFe    := fnNormal;

  //     Ide.dhCont := date;
  //     Ide.xJust  := 'Justificativa Contingencia';

  //Para NFe referenciada use os campos abaixo
  {     with Ide.NFref.Add do
        begin
          refNFe       := ''; //NFe Eletronica

          RefNF.cUF    := 0;  // |
          RefNF.AAMM   := ''; // |
          RefNF.CNPJ   := ''; // |
          RefNF.modelo := 1;  // |- NFe Modelo 1/1A
          RefNF.serie  := 1;  // |
          RefNF.nNF    := 0;  // |

          RefNFP.cUF     := 0;  // |
          RefNFP.AAMM    := ''; // |
          RefNFP.CNPJCPF := ''; // |
          RefNFP.IE      := ''; // |- NF produtor Rural
          RefNFP.modelo  := ''; // |
          RefNFP.serie   := 1;  // |
          RefNFP.nNF     := 0;  // |

          RefECF.modelo  := ECFModRef2B; // |
          RefECF.nECF    := '';          // |- Cupom Fiscal
          RefECF.nCOO    := '';          // |
        end;
  }
      Emit.CNPJCPF := qryEmitenteCNPJ.AsString;
      Emit.IE      := Trim(qryEmitenteIE.AsString);
      Emit.CNAE    := Trim(qryEmitenteCNAE.AsString);  // C20 - CNAE fiscal Este campo deve ser informado quando o campo NFe.Emit.IM for informado.
      Emit.xNome   := qryEmitenteRZSOC.AsString;
      Emit.xFant   := qryEmitenteNMFANT.AsString;

      case qryEmitenteTIPO_REGIME_NFE.AsInteger of
        0 : Emit.CRT := crtSimplesNacional;
        1 : Emit.CRT := crtSimplesExcessoReceita;
        2 : Emit.CRT := crtRegimeNormal;
      end;

      Emit.EnderEmit.fone    := qryEmitenteFONE.AsString;
      Emit.EnderEmit.CEP     := StrToInt( qryEmitenteCEP.AsString );
      Emit.EnderEmit.xLgr    := Trim( qryEmitenteTLG_SIGLA.AsString + ' ' + qryEmitenteLOG_NOME.AsString );
      Emit.EnderEmit.nro     := qryEmitenteNUMERO_END.AsString;
      Emit.EnderEmit.xCpl    := qryEmitenteCOMPLEMENTO.AsString + '.';
      Emit.EnderEmit.xBairro := qryEmitenteBAI_NOME.AsString;
      Emit.EnderEmit.cMun    := qryEmitenteCID_IBGE.AsInteger;
      Emit.EnderEmit.xMun    := qryEmitenteCID_NOME.AsString;
      Emit.EnderEmit.UF      := qryEmitenteEST_SIGLA.AsString;
      Emit.enderEmit.cPais   := qryEmitentePAIS_ID.AsInteger;
      Emit.enderEmit.xPais   := qryEmitentePAIS_NOME.AsString;
      
      Emit.IEST              := '';
      Emit.IM                := ''; // Preencher no caso de existir servi�os na nota
      Emit.CNAE              := ''; // Verifique na cidade do emissor da NFe se � permitido
                                    // a inclus�o de servi�os na NFe

  //Para NFe Avulsa preencha os campos abaixo
  {      Avulsa.CNPJ    := '';
        Avulsa.xOrgao  := '';
        Avulsa.matr    := '';
        Avulsa.xAgente := '';
        Avulsa.fone    := '';
        Avulsa.UF      := '';
        Avulsa.nDAR    := '';
        Avulsa.dEmi    := now;
        Avulsa.vDAR    := 0;
        Avulsa.repEmi  := '';
        Avulsa.dPag    := now;             }

      Dest.CNPJCPF           := qryDestinatarioCNPJ.AsString; // FormatFloat('00000000000000', qryDestinatarioCNPJ.AsInteger);
      Dest.xNome             := qryDestinatarioNOME.AsString;

      if ( qryDestinatarioPESSOA_FISICA.AsInteger = 0 ) then
      begin
        Dest.IE              := Trim(qryDestinatarioINSCEST.AsString);
        Dest.ISUF            := EmptyStr;
      end
      else
      begin
        Dest.IE              := EmptyStr;
        Dest.ISUF            := EmptyStr;
      end;

      Dest.EnderDest.Fone    := qryDestinatarioFONE.AsString;
      Dest.EnderDest.CEP     := qryDestinatarioCEP.AsInteger;
      Dest.EnderDest.xLgr    := Trim( qryDestinatarioTLG_SIGLA.AsString + ' ' + qryDestinatarioLOG_NOME.AsString );
      Dest.EnderDest.nro     := qryDestinatarioNUMERO_END.AsString;
      Dest.EnderDest.xCpl    := qryDestinatarioCOMPLEMENTO.AsString;
      Dest.EnderDest.xBairro := qryDestinatarioBAI_NOME.AsString;
      Dest.EnderDest.cMun    := qryDestinatarioCID_IBGE.AsInteger;
      Dest.EnderDest.xMun    := qryDestinatarioCID_NOME.AsString;
      Dest.EnderDest.UF      := qryDestinatarioEST_SIGLA.AsString;
      Dest.EnderDest.cPais   := qryDestinatarioPAIS_ID.AsInteger;  // 1058;
      Dest.EnderDest.xPais   := qryDestinatarioPAIS_NOME.AsString; // 'BRASIL';

  //Use os campos abaixo para informar o endere�o de retirada quando for diferente do Emitente
  {      Retirada.CNPJCPF := '';
        Retirada.xLgr    := '';
        Retirada.nro     := '';
        Retirada.xCpl    := '';
        Retirada.xBairro := '';
        Retirada.cMun    := 0;
        Retirada.xMun    := '';
        Retirada.UF      := '';}

  //Use os campos abaixo para informar o endere�o de entrega quando for diferente do Remetente/Destinat�rio
  {      Entrega.CNPJCPF := '';
        Entrega.xLgr    := '';
        Entrega.nro     := '';
        Entrega.xCpl    := '';
        Entrega.xBairro := '';
        Entrega.cMun    := 0;
        Entrega.xMun    := '';
        Entrega.UF      := '';}

  //Adicionando Produtos
  
      qryDadosProduto.First;
      
      while not qryDadosProduto.Eof do
      begin

        with Det.Add do
        begin
          Prod.nItem    := qryDadosProduto.RecNo; // qryDadosProdutoSEQ.AsInteger;              // N�mero sequencial, para cada item deve ser incrementado
          Prod.cProd    := qryDadosProdutoCODPROD.AsString;

          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
            Prod.xProd  := qryDadosProdutoDESCRI.AsString
          else
            Prod.xProd  := qryDadosProdutoDESCRI.AsString + ' ' + qryDadosProdutoANO_FAB_MODELO_VEICULO.AsString;

          Prod.NCM      := qryDadosProdutoNCM_SH.AsString;            // Tabela NCM dispon�vel em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
          Prod.EXTIPI   := '';
          Prod.CFOP     := qryDadosProdutoCFOP_COD.AsString;

          Prod.cEAN     := qryDadosProdutoCODBARRA_EAN.AsString;
          Prod.uCom     := qryDadosProdutoUNP_SIGLA.AsString;
          Prod.qCom     := qryDadosProdutoQTDE.AsCurrency;

          if ( qryDadosProdutoPUNIT_PROMOCAO.AsCurrency > 0 ) then
            Prod.vUnCom := qryDadosProdutoPUNIT_PROMOCAO.AsCurrency   // I10a  Valor Unit�rio de comercializa��o
          else
            Prod.vUnCom := qryDadosProdutoPUNIT.AsCurrency;           // I10a  Valor Unit�rio de comercializa��o

          Prod.vProd    := qryDadosProdutoTOTAL_BRUTO.AsCurrency;     // I11 - Valor Total Bruto dos Produtos ou Servi�os

          Prod.cEANTrib  := qryDadosProdutoCODBARRA_EAN.AsString;
          Prod.uTrib     := qryDadosProdutoUNP_SIGLA.AsString;
          Prod.qTrib     := qryDadosProdutoQTDE.AsCurrency;

          if ( qryDadosProdutoPUNIT_PROMOCAO.AsCurrency > 0 ) then
            Prod.vUnTrib := qryDadosProdutoPUNIT_PROMOCAO.AsCurrency  // I14a  Valor Unit�rio de tributa��o
          else
            Prod.vUnTrib := qryDadosProdutoPUNIT.AsCurrency;          // I14a  Valor Unit�rio de tributa��o

(* EXEMPLO *)
          // NFe.Det[i].Prod.uCom    := 'CX';                                                   = 'UN'
          // NFe.Det[i].Prod.qCom    :=    2;   Vendidas 2 caixas ( com 10 unidades cada )      = 20
          // NFe.Det[i].Prod.vUnCom  :=   50;   R$ 50,00 cada caixa                             = 50,00 / 10 = 5,00
          // NFe.Det[i].Prod.vProd   :=  100;   R$ 100,00 Valor dos produtos                    = 20 * 5,00 = 100,00
          // NFe.Det[i].Prod.uTrib   := 'UN';                                                   = 'UN'
          // NFe.Det[i].Prod.qTrib   :=   20;   2 caixas X 10 unidades por caixa = 20 unidades  = 20
          // NFe.Det[i].Prod.vUnTrib :=    5;   R$ 100,00 / 20 unidades = R$ 5,00 cada unidade  = 100,00 / 20 = 5,00

          Prod.vFrete    := 0;                                        // I15 - Valor Total do Frete
          Prod.vSeg      := 0;                                        // I16 - Valor Total do Seguro
          Prod.vDesc     := qryDadosProdutoTOTAL_DESCONTO.AsCurrency; // I17 - Valor do Desconto

          // Informa��o Adicional do Produto
          
          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
            if ( Trim(qryDadosProdutoREFERENCIA.AsString) <> EmptyStr ) then
              infAdProd    := 'Ref.: ' + qryDadosProdutoREFERENCIA.AsString
            else
              infAdProd    := EmptyStr
          else
            infAdProd      := 'Cor: '         + qryDadosProdutoCOR_VEICULO_DESCRICAO.AsString + #13 +
                              'Placa: '       + qryDadosProdutoREFERENCIA.AsString      + #13 +
                              'Renavam: '     + qryDadosProdutoRENAVAM_VEICULO.AsString + #13 +
                              'Combustivel: ' + qryDadosProdutoCOMBUSTIVEL_VEICULO_DESCRICAO.AsString;

  //Declara��o de Importa��o. Pode ser adicionada v�rias atrav�s do comando Prod.DI.Add
  
  {         with Prod.DI.Add do
            begin
              nDi         := '';
              dDi         := now;
              xLocDesemb  := '';
              UFDesemb    := '';
              dDesemb     := now;
              cExportador := '';

              with adi.Add do
               begin
                 nAdicao     := 1;
                 nSeqAdi     := 1;
                 cFabricante := '';
                 vDescDI     := 0;
               end;
            end;
  }

  //Campos para venda de ve�culos novos

          if ( (GetSegmentoID(qryEmitenteCNPJ.AsString) = SEGMENTO_MERCADO_CARRO_ID) and (qryDadosProdutoPRODUTO_NOVO.AsInteger = 1) ) then
          begin

            with Prod.veicProd do
              begin
                tpOP     := toVendaConcessionaria; // J02 - Tipo da opera��o
                                                   //    (1) = toVendaConcessionaria
                                                   //    (2) = toFaturamentoDireto
                                                   //    (3) = toVendaDireta
                                                   //    (0) = toOutros
                chassi   := qryDadosProdutoCHASSI_VEICULO.AsString;        // J03 - Chassi do ve�culo
                cCor     := qryDadosProdutoCOR_VEICULO.AsString;           // J04 - Cor
                xCor     := qryDadosProdutoCOR_VEICULO_DESCRICAO.AsString; // J05 - Descri��o da Cor
                pot      := ''; // J06 - Pot�ncia Motor
                Cilin    := '';
                pesoL    := ''; // J08 - Peso L�quido
                pesoB    := ''; // J09 - Peso Bruto
                nSerie   := ''; // J10 - Serial (s�rie)
                tpComb   := qryDadosProdutoCOMBUSTIVEL_VEICULO_DESCRICAO.AsString; // J11 - Tipo de combust�vel
                nMotor   := ''; // J12 - N�mero de Motor
                CMT      := '';
                dist     := '';        // J14 - Dist�ncia entre eixos
//                RENAVAM  := '';        // J15 - RENAVAM            (N�o informar a TAG na exporta��o)
                anoMod   := qryDadosProdutoANO_MODELO_VEICULO.AsInteger;         // J16 - Ano Modelo de Fabrica��o
                anoFab   := qryDadosProdutoANO_FABRICACAO_VEICULO.AsInteger;     // J17 - Ano de Fabrica��o
                tpPint   := '';        // J18 - Tipo de Pintura
                tpVeic   := StrToIntDef(qryDadosProdutoTIPO_VEICULO.AsString, 0); // J19 - Tipo de Ve�culo    (Utilizar Tabela RENAVAM)
                espVeic  := 0;         // J20 - Esp�cie de Ve�culo (Utilizar Tabela RENAVAM)
                VIN      := '';        // J21 - Condi��o do VIN
                condVeic := cvAcabado; // J22 - Condi��o do Ve�culo (1 - Acabado; 2 - Inacabado; 3 - Semi-acabado)
                cMod     := '';        // J23 - C�digo Marca Modelo (Utilizar Tabela RENAVAM)
              end;

          end;

{
    property tpOP: TpcnTipoOperacao read FtpOP write FtpOP;
    property chassi: string read Fchassi write Fchassi;
    property cCor: string read FcCor write FcCor;
    property xCor: string read FxCor write FxCor;
    property pot: string read Fpot write Fpot;
    property Cilin: string read FCilin write FCilin;
    property pesoL: string read FpesoL write FpesoL;
    property pesoB: string read FpesoB write FpesoB;
    property nSerie: string read FnSerie write FnSerie;
    property tpComb: string read FtpComb write FtpComb;
    property nMotor: string read FnMotor write FnMotor;
    property CMT: string read FCMT write FCMT;
    property dist: string read Fdist write Fdist;
    //property RENAVAM: string read FRENAVAM write FRENAVAM;
    property anoMod: integer read FanoMod write FanoMod;
    property anoFab: integer read FanoFab write FanoFab;
    property tpPint: string read FtpPint write FtpPint;
    property tpVeic: integer read FtpVeic write FtpVeic;
    property espVeic: integer read FespVeic write FespVeic;
    property VIN: string read FVIN write FVIN;
    property condVeic: TpcnCondicaoVeiculo read FcondVeic write FcondVeic;
    property cMod: string read FcMod write FcMod;

    property cCorDENATRAN: string read FcCorDENATRAN write FcCorDENATRAN;
    property lota: integer read Flota write Flota;
    property tpRest: integer read FtpRest write FtpRest;
}

  //Campos espec�ficos para venda de medicamentos
  {         with Prod.med.Add do
            begin
              nLote := '';
              qLote := 0 ;
              dFab  := now ;
              dVal  := now ;
              vPMC  := 0 ;
            end;  }

  //Campos espec�ficos para venda de armamento
  {         with Prod.arma.Add do
            begin
              nSerie := 0;
              tpArma := taUsoPermitido ;
              nCano  := 0 ;
              descr  := '' ;
            end;      }

  //Campos espec�ficos para venda de combust�vel(distribuidoras)
  {         with Prod.comb do
            begin
              cProdANP := 0;
              CODIF    := '';
              qTemp    := 0;
              UFcons   := '';

              CIDE.qBCprod   := 0 ;
              CIDE.vAliqProd := 0 ;
              CIDE.vCIDE     := 0 ;

              ICMS.vBCICMS   := 0 ;
              ICMS.vICMS     := 0 ;
              ICMS.vBCICMSST := 0 ;
              ICMS.vICMSST   := 0 ;

              ICMSInter.vBCICMSSTDest := 0 ;
              ICMSInter.vICMSSTDest   := 0 ;

              ICMSCons.vBCICMSSTCons := 0 ;
              ICMSCons.vICMSSTCons   := 0 ;
              ICMSCons.UFcons        := '' ;
            end;}

          with Imposto do
          begin
            with ICMS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                // csosnVazio, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900
                
                Case qryDadosProdutoCSOSN.AsInteger of
                  101 : CSOSN := csosn101;
                  102 : CSOSN := csosn102;
                  103 : CSOSN := csosn103;
                  201 : CSOSN := csosn201;
                  202 : CSOSN := csosn202;
                  203 : CSOSN := csosn203;
                  300 : CSOSN := csosn300;
                  400 : CSOSN := csosn400;
                  500 : CSOSN := csosn500;
                  else
                    CSOSN := csosn900;
                end;

                pCredSN     := qryDadosProdutoALIQUOTA_CSOSN.AsCurrency;
                vCredICMSSN := qryDadosProdutoPFINAL.AsCurrency * pCredSN / 100;

              end
              else
              begin

                Case qryDadosProdutoCODTRIBUTACAO.AsInteger of
                   0 : CST := cst00;
                  10 : CST := cst10;
                  20 : CST := cst20;
                  30 : CST := cst30;
                  40 : CST := cst40;
                  41 : CST := cst41;
                  50 : CST := cst50;
                  51 : CST := cst51;
                  60 : CST := cst60;
                  70 : CST := cst70;
                  else
                    CST := cst90;
                end;

                ICMS.modBC   := dbiValorOperacao;
                ICMS.pRedBC  := qryDadosProdutoPERCENTUAL_REDUCAO_BC.AsCurrency;
                
                if ( ICMS.pRedBC > 0 ) then
                  ICMS.vBC   := qryDadosProdutoVALOR_REDUCAO_BC.AsCurrency
                else
                  ICMS.vBC   := qryDadosProdutoPFINAL.AsCurrency;

                ICMS.pICMS   := qryDadosProdutoALIQUOTA.AsCurrency;
                ICMS.vICMS   := ICMS.vBC * ICMS.pICMS / 100;

              end;

              ICMS.orig    := TpcnOrigemMercadoria( qryDadosProdutoCODORIGEM.AsInteger );
              ICMS.modBCST := dbisMargemValorAgregado;
              ICMS.pMVAST  := 0;
              ICMS.pRedBCST:= 0;
              ICMS.vBCST   := 0;
              ICMS.pICMSST := 0;
              ICMS.vICMSST := 0;

            end;

            with PIS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                CST      := pis99;
                PIS.vBC  := 0;
                PIS.pPIS := 0;
                PIS.vPIS := 0;

                PIS.qBCProd   := 0;
                PIS.vAliqProd := 0;

              end
              else
              begin

                CST := TpcnCstPis(qryDadosProdutoCST_PIS_INDICE_ACBR.AsInteger);

                if ( CST = pis99 ) then
                begin
                  PIS.vBC  := 0;
                  PIS.pPIS := 0;
                  PIS.vPIS := 0;
                end
                else
                begin
                  PIS.vBC  := qryDadosProdutoPFINAL.AsCurrency;
                  PIS.pPIS := qryDadosProdutoALIQUOTA_PIS.AsCurrency;
                  PIS.vPIS := PIS.vBC * PIS.pPIS / 100;
                end;

                PIS.qBCProd   := 0;
                PIS.vAliqProd := 0;

              end;
            end;

            with COFINS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                CST            := cof99;
                COFINS.vBC     := 0;
                COFINS.pCOFINS := 0;
                COFINS.vCOFINS := 0;

                COFINS.qBCProd   := 0;
                COFINS.vAliqProd := 0;

              end
              else
              begin

                CST := TpcnCstCofins(qryDadosProdutoCST_COFINS_INDICE_ACBR.AsInteger);

                if ( CST = cof99 ) then
                begin
                  COFINS.vBC     := 0;
                  COFINS.pCOFINS := 0;
                  COFINS.vCOFINS := 0;
                end
                else
                begin
                  COFINS.vBC     := qryDadosProdutoPFINAL.AsCurrency;
                  COFINS.pCOFINS := qryDadosProdutoALIQUOTA_COFINS.AsCurrency;
                  COFINS.vCOFINS := COFINS.vBC * COFINS.pCOFINS / 100;
                end;

                COFINS.qBCProd   := 0;
                COFINS.vAliqProd := 0;
                
              end;
            end;

  {
            with IPI do
            begin
              CST      := ipi99 ;
              clEnq    := '999';
              CNPJProd := '';
              cSelo    := '';
              qSelo    := 0;
              cEnq     := '';

              vBC    := qryDadosProdutoPUNIT.AsCurrency;
              qUnid  := 0;
              vUnid  := 0;
              pIPI   := 0; // Percentual IPI
              vIPI   := 0; // Valor IPI
            end;

              with II do
               begin
                 vBc      := 0;
                 vDespAdu := 0;
                 vII      := 0;
                 vIOF     := 0;
               end;

              with PISST do
               begin
                 vBc       := 0;
                 pPis      := 0;
                 qBCProd   := 0;
                 vAliqProd := 0;
                 vPIS      := 0;
               end;

              with COFINSST do
               begin
                 vBC       := 0;
                 pCOFINS   := 0;
                 qBCProd   := 0;
                 vAliqProd := 0;
                 vCOFINS   := 0;
               end;
  }
  //Grupo para servi�os
  {            with ISSQN do
               begin
                 vBC       := 0;
                 vAliq     := 0;
                 vISSQN    := 0;
                 cMunFG    := 0;
                 cListServ := 0; // Preencha este campo usando a tabela dispon�vel
                                 // em http://www.planalto.gov.br/Ccivil_03/LEIS/LCP/Lcp116.htm
               end;}
          end;
        end ;

        qryDadosProduto.Next;
      end;

      Total.ICMSTot.vBC     := qryCalculoImportoNFE_VALOR_BASE_ICMS.AsCurrency;
      Total.ICMSTot.vICMS   := qryCalculoImportoNFE_VALOR_ICMS.AsCurrency;
      Total.ICMSTot.vBCST   := qryCalculoImportoNFE_VALOR_BASE_ICMS_SUBST.AsCurrency;
      Total.ICMSTot.vST     := qryCalculoImportoNFE_VALOR_ICMS_SUBST.AsCurrency;
      Total.ICMSTot.vProd   := qryCalculoImportoNFE_VALOR_TOTAL_PRODUTO.AsCurrency;
      Total.ICMSTot.vFrete  := qryCalculoImportoNFE_VALOR_FRETE.AsCurrency;
      Total.ICMSTot.vSeg    := qryCalculoImportoNFE_VALOR_SEGURO.AsCurrency;
      Total.ICMSTot.vDesc   := qryCalculoImportoNFE_VALOR_DESCONTO.AsCurrency;
      Total.ICMSTot.vII     := qryCalculoImportoNFE_VALOR_TOTAL_II.AsCurrency;
      Total.ICMSTot.vIPI    := qryCalculoImportoNFE_VALOR_TOTAL_IPI.AsCurrency;
      Total.ICMSTot.vPIS    := qryCalculoImportoNFE_VALOR_PIS.AsCurrency;
      Total.ICMSTot.vCOFINS := qryCalculoImportoNFE_VALOR_COFINS.AsCurrency;
      Total.ICMSTot.vOutro  := qryCalculoImportoNFE_VALOR_OUTROS.AsCurrency;
      Total.ICMSTot.vNF     := qryCalculoImportoNFE_VALOR_TOTAL_NOTA.AsCurrency;

  {      Total.ISSQNtot.vServ   := 0;
        Total.ISSQNTot.vBC     := 0;
        Total.ISSQNTot.vISS    := 0;
        Total.ISSQNTot.vPIS    := 0;
        Total.ISSQNTot.vCOFINS := 0;}

  {      Total.retTrib.vRetPIS    := 0;
        Total.retTrib.vRetCOFINS := 0;
        Total.retTrib.vRetCSLL   := 0;
        Total.retTrib.vBCIRRF    := 0;
        Total.retTrib.vIRRF      := 0;
        Total.retTrib.vBCRetPrev := 0;
        Total.retTrib.vRetPrev   := 0;}

      Transp.modFrete            := mfSemFrete; // X02 - Modalidade do frete
                                                //         (0)=mfContaEmitente     � por conta do emitente;
                                                //         (1)=mfContaDestinatario � por conta do destinat�rio)
                                                //       TAG de grupo Transportador - <transporta> - Ocorr�ncia 0-1
      Transp.Transporta.CNPJCPF  := '';
      Transp.Transporta.xNome    := '';
      Transp.Transporta.IE       := '';
      Transp.Transporta.xEnder   := '';
      Transp.Transporta.xMun     := '';
      Transp.Transporta.UF       := '';

  {      Transp.retTransp.vServ    := 0;
        Transp.retTransp.vBCRet   := 0;
        Transp.retTransp.pICMSRet := 0;
        Transp.retTransp.vICMSRet := 0;
        Transp.retTransp.CFOP     := '';
        Transp.retTransp.cMunFG   := 0;         }

        Transp.veicTransp.placa := '';
        Transp.veicTransp.UF    := '';
        Transp.veicTransp.RNTC  := '';
  //Dados do Reboque
  {      with Transp.Reboque.Add do
         begin
           placa := '';
           UF    := '';
           RNTC  := '';
         end;}

      if ( Transp.modFrete in [mfContaDestinatario, mfContaTerceiros] ) then
        with Transp.Vol.Add do
        begin
          qVol  := qryDadosProduto.RecordCount;
          esp   := 'Especie';
          marca := 'Marca';
          nVol  := 'Numero';
          pesoB := qryDadosProduto.RecordCount * 1;
          pesoL := qryDadosProduto.RecordCount * 1.01;

          //Lacres do volume. Pode ser adicionado v�rios
          //Lacres.Add.nLacre := '';
        end;

//      // Dados da Fatura
//
//      Cobr.Fat.nFat  := FormatFloat('0000', qryCalculoImportoANO.AsInteger) + '/' + FormatFloat('0000000', qryCalculoImportoCODCONTROL.AsInteger);
//      Cobr.Fat.vOrig := qryCalculoImportoTOTALVENDABRUTA.AsCurrency;
//      Cobr.Fat.vDesc := qryCalculoImportoDESCONTO.AsCurrency ;
//      Cobr.Fat.vLiq  := qryCalculoImportoTOTALVENDA.AsCurrency ;

      // Dados da(s) Duplicata(s)
      
      if ( qryCalculoImportoVENDA_PRAZO.AsInteger = 1 ) then
      begin
        qryDuplicatas.First;
        while not qryDuplicatas.Eof do
        begin
          with Cobr.Dup.Add do
          begin
            nDup  := FormatFloat('0000', qryDuplicatasANOLANC.AsInteger) + '/' + FormatFloat('0000000', qryDuplicatasNUMLANC.AsInteger);
            dVenc := qryDuplicatasDTVENC.AsDateTime;
            vDup  := qryDuplicatasVALORREC.AsCurrency;
          end;

          qryDuplicatas.Next;
        end;
      end;

      InfAdic.infCpl     := ' * * * ' + #13 +
                            'Venda: ' + qryCalculoImportoANO.AsString + '/' + FormatFloat('###0000000', qryCalculoImportoCODCONTROL.AsInteger)  +
                            ' - Forma/Cond. Pgto.: ' + qryCalculoImportoLISTA_FORMA_PAGO.AsString + '/' + qryCalculoImportoLISTA_COND_PAGO_FULL.AsString + ' * * * ' + #13 +
                            'Vendedor: ' + qryCalculoImportoVENDEDOR_NOME.AsString + ' * * * ' + #13 +
                            'Observa��es : ' + qryCalculoImportoOBS.AsString;

      InfAdic.infAdFisco := 'Info. Fisco: ' + GetInformacaoFisco;

  {
      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Info. Fisco: ' + GetInformacaoFisco;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Obsera��es da venda: ' + qryCalculoImportoOBS.AsString;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Venda: ' + qryCalculoImportoANO.AsString + '/' + FormatFloat('###0000000', qryCalculoImportoCODCONTROL.AsInteger) +
                  ' - Forma/Cond. Pgto.: ' + qryCalculoImportoFORMAPAG.AsString + '/' + qryCalculoImportoCOND_DESCRICAO_FULL.AsString;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Vendedor: ' + qryCalculoImportoVENDEDOR_NOME.AsString;
      end;

      with InfAdic.obsFisco.Add do
      begin
        xCampo := 'ObsFisco';
        xTexto := GetInformacaoFisco;
      end;

  //Processo referenciado
       with InfAdic.procRef.Add do
         begin
           nProc := '';
           indProc := ipSEFAZ;
         end;                 }

      exporta.UFembarq   := '';
      exporta.xLocEmbarq := '';

      compra.xNEmp := '';
      compra.xPed  := '';
      compra.xCont := '';

      ACBrNFe.NotasFiscais.GerarNFe;
      ACBrNFe.NotasFiscais.Assinar;
      ACBrNFe.NotasFiscais.Valida;

      ACBrNFe.NotasFiscais.Items[0].SaveToFile( EmptyStr );

      FileNameXML := ACBrNFe.NotasFiscais.Items[0].NomeArq;

    end;

  except
    On E : Exception do
      ShowError('Erro ao tentar gerar NF-e de Sa�da.' + #13#13 + 'GerarNFEACBr() --> ' + e.Message);
  end;

end;

procedure TDMNFe.FrECFPoolerGetValue(const VarName: String;
  var Value: Variant);
begin
  if ( VarName = 'CEPEmissor' ) then
    Value := StrFormatarCEP(qryEmitenteCEP.AsString);

  if ( VarName = 'CNPJEmissor' ) then
    Value := StrFormatarCnpj(qryEmitenteCNPJ.AsString);

  if ( VarName = 'FONEEmissor' ) then
    Value := StrFormatarFONE(qryEmitenteFONE.AsString);

  if ( VarName = 'CNPJCliente' ) then
    if ( qryDestinatarioPESSOA_FISICA.AsInteger = 0 ) then
      Value := StrFormatarCnpj(qryDestinatarioCNPJ.AsString)
    else
      Value := StrFormatarCpf(qryDestinatarioCNPJ.AsString);
end;

procedure TDMNFe.GerarTabela_CST_PIS;
var
  I : Integer;
  sCST_PIS_ID : Array[0..32] of String;
const
  CST_PIS_DESC : Array[0..32] of String = (
      'Opera��o Tribut�vel com Al�quota B�sica'
    , 'Opera��o Tribut�vel com Al�quota Diferenciada'
    , 'Opera��o Tribut�vel com Al�quota por Unidade de Medida de Produto'
    , 'Opera��o Tribut�vel Monof�sica - Revenda a Al�quota Zero'
    , 'Opera��o Tribut�vel por Substitui��o Tribut�ria'
    , 'Opera��o Tribut�vel a Al�quota Zero'
    , 'Opera��o Isenta da Contribui��o'
    , 'Opera��o sem Incid�nc ia da Contribui��o'
    , 'Opera��o com Suspens�o da Contribui��o'
    , 'Outras Opera��es de Sa�da'
    , 'Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno'
    , 'Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita N�o Tributada no Mercado Interno'
    , 'Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita de Exporta��o'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas no Mercado Interno e de Exporta��o'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas N�o-Tributadas no Mercado Interno e de Exporta��o'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno, e de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita Tributada no Mercado Interno'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita N�o-Tributada no Mercado Interno'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas no Mercado Interno e de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas N�o-Tributadas no Mercado Interno e de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno, e de Exporta��o'
    , 'Cr�dito Presumido - Outras Opera��es'
    , 'Opera��o de Aquisi��o sem Direito a Cr�dito'
    , 'Opera��o de Aquisi��o com Isen��o'
    , 'Opera��o de Aquisi��o com Suspens�o'
    , 'Opera��o de Aquisi��o a Al�quota Zero'
    , 'Opera��o de Aquisi��o sem Incid�ncia da Contribui��o'
    , 'Opera��o de Aquisi��o por Substitui��o Tribut�ria'
    , 'Outras Opera��es de Entrada'
    , 'Outras Opera��es'
  );
begin
  try
    sCST_PIS_ID[0]  := '01'; // Opera��o Tribut�vel com Al�quota B�sica
    sCST_PIS_ID[1]  := '02'; // Opera��o Tribut�vel com Al�quota Diferenciada
    sCST_PIS_ID[2]  := '03'; // Opera��o Tribut�vel com Al�quota por Unidade de Medida de Produto
    sCST_PIS_ID[3]  := '04'; // Opera��o Tribut�vel Monof�sica - Revenda a Al�quota Zero
    sCST_PIS_ID[4]  := '05'; // Opera��o Tribut�vel por Substitui��o Tribut�ria
    sCST_PIS_ID[5]  := '06'; // Opera��o Tribut�vel a Al�quota Zero
    sCST_PIS_ID[6]  := '07'; // Opera��o Isenta da Contribui��o
    sCST_PIS_ID[7]  := '08'; // Opera��o sem Incid�nc ia da Contribui��o
    sCST_PIS_ID[8]  := '09'; // Opera��o com Suspens�o da Contribui��o
    sCST_PIS_ID[9]  := '49'; // Outras Opera��es de Sa�da
    sCST_PIS_ID[10] := '50'; // Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno
    sCST_PIS_ID[11] := '51'; // Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita N�o Tributada no Mercado Interno
    sCST_PIS_ID[12] := '52'; // Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita de Exporta��o
    sCST_PIS_ID[13] := '53'; // Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno
    sCST_PIS_ID[14] := '54'; // Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas no Mercado Interno e de Exporta��o
    sCST_PIS_ID[15] := '55'; // Opera��o com Direito a Cr�dito - Vinculada a Receitas N�o-Tributadas no Mercado Interno e de Exporta��o
    sCST_PIS_ID[16] := '56'; // Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno' e de Exporta��o
    sCST_PIS_ID[17] := '60'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita Tributada no Mercado Interno
    sCST_PIS_ID[18] := '61'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita N�o-Tributada no Mercado Interno
    sCST_PIS_ID[19] := '62'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita de Exporta��o
    sCST_PIS_ID[20] := '63'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno
    sCST_PIS_ID[21] := '64'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas no Mercado Interno e de Exporta��o
    sCST_PIS_ID[22] := '65'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas N�o-Tributadas no Mercado Interno e de Exporta��o
    sCST_PIS_ID[23] := '66'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno' e de Exporta��o
    sCST_PIS_ID[24] := '67'; // Cr�dito Presumido - Outras Opera��es
    sCST_PIS_ID[25] := '70'; // Opera��o de Aquisi��o sem Direito a Cr�dito
    sCST_PIS_ID[26] := '71'; // Opera��o de Aquisi��o com Isen��o
    sCST_PIS_ID[27] := '72'; // Opera��o de Aquisi��o com Suspens�o
    sCST_PIS_ID[28] := '73'; // Opera��o de Aquisi��o a Al�quota Zero
    sCST_PIS_ID[29] := '74'; // Opera��o de Aquisi��o sem Incid�ncia da Contribui��o
    sCST_PIS_ID[30] := '75'; // Opera��o de Aquisi��o por Substitui��o Tribut�ria
    sCST_PIS_ID[31] := '98'; // Outras Opera��es de Entrada
    sCST_PIS_ID[32] := '99'; // Outras Opera��es

    for I := Low(sCST_PIS_ID) to High(sCST_PIS_ID) do
      with IBSQL do
      begin
        SQL.Clear;
        SQL.Add( 'Execute Procedure SET_CST_PIS ('     );
        SQL.Add( '    ' + QuotedStr(sCST_PIS_ID[I])    );
        SQL.Add( '  , ' + QuotedStr(CST_PIS_DESC[I])   );
        SQL.Add( '  , ' + IntToStr(Ord(TpcnCstIpi(I))) );
        SQL.Add( ')' );

        ExecQuery;
        CommitTransaction;
      end;
  except
    On E : Exception do
      raise Exception.Create('Erro no procedimento GerarTabela_CST_PIS - ' + E.Message);
  end;
end;

procedure TDMNFe.GerarTabela_CST_COFINS;
var
  I : Integer;
const
  sCST_PIS_ID : Array[0..32] of String = (
      '01'
    , '02'
    , '03'
    , '04'
    , '05'
    , '06'
    , '07'
    , '08'
    , '09'
    , '49'
    , '50'
    , '51'
    , '52'
    , '53'
    , '54'
    , '55'
    , '56'
    , '60'
    , '61'
    , '62'
    , '63'
    , '64'
    , '65'
    , '66'
    , '67'
    , '70'
    , '71'
    , '72'
    , '73'
    , '74'
    , '75'
    , '98'
    , '99'
  );
  CST_PIS_DESC : Array[0..32] of String = (
      'Opera��o Tribut�vel com Al�quota B�sica'
    , 'Opera��o Tribut�vel com Al�quota Diferenciada'
    , 'Opera��o Tribut�vel com Al�quota por Unidade de Medida de Produto'
    , 'Opera��o Tribut�vel Monof�sica - Revenda a Al�quota Zero'
    , 'Opera��o Tribut�vel por Substitui��o Tribut�ria'
    , 'Opera��o Tribut�vel a Al�quota Zero'
    , 'Opera��o Isenta da Contribui��o'
    , 'Opera��o sem Incid�ncia da Contribui��o'
    , 'Opera��o com Suspens�o da Contribui��o'
    , 'Outras Opera��es de Sa�da'
    , 'Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno'
    , 'Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita N�o-Tributada no Mercado Interno'
    , 'Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita de Exporta��o'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas no Mercado Interno e de Exporta��o'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas N�o Tributadas no Mercado Interno e de Exporta��o'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno e de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita Tributada no Mercado Interno'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita N�o-Tributada no Mercado Interno'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas no Mercado Interno e de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas N�o-Tributadas no Mercado Interno e de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno e de Exporta��o'
    , 'Cr�dito Presumido - Outras Opera��es'
    , 'Opera��o de Aquisi��o sem Direito a Cr�dito'
    , 'Opera��o de Aquisi��o com Isen��o'
    , 'Opera��o de Aquisi��o com Suspens�o'
    , 'Opera��o de Aquisi��o a Al�quota Zero'
    , 'Opera��o de Aquisi��o sem Incid�ncia da Contribui��o'
    , 'Opera��o de Aquisi��o por Substitui��o Tribut�ria'
    , 'Outras Opera��es de Entrada'
    , 'Outras Opera��es'
  );
begin
  try
    for I := Low(sCST_PIS_ID) to High(sCST_PIS_ID) do
      with IBSQL do
      begin
        SQL.Clear;
        SQL.Add( 'Execute Procedure SET_CST_COFINS ('     );
        SQL.Add( '    ' + QuotedStr(sCST_PIS_ID[I])    );
        SQL.Add( '  , ' + QuotedStr(CST_PIS_DESC[I])   );
        SQL.Add( '  , ' + IntToStr(Ord(TpcnCstCofins(I))) );
        SQL.Add( ')' );

        ExecQuery;
        CommitTransaction;
      end;
  except
    On E : Exception do
      raise Exception.Create('Erro no procedimento GerarTabela_CST_COFINS - ' + E.Message);
  end;
end;

function TDMNFe.GerarNFeEntradaOnLineACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra: Integer;
  var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
  const Imprimir : Boolean = TRUE): Boolean;
var
  DtHoraEmiss : TDateTime;
begin

  try

    GerarNFEEntradaACBr(sCNPJEmitente, iCodFornecedor, iAnoCompra, iNumCompra, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML);

    iNumeroLote := GetNextID('TBEMPRESA', 'LOTE_NUM_NFE', 'where CNPJ = ' + QuotedStr(sCNPJEmitente) + ' and LOTE_ANO_NFE = ' + qryEmitenteLOTE_ANO_NFE.AsString);

    Result := ACBrNFe.Enviar( iNumeroLote, Imprimir );

    if ( Result ) then
    begin
      ChaveNFE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
      ProtocoloNFE := ACBrNFe.WebServices.Retorno.Protocolo;
      ReciboNFE    := ACBrNFe.WebServices.Retorno.Recibo;

      UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
      UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar gerar NF-e de Entrada.' + #13#13 + 'GerarNFeEntradaOnLineACBr() --> ' + E.Message);
      Result := False;
    end;
  end;

end;

function TDMNFe.GerarNFeEntradaOffLineACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
  var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE : String;
  const Imprimir : Boolean = TRUE) : Boolean;
var
  DtHoraEmiss : TDateTime;
begin

  try

    GerarNFEEntradaACBr(sCNPJEmitente, iCodFornecedor, iAnoCompra, iNumCompra, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML);

    Result := True;

    if ( Imprimir ) then
      ACBrNFe.NotasFiscais.Imprimir;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar gerar NF-e de Entrada.' + #13#13 + 'GerarNFeEntradaOffLineACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

procedure TDMNFe.GerarNFEEntradaACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
  var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String);
begin

  try

    LerConfiguracao;

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatarioFornecedor( iCodFornecedor );
    AbrirCompra( iAnoCompra, iNumCompra );

    if not NetWorkActive(True) then
      Exit;

    iSerieNFe   := qryEmitenteSERIE_NFE.AsInteger;
    iNumeroNFe  := GetNextID('TBEMPRESA', 'NUMERO_NFE',   'where CNPJ = ' + QuotedStr(sCNPJEmitente) + ' and SERIE_NFE = '    + qryEmitenteSERIE_NFE.AsString);
    DtHoraEmiss := GetDateTimeDB;

    ACBrNFe.NotasFiscais.Clear;
    
    with ACBrNFe.NotasFiscais.Add.NFe do
    begin
      Ide.cNF       := iNumeroNFe; // Caso n�o seja preenchido ser� gerado um n�mero aleat�rio pelo componente
      Ide.natOp     := qryEntradaCalculoImportoCFOP_DESCRICAO.AsString;

      if ( qryEntradaCalculoImportoCOMPRA_PRAZO.AsInteger = 0 ) then
        Ide.indPag  := ipVista
      else
        Ide.indPag  := ipPrazo;

      Ide.modelo    := 55;
      Ide.serie     := iSerieNFe;
      Ide.nNF       := iNumeroNFe;
      Ide.dEmi      := GetDateDB; // StrToDate( FormatDateTime('dd/mm/yyyy', DtHoraEmiss) );
      Ide.tpNF      := tnEntrada;
      Ide.tpEmis    := ACBrNFe.Configuracoes.Geral.FormaEmissao;
      Ide.tpAmb     := ACBrNFe.Configuracoes.WebServices.Ambiente;
      Ide.verProc   := GetExeVersion( ParamStr(0) ); // Vers�o do seu sistema
      Ide.cUF       := NotaUtil.UFtoCUF( qryEmitenteEST_SIGLA.AsString );
      Ide.cMunFG    := qryEmitenteCID_IBGE.AsInteger ;
      Ide.finNFe    := fnNormal;

  //     Ide.dhCont := date;
  //     Ide.xJust  := 'Justificativa Contingencia';

  //Para NFe referenciada use os campos abaixo
  {     with Ide.NFref.Add do
        begin
          refNFe       := ''; //NFe Eletronica

          RefNF.cUF    := 0;  // |
          RefNF.AAMM   := ''; // |
          RefNF.CNPJ   := ''; // |
          RefNF.modelo := 1;  // |- NFe Modelo 1/1A
          RefNF.serie  := 1;  // |
          RefNF.nNF    := 0;  // |

          RefNFP.cUF     := 0;  // |
          RefNFP.AAMM    := ''; // |
          RefNFP.CNPJCPF := ''; // |
          RefNFP.IE      := ''; // |- NF produtor Rural
          RefNFP.modelo  := ''; // |
          RefNFP.serie   := 1;  // |
          RefNFP.nNF     := 0;  // |

          RefECF.modelo  := ECFModRef2B; // |
          RefECF.nECF    := '';          // |- Cupom Fiscal
          RefECF.nCOO    := '';          // |
        end;
  }
      Emit.CNPJCPF := qryEmitenteCNPJ.AsString;
      Emit.IE      := Trim(qryEmitenteIE.AsString);
      Emit.CNAE    := Trim(qryEmitenteCNAE.AsString);  // C20 - CNAE fiscal Este campo deve ser informado quando o campo NFe.Emit.IM for informado.
      Emit.xNome   := qryEmitenteRZSOC.AsString;
      Emit.xFant   := qryEmitenteNMFANT.AsString;

      case qryEmitenteTIPO_REGIME_NFE.AsInteger of
        0 : Emit.CRT := crtSimplesNacional;
        1 : Emit.CRT := crtSimplesExcessoReceita;
        2 : Emit.CRT := crtRegimeNormal;
      end;

      Emit.EnderEmit.fone    := qryEmitenteFONE.AsString;
      Emit.EnderEmit.CEP     := StrToInt( qryEmitenteCEP.AsString );
      Emit.EnderEmit.xLgr    := Trim( qryEmitenteTLG_SIGLA.AsString + ' ' + qryEmitenteLOG_NOME.AsString );
      Emit.EnderEmit.nro     := qryEmitenteNUMERO_END.AsString;
      Emit.EnderEmit.xCpl    := qryEmitenteCOMPLEMENTO.AsString + '.';
      Emit.EnderEmit.xBairro := qryEmitenteBAI_NOME.AsString;
      Emit.EnderEmit.cMun    := qryEmitenteCID_IBGE.AsInteger;
      Emit.EnderEmit.xMun    := qryEmitenteCID_NOME.AsString;
      Emit.EnderEmit.UF      := qryEmitenteEST_SIGLA.AsString;
      Emit.enderEmit.cPais   := qryEmitentePAIS_ID.AsInteger;
      Emit.enderEmit.xPais   := qryEmitentePAIS_NOME.AsString;
      
      Emit.IEST              := '';
      Emit.IM                := ''; // Preencher no caso de existir servi�os na nota
      Emit.CNAE              := ''; // Verifique na cidade do emissor da NFe se � permitido
                                    // a inclus�o de servi�os na NFe

  //Para NFe Avulsa preencha os campos abaixo
  {      Avulsa.CNPJ    := '';
        Avulsa.xOrgao  := '';
        Avulsa.matr    := '';
        Avulsa.xAgente := '';
        Avulsa.fone    := '';
        Avulsa.UF      := '';
        Avulsa.nDAR    := '';
        Avulsa.dEmi    := now;
        Avulsa.vDAR    := 0;
        Avulsa.repEmi  := '';
        Avulsa.dPag    := now;             }

      Dest.CNPJCPF           := qryFornecedorDestinatarioCNPJ.AsString; // FormatFloat('00000000000000', qryDestinatarioCNPJ.AsInteger);
      Dest.xNome             := qryFornecedorDestinatarioNOME.AsString;

      if ( qryFornecedorDestinatarioPESSOA_FISICA.AsInteger = 0 ) then
      begin
        Dest.IE              := Trim(qryFornecedorDestinatarioINSCEST.AsString);
        Dest.ISUF            := EmptyStr;
      end
      else
      begin
        Dest.IE              := EmptyStr;
        Dest.ISUF            := EmptyStr;
      end;

      Dest.EnderDest.Fone    := qryFornecedorDestinatarioFONE.AsString;
      Dest.EnderDest.CEP     := qryFornecedorDestinatarioCEP.AsInteger;
      Dest.EnderDest.xLgr    := Trim( qryFornecedorDestinatarioTLG_SIGLA.AsString + ' ' + qryFornecedorDestinatarioLOG_NOME.AsString );
      Dest.EnderDest.nro     := qryFornecedorDestinatarioNUMERO_END.AsString;
      Dest.EnderDest.xCpl    := qryFornecedorDestinatarioCOMPLEMENTO.AsString;
      Dest.EnderDest.xBairro := qryFornecedorDestinatarioBAI_NOME.AsString;
      Dest.EnderDest.cMun    := qryFornecedorDestinatarioCID_IBGE.AsInteger;
      Dest.EnderDest.xMun    := qryFornecedorDestinatarioCID_NOME.AsString;
      Dest.EnderDest.UF      := qryFornecedorDestinatarioEST_SIGLA.AsString;
      Dest.EnderDest.cPais   := qryFornecedorDestinatarioPAIS_ID.AsInteger;  // 1058;
      Dest.EnderDest.xPais   := qryFornecedorDestinatarioPAIS_NOME.AsString; // 'BRASIL';

  //Use os campos abaixo para informar o endere�o de retirada quando for diferente do Emitente
  {      Retirada.CNPJCPF := '';
        Retirada.xLgr    := '';
        Retirada.nro     := '';
        Retirada.xCpl    := '';
        Retirada.xBairro := '';
        Retirada.cMun    := 0;
        Retirada.xMun    := '';
        Retirada.UF      := '';}

  //Use os campos abaixo para informar o endere�o de entrega quando for diferente do Remetente/Destinat�rio
  {      Entrega.CNPJCPF := '';
        Entrega.xLgr    := '';
        Entrega.nro     := '';
        Entrega.xCpl    := '';
        Entrega.xBairro := '';
        Entrega.cMun    := 0;
        Entrega.xMun    := '';
        Entrega.UF      := '';}

  //Adicionando Produtos
  
      qryEntradaDadosProduto.First;
      
      while not qryEntradaDadosProduto.Eof do
      begin

        with Det.Add do
        begin
          Prod.nItem    := qryEntradaDadosProduto.RecNo; // qryDadosProdutoSEQ.AsInteger;              // N�mero sequencial, para cada item deve ser incrementado
          Prod.cProd    := qryEntradaDadosProdutoCODPROD.AsString;

          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
            Prod.xProd  := qryEntradaDadosProdutoDESCRI.AsString
          else
            Prod.xProd  := qryEntradaDadosProdutoDESCRI.AsString + ' ' + qryEntradaDadosProdutoANO_FAB_MODELO_VEICULO.AsString;

          Prod.NCM      := qryEntradaDadosProdutoNCM_SH.AsString;            // Tabela NCM dispon�vel em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
          Prod.EXTIPI   := '';
          Prod.CFOP     := qryEntradaDadosProdutoCFOP_COD.AsString;

          Prod.cEAN     := qryEntradaDadosProdutoCODBARRA_EAN.AsString;
          Prod.uCom     := qryEntradaDadosProdutoUNP_SIGLA.AsString;
          Prod.qCom     := qryEntradaDadosProdutoQTDE.AsCurrency;

          Prod.vUnCom   := qryEntradaDadosProdutoPUNIT.AsCurrency;           // I10a  Valor Unit�rio de comercializa��o

          Prod.vProd    := qryEntradaDadosProdutoTOTAL_BRUTO.AsCurrency;     // I11 - Valor Total Bruto dos Produtos ou Servi�os

          Prod.cEANTrib  := qryEntradaDadosProdutoCODBARRA_EAN.AsString;
          Prod.uTrib     := qryEntradaDadosProdutoUNP_SIGLA.AsString;
          Prod.qTrib     := qryEntradaDadosProdutoQTDE.AsCurrency;

          Prod.vUnTrib   := qryEntradaDadosProdutoPUNIT.AsCurrency;          // I14a  Valor Unit�rio de tributa��o

(* EXEMPLO *)
          // NFe.Det[i].Prod.uCom    := 'CX';                                                   = 'UN'
          // NFe.Det[i].Prod.qCom    :=    2;   Vendidas 2 caixas ( com 10 unidades cada )      = 20
          // NFe.Det[i].Prod.vUnCom  :=   50;   R$ 50,00 cada caixa                             = 50,00 / 10 = 5,00
          // NFe.Det[i].Prod.vProd   :=  100;   R$ 100,00 Valor dos produtos                    = 20 * 5,00 = 100,00
          // NFe.Det[i].Prod.uTrib   := 'UN';                                                   = 'UN'
          // NFe.Det[i].Prod.qTrib   :=   20;   2 caixas X 10 unidades por caixa = 20 unidades  = 20
          // NFe.Det[i].Prod.vUnTrib :=    5;   R$ 100,00 / 20 unidades = R$ 5,00 cada unidade  = 100,00 / 20 = 5,00

          Prod.vFrete    := 0;                                               // I15 - Valor Total do Frete
          Prod.vSeg      := 0;                                               // I16 - Valor Total do Seguro
          Prod.vDesc     := qryEntradaDadosProdutoTOTAL_DESCONTO.AsCurrency; // I17 - Valor do Desconto

          // Informa��o Adicional do Produto
          
          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
            if ( Trim(qryEntradaDadosProdutoREFERENCIA.AsString) <> EmptyStr ) then
              infAdProd    := 'Ref.: ' + qryEntradaDadosProdutoREFERENCIA.AsString
            else
              infAdProd    := EmptyStr
          else
            infAdProd      := 'Cor: '         + qryEntradaDadosProdutoCOR_VEICULO_DESCRICAO.AsString + #13 +
                              'Placa: '       + qryEntradaDadosProdutoREFERENCIA.AsString      + #13 +
                              'Renavam: '     + qryEntradaDadosProdutoRENAVAM_VEICULO.AsString + #13 +
                              'Combustivel: ' + qryEntradaDadosProdutoCOMBUSTIVEL_VEICULO_DESCRICAO.AsString;

  //Declara��o de Importa��o. Pode ser adicionada v�rias atrav�s do comando Prod.DI.Add
  
  {         with Prod.DI.Add do
            begin
              nDi         := '';
              dDi         := now;
              xLocDesemb  := '';
              UFDesemb    := '';
              dDesemb     := now;
              cExportador := '';

              with adi.Add do
               begin
                 nAdicao     := 1;
                 nSeqAdi     := 1;
                 cFabricante := '';
                 vDescDI     := 0;
               end;
            end;
  }

  //Campos para venda de ve�culos novos

          if ( (GetSegmentoID(qryEmitenteCNPJ.AsString) = SEGMENTO_MERCADO_CARRO_ID) and (qryEntradaDadosProdutoPRODUTO_NOVO.AsInteger = 1) ) then
          begin

            with Prod.veicProd do
              begin
                tpOP     := toVendaConcessionaria; // J02 - Tipo da opera��o
                                                   //    (1) = toVendaConcessionaria
                                                   //    (2) = toFaturamentoDireto
                                                   //    (3) = toVendaDireta
                                                   //    (0) = toOutros
                chassi   := qryEntradaDadosProdutoCHASSI_VEICULO.AsString;        // J03 - Chassi do ve�culo
                cCor     := qryEntradaDadosProdutoCOR_VEICULO.AsString;           // J04 - Cor
                xCor     := qryEntradaDadosProdutoCOR_VEICULO_DESCRICAO.AsString; // J05 - Descri��o da Cor
                pot      := ''; // J06 - Pot�ncia Motor
                Cilin    := '';
                pesoL    := ''; // J08 - Peso L�quido
                pesoB    := ''; // J09 - Peso Bruto
                nSerie   := ''; // J10 - Serial (s�rie)
                tpComb   := qryEntradaDadosProdutoCOMBUSTIVEL_VEICULO_DESCRICAO.AsString; // J11 - Tipo de combust�vel
                nMotor   := ''; // J12 - N�mero de Motor
                CMT      := '';
                dist     := '';        // J14 - Dist�ncia entre eixos
//                RENAVAM  := '';        // J15 - RENAVAM            (N�o informar a TAG na exporta��o)
                anoMod   := qryEntradaDadosProdutoANO_MODELO_VEICULO.AsInteger;         // J16 - Ano Modelo de Fabrica��o
                anoFab   := qryEntradaDadosProdutoANO_FABRICACAO_VEICULO.AsInteger;     // J17 - Ano de Fabrica��o
                tpPint   := '';        // J18 - Tipo de Pintura
                tpVeic   := StrToIntDef(qryEntradaDadosProdutoTIPO_VEICULO.AsString, 0); // J19 - Tipo de Ve�culo    (Utilizar Tabela RENAVAM)
                espVeic  := 0;         // J20 - Esp�cie de Ve�culo (Utilizar Tabela RENAVAM)
                VIN      := '';        // J21 - Condi��o do VIN
                condVeic := cvAcabado; // J22 - Condi��o do Ve�culo (1 - Acabado; 2 - Inacabado; 3 - Semi-acabado)
                cMod     := '';        // J23 - C�digo Marca Modelo (Utilizar Tabela RENAVAM)
              end;

          end;

{
    property tpOP: TpcnTipoOperacao read FtpOP write FtpOP;
    property chassi: string read Fchassi write Fchassi;
    property cCor: string read FcCor write FcCor;
    property xCor: string read FxCor write FxCor;
    property pot: string read Fpot write Fpot;
    property Cilin: string read FCilin write FCilin;
    property pesoL: string read FpesoL write FpesoL;
    property pesoB: string read FpesoB write FpesoB;
    property nSerie: string read FnSerie write FnSerie;
    property tpComb: string read FtpComb write FtpComb;
    property nMotor: string read FnMotor write FnMotor;
    property CMT: string read FCMT write FCMT;
    property dist: string read Fdist write Fdist;
    //property RENAVAM: string read FRENAVAM write FRENAVAM;
    property anoMod: integer read FanoMod write FanoMod;
    property anoFab: integer read FanoFab write FanoFab;
    property tpPint: string read FtpPint write FtpPint;
    property tpVeic: integer read FtpVeic write FtpVeic;
    property espVeic: integer read FespVeic write FespVeic;
    property VIN: string read FVIN write FVIN;
    property condVeic: TpcnCondicaoVeiculo read FcondVeic write FcondVeic;
    property cMod: string read FcMod write FcMod;

    property cCorDENATRAN: string read FcCorDENATRAN write FcCorDENATRAN;
    property lota: integer read Flota write Flota;
    property tpRest: integer read FtpRest write FtpRest;
}

  //Campos espec�ficos para venda de medicamentos
  {         with Prod.med.Add do
            begin
              nLote := '';
              qLote := 0 ;
              dFab  := now ;
              dVal  := now ;
              vPMC  := 0 ;
            end;  }

  //Campos espec�ficos para venda de armamento
  {         with Prod.arma.Add do
            begin
              nSerie := 0;
              tpArma := taUsoPermitido ;
              nCano  := 0 ;
              descr  := '' ;
            end;      }

  //Campos espec�ficos para venda de combust�vel(distribuidoras)
  {         with Prod.comb do
            begin
              cProdANP := 0;
              CODIF    := '';
              qTemp    := 0;
              UFcons   := '';

              CIDE.qBCprod   := 0 ;
              CIDE.vAliqProd := 0 ;
              CIDE.vCIDE     := 0 ;

              ICMS.vBCICMS   := 0 ;
              ICMS.vICMS     := 0 ;
              ICMS.vBCICMSST := 0 ;
              ICMS.vICMSST   := 0 ;

              ICMSInter.vBCICMSSTDest := 0 ;
              ICMSInter.vICMSSTDest   := 0 ;

              ICMSCons.vBCICMSSTCons := 0 ;
              ICMSCons.vICMSSTCons   := 0 ;
              ICMSCons.UFcons        := '' ;
            end;}

          with Imposto do
          begin
            with ICMS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                // csosnVazio, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900
                
                Case qryEntradaDadosProdutoCSOSN.AsInteger of
                  101 : CSOSN := csosn101;
                  102 : CSOSN := csosn102;
                  103 : CSOSN := csosn103;
                  201 : CSOSN := csosn201;
                  202 : CSOSN := csosn202;
                  203 : CSOSN := csosn203;
                  300 : CSOSN := csosn300;
                  400 : CSOSN := csosn400;
                  500 : CSOSN := csosn500;
                  else
                    CSOSN := csosn900;
                end;

                pCredSN     := qryEntradaDadosProdutoALIQUOTA_CSOSN.AsCurrency;
                vCredICMSSN := qryEntradaDadosProdutoPFINAL.AsCurrency * pCredSN / 100;

              end
              else
              begin

                Case qryEntradaDadosProdutoCODTRIBUTACAO.AsInteger of
                   0 : CST := cst00;
                  10 : CST := cst10;
                  20 : CST := cst20;
                  30 : CST := cst30;
                  40 : CST := cst40;
                  41 : CST := cst41;
                  50 : CST := cst50;
                  51 : CST := cst51;
                  60 : CST := cst60;
                  70 : CST := cst70;
                  else
                    CST := cst90;
                end;

                ICMS.modBC   := dbiValorOperacao;
                ICMS.pRedBC  := qryEntradaDadosProdutoPERCENTUAL_REDUCAO_BC.AsCurrency;

                if ( ICMS.pRedBC > 0 ) then
                  ICMS.vBC   := qryEntradaDadosProdutoVALOR_REDUCAO_BC.AsCurrency
                else
                  ICMS.vBC   := qryEntradaDadosProdutoPFINAL.AsCurrency;

                ICMS.pICMS   := qryEntradaDadosProdutoALIQUOTA.AsCurrency;
                ICMS.vICMS   := ICMS.vBC * ICMS.pICMS / 100;

              end;

              ICMS.orig    := TpcnOrigemMercadoria( qryEntradaDadosProdutoCODORIGEM.AsInteger );
              ICMS.modBCST := dbisMargemValorAgregado;
              ICMS.pMVAST  := 0;
              ICMS.pRedBCST:= 0;
              ICMS.vBCST   := 0;
              ICMS.pICMSST := 0;
              ICMS.vICMSST := 0;

            end;

            with PIS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                CST      := pis99;
                PIS.vBC  := 0;
                PIS.pPIS := 0;
                PIS.vPIS := 0;

                PIS.qBCProd   := 0;
                PIS.vAliqProd := 0;

              end
              else
              begin

                CST := TpcnCstPis(qryEntradaDadosProdutoCST_PIS_INDICE_ACBR.AsInteger);

                if ( CST = pis99 ) then
                begin
                  PIS.vBC  := 0;
                  PIS.pPIS := 0;
                  PIS.vPIS := 0;
                end
                else
                begin
                  PIS.vBC  := qryEntradaDadosProdutoPFINAL.AsCurrency;
                  PIS.pPIS := qryEntradaDadosProdutoALIQUOTA_PIS.AsCurrency;
                  PIS.vPIS := PIS.vBC * PIS.pPIS / 100;
                end;

                PIS.qBCProd   := 0;
                PIS.vAliqProd := 0;

              end;
            end;

            with COFINS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                CST            := cof99;
                COFINS.vBC     := 0;
                COFINS.pCOFINS := 0;
                COFINS.vCOFINS := 0;

                COFINS.qBCProd   := 0;
                COFINS.vAliqProd := 0;

              end
              else
              begin

                CST := TpcnCstCofins(qryEntradaDadosProdutoCST_COFINS_INDICE_ACBR.AsInteger);

                if ( CST = cof99 ) then
                begin
                  COFINS.vBC     := 0;
                  COFINS.pCOFINS := 0;
                  COFINS.vCOFINS := 0;
                end
                else
                begin
                  COFINS.vBC     := qryEntradaDadosProdutoPFINAL.AsCurrency;
                  COFINS.pCOFINS := qryEntradaDadosProdutoALIQUOTA_COFINS.AsCurrency;
                  COFINS.vCOFINS := COFINS.vBC * COFINS.pCOFINS / 100;
                end;

                COFINS.qBCProd   := 0;
                COFINS.vAliqProd := 0;

              end;
            end;

  {
            with IPI do
            begin
              CST      := ipi99 ;
              clEnq    := '999';
              CNPJProd := '';
              cSelo    := '';
              qSelo    := 0;
              cEnq     := '';

              vBC    := qryDadosProdutoPUNIT.AsCurrency;
              qUnid  := 0;
              vUnid  := 0;
              pIPI   := 0; // Percentual IPI
              vIPI   := 0; // Valor IPI
            end;

              with II do
               begin
                 vBc      := 0;
                 vDespAdu := 0;
                 vII      := 0;
                 vIOF     := 0;
               end;

              with PISST do
               begin
                 vBc       := 0;
                 pPis      := 0;
                 qBCProd   := 0;
                 vAliqProd := 0;
                 vPIS      := 0;
               end;

              with COFINSST do
               begin
                 vBC       := 0;
                 pCOFINS   := 0;
                 qBCProd   := 0;
                 vAliqProd := 0;
                 vCOFINS   := 0;
               end;
  }
  //Grupo para servi�os
  {            with ISSQN do
               begin
                 vBC       := 0;
                 vAliq     := 0;
                 vISSQN    := 0;
                 cMunFG    := 0;
                 cListServ := 0; // Preencha este campo usando a tabela dispon�vel
                                 // em http://www.planalto.gov.br/Ccivil_03/LEIS/LCP/Lcp116.htm
               end;}
          end;
        end ;

        qryEntradaDadosProduto.Next;
      end;

      Total.ICMSTot.vBC     := qryEntradaCalculoImportoNFE_VALOR_BASE_ICMS.AsCurrency;
      Total.ICMSTot.vICMS   := qryEntradaCalculoImportoNFE_VALOR_ICMS.AsCurrency;
      Total.ICMSTot.vBCST   := qryEntradaCalculoImportoNFE_VALOR_BASE_ICMS_SUBST.AsCurrency;
      Total.ICMSTot.vST     := qryEntradaCalculoImportoNFE_VALOR_ICMS_SUBST.AsCurrency;
      Total.ICMSTot.vProd   := qryEntradaCalculoImportoNFE_VALOR_TOTAL_PRODUTO.AsCurrency;
      Total.ICMSTot.vFrete  := qryEntradaCalculoImportoNFE_VALOR_FRETE.AsCurrency;
      Total.ICMSTot.vSeg    := qryEntradaCalculoImportoNFE_VALOR_SEGURO.AsCurrency;
      Total.ICMSTot.vDesc   := qryEntradaCalculoImportoNFE_VALOR_DESCONTO.AsCurrency;
      Total.ICMSTot.vII     := qryEntradaCalculoImportoNFE_VALOR_TOTAL_II.AsCurrency;
      Total.ICMSTot.vIPI    := qryEntradaCalculoImportoNFE_VALOR_TOTAL_IPI.AsCurrency;
      Total.ICMSTot.vPIS    := qryEntradaCalculoImportoNFE_VALOR_PIS.AsCurrency;
      Total.ICMSTot.vCOFINS := qryEntradaCalculoImportoNFE_VALOR_COFINS.AsCurrency;
      Total.ICMSTot.vOutro  := qryEntradaCalculoImportoNFE_VALOR_OUTROS.AsCurrency;
      Total.ICMSTot.vNF     := qryEntradaCalculoImportoNFE_VALOR_TOTAL_NOTA.AsCurrency;

  {      Total.ISSQNtot.vServ   := 0;
        Total.ISSQNTot.vBC     := 0;
        Total.ISSQNTot.vISS    := 0;
        Total.ISSQNTot.vPIS    := 0;
        Total.ISSQNTot.vCOFINS := 0;}

  {      Total.retTrib.vRetPIS    := 0;
        Total.retTrib.vRetCOFINS := 0;
        Total.retTrib.vRetCSLL   := 0;
        Total.retTrib.vBCIRRF    := 0;
        Total.retTrib.vIRRF      := 0;
        Total.retTrib.vBCRetPrev := 0;
        Total.retTrib.vRetPrev   := 0;}

      Transp.modFrete            := mfSemFrete; // X02 - Modalidade do frete
                                                //         (0)=mfContaEmitente     � por conta do emitente;
                                                //         (1)=mfContaDestinatario � por conta do destinat�rio)
                                                //       TAG de grupo Transportador - <transporta> - Ocorr�ncia 0-1
      Transp.Transporta.CNPJCPF  := '';
      Transp.Transporta.xNome    := '';
      Transp.Transporta.IE       := '';
      Transp.Transporta.xEnder   := '';
      Transp.Transporta.xMun     := '';
      Transp.Transporta.UF       := '';

  {      Transp.retTransp.vServ    := 0;
        Transp.retTransp.vBCRet   := 0;
        Transp.retTransp.pICMSRet := 0;
        Transp.retTransp.vICMSRet := 0;
        Transp.retTransp.CFOP     := '';
        Transp.retTransp.cMunFG   := 0;         }

        Transp.veicTransp.placa := '';
        Transp.veicTransp.UF    := '';
        Transp.veicTransp.RNTC  := '';
  //Dados do Reboque
  {      with Transp.Reboque.Add do
         begin
           placa := '';
           UF    := '';
           RNTC  := '';
         end;}

      if ( Transp.modFrete in [mfContaDestinatario, mfContaTerceiros] ) then
        with Transp.Vol.Add do
        begin
          qVol  := qryEntradaDadosProduto.RecordCount;
          esp   := 'Especie';
          marca := 'Marca';
          nVol  := 'Numero';
          pesoB := qryEntradaDadosProduto.RecordCount * 1;
          pesoL := qryEntradaDadosProduto.RecordCount * 1.01;

          //Lacres do volume. Pode ser adicionado v�rios
          //Lacres.Add.nLacre := '';
        end;

//      // Dados da Fatura
//
//      Cobr.Fat.nFat  := FormatFloat('0000', qryCalculoImportoANO.AsInteger) + '/' + FormatFloat('0000000', qryCalculoImportoCODCONTROL.AsInteger);
//      Cobr.Fat.vOrig := qryCalculoImportoTOTALVENDABRUTA.AsCurrency;
//      Cobr.Fat.vDesc := qryCalculoImportoDESCONTO.AsCurrency ;
//      Cobr.Fat.vLiq  := qryCalculoImportoTOTALVENDA.AsCurrency ;

      // Dados da(s) Duplicata(s)
      
      if ( qryEntradaCalculoImportoCOMPRA_PRAZO.AsInteger = 1 ) then
      begin
        qryEntradaDuplicatas.First;
        while not qryEntradaDuplicatas.Eof do
        begin
          with Cobr.Dup.Add do
          begin
            nDup  := FormatFloat('0000', qryEntradaDuplicatasANOLANC.AsInteger) + '/' + FormatFloat('0000000', qryEntradaDuplicatasNUMLANC.AsInteger);
            dVenc := qryEntradaDuplicatasDTVENC.AsDateTime;
            vDup  := qryEntradaDuplicatasVALORPAG.AsCurrency;
          end;

          qryEntradaDuplicatas.Next;
        end;
      end;

      InfAdic.infCpl     := ' * * * ' + #13 +
                            'Compra: ' + qryEntradaCalculoImportoANO.AsString + '/' + FormatFloat('###0000000', qryEntradaCalculoImportoCODCONTROL.AsInteger)  +
                            ' - Forma/Cond. Pgto.: ' + qryEntradaCalculoImportoFORMA_PAGO.AsString + '/' + qryEntradaCalculoImportoCOND_PAGO_FULL.AsString + ' * * * ' + #13 +
                            'Usu�rio: ' + qryEntradaCalculoImportoUSUARIO_NOME_COMPLETO.AsString + ' * * * ' + #13 +
                            'Observa��es : ' + qryEntradaCalculoImportoOBS.AsString;

      InfAdic.infAdFisco := 'Info. Fisco: ' + GetInformacaoFisco;

  {
      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Info. Fisco: ' + GetInformacaoFisco;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Obsera��es da venda: ' + qryCalculoImportoOBS.AsString;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Venda: ' + qryCalculoImportoANO.AsString + '/' + FormatFloat('###0000000', qryCalculoImportoCODCONTROL.AsInteger) +
                  ' - Forma/Cond. Pgto.: ' + qryCalculoImportoFORMAPAG.AsString + '/' + qryCalculoImportoCOND_DESCRICAO_FULL.AsString;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Vendedor: ' + qryCalculoImportoVENDEDOR_NOME.AsString;
      end;

      with InfAdic.obsFisco.Add do
      begin
        xCampo := 'ObsFisco';
        xTexto := GetInformacaoFisco;
      end;

  //Processo referenciado
       with InfAdic.procRef.Add do
         begin
           nProc := '';
           indProc := ipSEFAZ;
         end;                 }

      exporta.UFembarq   := '';
      exporta.xLocEmbarq := '';

      compra.xNEmp := '';
      compra.xPed  := '';
      compra.xCont := '';

      ACBrNFe.NotasFiscais.GerarNFe;
      ACBrNFe.NotasFiscais.Assinar;
      ACBrNFe.NotasFiscais.Valida;

      ACBrNFe.NotasFiscais.Items[0].SaveToFile( EmptyStr );

      FileNameXML := ACBrNFe.NotasFiscais.Items[0].NomeArq;

    end;

  except
    On E : Exception do
      ShowError('Erro ao tentar gerar NF-e de Entrada.' + #13#13 + 'GerarNFEEntradaACBr() --> ' + e.Message);
  end;

end;

function TDMNFe.ImprimirDANFEEntradaACBr(const sCNPJEmitente : String; const CodFornecedor: Integer; const iAnoCompra, iNumCompra : Integer;
  const IsPDF : Boolean = FALSE) : Boolean;
var
  FileNameXML : String;
begin

  try

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatarioFornecedor( CodFornecedor );
    AbrirCompra( iAnoCompra, iNumCompra );

    if ( IsPDF ) then
      FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CLIENT + qryEntradaCalculoImportoXML_NFE_FILENAME.AsString
    else
      FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_PRINT  + qryEntradaCalculoImportoXML_NFE_FILENAME.AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    qryEntradaCalculoImportoXML_NFE.SaveToFile( FileNameXML );

    with ACBrNFe do
    begin
      NotasFiscais.Clear;
      NotasFiscais.LoadFromFile( FileNameXML );

      if NotasFiscais.Items[0].NFe.Ide.tpEmis = teDPEC then
      begin
        WebServices.ConsultaDPEC.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
        WebServices.ConsultaDPEC.Executar;

        DANFE.ProtocoloNFe := WebServices.ConsultaDPEC.nRegDPEC + ' ' + DateTimeToStr(WebServices.ConsultaDPEC.dhRegDPEC);
      end;

      if ( IsPDF ) then
        NotasFiscais.ImprimirPDF
      else
        NotasFiscais.Imprimir;

      Result := True;
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar imprimir DANFE de Entrada.' + #13#13 + 'ImprimirDANFEEntradaACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

procedure TDMNFe.AbrirDestinatarioFornecedor(iCodigo: Integer);
begin
  with qryFornecedorDestinatario do
  begin
    Close;
    ParamByName('Codigo').AsInteger := iCodigo;
    Open;
  end;
end;

procedure TDMNFe.AbrirCompra(AnoCompra, NumeroCompra: Integer);
begin
  with qryEntradaCalculoImporto do
  begin
    Close;
    ParamByName('anoCompra').AsInteger := AnoCompra;
    ParamByName('numCompra').AsInteger := NumeroCompra;
    Open;
  end;

  with qryEntradaDadosProduto do
  begin
    Close;
    ParamByName('anoCompra').AsInteger := AnoCompra;
    ParamByName('numCompra').AsInteger := NumeroCompra;
    Open;
  end;

  with qryEntradaDuplicatas do
  begin
    Close;
    ParamByName('anoCompra').AsInteger := AnoCompra;
    ParamByName('numCompra').AsInteger := NumeroCompra;
    Open;
  end;
end;

function TDMNFe.CancelarNFeEntradaACBr(const sCNPJEmitente : String; const iCodFornecedor, iAnoCompra, iNumCompra: Integer;
  const Motivo: String): Boolean;
var
  FileNameXML ,
  ChaveNFE    : String;
begin

  try

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatarioFornecedor( iCodFornecedor );
    AbrirCompra( iAnoCompra, iNumCompra );

    FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CANCEL + qryEntradaCalculoImportoXML_NFE_FILENAME.AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    qryEntradaCalculoImportoXML_NFE.SaveToFile( FileNameXML );

    with ACBrNFe do
    begin
      NotasFiscais.Clear;
      NotasFiscais.LoadFromFile( FileNameXML );

      Result := Cancelamento( Motivo );
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar cancelar NF-e de Entrada.'+ #13#13 + 'CancelarNFeEntradaACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

end.
