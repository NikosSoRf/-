/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     08.12.2023 18:28:20                          */
/*==============================================================*/

Create database Polygraf
go
use Polygraf
go
/*==============================================================*/
/* Table: Client                                                */
/*==============================================================*/
create table Client (
   ClientId             int     identity     not null ,
   NameC                varchar(50)          null,
   SurnameC             varchar(50)          null,
   Phone				varchar(50)			 null,
   constraint PK_CLIENT primary key (ClientId) 
)
go

/*==============================================================*/
/* Table: Contract                                              */
/*==============================================================*/
create table Contract (
   ContractId           int       identity           not null,
   ClientId             int                  not null,
   DateOfBegin          datetime             null,
   DateOfEnd            datetime             null,
   constraint PK_CONTRACT primary key (ContractId) 
)
go

/*==============================================================*/
/* Table: Employer                                              */
/*==============================================================*/
create table Employer (
   EmployerId           int           identity       not null,
   Position             varchar(50)          null,
   NameE                varchar(50)          null,
   SurnameE             varchar(50)          null,
   Password             varchar(50)          not null,
   Mail                 varchar(50)          not null,
   constraint PK_EMPLOYER primary key (EmployerId) 
)
go

/*==============================================================*/
/* Table: History_of_contract                                 */
/*==============================================================*/
create table HistoryOfContract (
   IdHistoryOfContract            int   identity     not null,
   ContractId           int                  null,
   Data_change          datetime             null,
   Status               char(20)             not null,
   constraint PK_HISTORY_OF_CONTRACT primary key (IdHistoryOfContract) 
)
go

/*==============================================================*/
/* Table: History_of_Material                                   */
/*==============================================================*/
create table HistoryOfMaterial (
   IdHistory           int       identity           not null,
   IdMaterial          int                  null,
   EmployerId           int                  not null,
   Quantity             int                  not null,
   Data_change_Quantity datetime             null,
   constraint PK_HISTORY_OF_MATERIAL primary key (IdHistory) 
)
go

/*==============================================================*/
/* Table: Materials                                             */
/*==============================================================*/
create table Materials (
   IdMaterial          int      identity            not null,
   Name_M               char(20)             null,
   Quantity_M           int                  null,
   constraint PK_MATERIALS primary key (IdMaterial) 
)
go

/*==============================================================*/
/* Table: Position                                              */
/*==============================================================*/
create table Position (
   Position             varchar(50)          not null,
   constraint PK_POSITION primary key (Position)
)
go

/*==============================================================*/
/* Table: TechnicalCard                                         */
/*==============================================================*/
create table TechnicalCard (
   TCId                 int       identity           not null,
   ContractId           int                  not null,
   TypePrint            varchar(50)          null,
   Object               varchar(50)          null,
   constraint PK_TECHNICALCARD primary key (TCId) 
)
go

/*==============================================================*/
/* Table: ���������                                             */
/*==============================================================*/
create table ��������� (
   ContractId           int                  not null,
   EmployerId           int                  not null,
   constraint PK_��������� primary key (ContractId, EmployerId) 
)
go

/*==============================================================*/
/* Table: �����������                                           */
/*==============================================================*/
create table ����������� (
   TCId                 int                  not null,
   EmployerId           int                  not null,
   constraint PK_����������� primary key (TCId, EmployerId)
)
go

/*==============================================================*/
/* Table: ��������                                              */
/*==============================================================*/
create table �������� (
   TCId                 int                  not null,
   IdMaterial          int                  not null,
   constraint PK_�������� primary key (TCId, IdMaterial)
)
go

alter table Contract
   add constraint FK_CONTRACT_���������_CLIENT foreign key (ClientId)
      references Client (ClientId) on delete cascade on update cascade
go

alter table Employer
   add constraint FK_EMPLOYER_RELATIONS_POSITION foreign key (Position)
      references Position (Position)
go

alter table HistoryOfContract
   add constraint FK_HISTORY_���������_CONTRACT foreign key (ContractId)
      references Contract (ContractId)

alter table HistoryOfMaterial
   add constraint FK_HISTORY_���������_EMPLOYER foreign key (EmployerId)
      references Employer (EmployerId) 
go

alter table HistoryOfMaterial
   add constraint FK_HISTORY_���������_MATERIAL foreign key (IdMaterial)
      references Materials (IdMaterial)
go

alter table TechnicalCard
   add constraint FK_TECHNICA_�������_CONTRACT foreign key (ContractId)
      references Contract (ContractId) on delete cascade on update cascade
go

alter table ���������
   add constraint FK_��������_���������_CONTRACT foreign key (ContractId)
      references Contract (ContractId) on delete cascade on update cascade
go

alter table ���������
   add constraint FK_��������_���������_EMPLOYER foreign key (EmployerId)
      references Employer (EmployerId) 
go

alter table �����������
   add constraint FK_��������_���������_TECHNICA foreign key (TCId)
      references TechnicalCard (TCId) on delete cascade on update cascade
go

alter table �����������
   add constraint FK_��������_���������_EMPLOYER foreign key (EmployerId)
      references Employer (EmployerId)
go

alter table ��������
   add constraint FK_��������_��������_TECHNICA foreign key (TCId)
      references TechnicalCard (TCId) on delete cascade on update cascade
go

alter table ��������
   add constraint FK_��������_��������2_MATERIAL foreign key (IdMaterial)
      references Materials (IdMaterial)
go

