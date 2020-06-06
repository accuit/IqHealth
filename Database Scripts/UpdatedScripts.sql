USE [LaymanWoods]
GO


Update CategoryMaster Set Title = 'Granite' Where CategoryCode = 502
Update ProductMaster Set Title = 'Handles, Favicol, Tape, Cartriage, Screws etc…' Where CategoryCode = 300;
Update ProductMaster Set isDeleted = 1, isActive = 0 Where CategoryCode = 700;
Update ProductMaster Set SKUCode = 'FCL', MRP=720 Where CategoryCode = 600 AND Name = 'False Ceiling';
Update ProductMaster Set SKUCode = 'PPP', MeasurementUnit = 3 Where CategoryCode = 600 AND Name = 'Plain POP';
Update ProductMaster Set SKUCode = 'MLP', Title='Moulding POP', MRP=240 Where CategoryCode = 600 AND Name = 'Moulding Price';
Update ProductMaster Set MeasurementUnit = 3 Where CategoryCode = 500 AND isDeleted = 0;
Delete from InteriorAndCategoryMapping Where CategoryCode = 107 and InteriorID = 1;









