   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      #    TachiShop.CustomerListControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	         MaterialDesignPaper#���   5
        � DataContext  5      ��   Locator �� Source# [  �� Path$ CustomerListViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ Loaded��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *LoadedCommand+5        5   
   $ Unloaded��6   . 5         6$   �� *UnloadedCommand+5       � 	Resources 5        MaterialDesignTextBox �� BasedOn	 �� 
TargetType
 �� Property �� Value  MaterialDesignComboBox�� 5   
   %�   '��       7  '�� R     7  �� 5      8   "	 ��6E   .�5      �� 
 � ��$ 0,8,0,8q�6+   5      �� 5      8   "	 ��6F   .�5      �� 
 � ��$ Stretch=�68   �� 5      
 � ��$ 0,8,0,8q�6+   5      5      .��5       � $
��20,0q�6    � RowDefinitions 5!   
   �� 5"      $
��Auto �6   �� 5#      $��* �6   .+�5%   
   � $��0��6    � ColumnDefinitions 5&      �� 5'      �� 5(      .+�5*      �� $
��Left=�5+      $��DemiBold"�5,       $  MaterialDesignHeadline4TextBlock#��[ 5-      $��Danh sách khách hàng��5.      �� 5/      $��1��50      $��40��51      $��40��52      $��0q�53      $��Right=�54      $��Center=�55      
��� � �
������   MaterialDesignRaisedButton#���  59       � ToolTip$ Tạo mới hóa đơn��5:      ��58      �� *OpenAddEditDialogCommand+.��5;      '  !MaterialDesignThemes.Wpf.PackIcon  $��40��5<      $��40��5=      $��Center=�5>      $��Center=�5?      
�������   Kind$	 Add=�5A      5B      5C      &   System.Windows.Controls.DataGrid  5D   
   $��1��5E      $
��Auto��5F      $��Stretch=�5G         AutoGenerateColumns$ False��5H         CanUserAddRows$ False��5I         
IsReadOnly$
 True��5J      $
��True��5L      $
��Auto=�5M      $
��Auto=�5N      ��5K      �� *	Customers+ 5O        CenterCellStyle��%V   &	       �� 5P      "	 ��60   .�5Q      �� 
 � ��$ Center=�6:   5R      5S         Columns 5T      0  *System.Windows.Controls.DataGridTextColumn  5U      ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$
 Auto	 5V      1
  +System.Windows.Controls.DataGridBoundColumn 
  ElementStyle# [ 5X         Header$ Tên khác hàng��5Y       
  Binding 5W      �� *
FullName+5Y        5Z      $
 Auto	 5[      # [ 5]      $ Giới tính��5^       5\      �� *Gender+  EnumConverter �� 	Converter# [  �� ConverterParameter$ GENDER��5^        5_      $
 Auto	 5`      # [ 5b      $ 
Ngày sinh��5c         SortMemberPath$ 	BirthDate��5d       5a      �� *	BirthDate+ �� StringFormat$ 
dd/MM/yyyy��5d        5e      $
 Auto	 5f      # [ 5h      $ Điện thoại��5i       5g      �� *PhoneNumber+5i        5j      $
 Auto	 5k         MaxWidth$	 300Q�5l      $ Địa chỉ��5n       5m      �� *	Address+ 5o      �� 5p      "	 ��6    .�5q      �� 
 � ��$
 Wrap=�6=   5r      5t      4  .System.Windows.Controls.DataGridTemplateColumn  5u      $
 Auto	 6)      CellTemplate 5v      �� 5w      .R�5x      ��  �� Orientation$ 
Horizontal=�6)   .+�5y   "   �� $��20��5z   %   
������ & "MaterialDesignIconForegroundButton#���  5~   %   $ Sửa��5   %   ��5{   %   �� *&$DataContext.OpenAddEditDialogCommand+ �� RelativeSource �� *FindAncestor+  �� AncestorType"  >���5|   %   �� *DataContext.Id+ �� *FindAncestor+)  #System.Windows.Controls.DataGridRow"   .��5�   &     $��20��6>   $
 Edit=�6J   5�   #   5�      5�      5�      5�      5�      5�      