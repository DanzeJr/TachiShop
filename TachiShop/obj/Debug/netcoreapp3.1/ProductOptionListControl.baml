   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      (    "TachiShop.ProductOptionListControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	      $
��auto��5
      $
��auto��5         MaterialDesignPaper#���   5        � DataContext  5      ��   Locator �� Source# [  �� Path$  ProductOptionListViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ Loaded��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *LoadedCommand+5        5   
   $ Unloaded��6   . 5         6$   �� *UnloadedCommand+5       � 	Resources 5        MaterialDesignTextBox �� BasedOn	 �� 
TargetType
 �� Property �� Value  MaterialDesignComboBox�� 5   
   %�   '��       7  '�� R     7  �� 5      8   "	 ��6E   .�5      �� 
 � ��$ 0,8,0,8q�6+   5      �� 5      8   "	 ��6F   .�5      �� 
 � ��$ Stretch=�68   �� 5      
 � ��$ 0,8,0,8q�6+   5      5       .��5"      � $
��20,0q�6    � RowDefinitions 5#   
   �� 5$      $
��Auto �6   �� 5%      $��* �6   .+�5'   
   ��  �� Orientation$ 
Horizontal=�6   .+�5(      �� -   5         ��Name$ TbTitle��5)      $
��Left=�5*      $��DemiBold"�5+       $  MaterialDesignHeadline4TextBlock#��[ 5,      $��Danh sách chi tiết��5-      5.      &   System.Windows.Controls.DataGrid  5/   
   -   5          Name$ DataGrid��50      $��1��51      $��0��52      $
��Auto��53      $��Stretch=�54         AutoGenerateColumns$ False��55         CanUserAddRows$ False��56         
IsReadOnly$
 True��57      $
��True��59      $
��Auto=�5:      $
��Auto=�5;      ��58      �� *ProductOptions+   Columns 5<      0  *System.Windows.Controls.DataGridTextColumn  5=      ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$
 Auto 5>         Header$ Ngày nhập��5@         SortMemberPath$ CreatedDate��5A      1	  +System.Windows.Controls.DataGridBoundColumn 	  Binding 5?      �� *CreatedDate+ �� StringFormat$ {0:dd/MM/yyyy HH:mm:ss}��5A        5B      $
 Auto 5C      $ Trạng thái��5E       5D      �� *Status+  EnumConverter �� 	Converter# [  �� ConverterParameter$ ProductStatus��5E        5F      $
 Auto 5G      $ Số lượng nhập��5I       5H      �� *OriginStock+  DecimalConverter# [ $
 UNIT��5I        5J      $
 Auto 5K      $ 	Tồn kho��5M       5L      �� *Stock+# [ $
 UNIT��5M        5N      $
 Auto 5O      $ Đơn vị tính��5Q       5P      �� *Unit+# [ $ ProductUnit��5Q        5R      $
 Auto 5S      $ Giá nhập��5U       5T      �� *SupplyPrice+# [ $ PRICE��5U        5V      $
 Auto 5W      $ 	Giá bán��5Y       5X      �� *Price+# [ $ PRICE��5Y        5Z      $
 Auto 5[      $ Ngày cập nhật��5]      $ ModifiedDate��5^       5\      �� *ModifiedDate+$ {0:dd/MM/yyyy HH:mm:ss}��5^      4
  .System.Windows.Controls.DataGridTemplateColumn
  5_      $
 Auto 6)    
  CellTemplate 5`      �� 5a      .R�5b      �� $ 
Horizontal=�6)   .+�5c   "   �� $��20��5d   %   
������ & "MaterialDesignIconForegroundButton#���  5h   %    � ToolTip$ Cập nhật��5i   %   ��5e   %   �� *#!DataContext.OpenEditDialogCommand+ �� RelativeSource �� *FindAncestor+ �� AncestorType" >���5f   %   �� *DataContext.Id+ �� *FindAncestor+)  #System.Windows.Controls.DataGridRow"  .��5j   &   '  !MaterialDesignThemes.Wpf.PackIcon  $��20��6>      Kind$
 Edit=�6J   5k   #   5l      5m      5o      5q      5r      5s      