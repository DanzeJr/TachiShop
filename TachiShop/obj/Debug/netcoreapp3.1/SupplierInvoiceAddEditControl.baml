   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      U QSystem.Runtime, Version=4.2.2.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a7,clr-namespace:System;assembly=System.RuntimeSystem 5
      E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  5      -    'TachiShop.SupplierInvoiceAddEditControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	      6sys,clr-namespace:System;assembly=System.Runtime  5
      =validationRules'clr-namespace:TachiShop.ValidationRules  5      $
��Auto��5      $
��Auto��5         MaterialDesignPaper#���   5        � DataContext  5      ��   Locator �� Source# [  �� Path$% SupplierInvoiceAddEditViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ Loaded��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *LoadedCommand+5        5   
   $ Unloaded��6   . 5         6$   �� *UnloadedCommand+5       � 	Resources 5      ,   &TachiShop.ValidationRules.BindingProxy 	 Proxy   Data  MaterialDesignTextBox	 �� BasedOn
 �� 
TargetType �� Property �� Value  MaterialDesignComboBox�� 5   
   %  &	       '��      7  '�� n     7    5       69   �� �� 5      8	   "
 ��6E   .�5      ��  � ��$ 0,8,0,8q�6+   5      �� 5      8	   "
 ��6F   .�5       ��  � ��$ Stretch=�68   �� 5!       � ��$ 0,8,0,8q�6+   5"      5#      .��5&      � $
��20,0q�6    � RowDefinitions 5'   
   �� 5(      $��* �6   �� 5)      $	��100 �6   .+�5,   
   �  � ColumnDefinitions 5-      �� 5.      $
