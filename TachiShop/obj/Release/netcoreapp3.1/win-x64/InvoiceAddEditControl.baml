   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  U QSystem.Runtime, Version=4.2.2.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a7,clr-namespace:System;assembly=System.RuntimeSystem E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  %    TachiShop.InvoiceAddEditControl   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  #localclr-namespace:TachiShop  V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  6sys,clr-namespace:System;assembly=System.Runtime  =validationRules'clr-namespace:TachiShop.ValidationRules     MaterialDesignPaper#���     � DataContext  ��   Locator �� Source# [  �� Path$ InvoiceAddEditViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Loaded��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *LoadedCommand+  $ Unloaded��.    �� *UnloadedCommand+ � 	Resources ,   &TachiShop.ValidationRules.BindingProxy 	 Proxy   Data  MaterialDesignTextBox	 �� BasedOn
 �� 
TargetType �� Property �� Value  MaterialDesignComboBox�� %�   &	       '��      7  '�� ;     7     �� �� 8	   "
 ��.���  � ��$ 0,8,0,8q��� 8	   "
 ��.���  � ��$ Stretch=���  � ��$ 0,8,0,8q�.��� $
��20,0q� � RowDefinitions �� $��* ��� $	��100 �.+��  � ColumnDefinitions �� $
��Auto ��� $	��240 ��� $��10 ��� $��30 ��� $��20 ��� $��* � �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $��0��$��0��$��6��$��0,0,0,10q� �� Orientation$ 
Horizontal=�.+��� -    ��Name$ TbTitle��$
��Left=�$��DemiBold"� $  MaterialDesignHeadline4TextBlock#��[ $'��!Tạo mới hóa đơn bán hàng��&   System.Windows.Controls.DataGrid  -     Name$ DataGrid��$��1��$��8��$��5��$
��Auto��   AutoGenerateColumns$ False��   CanUserAddRows$ False��   
IsReadOnly$
 True��$
��True��$
��Auto=�$
��Auto=����� *InvoiceProducts+ �� SelectedItem �� *SelectedInvoiceProduct+    CenterRightColumnHeaderStyle & "MaterialDesignDataGridColumnHeader=  7System.Windows.Controls.Primitives.DataGridColumnHeader  CenterRightCellStyle��%�   &	       7  &	 \     �� 8	   "
  .���  � ��$ Center=���  � ��$ Right=���  � ��$	 5,0q��� "
 ��.���  � ��$ Center=���  � ��$ Right=�   $ SelectionChanged��.    �� *!DataGridSelectionChangedCommand+   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,	  &System.Windows.Controls.DataGridColumn 	  Width5
  /System.Windows.Controls.DataGridLengthConverter$
 Auto
  	  Header$ Tên mặt hàng��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *ProductOption.Product.Name+  $
 Auto
 $ Ngày nhập�� 	  SortMemberPath$ ProductOption.CreatedDate�� �� *ProductOption.CreatedDate+ �� StringFormat$ {0:dd/MM/yyyy HH:mm:ss}��  $
 Auto
 $ 
Đơn Giá��$ Price�� �� *Price+ 	 DecimalConverter �� 	Converter# [	  �� ConverterParameter$ PRICE��  $
 Auto
 $ Số lượng��$ Amount�� �� *Amount+# [	 $
 UNIT��  $
 Auto
 $ Đơn vị tính�� �� *Unit+ 
 EnumConverter# [
 $ PRODUCTUNIT��  $
 Auto
    ElementStyle# [ $ Thành tiền�� 	  HeaderStyle# [ $ 
