   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  U QSystem.Runtime, Version=4.2.2.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a7,clr-namespace:System;assembly=System.RuntimeSystem E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  -    'TachiShop.SupplierInvoiceAddEditControl   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  #localclr-namespace:TachiShop  V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  6sys,clr-namespace:System;assembly=System.Runtime  =validationRules'clr-namespace:TachiShop.ValidationRules  $
��Auto��$
��Auto��   MaterialDesignPaper#���     � DataContext  ��   Locator �� Source# [  �� Path$% SupplierInvoiceAddEditViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Loaded��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *LoadedCommand+  $ Unloaded��.    �� *UnloadedCommand+ � 	Resources ,   &TachiShop.ValidationRules.BindingProxy 	 Proxy   Data  MaterialDesignTextBox	 �� BasedOn
 �� 
TargetType �� Property �� Value  MaterialDesignComboBox�� %�   &	       '��      7  '�� ;     7     �� �� 8	   "
 ��.���  � ��$ 0,8,0,8q��� 8	   "
 ��.���  � ��$ Stretch=���  � ��$ 0,8,0,8q�.��� $
��20,0q� � RowDefinitions �� $��* ��� $	��100 �.+��  � ColumnDefinitions �� $
��Auto ��� $	��220 ��� $��10 ��� $��30 ��� $��20 ��� $��* � �� $
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
��Left=�$��DemiBold"� $  MaterialDesignHeadline4TextBlock#��[ #!Tạo mới hóa đơn nhập kho&   System.Windows.Controls.DataGrid  -     Name$ DataGrid��$��1��$��8��$��5��$
��Auto��   AutoGenerateColumns$ False��   CanUserAddRows$ False��   
IsReadOnly$
 True��$
��True��$
��Auto=�$
��Auto=����� *ProductOptions+ �� SelectedItem �� *SelectedOption+    CenterRightColumnHeaderStyle & "MaterialDesignDataGridColumnHeader=  7System.Windows.Controls.Primitives.DataGridColumnHeader  CenterRightCellStyle��%�   &	       7  &	 \     �� 8	   "
  .���  � ��$ Center=���  � ��$ Right=���  � ��$	 5,0q��� "
 ��.���  � ��$ Center=���  � ��$ Right=�   $ SelectionChanged��.    �� *!DataGridSelectionChangedCommand+   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,	  &System.Windows.Controls.DataGridColumn 	  Width5
  /System.Windows.Controls.DataGridLengthConverter$
 Auto
  	  Header$ Tên mặt hàng��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Product.Name+  $
 Auto
 $ Trạng thái�� �� *Status+ 	 EnumConverter �� 	Converter# [	  �� ConverterParameter$ ProductStatus��  $
 Auto
 $ Số lượng�� 	  SortMemberPath$ OriginStock�� �� *OriginStock+ 
 DecimalConverter# [
 $
 UNIT��  $
 Auto
 $ Đơn vị tính�� �� *Unit+# [	 $ PRODUCTUNIT��  $
 Auto
 $ Giá nhập��$ SupplyPrice�� �� *SupplyPrice+# [
 $ PRICE��  $
 Auto
 $ 	Giá bán��$ Price�� �� *Price+# [
 $ PRICE��  $
 Auto
    ElementStyle# [ $ Tổng tiền nhập�� 	  HeaderStyle# [ $ TotalSupplyPrice�� �� *TotalSupplyPrice+# [
 $ PRICE���� $��1��$��0��$��16,0,8,0q�$��Center=�$��Ngày nhập��� $��1��$��1�� �� $