��Auto �6#   �� 5/      $	��220 �6#   �� 50      $��10 �6#   �� 51      $��30 �6#   �� 52      $��20 �6#   �� 53      $��* �6#    55      �� 56      $
��Auto �6    �� 57      $
��Auto �6    �� 58      $
��Auto �6    �� 59      $
��Auto �6    �� 5:      $
��Auto �6    �� 5;      $
��Auto �6    �� 5<      $
��Auto �6    �� 5=      $
��Auto �6    �� 5>      $
��Auto �6    �� 5?      $
��Auto �6    �� 5@      $
��Auto �6    �� 5A      $
��Auto �6    �� 5B      $
��Auto �6    .+�5D      �� $��0��5E      $��0��5F      $��6��5G      $��0,0,0,10q�5H       �� Orientation$ 
Horizontal=�5I      .+�5J      �� -   5         ��Name$ TbTitle��5K      $
��Left=�5L      $��DemiBold"�5M       $  MaterialDesignHeadline4TextBlock#��[ 5N      #!Tạo mới hóa đơn nhập kho5P      5Q      &   System.Windows.Controls.DataGrid  5S      -   5          Name$ DataGrid��5T      $��1��5U      $��8��5V      $��5��5W      $
��Auto��5X         AutoGenerateColumns$ False��5Y         CanUserAddRows$ False��5Z         
IsReadOnly$
 True��5[      $
��True��5]      $
��Auto=�5^      $
��Auto=�5_      ��5\      �� *ProductOptions+ �� SelectedItem 5`      �� *SelectedOption+ 5a         CenterRightColumnHeaderStyle & "MaterialDesignDataGridColumnHeader=  7System.Windows.Controls.Primitives.DataGridColumnHeader  CenterRightCellStyle��%,  &	       7  &	 �     �� 5b      8	   "
  5e      .�5f      ��  � ��$ Center=�6E   �� 5g       � ��$ Right=�6G   �� 5h       � ��$	 5,0q�64   5i      �� 5j      "
 ��69   .�5k      ��  � ��$ Center=�6>   �� 5l       � ��$ Right=�6@   5m      5n       5o        5p      $ SelectionChanged��6%   . 5q         60   �� *!DataGridSelectionChangedCommand+5r         Columns 5t      0  *System.Windows.Controls.DataGridTextColumn  5u      ,	  &System.Windows.Controls.DataGridColumn 	  Width5
  /System.Windows.Controls.DataGridLengthConverter$
 Auto
 5v       	  Header$ Tên mặt hàng��5x      1  +System.Windows.Controls.DataGridBoundColumn   Binding 5w      �� *Product.Name+5x        5y      $
 Auto
 5z      $ Trạng thái��5|       5{      �� *Status+ 	 EnumConverter �� 	Converter# [	  �� ConverterParameter$ ProductStatus��5|        5}      $
 Auto
 5~      $ Số lượng��5�       	  SortMemberPath$ OriginStock��5�       5      �� *OriginStock+ 
 DecimalConverter# [
 $
 UNIT��5�        5�      $
 Auto
 5�      $ Đơn vị tính��5�       5�      �� *Unit+# [	 $ PRODUCTUNIT��5�        5�      $
 Auto
 5�      $ Giá nhập��5�      $ SupplyPrice��5�       5�      �� *SupplyPrice+# [
 $ PRICE��5�        5�      $
 Auto
 5�      $ 	Giá bán��5�      $ Price��5�       5�      �� *Price+# [
 $ PRICE��5�        5�      $
 Auto
 5�         ElementStyle# [ 5�      $ Tổng tiền nhập��5�       	  HeaderStyle# [ 5�      $ TotalSupplyPrice��5�       5�      �� *TotalSupplyPrice+# [
 $ PRICE��5�      5�      �� 5�      $��1��5�      $��0��5�      $��16,0,8,0q�5�      $��Center=�5�      $��Ngày nhập��5�      � 5�      $��1��6   $��1��6     5�      �� 5�      $
��1.5* �6'   �� 5�      $��15 �6'   �� 5�      $��1* �6'   .+�5�      (  "System.Windows.Controls.DatePicker  -   5          Name$ DpImportDate��5�      $��25��5�      $��0,0,0,0q�5�      )  #MaterialDesignThemes.Wpf.HintAssist    Hint$  Chọn ngày��5�      
! �� Now"   DisplayDateEnd#" Z! 5�      #   SelectedDate# 5�      �� 5�      $ �� NotifyOnValidationError$
$ True��5�      $ 
ImportDate�5�      % �� UpdateSourceTrigger$% PropertyChanged=�5�      & �� ValidatesOnDataErrors$
& True��5�      ' �� ValidationRules' 5�      6   0TachiShop.ValidationRules.DateTimeValidationRule  5�   "   (   Required$
( True��6I   5  /System.Windows.Controls.ExceptionValidationRule  5�   "   5�      5�      )  #MaterialDesignThemes.Wpf.TimePicker  5�      -   5        )  Name$) TpImportTime��5�      $��2��5�      $��25��5�      $��0,0,0,0q�5�      $  Chọn giờ��5�      *   SelectedTime* 5�      �� 5�      $
$ True��5�      $ 
ImportTime�5�      $% PropertyChanged=�5�      $
& True��5�      ' 5�        5�   "   $
( True��6I   +   RequiredMessage$+ Vui lòng nhập giờ��6Y     5�   "   5�      5�      5�      �� 5�      $��3��5�      $��0��5�      $��	16,20,8,0q�5�      $��Center=�5�      $��Nhà cung cấp��5�      �� 5�      -   5        , ��Name$, 
CbSupplier��5�      $��3��5�      $��1��5�      $��0,20,0,0q�5�      $��Bottom=�5�      $  Chọn nhà cung cấp��5�      - �� DisplayMemberPath$
- Name��5�      . �� SelectedValuePath$. Id��5�      ��5�      �� *	Suppliers+ 5�      �� *SupplierInvoice.Supplier+/ �� SelectedValue/ 5�      �� 5�      $
$ True��5�      $  SupplierInvoice.SupplierId�5�      $% PropertyChanged=�5�      $
& True��5�      ' 5�      2   ,TachiShop.ValidationRules.GuidValidationRule  5�      0   RequiredMessage$&0  Vui lòng chọn nhà cung cấp��6A     5�      5�      5�      �� 5�      $��3��5�      $��3��5�      $��30��5�      $��30��5�      $��Bottom=�5�      
��� � �  MaterialDesignIconButton#���  5�      1 � ToolTip$!1 Tạo mới nhà cung cấp��5�      ��5�      �� *OpenAddSupplierDialogCommand+.��5�      '  !MaterialDesignThemes.Wpf.PackIcon  
�������2   Kind$2 HomeAdd=�6=   5�      �� 5�      $��4��5�      $��0��5�      $��2��5�      $��	16,30,8,0q�5      $��Center=�5     $��15(�5     $��DemiBold"�5     $��Danh sách mặt hàng��5     �� 5     $��5��5     $��0��5     $��16,8,8,0q�5	     $��Center=�5
     $��Mặt hàng��5     �� 5     -   5        $, 	CbProduct��5     $��5��5     $��1��5     $��0,10,0,0q�5     $��Bottom=�5     $  Chọn mặt hàng��5     $
- Name��5     $. Id��5     ��5     �� *
Products+ 5     �� *ProductOption.Product+ 5       5     $ SelectionChanged��6%   . 5        60   �� * ProductSelectionChangedCommand+5     / 5     �� 5     $
$ True��5     $ ProductOption.ProductId�5     $% PropertyChanged=�5      $
& True��5!     ' 5"       5#     $"0 Vui lòng chọn mặt hàng��6A     5%     5'     5)     �� 5*     $��5��5+     $��3��5,     $��30��5-     $��30��5.     $��Bottom=�5/     
��� � �#���  52     $1 Tạo mới mặt hàng��53     ��51     �� *OpenAddProductDialogCommand+.��54       
�������$2 DatabaseAdd=�6=   55     �� 57     $��6��58     $��0��59     $��	16,18,8,0q�5:     $��Center=�5;     $��Trạng thái��5<     �� 5=     -   5        $, CbStatus��5>     $��6��5?     $��1��5@     $��0,20,0,0q�5A     $��Bottom=�5B     $  Chọn trạng thái��5C     $- Value��5D     $	. Key��5F     ��5E     �� *
Statuses+/ 5G     �� 5H     $
$ True��5I     $ ProductOption.Status�5J     $% PropertyChanged=�5K     $
& True��5L     ' 5M     6   0TachiShop.ValidationRules.NotEmptyValidationRule  5N     3   
EmptyValue$3 -1��6E   4   Message$04 *Vui lòng chọn trạng thái mặt hàng��6U     5P     5R     5T     �� 5V     $��7��5W     $��0��5X     $��	16,18,8,0q�5Y     $��Center=�5Z     $��Số lượng��5[     � 5\     $��7��6   $��1��6     5]     �� 5^     $��* �6'   �� 5_     $��10 �6'   �� 5`     $��* �6'   .+�5b     �� -   5        5 ��Name$5 TbOriginStock��5c     $��0,20,0,0q�5d     $  Nhập số lượng��5e     .��6D   ��5f     �� 5g     # [
 5h     $
 UNIT��5i     6 �� Delay$	6 500��5j     $