TotalPrice�� �� *
TotalPrice+# [	 $ PRICE���� $��1��$��0��$��16,0,8,0q�$��Center=�$��
Ngày bán��� $��1��$��1�� �� $��1* ��� $��15 ��� $��1* �.+�(  "System.Windows.Controls.DatePicker  -      Name$  DpPurchaseDate��$��25��$��0,0,0,0q�)  #MaterialDesignThemes.Wpf.HintAssist!   Hint$! Chọn ngày��
" �� Now#   DisplayDateEnd## Z" $   SelectedDate$ �� % �� NotifyOnValidationError$
% True��$ PurchaseDate�& �� UpdateSourceTrigger$& PropertyChanged=�' �� ValidatesOnDataErrors$
' True��( �� ValidationRules( 6   0TachiShop.ValidationRules.DateTimeValidationRule  )   Required$
) True��5  /System.Windows.Controls.ExceptionValidationRule  )  #MaterialDesignThemes.Wpf.TimePicker  -   *  Name$* TpPurchaseTime��$��2��$��25��$��0,0,0,0q�$! Chọn giờ��+   SelectedTime+ �� $
% True��$ PurchaseTime�$& PropertyChanged=�$
' True��(   ,   RequiredMessage$, Vui lòng nhập giờ��  �� $��3��$��0��$��	16,20,8,0q�$��Center=�$��Khách hàng���� -   - ��Name$- 
CbCustomer��$��3��$��1��$��0,20,0,0q�$��Bottom=�$! Chọn khách hàng��. �� DisplayMemberPath$. DisplayValue��/ �� SelectedValuePath$/ Id������ *	Customers+ �� *Invoice.Customer+0 �� SelectedValue0 �� $
% True��$ Invoice.CustomerId�$& PropertyChanged=�$
' True��( 2   ,TachiShop.ValidationRules.GuidValidationRule  1   Required$
1 True��2   RequiredMessage$#2 Vui lòng chọn khách hàng��  �� $��3��$��3��$��30��$��30��$��Bottom=�
��� � �  MaterialDesignIconButton#���  3 � ToolTip$3 Tạo mới khách hàng������ *OpenAddCustomerDialogCommand+.��'  !MaterialDesignThemes.Wpf.PackIcon  
�������4   Kind$4 	PersonAdd=��� $��4��$��0��$��2��$��	16,30,8,0q�$��Center=�$��15(�$��DemiBold"�$��Danh sách mặt hàng���� $��5��$��0��$��	16,10,8,0q�$��Center=�$��Mặt hàng���� -   $- 	CbProduct��$��5��$��1��$��0,10,0,0q�$��Bottom=�$! Chọn mặt hàng��$
. Name��$/ Id������ *
Products+   $ SelectionChanged��.    �� * ProductSelectionChangedCommand+ �� $
% True��$ SelectedProduct�$& PropertyChanged=�$
' True��( 6   0TachiShop.ValidationRules.NotEmptyValidationRule  5   Message$"5 Vui lòng chọn mặt hàng��  �� $��6��$��0��$��	16,18,8,0q�$��Center=�$��Ngày nhập���� -   $- CbOption��$��6��$��1��$��0,20,0,0q�$��Bottom=�$! Chọn ngày nhập��$. DisplayValue��$/ Id������ *ProductOptions+   $ SelectionChanged��.    �� *OptionSelectionChangedCommand+ �� $
% True��$ SelectedOption�$& PropertyChanged=�$
' True��(   $#5 Vui lòng chọn ngày nhập��  �� $��7��$��0��$��	16,18,8,0q�$��Center=�$��
Đơn giá���� $��7��$��1��$��0,20,8,0q�$��Center=�$��DemiBold"�
���  ��6 �� TextAlignment$6 Right=����� *SelectedOption.Price+# [	 $ 	PRICELONG���� $��8��$��0��$��	16,18,8,0q�$��Center=�$��Số lượng���� -   7 ��Name$7 TbAmount��$��8��$��1��$��0,20,0,3q�$! Nhập số lượng��.  (MaterialDesignThemes.Wpf.TextFieldAssist8   
SuffixText8 �� *SelectedOption.Unit+# [
 $ PRODUCTUNIT��.������ # [	 $
 UNIT��9 �� Delay$	9 500��$
% True��$ InvoiceProduct.Amount�$& PropertyChanged=�$
' True��( 5   /TachiShop.ValidationRules.DecimalValidationRule  
:   Min: 0.01;   RequiredMessage$$; Vui lòng nhập số lượng��<   Wrapper< .   (TachiShop.ValidationRules.DecimalWrapper  =   DecimalPlaces= �� *Data.SelectedOption.Unit+  UnitToDecimalPlaceConverter# [ # [ 
>   Max> �� *Data.SelectedOption.Stock+# [   .��� $��10��$��0��$��4��$��	0,30,0,15q� �� $
��1.7* ��� .+��� $	��130��$��25��$��Right=�$��11(����� *AddEditProductInvoiceCommand+  " MaterialDesignRaisedDarkButton? �� Triggers@ �� BindingA �� ElementName  NotZeroConverterB �� Value��%�  '��       7  7  �� 8	   "
 ��.���  � ��$ Thêm vào hóa đơn����  �@�ToolTip$' !Thêm mặt hàng vào hóa đơn����  � ��
 � � ���  � ��
 � � �? �� @ �� $A DataGrid��$ SelectedItems.Count�8  B True.a���  � ��$ Cập nhật hóa đơn����  �@�ToolTip$. (Cập nhật mặt hàng vào hóa đơn����  � ��
 ������  � ��
 ������ $��1��$
��Auto��$��25��$��Center=�$��
Làm mới��$��11(�#��[ $3 Làm mới mặt hàng������ *ClearProductCommand+�� $��10��$��5��$
��Auto��$��25��$
��0,15q�$��Right=�$��Xóa khỏi hóa đơn��$��11(�#��[ $3 Xóa khỏi hóa đơn������ *RemoveProductInvoiceCommand+���� $A DataGrid��$ SelectedItems�y��� $A DataGrid��$ SelectedItems.Count�   NotZeroToVisibilityConverter# [ � $��12��$��5��y��� *InvoiceProducts.Count+# [  �� $��2* ��� $��3* �.+��� $
��Left=�$��DemiBold"� $  MaterialDesignHeadline6TextBlock#��[ $��Tổng Tiền: ���� $��1��$��Right=�$��DemiBold"�
���  ��#��[ ���� *
TotalPrice+# [	 $ 	PRICELONG��� $��1��$��Stretch=�$��Center=� �� ��  �� �� .+��� $	��120��
��� � �
��� � �$��Tạo hóa đơn��#��[ $'3 !Tạo mới hóa đơn nhập kho������ *AddInvoiceCommand+�� $��1��$	��120��$��
Làm mới��#��[ $3 Làm mới hóa đơn������ *ClearCommand+'  !MaterialDesignThemes.Wpf.Snackbar  $��1��$��1��