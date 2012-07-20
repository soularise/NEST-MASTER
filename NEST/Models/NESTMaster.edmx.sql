
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 04/23/2012 18:02:38
-- Generated from EDMX file: C:\VisualStudioProjects\Murphy-NEST\Murphy-NEST\Murphy-NEST\NEST\Models\NESTMaster.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [NESTV1R];
GO
IF SCHEMA_ID(N'NESTSchema') IS NULL EXECUTE(N'CREATE SCHEMA [NESTSchema]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[NESTSchema].[Configurations]', 'U') IS NOT NULL
    DROP TABLE [NESTSchema].[Configurations];
GO
IF OBJECT_ID(N'[NESTSchema].[ContentBodies]', 'U') IS NOT NULL
    DROP TABLE [NESTSchema].[ContentBodies];
GO
IF OBJECT_ID(N'[NESTSchema].[ContentSections]', 'U') IS NOT NULL
    DROP TABLE [NESTSchema].[ContentSections];
GO
IF OBJECT_ID(N'[NESTSchema].[ContentTypes]', 'U') IS NOT NULL
    DROP TABLE [NESTSchema].[ContentTypes];
GO
IF OBJECT_ID(N'[NESTSchema].[Contributions]', 'U') IS NOT NULL
    DROP TABLE [NESTSchema].[Contributions];
GO
IF OBJECT_ID(N'[NESTSchema].[PolyCons]', 'U') IS NOT NULL
    DROP TABLE [NESTSchema].[PolyCons];
GO
IF OBJECT_ID(N'[NESTSchema].[Registrants]', 'U') IS NOT NULL
    DROP TABLE [NESTSchema].[Registrants];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Configurations'
CREATE TABLE [NESTSchema].[Configurations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [GoogleAnalytics_ID] nvarchar(max)  NOT NULL,
    [TwitterHandle] nvarchar(max)  NOT NULL,
    [FacebookURL] nvarchar(max)  NOT NULL,
    [GooglePlusURL] nvarchar(max)  NOT NULL,
    [ContributionEngine] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ContentBodies'
CREATE TABLE [NESTSchema].[ContentBodies] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [BodyText] nvarchar(max)  NOT NULL,
    [Type] nvarchar(max)  NULL,
    [SubHeader] nvarchar(max)  NULL,
    [Promote] nvarchar(max)  NULL,
    [CreationDate] nvarchar(max)  NULL,
    [Owner] nvarchar(max)  NULL,
    [ContentSection_ID] int  NOT NULL,
    [SortOrder] int  NULL,
    [Icon] nvarchar(max)  NULL,
    [SEOUrl] nvarchar(max)  NULL,
    [TeaserText] nvarchar(max)  NULL,
    [MediaSourceURL] nvarchar(max)  NULL,
    [IFrameURL] nvarchar(max)  NULL,
    [IncludePageHeader] nchar(10)  NULL,
    [TitleSize] nchar(2)  NULL,
    [SubHeaderSize] nchar(2)  NULL
);
GO

-- Creating table 'ContentSections'
CREATE TABLE [NESTSchema].[ContentSections] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Header] nvarchar(max)  NOT NULL,
    [URL] nvarchar(max)  NOT NULL,
    [CreationDate] nvarchar(max)  NOT NULL,
    [ContentTypeId] int  NOT NULL
);
GO

-- Creating table 'ContentTypes'
CREATE TABLE [NESTSchema].[ContentTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Behavior] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Contributions'
CREATE TABLE [NESTSchema].[Contributions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Amount] decimal(18,0)  NOT NULL,
    [Registrant_ID] int  NOT NULL
);
GO

-- Creating table 'Registrants'
CREATE TABLE [NESTSchema].[Registrants] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [MI] nvarchar(max)  NULL,
    [Company] nvarchar(max)  NULL,
    [Occupation] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NOT NULL,
    [HomePhone] nvarchar(max)  NULL,
    [CellPhone] nvarchar(max)  NULL,
    [Address1] nvarchar(max)  NULL,
    [Address2] nvarchar(max)  NULL,
    [City] nvarchar(max)  NULL,
    [State] nvarchar(max)  NULL,
    [ZipCode] nvarchar(max)  NOT NULL,
    [WebsiteURL] nvarchar(max)  NULL,
    [TwitterURL] nvarchar(max)  NULL,
    [FacebookURL] nvarchar(max)  NULL,
    [LinkedInURL] nvarchar(max)  NULL,
    [Comments] nvarchar(max)  NULL
);
GO

-- Creating table 'PolyCons'
CREATE TABLE [NESTSchema].[PolyCons] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NULL,
    [Position] nvarchar(max)  NULL,
    [Type] nvarchar(max)  NULL,
    [AvailableToList] bit  NOT NULL,
    [SortOrder] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Configurations'
ALTER TABLE [NESTSchema].[Configurations]
ADD CONSTRAINT [PK_Configurations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ContentBodies'
ALTER TABLE [NESTSchema].[ContentBodies]
ADD CONSTRAINT [PK_ContentBodies]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ContentSections'
ALTER TABLE [NESTSchema].[ContentSections]
ADD CONSTRAINT [PK_ContentSections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ContentTypes'
ALTER TABLE [NESTSchema].[ContentTypes]
ADD CONSTRAINT [PK_ContentTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contributions'
ALTER TABLE [NESTSchema].[Contributions]
ADD CONSTRAINT [PK_Contributions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Registrants'
ALTER TABLE [NESTSchema].[Registrants]
ADD CONSTRAINT [PK_Registrants]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PolyCons'
ALTER TABLE [NESTSchema].[PolyCons]
ADD CONSTRAINT [PK_PolyCons]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ContentSection_ID] in table 'ContentBodies'
ALTER TABLE [NESTSchema].[ContentBodies]
ADD CONSTRAINT [FK_ContentSectionContentBody]
    FOREIGN KEY ([ContentSection_ID])
    REFERENCES [NESTSchema].[ContentSections]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ContentSectionContentBody'
CREATE INDEX [IX_FK_ContentSectionContentBody]
ON [NESTSchema].[ContentBodies]
    ([ContentSection_ID]);
GO

-- Creating foreign key on [ContentTypeId] in table 'ContentSections'
ALTER TABLE [NESTSchema].[ContentSections]
ADD CONSTRAINT [FK_ContentSectionContentType]
    FOREIGN KEY ([ContentTypeId])
    REFERENCES [NESTSchema].[ContentTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ContentSectionContentType'
CREATE INDEX [IX_FK_ContentSectionContentType]
ON [NESTSchema].[ContentSections]
    ([ContentTypeId]);
GO

-- Creating foreign key on [Registrant_ID] in table 'Contributions'
ALTER TABLE [NESTSchema].[Contributions]
ADD CONSTRAINT [FK_Contributions_Registrants]
    FOREIGN KEY ([Registrant_ID])
    REFERENCES [NESTSchema].[Registrants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Contributions_Registrants'
CREATE INDEX [IX_FK_Contributions_Registrants]
ON [NESTSchema].[Contributions]
    ([Registrant_ID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------