   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      !    TachiShop.InfoDialogControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      )localclr-namespace:TachiShop     5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5      $	��250��5	      $	��500��5
         MaterialDesignPaper#���   5        � 	Resources  5        ReadOnlyTextBoxStyle  MaterialDesignTextBox �� BasedOn �� 
TargetType �� Property �� Value.  (MaterialDesignThemes.Wpf.TextFieldAssist��%�   &	       7  �� 5   
   8   " ��5      .�5      ��  �@��
IsReadOnly$
 True��6+   �� 5       � ��$ 0q�60   �� 5       �@ UnderlineBrush 6N   Z� 5      5      .��5      ]� $��10q�6   .+�5   
   �� $	��Top=�6    �� Orientation$ 
Horizontal=�6*   .+�5      '  !MaterialDesignThemes.Wpf.PackIcon  -   5          Name$ PiIcon��5      $��30��5      $��30��5      $
��Left=�5      $��Center=�5      
������   Kind$ 
InfoCircle=�5      �� 5       -   5         ��Name$ TbTitle��5!      $��Center=�5"       $  MaterialDesignHeadline6TextBlock#��[ 5#      $��Thông báo��5$      5%      � 5&   
   $��20,20,20,10q�6   	 � RowDefinitions	 5'      �� 5(      $
��Auto �6    �� 5)      $��20 �6    �� 5*      $
��Auto �6    .+�5,      �� -   5        
 ��Name$
 	TbMessage��5-      $��0��5.      $	��400��5/       �� AcceptsReturn$
 True��50      #��[ 51      $��Thông báo cái nhẹ��52       �� TextWrapping$
 Wrap=�53      �� 54      -   5         ��Name$
 BtOk��55      $��2��56      $��Center=�57      )  #MaterialDesignThemes.Wpf.DialogHost   CloseDialogCommand#��Z 58      $��OK��59       " MaterialDesignRaisedDarkButton#��[ 5:      5;      5<      5=      