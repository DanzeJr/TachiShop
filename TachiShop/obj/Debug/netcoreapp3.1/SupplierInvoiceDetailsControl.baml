   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      -    'TachiShop.SupplierInvoiceDetailsControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	         MaterialDesignPaper#���   5
        � DataContext  5      ��   Locator �� Source# [  �� Path$% SupplierInvoiceDetailsViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ Loaded��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *LoadedCommand+5        5   
   $ Unloaded��6   . 5         6$   �� *UnloadedCommand+5       � 	Resources 5        MaterialDesignTextBox �� BasedOn	 �� 
TargetType
 �� Property �� Value  MaterialDesignComboBox�� 5   
   %�   '��       7  '�� R     7  �� 5      8   "	 ��6E   .�5      �� 
 � ��$ 0,8,0,8q�6+   5      �� 5      8   "	 ��6F   .�5      �� 
 � ��$ Stretch=�68   �� 5      
 � ��$ 0,8,0,8q�6+   5      5      .��5!      � $��
20,0,20,20q�6    � ColumnDefinitions 5"   
   �� 5#      $
��Auto �6   �� 5$      $��15 �6   �� 5%      $
��Auto �6   �� 5&      $��* �6    � RowDefinitions 5(   
   �� 5)      $
��Auto �6   �� 5*      $
��Auto �6   �� 5+      $
��Auto �6   �� 5,      $
��Auto �6   �� 5-      $
��Auto �6   �� 5.      $
��Auto �6   �� 5/      $
��Auto �6   �� 50      $��* �6   �� 51      $
��Auto �6   �� 52      $
��Auto �6   �� 53      $
��Auto �6   �� 54      $
��Auto �6   �� 55      $
��Auto �6   .+�57   
   �� $��0��58      $��0��59      $��4��5:      $��0,0,0,10q�5;       �� Orientation$ 
Horizontal=�5<      .+�5=      �� $
��Left=�5>      $��DemiBold"�5?       $  MaterialDesignHeadline4TextBlock#��[ 5@      $&�� Chi tiết hóa đơn nhập kho��5A      5B      �� 5D   
   $��1��5E      $��0��5F      $
��0,10q�5G      $��Center=�5H      $��DemiBold"�5I      $��Ngày nhập: ��5J      �� 5K   
   $��1��5L      $��2��5M      $��Center=�5N      ��5O      �� *SupplierInvoice.ImportDate+ �� StringFormat$ {0:dd/MM/yyyy HH:mm:ss}���� 5Q   
   $��2��5R      $��0��5S      $
��0,10q�5T      $��Center=�5U      $��DemiBold"�5V      $��Khách hàng: ��5W      �� 5X   
   $��2��5Y      $��2��5Z      $��Center=�5[      ��5\      �� *'%SupplierInvoice.Supplier.DisplayValue+�� 5^   
   $��3��5_      $��0��5`      $��	0,10,0,20q�5a      $��Center=�5b      $��DemiBold"�5c      $��Nhân viên: ��5d      �� 5e   
   $��3��5f      $��2��5g      $��	0,10,0,20q�5h      $��Center=�5i      ��5j      �� *+)SupplierInvoice.CreatingUser.DisplayValue+�� 5l   
   $��5��5m      $��0��5n      $��4��5o      �� 5q   
   $��6��5r      $��0��5s      $��4��5t      $
��0,10q�5u      $��Center=�5v      $��15(�5w      $��DemiBold"�5x      $��Danh sách mặt hàng��5y      &   System.Windows.Controls.DataGrid  5|   
   -   5          Name$ DataGrid��5}      $��7��5~      $��0��5      $��4��5�      $
��Auto��5�         AutoGenerateColumns$ False��5�         CanUserAddRows$ False��5�         
IsReadOnly$
 True��5�      $
��True��5�      $
��Auto=�5�      $
��Auto=�5�      ��5�      �� * SupplierInvoice.ProductOptions+ 5�         CenterRightColumnHeaderStyle & "MaterialDesignDataGridColumnHeader=  7System.Windows.Controls.Primitives.DataGridColumnHeader  CenterRightCellStyle��%,  &	       7  &	 �     �� 5�      8   "	  5�      .�5�      �� 
 � ��$ Center=�6A   �� 5�      
 � ��$ Right=�6C   �� 5�      
 � ��$	 5,0q�60   5�      �� 5�      "	 ��65   .�5�      �� 
 � ��$ Center=�6:   �� 5�      
 � ��$ Right=�6<   5�      5�         Columns 5�      0  *System.Windows.Controls.DataGridTextColumn  5�      ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$
 Auto	 5�         Header$ Tên mặt hàng��5�      1
  +System.Windows.Controls.DataGridBoundColumn 
  Binding 5�      �� *Product.Name+5�        5�      $
 Auto	 5�      $ Trạng thái��5�       5�      �� *Status+  EnumConverter �� 	Converter# [  �� ConverterParameter$ ProductStatus��5�        5�      $
 Auto	 5�      $ Số lượng��5�         SortMemberPath$ OriginStock��5�       5�      �� *OriginStock+ 	 DecimalConverter# [	 $
 UNIT��5�        5�      $
 Auto	 5�      $ Đơn vị tính��5�       5�      �� *Unit+# [ $ PRODUCTUNIT��5�        5�      $
 Auto	 5�      $ Giá nhập��5�      $ SupplyPrice��5�       5�      �� *SupplyPrice+# [	 $ PRICE��5�        5�      $
 Auto	 5�      $ 	Giá bán��5�      $ Price��5�       5�      �� *Price+# [	 $ PRICE��5�        5�      $
 Auto	 5�       
  ElementStyle# [ 5�      $ Tổng tiền nhập��5�         HeaderStyle# [ 5�      $ TotalSupplyPrice��5�       5�      �� *TotalSupplyPrice+# [	 $ PRICE��5�      4  .System.Windows.Controls.DataGridTemplateColumn  5�      $
 Auto	 6)      CellTemplate 5�      �� 5�      .R�5�      �� $��20��5�   !   
������ &
 "MaterialDesignIconForegroundButton#��� 
 5�   !    � ToolTip$ Cập nhật��5�   !   ��5�   !   �� *#!DataContext.OpenEditDialogCommand+ �� RelativeSource �� *FindAncestor+  �� AncestorType"  >���5�   !   �� *DataContext.Id+ �� *FindAncestor+)  #System.Windows.Controls.DataGridRow"   .��5�   "   '  !MaterialDesignThemes.Wpf.PackIcon  $��20��6:   !   Kind$
! Edit=�6F   5�      5�      5�      5�      � 5�   
   $��8��5�      $��0��5�      $
��0,10q�5�      $��4��5�       5�      �� 5�      $��* �6#   �� 5�      $��20 �6#   �� 5�      $
��Auto �6#   .+�5�      �� $��Right=�5�      $��DemiBold"�5�       $  MaterialDesignHeadline6TextBlock#��[ 5�      $��Tổng Tiền: ��5�      �� 5�      $��2��5�      $��Right=�5�      $��DemiBold"�5�      
���  ��#��[ 5�      ��5�      �� *SupplierInvoice.TotalPrice+# [	 $ 	PRICELONG��5�      5�      5�      