   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  %    TachiShop.InvoiceDetailsControl   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  #localclr-namespace:TachiShop  V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006     MaterialDesignPaper#���     � DataContext  ��   Locator �� Source# [  �� Path$ InvoiceDetailsViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Loaded��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *LoadedCommand+  $ Unloaded��.    �� *UnloadedCommand+ � 	Resources   MaterialDesignTextBox �� BasedOn	 �� 
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
��Left=�$��DemiBold"� $  MaterialDesignHeadline4TextBlock#��[ $&�� Chi tiết hóa đơn bán hàng���� $��1��$��0��$
��0,10q�$��Center=�$��DemiBold"�$��Ngày bán: ���� $��1��$��2��$��Center=����� *Invoice.CreatedDate+ �� StringFormat$ {0:dd/MM/yyyy HH:mm:ss}���� $��2��$��0��$
��0,10q�$��Center=�$��DemiBold"�$��Khách hàng: ���� $��2��$��2��$��Center=����� *Invoice.Customer.DisplayValue+�� $��3��$��0��$��	0,10,0,20q�$��Center=�$��DemiBold"�$��Nhân viên: ���� $��3��$��2��$��	0,10,0,20q�$��Center=����� *#!Invoice.CreatingUser.DisplayValue+�� $��5��$��0��$��4���� $��6��$��0��$��4��$
��0,10q�$��Center=�$��15(�$��DemiBold"�$��Danh sách mặt hàng��&   System.Windows.Controls.DataGrid  -     Name$ DataGrid��$��7��$��0��$��4��$
��Auto��   AutoGenerateColumns$ False��   CanUserAddRows$ False��   
IsReadOnly$
 True��$
��True��$
��Auto=�$
��Auto=����� *Invoice.InvoiceProducts+    CenterRightColumnHeaderStyle & "MaterialDesignDataGridColumnHeader=  7System.Windows.Controls.Primitives.DataGridColumnHeader  CenterRightCellStyle��%�   &	       7  &	 \     �� 8   "	  .��� 
 � ��$ Center=��� 
 � ��$ Right=��� 
 � ��$	 5,0q��� "	 ��.��� 
 � ��$ Center=��� 
 � ��$ Right=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$
 Auto	    Header$ Tên mặt hàng��1
  +System.Windows.Controls.DataGridBoundColumn 
  Binding �� *ProductOption.Product.Name+  $
 Auto	 $ Ngày nhập��   SortMemberPath$ ProductOption.CreatedDate�� �� *ProductOption.CreatedDate+$ {0:dd/MM/yyyy HH:mm:ss}��  $
 Auto	 $ 
Đơn Giá��$ Price�� �� *Price+  DecimalConverter �� 	Converter# [  �� ConverterParameter$ PRICE��  $
 Auto	 $ Số lượng��$ Amount�� �� *Amount+# [ $
 UNIT��  $
 Auto	 $ Đơn vị tính�� �� *Unit+ 	 EnumConverter# [	 $ PRODUCTUNIT��  $
 Auto	  
  ElementStyle# [ $ Thành tiền��   HeaderStyle# [ $ 
TotalPrice�� �� *
TotalPrice+# [ $ PRICE��� $��8��$��0��$
��0,10q�$��4�� �� $��* ��� $��20 ��� $
��Auto �.+��� $��Right=�$��DemiBold"� $
  MaterialDesignHeadline6TextBlock#��[
 $��Tổng Tiền: ���� $��2��$��Right=�$��DemiBold"�
���  ��#��[
 ���� *Invoice.TotalPrice+# [ $ 	PRICELONG��