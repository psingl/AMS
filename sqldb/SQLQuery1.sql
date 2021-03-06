USE [master]
GO
/****** Object:  Database [student_portal]    Script Date: 10/11/2017 8:46:04 PM ******/
CREATE DATABASE [student_portal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'student_portal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\student_portal.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'student_portal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\student_portal_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [student_portal] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [student_portal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [student_portal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [student_portal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [student_portal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [student_portal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [student_portal] SET ARITHABORT OFF 
GO
ALTER DATABASE [student_portal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [student_portal] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [student_portal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [student_portal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [student_portal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [student_portal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [student_portal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [student_portal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [student_portal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [student_portal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [student_portal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [student_portal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [student_portal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [student_portal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [student_portal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [student_portal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [student_portal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [student_portal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [student_portal] SET RECOVERY FULL 
GO
ALTER DATABASE [student_portal] SET  MULTI_USER 
GO
ALTER DATABASE [student_portal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [student_portal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [student_portal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [student_portal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'student_portal', N'ON'
GO
USE [student_portal]
GO
/****** Object:  StoredProcedure [dbo].[ak1]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ak1]
as
select c_name from Course inner join Department on Course.d_id=1;


GO
/****** Object:  StoredProcedure [dbo].[as1]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[as1]
(
	@c_id int
)
as 
select * from Student where Sem_id=1;
GO
/****** Object:  StoredProcedure [dbo].[cour]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[cour]
as
select c_name from Course inner join per on Department.d_id=Course.d_id;
GO
/****** Object:  StoredProcedure [dbo].[info]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[info]
(

@t_contact int,
@t_name varchar(50),
@t_gmailid varchar(50),
@t_dob date,
@t_id int
)
as
insert into Teacher(t_contact,t_name,t_gmailid,t_dob,t_id) values(@t_contact,@t_name,@t_gmailid,@t_dob,@t_id);
GO
/****** Object:  StoredProcedure [dbo].[student_s]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[student_s]
( 
  @action varchar(50),
  @s_id int,
  @s_name varchar(50),
  @s_email varchar(50),
  @s_passward varchar(50),
  @s_date date,
  @s_address varchar(50),
  @s_contact varchar(50),
  @s_course varchar(20),
  @s_doa date
)
as
IF @action='insert'
 insert into Student ( s_id,s_name,s_email,s_passward,s_dob,s_address,s_course,s_doa) values (@s_id,@s_name,@s_email,@s_passward,@s_date,@s_address,@s_course,@s_doa);
 IF @action='update'
 update Student set s_name=@s_name, s_email=@s_email, s_passward=@s_passward,s_dob=@s_date, s_address=@s_address, s_contact=@s_contact, s_course=@s_course, s_doa=@s_doa where s_id=@s_id;
 IF @action='delete'
 Delete from Student where s_id=@s_id; 

GO
/****** Object:  StoredProcedure [dbo].[t_insert]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[t_insert]
(
   @action varchar(50),
   @t_contact int,
   @t_name varchar(50),
   @t_gmailid varchar(50),
   
   @t_address varchar(100),
   @t_date date,
   @d_id int,
   
   @pass varchar(20)
   )
as
 IF @action='insert'
insert into Teacher(t_contact,t_name,t_gmailid,t_address,t_dob,d_id,pass) values(@t_contact,@t_name,@t_gmailid,@t_address,@t_date,@d_id,@pass);
IF @action='update'
 update Teacher set t_name=@t_name, t_gmailid=@t_gmailid,t_address=@t_address,d_id=@d_id where t_contact=@t_contact;
 IF @action='delete'
   delete from Teacher where t_contact=@t_contact;

GO
/****** Object:  StoredProcedure [dbo].[teach]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[teach]
(
   @action varchar(50),
   @t_contact int,
   @t_name varchar(50),
   @t_gmailid varchar(50),
   @t_passward varchar(50),
   @t_address varchar(100),
   @t_date date

   )
as
 IF @action='insert'
insert into Teacher(t_contact,t_name,t_gmailid,t_passward,t_address,t_dob) values(@t_contact,@t_name,@t_gmailid,@t_passward,@t_address,@t_date);
IF @action='update'
 update Teacher set t_name=@t_name, t_gmailid=@t_gmailid,t_passward=@t_passward,t_address=@t_address where t_contact=@t_contact;
 IF @action='delete'
   delete from Teacher where t_contact=@t_contact;

   


GO
/****** Object:  Table [dbo].[Attandance]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attandance](
	[sr_no] [int] IDENTITY(1,1) NOT NULL,
	[s_id] [int] NULL,
	[total_att] [int] NULL,
	[stu_att] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [varchar](50) NULL,
	[d_id] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[d_id] [int] IDENTITY(1,1) NOT NULL,
	[d_name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Main]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main](
	[m_id] [int] IDENTITY(1,1) NOT NULL,
	[d_id] [int] NOT NULL,
	[c_id] [int] NOT NULL,
	[sec_id] [int] NOT NULL,
	[sub_id] [int] NOT NULL,
	[sem_id] [int] NOT NULL,
	[s_id] [int] NULL,
	[t_id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Section](
	[sec_id] [int] IDENTITY(1,1) NOT NULL,
	[sec_name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 10/11/2017 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[sem_id] [int] IDENTITY(1,1) NOT NULL,
	[sem_name] [varchar](50) NULL,
	[c_id] [int] NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[sem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/11/2017 8:46:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[sr_no] [int] IDENTITY(1,1) NOT NULL,
	[s_id] [int] NULL,
	[s_name] [varchar](50) NULL,
	[s_email] [varchar](50) NULL,
	[s_passward] [varchar](50) NULL,
	[s_dob] [date] NULL,
	[s_address] [varchar](50) NULL,
	[s_contact] [varchar](50) NULL,
	[s_course] [varchar](20) NULL,
	[s_doa] [date] NULL,
	[m_id] [int] NULL,
	[t_id] [int] NULL,
	[Sem_id] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 10/11/2017 8:46:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subject](
	[sub_id] [int] IDENTITY(1,1) NOT NULL,
	[sub_name] [varchar](50) NULL,
	[sem_id] [nchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 10/11/2017 8:46:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[t_id] [int] IDENTITY(1,1) NOT NULL,
	[t_contact] [int] NOT NULL,
	[t_name] [varchar](50) NULL,
	[t_gmailid] [varchar](50) NULL,
	[t_address] [varchar](100) NULL,
	[t_dob] [date] NULL,
	[d_id] [int] NULL,
	[pass] [varchar](10) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[t_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [student_portal] SET  READ_WRITE 
GO
