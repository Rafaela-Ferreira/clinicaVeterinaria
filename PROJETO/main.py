import sys 
from PySide6.QtCore import QtMsgType 
from PySide6.QtWidgets import QDialog, QApplication, QMainWindow, QStatusBar,  QTableWidgetItem

from FrmDepto_ui import Ui_FrmDepto
from FrmConexao_ui import Ui_dlgConexao 
from datetime import datetime 
import pyodbc as bd

global conexao, meuCursor

class FormPrincipal(QMainWindow, Ui_FrmDepto):

    def __init__(self): 
        super().__init__() 
        self.setupUi(self) 
        self.statusBar = QStatusBar() 
        self.setStatusBar(self.statusBar)
        self.show()

        self.situacao = "navegando" 
        self.action_Sair.triggered.connect(self.sairDoPrograma)
        self.action_Novo.triggered.connect(self.novoRegistro) 
        self.action_Editar.triggered.connect(self.editarRegistro) 
        self.action_Salvar.triggered.connect(self.salvarRegistro)
        self.action_Excluir.triggered.connect(self.excluirRegistro)
        self.action_Cancelar.triggered.connect(self.cancelarAcao)
 
    def sairDoPrograma(self):
        conexao.close()  # importante fechar arquivo ao banco de dados 
        self.close()
        
    def novoRegistro(self):
        # limpamos os campos (controles) da tela para 
        # iniciar a digitação dos dados do novo registro
        self.spbNumDepto.setValue(1)
        self.edNomeDepto.setText("")
        self.edGerente_NumSegSocial.setText("")
        self.deData_Inicial_Gerente.setDate(datetime.today()) 
        
        self.situacao = "incluindo"     # indica início do modo de inclusão
        self.spbNumDepto.setReadOnly(False) 
        self.spbNumDepto.setFocus()     # coloca o cursor nesse controle
        self.statusBar.showMessage("Digite os dados acima")

    def editarRegistro(self): 
        self.situacao = "editando" 
        self.edNomeDepto.setFocus() 
        self.spbNumDepto.setReadOnly(True) 
        self.statusBar.showMessage("Altere os dados acima")

    def salvarRegistro(self):
        if self.situacao == "incluindo": 
            sComando = "Insert into Empresa.Departamento "+\
                " (numDepto, nomeDepto, gerente_numSegSocial, "+\
                " gerente_dataInicial) "+\
                " values (?, ?, ?, Convert(date, ?, 103) ) "
            try: # tente executar o comando abaixo:
                meuCursor.execute(sComando, self.spbNumDepto.value(),
                    self.edNomeDepto.text(),
                    self.edGerente_NumSegSocial.text(),
                    f"{self.deData_Inicial_Gerente.date().toString('dd/MM/yyyy')}"
                    )
                meuCursor.commit()  # enviar ao banco de dados
                self.statusBar.showMessage("Registro incluído")
            except Exception as erro:
                if hasattr(erro, 'message'): 
                    mensagem = erro.message 
                else: 
                    mensagem = erro.args[1] 
                self.statusBar.showMessage(mensagem)
        elif self.situacao == "editando":
            sComando = "Update Empresa.Departamento "+\
                " set nomeDepto = ?, gerente_numSegSocial = ?, "+\
                " gerente_dataInicial = Convert(date, ?, 103) "+\
                " where numDepto = ? "
            
            try: # tente executar o comando abaixo: 
                meuCursor.execute(sComando, 
                    self.edNomeDepto.text(), 
                    self.edGerente_NumSegSocial.text(), 
                    f"{self.deData_Inicial_Gerente.date().toString('dd/MM/yyyy')}",
                    int(self.spbNumDepto.value())) 
                meuCursor.commit()      # enviar as mudanças para o BD 
                self.statusBar.showMessage("Registro alterado") 
            except Exception as erro: # em caso de erro 
                if hasattr(erro, 'message'): 
                    mensagem = erro.message 
                else:
                    mensagem = erro.args[1] 
                self.statusBar.showMessage(mensagem)
        self.situacao = "navegando"
        
    def excluirRegistro(self):
        self.situacao = "excluindo" 
        sComando =  "Delete from Empresa.Departamento "+\
                    " where numDepto = ? "
        try: # tente executar o comando abaixo: 
            meuCursor.execute(sComando, self.spbNumDepto.value()) 
            meuCursor.commit() # enviar as mudanças para o BD 
            self.statusBar.showMessage("Excluído")
            self.situacao = "navegando" 
        except Exception as erro: # em caso de erro 
            if hasattr(erro, 'message'): 
                mensagem = erro.message 
            else: 
                mensagem = erro.args[1] 
            self.statusBar.showMessage(mensagem)

    def cancelarAcao(self): 
        self.situacao = "navegando"                
class DialogoConexao(QDialog, Ui_dlgConexao) :
    def __init__(self):
        super().__init__() 
        self.setupUi(self) 
        self.setModal(True)

if __name__ == "__main__":
    aplicacao = QApplication(sys.argv) 
    dlgCon = DialogoConexao() 
    if dlgCon.exec() == QDialog.Accepted: 
        try: 
            conexao = bd.connect(driver="SQL Server", 
                                server=f"{dlgCon.edServidor.text()}", 
                                database=f"{dlgCon.edBancoDeDados.text()}", 
                                uid=f"{dlgCon.edUserId.text()}", 
                                pwd=f"{dlgCon.edSenha.text()}") 
            print("Conexão bem sucedida!")
            meuCursor = conexao.cursor() # cursor: objeto de acesso ao BD
            janela = FormPrincipal() 
            aplicacao.exec() 
        except: 
            print("Não foi possível conectar ao banco de dados")
    