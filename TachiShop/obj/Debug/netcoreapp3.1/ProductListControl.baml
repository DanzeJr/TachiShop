   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      "    TachiShop.ProductListControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	      $
��auto��5
      $
��auto��5         MaterialDesignPaper#���   5        � DataContext  5      ��   Locator �� Source# [  �� Path$ ProductListViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
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
   � $��0��6    � ColumnDefinitions 5(      �� 5)      �� 5*      .+�5,      �� -   5         ��Name$ TbTitle��5-      $
��Left=�5.      $��DemiBold"�5/       $  MaterialDesignHeadline4TextBlock#��[ 50      Danh sách mặt hàng52      �� 53      $��1��54      $��40��55      $��40��56      $��0q�57      $��Right=�58      $��Center=�59      
��� � �
������   MaterialDesignRaisedButton#���  5=       � ToolTip$ Tạo mới hàng hóa��5>      ��5<      �� *OpenAddEditDialogCommand+.��5?      '  !MaterialDesignThemes.Wpf.PackIcon  $��40��5@      $��40��5A      $��Center=�5B      $��Center=�5C      
�������   Kind$	 Add=�5E      5F      5G      &   System.Windows.Controls.DataGrid  5H   
   $��1��5I      $
��Auto��5J      $��Stretch=�5K         AutoGenerateColumns$ False��5L         CanUserAddRows$ False��5M         
IsReadOnly$
 True��5N      $
��True��5P      $
��Auto=�5Q      $
��Auto=�5R      ��5O      �� *
Products+ 5S        CenterCellStyle��%V   &	       �� 5T      "	 ��60   .�5U      �� 
 � ��$ Center=�6:   5V      5W         Columns 5X      0  *System.Windows.Controls.DataGridTextColumn  5Y      ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$
 Auto	 5Z      1
  +System.Windows.Controls.DataGridBoundColumn 
  ElementStyle# [ 5\         Header$ Tên mặt hàng��5]       
  Binding 5[      �� *Name+5]        5^      $
 Auto	 5_      # [ 5a      $ Trạng thái��5b       5`      �� *Status+  EnumConverter �� 	Converter# [  �� ConverterParameter$ ProductStatus��5b        5c      $
 Auto	 5d      # [ 5f      $ Tổng lượng nhập��5g         SortMemberPath$ TotalOriginStock��5h       5e      �� *ProductOptions+  CollectionConverter# [ $ ProductOriginStock��5h        5i      $
 Auto	 5j      # [ 5l      $ 	Tồn kho��5m      $ 
TotalStock��5n       5k      �� *ProductOptions+# [ $ ProductStock��5n        5o      $
 Auto	 5p         MaxWidth$	 250Q�5q      $ 
Danh mục��5s       5r      �� *
Categories+# [ $ ProductCategories�� 5t      �� 5u      "	 ��6    .�5v      �� 
 � ��$
 Wrap=�6=   5w      5y        5z      $
 Auto	 5{      # [ 5}      $ Ngày tạo��5~      $ CreatedDate��5       5|      �� *CreatedDate+ �� StringFormat$ {0:dd/MM/yyyy HH:mm:ss}��5        5�      $
 Auto	 5�      # [ 5�      $ Ngày cập nhật��5�      $ ModifiedDate��5�       5�      �� *ModifiedDate+$ {0:dd/MM/yyyy HH:mm:ss}��5�      4  .System.Windows.Controls.DataGridTemplateColumn  5�      $
 Auto	 6)      CellTemplate 5�      �� 5�      .R�5�      ��  �� Orientation$ 
Horizontal=�6)   .+�5�   "   �� $��20��5�   %   
������ &	 "MaterialDesignIconForegroundButton#��� 	 5�   %   $ Sửa��5�   %   ��5�   %   �� *&$DataContext.OpenAddEditDialogCommand+  �� RelativeSource  �� *FindAncestor+! �� AncestorType"! >���5�   %   �� *DataContext.Id+  �� *FindAncestor+)  #System.Windows.Controls.DataGridRow"!  .��5�   &     $��20��6>   $
 Edit=�6J   5�   #   �� 5�   "   $��20��5�   %   
����  �#��� 	 5�   %   $ Xem chi tiết��5�   %   ��5�   %   �� * DataContext.ViewDetailsCommand+  �� *FindAncestor+"! >���5�   %   �� *DataContext.Id+  �� *FindAncestor+"!  .��5�   &     $��20��6>   $ Forward=�6J   5�   #   5�      5�      5�      5�      5�      5�      