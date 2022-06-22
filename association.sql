/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     4/3/2019 7:17:38 PM                          */
/*==============================================================*/


drop table if exists ActivityApplication;

drop table if exists ActivityInformation;

drop table if exists AdminInformation;

drop table if exists ApplicationOfAdmission;

drop table if exists AssociationEstablish;

drop table if exists AssociationInformation;

drop table if exists InstitutionInformation;

drop table if exists MemberInformation;

drop table if exists MessageInformation;

drop table if exists MonthlyFinancialStatement;

drop table if exists Position;

drop table if exists UserInformation;

/*==============================================================*/
/* Table: ActivityApplication                                   */
/*==============================================================*/
create table ActivityApplication
(
   application_id       int not null,
   association_id       int,
   application_name     varchar(30),
   activity_time        varchar(20),
   activity_location    varchar(50),
   activity_content     varchar(1000),
   activity_significance varchar(200),
   status               varchar(20),
   primary key (application_id)
);

/*==============================================================*/
/* Table: ActivityInformation                                   */
/*==============================================================*/
create table ActivityInformation
(
   activity_id          int not null,
   association_id       int,
   activity_name        varchar(50),
   activity_time        varchar(20),
   activity_location    varchar(50),
   activity_content     varchar(1000),
   activity_cost        int,
   primary key (activity_id)
);

/*==============================================================*/
/* Table: AdminInformation                                      */
/*==============================================================*/
create table AdminInformation
(
   admin_id             int not null,
   position_id          int,
   admin_name           varchar(20),
   admin_accout         varchar(20),
   admin_password       varchar(20),
   primary key (admin_id)
);

/*==============================================================*/
/* Table: ApplicationOfAdmission                                */
/*==============================================================*/
create table ApplicationOfAdmission
(
   admission_id         int not null,
   user_id              int,
   association_id       int,
   user_sex             varchar(5),
   user_age             int,
   user_phone           varchar(20),
   admission_reson      varchar(1000),
   primary key (admission_id)
);

/*==============================================================*/
/* Table: AssociationEstablish                                  */
/*==============================================================*/
create table AssociationEstablish
(
   establish_id         int not null,
   user_id              int,
   association_name     varchar(50),
   association_introduction varchar(1000),
   establish_time       varchar(20),
   reson_establishment  varchar(1000),
   state                varchar(20),
   primary key (establish_id)
);

/*==============================================================*/
/* Table: AssociationInformation                                */
/*==============================================================*/
create table AssociationInformation
(
   association_id       int not null,
   association_name     varchar(50) not null,
   association_establish_time varchar(20),
   association_profile  char(200),
   association_purpose  varchar(100),
   primary key (association_id)
);

/*==============================================================*/
/* Table: InstitutionInformation                                */
/*==============================================================*/
create table InstitutionInformation
(
   institution_id       int not null,
   institution_title    varchar(20),
   institution_time     varchar(20),
   institution_content  varchar(2000),
   primary key (institution_id)
);

/*==============================================================*/
/* Table: MemberInformation                                     */
/*==============================================================*/
create table MemberInformation
(
   member_id            int not null,
   association_id       int,
   position_id          int,
   member_name          varchar(20),
   member_xuehao        varchar(20),
   member_password      varchar(16),
   member_email         varchar(30),
   member_sex           varchar(5),
   member_age           int,
   member_phone         varchar(20),
   primary key (member_id)
);

/*==============================================================*/
/* Table: MessageInformation                                    */
/*==============================================================*/
create table MessageInformation
(
   message_id           int not null,
   association_id       int,
   message_title        varchar(50),
   message_time         varchar(20),
   message_content      varchar(2000),
   primary key (message_id)
);

/*==============================================================*/
/* Table: MonthlyFinancialStatement                             */
/*==============================================================*/
create table MonthlyFinancialStatement
(
   fund_id              int not null,
   association_id       int,
   fund_time            varchar(20),
   fund_income          int,
   fund_expenditure     int,
   fund_remarks         varchar(2000),
   primary key (fund_id)
);

/*==============================================================*/
/* Table: Position                                              */
/*==============================================================*/
create table Position
(
   position_id          int not null,
   position_name        varchar(30),
   primary key (position_id)
);

/*==============================================================*/
/* Table: UserInformation                                       */
/*==============================================================*/
create table UserInformation
(
   user_id              int not null,
   user_xuehao          varchar(20),
   user_name            varchar(20),
   user_password        varchar(20),
   user_email           varchar(20),
   primary key (user_id)
);

alter table ActivityApplication add constraint FK_Reference_6 foreign key (association_id)
      references AssociationInformation (association_id) on delete restrict on update restrict;

alter table ActivityInformation add constraint FK_Reference_5 foreign key (association_id)
      references AssociationInformation (association_id) on delete restrict on update restrict;

alter table AdminInformation add constraint FK_Reference_7 foreign key (position_id)
      references Position (position_id) on delete restrict on update restrict;

alter table ApplicationOfAdmission add constraint FK_Reference_8 foreign key (association_id)
      references AssociationInformation (association_id) on delete restrict on update restrict;

alter table ApplicationOfAdmission add constraint FK_Reference_9 foreign key (user_id)
      references UserInformation (user_id) on delete restrict on update restrict;

alter table AssociationEstablish add constraint FK_Reference_10 foreign key (user_id)
      references UserInformation (user_id) on delete restrict on update restrict;

alter table MemberInformation add constraint FK_Reference_3 foreign key (association_id)
      references AssociationInformation (association_id) on delete restrict on update restrict;

alter table MemberInformation add constraint FK_Reference_4 foreign key (position_id)
      references Position (position_id) on delete restrict on update restrict;

alter table MessageInformation add constraint FK_Reference_1 foreign key (association_id)
      references AssociationInformation (association_id) on delete restrict on update restrict;

alter table MonthlyFinancialStatement add constraint FK_Reference_2 foreign key (association_id)
      references AssociationInformation (association_id) on delete restrict on update restrict;

