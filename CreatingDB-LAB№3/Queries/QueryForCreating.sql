

CREATE TABLE [dbo].[Song3](
	[NameOfSong] [nvarchar](50) NOT NULL,
	[NameOfAlbum] [nvarchar](50) NULL,
	[PictureOfAlbum] [image] NULL,
	[TimeOfSong] [int] NULL,
	[CountInAlbum] [int] NULL,
	[Artist] [nvarchar](50) NULL,
	[Bio] [text] NULL,
	[CountryOfArtist] [nvarchar](50) NULL,
	[YearOfBirth] [int] NULL,
	[PlaceOfRecordingAlbum] [nvarchar](50) NULL,
	[AdressOfPlace] [nvarchar](50) NULL,
	[Director] [nvarchar](50) NULL,
	[YearOfCreating] [int] NULL,
	[NumOfAlbum] [int] NULL,
	CONSTRAINT [CK_PoryadkoviyNomer1] CHECK  (([CountInAlbum] like '[0-9]%')),
	CONSTRAINT [CK_YearOfBirth1] CHECK  ((NOT [YearOfBirth] like '>YearOfCreating'))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	
GO
