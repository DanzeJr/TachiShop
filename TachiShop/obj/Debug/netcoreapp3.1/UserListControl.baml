   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5          TachiShop.UserListControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	         MaterialDesignPaper#���   5
        � DataContext  5      ��   Locator �� Source# [  �� Path$ UserListViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ Loaded��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *LoadedCommand+5       � 	Resources 5        MaterialDesignTextBox �� BasedOn	 �� 
TargetType
 �� Property �� Value  MaterialDesignComboBox�� 5   
   %�   '��       7  '�� R     7  �� 5      8   "	 ��6E   .�5      �� 
 � ��$ 0,8,0,8q�6+   5      �� 5      8   "	 ��6F   .�5      �� 
 � ��$ Stretch=�68   �� 5      
 � ��$ 0,8,0,8q�6+   5      5      .��5      � $
��20,0q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5       $��* �6   .+�5"   
   � $��0��6    � ColumnDefinitions 5#      �� 5$      �� 5%      .+�5'      �� $
��Left=�5(      $��DemiBold"�5)       $  MaterialDesignHeadline4TextBlock#��[ 5*      $��Danh sách nhân viên��5+      �� 5,      $��1��5-      $��40��5.      $��40��5/      $��0q�50      $��Right=�51      $��Center=�52      
��� � �
������   MaterialDesignRaisedButton#���  56       � ToolTip$ Tạo mới hóa đơn��57      ��55      �� *ViewAddCommand+.��58      '  !MaterialDesignThemes.Wpf.PackIcon  $��40��59      $��40��5:      $��Center=�5;      $��Center=�5<      
�������   Kind$	 Add=�5>      5?      5@      &   System.Windows.Controls.DataGrid  5A   
   $��1��5B      $
��Auto��5C      $��Stretch=�5D         AutoGenerateColumns$ False��5E         CanUserAddRows$ False��5F         
IsReadOnly$
 True��5G      $
��True��5I      $
��Auto=�5J      $
��Auto=�5K      ��5H      �� *Users+ 5L        CenterCellStyle��%V   &	       �� 5M      "	 ��60   .�5N      �� 
 � ��$ Center=�6:   5O      5P         Columns 5Q      0  *System.Windows.Controls.DataGridTextColumn  5R      ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$
 Auto	 5S      1
  +System.Windows.Controls.DataGridBoundColumn 
  ElementStyle# [ 5U         Header$ Tài khoản��5V       
  Binding 5T      �� *
UserName+5V        5W      $
 Auto	 5X      # [ 5Z      $ Tên nhân viên��5[       5Y      �� *
FullName+5[        5\      $
 Auto	 5]      # [ 5_      $ Giới tính��5`       5^      �� *Gender+  EnumConverter �� 	Converter# [  �� ConverterParameter$ GENDER��5`        5a      $
 Auto	 5b      # [ 5d      $ 
Ngày sinh��5e         SortMemberPath$ 	BirthDate��5f       5c      �� *	BirthDate+ �� StringFormat$ {0:dd/MM/yyyy}��5f        5g      $
 Auto	 5h      # [ 5j      $ Email��5k       5i      �� *Email+5k        5l      $
 Auto	 5m      # [ 5o      $ Điện thoại��5p       5n      �� *PhoneNumber+5p        5q      $
 Auto	 5r      # [ 5t      $ Ngày tạo��5u      $ CreatedDate��5v       5s      �� *CreatedDate+$ {0:dd/MM/yyyy HH:mm:ss}��5v      4  .System.Windows.Controls.DataGridTemplateColumn  5w      $
 Auto	 6)      CellTemplate 5x      �� 5y      .R�5z      ��  �� Orientation$ 
Horizontal=�6)   .+�5{   "   �� $��20��5|   %   
������ & "MaterialDesignIconForegroundButton#���  5�   %   $ Sửa��5�   %   ��5}   %   �� *DataContext.ViewEditCommand+ �� RelativeSource �� *FindAncestor+ �� AncestorType" >���5~   %   �� *DataContext.Id+ �� *FindAncestor+)  #System.Windows.Controls.DataGridRow"  .��5�   &     $��20��6>   $
 Edit=�6J   5�   #   �� 5�   "   $��20��5�   %   
����  �#���  5�   %   $ Xem chi tiết��5�   %   ��5�   %   �� * DataContext.ViewDetailsCommand+ �� *FindAncestor+" >���5�   %   �� *DataContext.Id+ �� *FindAncestor+"  .��5�   &     $��20��6>   $ Forward=�6J   5�   #   5�      5�      5�      5�      5�      5�      