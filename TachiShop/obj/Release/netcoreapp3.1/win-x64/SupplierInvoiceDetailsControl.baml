   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  -    'TachiShop.SupplierInvoiceDetailsControl   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  #localclr-namespace:TachiShop  V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006     MaterialDesignPaper#���     � DataContext  ��   Locator �� Source# [  �� Path$% SupplierInvoiceDetailsViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Loaded��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *LoadedCommand+  $ Unloaded��.    �� *UnloadedCommand+ � 	Resources   MaterialDesignTextBox �� BasedOn	 �� 
TargetType
 �� Property �� Value  MaterialDesignComboBox�� %�   '��       7  '�� -     7  �� 8   "	 ��.��� 
 � ��$ 0,8,0,8q��� 8   "	 ��.��� 
 � ��$ Stretch=��� 
 � ��$ 0,8,0,8q�.��� $��
20,0,20,20q� � ColumnDefinitions �� $
��Auto ��� $��15 ��� $
��Auto ��� $��* � � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $��0��$��0��$��4��$��0,0,0,10q� �� Orientation$ 
Horizontal=�.+��� $
��Left=�$��DemiBold"� $  MaterialDesignHeadline4TextBlock#��[ $&�� Chi tiết hóa đơn nhập kho���� $��1��$��0��$
��0,10q�$��Center=�$��DemiBold"�$��Ngày nhập: ���� $��1��$��2��$��Center=����� *SupplierInvoice.ImportDate+ �� StringFormat$ {0:dd/MM/yyyy HH:mm:ss}���� $��2��$��0��$
��0,10q�$��Center=�$��DemiBold"�$��Khách hàng: ���� $��2��$��2��$��Center=����� *'%SupplierInvoice.Supplier.DisplayValue+�� $��3��$��0��$��	0,10,0,20q�$��Center=�$��DemiBold"�$��Nhân viên: ���� $��3��$��2��$��	0,10,0,20q�$��Center=����� *+)SupplierInvoice.CreatingUser.DisplayValue+�� $��5��$��0��$��4���� $��6��$��0��$��4��$
��0,10q�$��Center=�$��15(�$��DemiBold"�$��Danh sách mặt hàng��&   System.Windows.Controls.DataGrid  -     Name$ DataGrid��$��7��$��0��$��4��$
��Auto��   AutoGenerateColumns$ False��   CanUserAddRows$ False��   
IsReadOnly$
 True��$
��True��$
��Auto=�$
��Auto=����� * SupplierInvoice.ProductOptions+    CenterRightColumnHeaderStyle & "MaterialDesignDataGridColumnHeader=  7System.Windows.Controls.Primitives.DataGridColumnHeader  CenterRightCellStyle��%�   &	       7  &	 \     �� 8   "	  .��� 
 � ��$ Center=��� 
 � ��$ Right=��� 
 � ��$	 5,0q��� "	 ��.��� 
 � ��$ Center=��� 
 � ��$ Right=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$
 Auto	    Header$ Tên mặt hàng��1
  +System.Windows.Controls.DataGridBoundColumn 
  Binding �� *Product.Name+  $
 Auto	 $ Trạng thái�� �� *Status+  EnumConverter �� 	Converter# [  �� ConverterParameter$ ProductStatus��  $
 Auto	 $ Số lượng��   SortMemberPath$ OriginStock�� �� *OriginStock+ 	 DecimalConverter# [	 $
 UNIT��  $
 Auto	 $ Đơn vị tính�� �� *Unit+# [ $ PRODUCTUNIT��  $
 Auto	 $ Giá nhập��$ SupplyPrice�� �� *SupplyPrice+# [	 $ PRICE��  $
 Auto	 $ 	Giá bán��$ Price�� �� *Price+# [	 $ PRICE��  $
 Auto	  
  ElementStyle# [ $ Tổng tiền nhập��   HeaderStyle# [ $ TotalSupplyPrice�� �� *TotalSupplyPrice+# [	 $ PRICE��4  .System.Windows.Controls.DataGridTemplateColumn  $
 Auto	    CellTemplate �� .R��� $��20��
������ &
 "MaterialDesignIconForegroundButton#��� 
  � ToolTip$ Cập nhật������ *#!DataContext.OpenEditDialogCommand+ �� RelativeSource �� *FindAncestor+  �� AncestorType"  >����� *DataContext.Id+ �� *FindAncestor+)  #System.Windows.Controls.DataGridRow"   .��'  !MaterialDesignThemes.Wpf.PackIcon  $��20��!   Kind$
! Edit=�� $��8��$��0��$
��0,10q�$��4�� �� $��* ��� $��20 ��� $
��Auto �.+��� $��Right=�$��DemiBold"� $  MaterialDesignHeadline6TextBlock#��[ $��Tổng Tiền: ���� $��2��$��Right=�$��DemiBold"�
���  ��#��[ ���� *SupplierInvoice.TotalPrice+# [	 $ 	PRICELONG��