$ True��5k     $ ProductOption.OriginStock�5l     $% PropertyChanged=�5m     $
& True��5n     ' 5o     5   /TachiShop.ValidationRules.DecimalValidationRule  5p  "   
7   Min7 0.016H   8   RequiredMessage$$8 Vui lòng nhập số lượng��6S   9   Wrapper9 5q  &   .   (TachiShop.ValidationRules.DecimalWrapper  5r  *   :   DecimalPlaces: 6I   �� *Data.ProductOption.Unit+  UnitToDecimalPlaceConverter# [ # [ 5t  #     5v  "   5x     .��5y  $   5z     �� 5{     -	   5        $, CbUnit��5|     $��2��5}     $��0,20,0,0q�5~     $��Center=�5     $  Chọn đơn vị��5�     $- Value��5�     $	. Key��5�     ��5�     �� *Units+/ 5�     �� 5�     $
$ True��5�     $ ProductOption.Unit�5�     $% PropertyChanged=�5�     $
& True��5�     ' 5�       5�  "   $3 -1��6I   $!4 Vui lòng chọn đơn vị��6Y     5�  "   5�     5�     5�     �� 5�     $��8��5�     $��0��5�     $��	16,18,8,0q�5�     $��Center=�5�     $
��Giá��5�     � 5�     $��8��6   $��1��6     5�     �� 5�     $��* �6'   �� 5�     $��10 �6'   �� 5�     $��* �6'   .+�5�     �� -
   5        $5 TbSupplyPrice��5�     $��0,20,0,0q�5�     $  Giá nhập��5�     .��6?   ��5�     �� 5�     # [
 5�     $ PRICE��5�     $	6 500��5�     $
$ True��5�     $ ProductOption.SupplyPrice�5�     $% PropertyChanged=�5�     $
& True��5�     ' 5�       5�  "   7 1006H   $"8 Vui lòng nhập giá nhập��6R     5�  "   5�     .��5�  $   5�     �� 5�     -   5        $5 TbPrice��5�     $��2��5�     $��0,20,0,0q�5�     $  	Giá bán��5�     .��6>   ��5�     �� 5�     # [
 5�     $ PRICE��5�     $	6 500��5�     $
$ True��5�     $ ProductOption.Price�5�     $% PropertyChanged=�5�     $
& True��5�     ' 5�       5�  "   7 1006H   $ 8 Vui lòng nhập giá bán��6R     5�  "   5�     .��5�  $   5�     5�     � 5�     $��10��5�     $��0��5�     $��4��5�     $��	0,30,0,15q�5�      5�     �� 5�     $
��1.7* �6'   �� 5�     .+�5�     �� $	��130��5�     $��25��5�     $��Right=�5�     $��11(�5�     ��5�     �� *AddEditProductInvoiceCommand+ 5�      " MaterialDesignRaisedDarkButton; �� Triggers< �� Binding= �� ElementName  NotZeroConverter> �� Value��%Q  '��       7  7  �� 5�     8	   "
 ��6Z   .�5�     ��  � ��$ Thêm vào hóa đơn��68   �� 5�      �@�ToolTip$' !Thêm mặt hàng vào hóa đơn��68   �� 5�      � ��
 � � �6;   �� 5�      � ��
 � � �6<   ; 5�     �� 5�  "   < 6.   �� $= DataGrid��$ SelectedItems.Count�8  > True6�   .a�5�  &   ��  � ��$ Cập nhật hóa đơn��6@   �� 5�  &    �@�ToolTip$. (Cập nhật mặt hàng vào hóa đơn��6@   �� 5�  &    � ��
 ����6C   �� 5�  &    � ��
 ����6D   5�  #   5�     5�     5�     �� 5�     $��1��5�     $
��Auto��5�     $��25��5�     $��Center=�5�     $��
Làm mới��5�     $��11(�5�     #��[ 5�     $1 Làm mới mặt hàng��5�     ��5�     �� *ClearProductCommand+5�     5�     �� 5�     $��10��5�     $��5��5�     $
��Auto��5�     $��25��5�     $
��0,15q�5�     $��Right=�5�     $��Xóa khỏi hóa đơn��5     $��11(�5     #��[ 5     $1 Xóa khỏi hóa đơn��5     ��5�     �� *RemoveProductInvoiceCommand+��5      �� $= DataGrid��$ SelectedItems�y�5     �� $= DataGrid��$ SelectedItems.Count�   NotZeroToVisibilityConverter# [ � 5     $��12��5     $��5��5	     y�5
     �� *ProductOptions.Count+# [  5     �� 5     $��2* �6'   �� 5     $��3* �6'   .+�5     �� $
��Left=�5     $��DemiBold"�5      $  MaterialDesignHeadline6TextBlock#��[ 5     $��Tổng Tiền Nhập: ��5     �� 5     $��1��5     $��Right=�5     $��DemiBold"�5     
���  ��#��[ 5     ��5     �� *
TotalPrice+# [
 $ 	PRICELONG��5     5     � 5  
   $��1��5      $��Stretch=�5!     $��Center=�5"      5#     �� 5$     �� 5%      5'     �� 5(     �� 5)     .+�5+     �� $	��120��5,     
��� � �
��� � �$��Tạo hóa đơn��50     #��[ 51     $'1 !Tạo mới hóa đơn nhập kho��52     ��5/     �� *AddInvoiceCommand+52     �� 53     $��1��54     $	��120��55     $��
Làm mới��57     #��[ 58     $1 Làm mới hóa đơn��59     ��56     �� *ClearCommand+59     '  !MaterialDesignThemes.Wpf.Snackbar  5:     $��1��6&   $��1��63   5;     5=     5>     