USE [dop_prueba_dcom]
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([id], [identif], [tipo_identif], [nombre], [nombre_repres_legal], [telefono], [email], [nombre_contacto], [vr_activo], [vr_pasivo], [vr_patrim]) VALUES (3, N'444', N'PA', N'cristiano ronaldo', N'jorge mendez', N'3239876543', N'cr7@yahoo.com', N'laura gomez', 125000000.0000, 25000000.0000, 100000000.0000)
INSERT [dbo].[cliente] ([id], [identif], [tipo_identif], [nombre], [nombre_repres_legal], [telefono], [email], [nombre_contacto], [vr_activo], [vr_pasivo], [vr_patrim]) VALUES (10, N'2233445566', N'CC', N'ivan duque', N'abelardo de la espriella', N'', N'', N'', 5000.0000, 1000.0000, 4000.0000)
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
