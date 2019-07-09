
create Database HelpDesk
go

Use HelpDesk

go


create table TiposUsuarios(
IdTipoUsuario int identity,
TipoUsuario varchar(50),
FechaRegistro date,
constraint pk_TiposUsuarios
primary key(IdTipoUsuario),
constraint unq_TipoUsuarios
unique(TipoUsuario));

go
--------------------------------------------------------------------------------

create table Departamentos(
IdDepartamento int identity,
Departamento varchar(100),
FechaRegistro date,
constraint pk_Departamentos
primary key(IdDepartamento),
constraint unq_Departamentos
unique(Departamento));

go
--------------------------------------------------------------------------------

Create Table Usuarios(
IdUsuario int identity,
NombreUsuario varchar(30),
Constrasena varbinary,
NombreEmpleado varchar(50),
Apellido1 varchar(30),
Apellido2 varchar(30),
IdDepartamento int,
IdTipoUsuario int,
Email varchar(80),
Extencion varchar(6),
Estatus bit,
FechaRegistro date,
constraint pk_Usuarios
primary key(IdUsuario),
constraint unq_Usuarios
unique(NombreUsuario),
constraint frk_UsuariosDepart
foreign key(IdDepartamento)references Departamentos(IdDepartamento),
constraint frk_UsuariosTipoS
foreign key(IdTipoUsuario)references TiposUsuarios(IdTipoUsuario));

go
--------------------------------------------------------------------------------

create table TiposTickets(
IdTipoTicket int identity,
TipoTicket varchar(50),
constraint pk_TiposTickets
primary key(IdTipoTicket),
constraint unq_TiposTickets
unique(TipoTicket))

go
--------------------------------------------------------------------------------

create table Tickets(
IdTicket int identity,
Asunto varchar(100),
Descripcion varchar(150),
IdTipoTicket int,
Prioridad varchar(1),
IdUsuarioRegistra int,
FechaRegistro date,
IdUsuarioAsignado int,
FechaAsignacion date,
FechaResolucion date,
Estatus bit,
constraint pk_Tikets
primary key(IdTicket),
constraint frk_TicketsTipos
foreign key(IdTipoTicket) references TiposTickets(IdTipoTicket),
constraint frk_TicketsUsuario
foreign key(IdUsuarioRegistra)References Usuarios(IdUsuario),
constraint frk_TicketsUsuario2
foreign key(IdUsuarioAsignado)References Usuarios(IdUsuario))

go
--------------------------------------------------------------------------------


create table TicketsDetalle(
IdTicket int,
IdTicketDetalle int identity,
IdUsuario int,
Mensaje varchar(500),
FechaRegistro date,
constraint pk_TicketsDetalle
primary key(IdTicketDetalle),
constraint frk_TicketsDetalle
foreign key(IdTicket) references Tickets(IdTicket))