��1.5* ��� $��15 ��� $��1* �.+�(  "System.Windows.Controls.DatePicker  -     Name$ DpImportDate��$��25��$��0,0,0,0q�)  #MaterialDesignThemes.Wpf.HintAssist    Hint$  Chọn ngày��
! �� Now"   DisplayDateEnd#" Z! #   SelectedDate# �� $ �� NotifyOnValidationError$
$ True��$ 
ImportDate�% �� UpdateSourceTrigger$% PropertyChanged=�& �� ValidatesOnDataErrors$
& True��' �� ValidationRules' 6   0TachiShop.ValidationRules.DateTimeValidationRule  (   Required$
( True��5  /System.Windows.Controls.ExceptionValidationRule  )  #MaterialDesignThemes.Wpf.TimePicker  -   )  Name$) TpImportTime��$��2��$��25��$��0,0,0,0q�$  Chọn giờ��*   SelectedTime* �� $
$ True��$ 
ImportTime�$% PropertyChanged=�$
& True��'   $
( True��+   RequiredMessage$+ Vui lòng nhập giờ��  �� $��3��$��0��$��	16,20,8,0q�$��Center=�$��Nhà cung cấp���� -   , ��Name$, 
CbSupplier��$��3��$��1��$��0,20,0,0q�$��Bottom=�$  Chọn nhà cung cấp��- �� DisplayMemberPath$
- Name��. �� SelectedValuePath$. Id������ *	Suppliers+ �� *SupplierInvoice.Supplier+/ �� SelectedValue/ �� $
$ True��$  SupplierInvoice.SupplierId�$% PropertyChanged=�$
& True��' 2   ,TachiShop.ValidationRules.GuidValidationRule  0   RequiredMessage$&0  Vui lòng chọn nhà cung cấp��  �� $��3��$��3��$��30��$��30��$��Bottom=�
��� � �  MaterialDesignIconButton#���  1 � ToolTip$!1 Tạo mới nhà cung cấp������ *OpenAddSupplierDialogCommand+.��'  !MaterialDesignThemes.Wpf.PackIcon  
�������2   Kind$2 HomeAdd=��� $��4��$��0��$��2��$��	16,30,8,0q�$��Center=�$��15(�$��DemiBold"�$��Danh sách mặt hàng���� $��5��$��0��$��16,8,8,0q�$��Center=�$��Mặt hàng���� -   $, 	CbProduct��$��5��$��1��$��0,10,0,0q�$��Bottom=�$  Chọn mặt hàng��$
- Name��$. Id������ *
Products+ �� *ProductOption.Product+   $ SelectionChanged��.    �� * ProductSelectionChangedCommand+/ �� $
$ True��$ ProductOption.ProductId�$% PropertyChanged=�$
& True��'   $"0 Vui lòng chọn mặt hàng��  �� $��5��$��3��$��30��$��30��$��Bottom=�
��� � �#���  $1 Tạo mới mặt hàng������ *OpenAddProductDialogCommand+.��  
�������$2 DatabaseAdd=��� $��6��$��0��$��	16,18,8,0q�$��Center=�$��Trạng thái���� -   $, CbStatus��$��6��$��1��$��0,20,0,0q�$��Bottom=�$  Chọn trạng thái��$- Value��$	. Key������ *
Statuses+/ �� $
$ True��$ ProductOption.Status�$% PropertyChanged=�$
& True��' 6   0TachiShop.ValidationRules.NotEmptyValidationRule  3   
EmptyValue$3 -1��4   Message$04 *Vui lòng chọn trạng thái mặt hàng��  �� $��7��$��0��$��	16,18,8,0q�$��Center=�$��Số lượng��� $��7��$��1�� �� $��* ��� $��10 ��� $��* �.+��� -   5 ��Name$5 TbOriginStock��$��0,20,0,0q�$  Nhập số lượng��.������ # [
 $
 UNIT��6 �� Delay$	6 500��$
$ True��$ ProductOption.OriginStock�$% PropertyChanged=�$
& True��' 5   /TachiShop.ValidationRules.DecimalValidationRule  
7   Min7 0.018   RequiredMessage$$8 Vui lòng nhập số lượng��9   Wrapper9 .   (TachiShop.ValidationRules.DecimalWrapper  :   DecimalPlaces: �� *Data.ProductOption.Unit+  UnitToDecimalPlaceConverter# [ # [   .���� -	   $, CbUnit��$��2��$��0,20,0,0q�$��Center=�$  Chọn đơn vị��$- Value��$	. Key������ *Units+/ �� $
$ True��$ ProductOption.Unit�$% PropertyChanged=�$
& True��'   $3 -1��$!4 Vui lòng chọn đơn vị��  �� $��8��$��0��$��	16,18,8,0q�$��Center=�$
��Giá��� $��8��$��1�� �� $��* ��� $��10 ��� $��* �.+��� -
   $5 TbSupplyPrice��$��0,20,0,0q�$  Giá nhập��.������ # [
 $ PRICE��$	6 500��$
$ True��$ ProductOption.SupplyPrice�$% PropertyChanged=�$
& True��'   7 100$"8 Vui lòng nhập giá nhập��  .���� -   $5 TbPrice��$��2��$��0,20,0,0q�$  	Giá bán��.������ # [
 $ PRICE��$	6 500��$
$ True��$ ProductOption.Price�$% PropertyChanged=�$
& True��'   7 100$ 8 Vui lòng nhập giá bán��  .��� $��10��$��0��$��4��$��	0,30,0,15q� �� $
��1.7* ��� .+��� $	��130��$��25��$��Right=�$��11(����� *AddEditProductInvoiceCommand+  " MaterialDesignRaisedDarkButton; �� Triggers< �� Binding= �� ElementName  NotZeroConverter> �� Value��%�  '��       7  7  �� 8	   "
 ��.���  � ��$ Thêm vào hóa đơn����  �@�ToolTip$' !Thêm mặt hàng vào hóa đơn����  � ��
 � � ���  � ��
 � � �; �� < �� $= DataGrid��$ SelectedItems.Count�8  > True.a���  � ��$ Cập nhật hóa đơn����  �@�ToolTip$. (Cập nhật mặt hàng vào hóa đơn����  � ��
 ������  � ��
 ������ $��1��$
��Auto��$��25��$��Center=�$��
Làm mới��$��11(�#��[ $1 Làm mới mặt hàng������ *ClearProductCommand+�� $��10��$��5��$
��Auto��$��25��$
��0,15q�$��Right=�$��Xóa khỏi hóa đơn��$��11(�#��[ $1 Xóa khỏi hóa đơn������ *RemoveProductInvoiceCommand+���� $= DataGrid��$ SelectedItems�y��� $= DataGrid��$ SelectedItems.Count�   NotZeroToVisibilityConverter# [ � $��12��$��5��y��� *ProductOptions.Count+# [  �� $��2* ��� $��3* �.+��� $
��Left=�$��DemiBold"� $  MaterialDesignHeadline6TextBlock#��[ $��Tổng Tiền Nhập: ���� $��1��$��Right=�$��DemiBold"�
���  ��#��[ ���� *
TotalPrice+# [
 $ 	PRICELONG��� $��1��$��Stretch=�$��Center=� �� ��  �� �� .+��� $	��120��
��� � �
��� � �$��Tạo hóa đơn��#��[ $'1 !Tạo mới hóa đơn nhập kho������ *AddInvoiceCommand+�� $��1��$	��120��$��
Làm mới��#��[ $1 Làm mới hóa đơn������ *ClearCommand+'  !MaterialDesignThemes.Wpf.Snackbar  $��1��$��1��