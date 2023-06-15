# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'agendarConsulta.ui'
##
## Created by: Qt User Interface Compiler version 6.5.0
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################

from PySide6.QtCore import (QCoreApplication, QDate, QDateTime, QLocale,
    QMetaObject, QObject, QPoint, QRect,
    QSize, QTime, QUrl, Qt)
from PySide6.QtGui import (QBrush, QColor, QConicalGradient, QCursor,
    QFont, QFontDatabase, QGradient, QIcon,
    QImage, QKeySequence, QLinearGradient, QPainter,
    QPalette, QPixmap, QRadialGradient, QTransform)
from PySide6.QtWidgets import (QApplication, QDateEdit, QLabel, QMainWindow,
    QMenuBar, QPushButton, QSizePolicy, QStatusBar,
    QTextEdit, QTimeEdit, QWidget)

class Ui_FormAgendarConsulta(object):
    def setupUi(self, FormAgendarConsulta):
        if not FormAgendarConsulta.objectName():
            FormAgendarConsulta.setObjectName(u"FormAgendarConsulta")
        FormAgendarConsulta.resize(730, 558)
        self.centralwidget = QWidget(FormAgendarConsulta)
        self.centralwidget.setObjectName(u"centralwidget")
        self.nomeCliente = QTextEdit(self.centralwidget)
        self.nomeCliente.setObjectName(u"nomeCliente")
        self.nomeCliente.setGeometry(QRect(210, 100, 541, 31))
        self.label = QLabel(self.centralwidget)
        self.label.setObjectName(u"label")
        self.label.setGeometry(QRect(310, 40, 141, 41))
        font = QFont()
        font.setPointSize(12)
        self.label.setFont(font)
        self.sair = QPushButton(self.centralwidget)
        self.sair.setObjectName(u"sair")
        self.sair.setGeometry(QRect(650, 420, 75, 23))
        self.label_2 = QLabel(self.centralwidget)
        self.label_2.setObjectName(u"label_2")
        self.label_2.setGeometry(QRect(30, 100, 141, 31))
        self.label_2.setFont(font)
        self.TipoAnimal = QTextEdit(self.centralwidget)
        self.TipoAnimal.setObjectName(u"TipoAnimal")
        self.TipoAnimal.setGeometry(QRect(210, 170, 541, 31))
        self.label_3 = QLabel(self.centralwidget)
        self.label_3.setObjectName(u"label_3")
        self.label_3.setGeometry(QRect(30, 170, 141, 31))
        self.label_3.setFont(font)
        self.label_4 = QLabel(self.centralwidget)
        self.label_4.setObjectName(u"label_4")
        self.label_4.setGeometry(QRect(30, 230, 141, 31))
        self.label_4.setFont(font)
        self.label_5 = QLabel(self.centralwidget)
        self.label_5.setObjectName(u"label_5")
        self.label_5.setGeometry(QRect(30, 290, 141, 31))
        self.label_5.setFont(font)
        self.agendarConsulta = QPushButton(self.centralwidget)
        self.agendarConsulta.setObjectName(u"agendarConsulta")
        self.agendarConsulta.setGeometry(QRect(530, 420, 75, 23))
        self.dataConsulta = QDateEdit(self.centralwidget)
        self.dataConsulta.setObjectName(u"dataConsulta")
        self.dataConsulta.setGeometry(QRect(210, 230, 110, 22))
        self.horaConsulta = QTimeEdit(self.centralwidget)
        self.horaConsulta.setObjectName(u"horaConsulta")
        self.horaConsulta.setGeometry(QRect(210, 290, 118, 22))
        self.label_6 = QLabel(self.centralwidget)
        self.label_6.setObjectName(u"label_6")
        self.label_6.setGeometry(QRect(30, 340, 171, 31))
        self.label_6.setFont(font)
        self.nomeVeterinario = QTextEdit(self.centralwidget)
        self.nomeVeterinario.setObjectName(u"nomeVeterinario")
        self.nomeVeterinario.setGeometry(QRect(210, 340, 541, 31))
        FormAgendarConsulta.setCentralWidget(self.centralwidget)
        self.menubar = QMenuBar(FormAgendarConsulta)
        self.menubar.setObjectName(u"menubar")
        self.menubar.setGeometry(QRect(0, 0, 730, 21))
        FormAgendarConsulta.setMenuBar(self.menubar)
        self.statusbar = QStatusBar(FormAgendarConsulta)
        self.statusbar.setObjectName(u"statusbar")
        FormAgendarConsulta.setStatusBar(self.statusbar)

        self.retranslateUi(FormAgendarConsulta)

        QMetaObject.connectSlotsByName(FormAgendarConsulta)
    # setupUi

    def retranslateUi(self, FormAgendarConsulta):
        FormAgendarConsulta.setWindowTitle(QCoreApplication.translate("FormAgendarConsulta", u"adendamento de consultas", None))
        self.label.setText(QCoreApplication.translate("FormAgendarConsulta", u"Agendar consulta", None))
        self.sair.setText(QCoreApplication.translate("FormAgendarConsulta", u"sair", None))
        self.label_2.setText(QCoreApplication.translate("FormAgendarConsulta", u"Nome do Cliente:", None))
        self.label_3.setText(QCoreApplication.translate("FormAgendarConsulta", u"Tipo do animal:", None))
        self.label_4.setText(QCoreApplication.translate("FormAgendarConsulta", u"Data:", None))
        self.label_5.setText(QCoreApplication.translate("FormAgendarConsulta", u"Hora:", None))
        self.agendarConsulta.setText(QCoreApplication.translate("FormAgendarConsulta", u"Agendar", None))
        self.label_6.setText(QCoreApplication.translate("FormAgendarConsulta", u"Nome do veterinario:", None))
    # retranslateUi

