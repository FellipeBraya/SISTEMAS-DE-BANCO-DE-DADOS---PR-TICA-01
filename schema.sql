PRAGMA foreign_keys = ON;

-- Tabela Participante
CREATE TABLE Participante (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL,
    Email TEXT NOT NULL UNIQUE,
    Telefone TEXT
);

-- Tabela Evento
CREATE TABLE Evento (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL,
    Descricao TEXT,
    Local TEXT NOT NULL,
    Data TEXT NOT NULL
);

-- Tabela Inscricao
CREATE TABLE Inscricao (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Id_Evento INTEGER NOT NULL,
    Id_Participante INTEGER NOT NULL,
    Data_Inscricao TEXT,
    Status TEXT,
    FOREIGN KEY (Id_Evento) REFERENCES Evento(Id),
    FOREIGN KEY (Id_Participante) REFERENCES Participante(Id)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Id_Inscricao INTEGER UNIQUE,
    Valor REAL,
    Data_Pagamento TEXT,
    Status TEXT,
    FOREIGN KEY (Id_Inscricao) REFERENCES Inscricao(Id)
);

-- Inserindo Valores Participante
INSERT INTO Participante (Nome, Email, Telefone) VALUES 
('Fellipe', 'fellipe@gmail.com', '34999990000'),
('Marina', 'marina@gmail.com', '34988887777'),
('Carlos', 'carlos@gmail.com', '34977776666');

-- Inserindo Valores Evento
INSERT INTO Evento (Nome, Descricao, Local, Data) VALUES
('Semana de Tecnologia', 'Palestras e workshops sobre inovação', 'Patos de Minas - Auditório Central', '15/03/2025'),
('Feira de Empreendedorismo', 'Exposição de startups e projetos locais', 'Patos de Minas - Centro de Convenções', '10/04/2025'),
('Workshop de Banco de Dados', 'Treinamento prático em SQL e modelagem', 'Patos de Minas - Laboratório 2', '05/05/2025');

-- Inserindo Valores Inscricao
INSERT INTO Inscricao (Id_Evento, Id_Participante, Data_Inscricao, Status) VALUES
(1, 1, '10/03/2025', 'confirmada'),
(1, 2, '12/03/2025', 'confirmada'),
(2, 3, '05/04/2025', 'confirmada'),
(3, 1, '01/05/2025', 'confirmada');

-- Inserindo Valores Pagamento
INSERT INTO Pagamento (Id_Inscricao, Valor, Data_Pagamento, Status) VALUES
(1, 150.00, '11/03/2025', 'pago'),
(2, 150.00, '13/03/2025', 'pendente'),
(3, 200.00, '06/04/2025', 'pago'),
(4, 100.00, '02/05/2025', 'pago');