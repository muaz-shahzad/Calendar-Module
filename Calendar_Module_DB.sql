--First run this command
CREATE DATABASE Calendar_Module;
//////////////////////////////////////
--Second run this command
CREATE TABLE [dbo].[Available] (
    [time] TIME (0) NOT NULL
);
////////////
--For Insert Time slots in Table
--Note: Run following inserts commands one by one
INSERT INTO Available(time)
VALUES ('09:00');
INSERT INTO Available(time)
VALUES ('10:00');
INSERT INTO Available(time)
VALUES ('11:00');
INSERT INTO Available(time)
VALUES ('12:00');
INSERT INTO Available(time)
VALUES ('13:00');
INSERT INTO Available(time)
VALUES ('14:00');
//////////////////////////////////////
--Third run this command
CREATE TABLE [dbo].[Reserved_Slot] (
    [Slot] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Reserved_Slot_1] PRIMARY KEY CLUSTERED ([Slot] ASC)
);
//////////////////////////////////////
--Fourth run this command
CREATE TABLE [dbo].[Date] (
    [Date] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Date] PRIMARY KEY CLUSTERED ([Date] ASC)
);
//////////////////////////////////////
--Fifth run this command
create PROCEDURE ReservedSlot_SP
@Slot nvarchar(50)
as
begin
insert into Reserved_Slot (Slot)
values(@Slot)
end

//////////////////////////////////////
--Sixth run this command
create PROCEDURE DateSlot_SP
@Date nvarchar(50)
as
begin
insert into Date (Date)
values(@Date)
end

//////////////////////////////////////
--Query for display data
Select * from Reserved_Slot
Select * from Date
Select * from Available