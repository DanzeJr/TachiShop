   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      #    TachiShop.MultiSelectComboBox   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      )localclr-namespace:TachiShop     5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5        � 	Resources  5
         MultiSelectComboBoxTemplate �� 
TargetType �Name J� SnapsToDevicePixels6  0MaterialDesignThemes.Wpf.BottomDashedLineAdorner   Brush   	Thickness   
IsAttached �� RelativeSource  NotConverter �� 	Converter	 � ColumnDefinitions
 d�Name & "MaterialDesignComboBoxToggleButton d� 	IsChecked �� Mode � UseLayoutRounding J� Opacity �� Path ��Name# �� SelectionBoxItemStringFormat �� ContentStringFormat �� SelectionBoxItemTemplate J� IsHitTestVisible ��Name ) %MaterialDesignComboBoxEditableTextBox �� 
IsReadOnly �� 
CaretBrush(  "MaterialDesignThemes.Wpf.SmartHint  Name)  #MaterialDesignThemes.Wpf.HintAssist   Hint   Hint   	HintProxyB  <MaterialDesignThemes.Wpf.Converters.HintProxyFabricConverter   Instance   UseFloating   FloatingScale   FloatingOffset    HintOpacity! �� Orientation" ��Name  MaterialDesignToolButton  ClearTextConverter# `� 	Converter$ �� ElementName'  !MaterialDesignThemes.Wpf.PackIcon%   Kind(  "MaterialDesignThemes.Wpf.Underline&  Name.  (MaterialDesignThemes.Wpf.TextFieldAssist'   UnderlineBrush(   IsActive
) �� Top,  &MaterialDesignThemes.Wpf.ComboBoxPopup*  Name+ � AllowsTransparency, � HorizontalOffset- � VerticalOffset.   DefaultVerticalOffset/   DownVerticalOffset0   UpVerticalOffset1   CornerRadius2   ContentMargin  MaterialDesignPaper
3 � Tag  PopupContentUpTemplate4   UpContentTemplate  PopupContentDownTemplate5   DownContentTemplate 	 PopupContentClassicTemplate6   ClassicContentTemplate7 � PlacementTarget8   ContentMinWidth 
 MathAddConverter9 �� ConverterParameter.	  (MaterialDesignThemes.Wpf.ColorZoneAssist: 	  Mode;   ClassicMode<   
Background  FallbackBrushConverter= �� MaxDropDownHeight> ��Name-
  'System.Windows.Input.KeyboardNavigation? 
  DirectionalNavigation@ �� TriggersA P� 
SourceNameB P� PropertyC P� Value # MaterialDesignComboBoxItemStyleD �� ValueE �� PropertyF �� 
TargetNameG ]� 
ConditionsH �� PropertyI �� ValueJ �� 
SourceName  ValidationErrorBrush  RemoveAlphaBrushConverter  MaterialDesignBody  PrimaryHueLightBrush " PrimaryHueLightForegroundBrush  PrimaryHueMidBrush   PrimaryHueMidForegroundBrush  PrimaryHueDarkBrush ! PrimaryHueDarkForegroundBrush  SecondaryAccentBrush " SecondaryAccentForegroundBrush ! MaterialDesignLightBackground ! MaterialDesignLightForeground   MaterialDesignDarkBackground   MaterialDesignDarkForeground  MultiSelectComboBoxK �� 
TargetType  MaterialDesignTextBoxBorderL �� AncestorType ) %MaterialDesignValidationErrorTemplateM �� Triggers-  'MaterialDesignThemes.Wpf.ComboBoxAssist  	TrueValue��%�2  &	        7  7  7  7  7  7  7  7 	 7 
 7  7  7  7  7  7  7  7  7  7  &	 ',    7  7  7   7  7  7  �� 5   
   " ��6>   .R�5      � $ templateRoot��6   #��z��5      $
 True��5      .+�5      �� .u�5      � $ 	InnerRoot��6   # z��5      # z��5       5      �� *	IsEnabled+ �� *Self+8   	 5      �� 5      $��* �6/   �� 5      $��0 �6/   #��� r�69   .+�5      d� $
 toggleButton��6'   $��2��5   !   #��z��5   !   #��z��5   !   #��z��5   !   8��  5   !   �� *IsDropDownOpen+$ TwoWay=� �� *TemplatedParent+5   !   � 5      #��z��6   #��z��5       #��z��5!      # z 5"      # z 5#      	 5$      �� 5%   "   $
��Auto �63   �� 5&   "   $��* �63   �� 5'   "   $
��Auto �63   .+�5)      �� $��0��5*   !   #��z��5+   !    5,   !   �� $- '(materialDesign:HintAssist.HintOpacity)� �� *TemplatedParent+� 5-      $ 	InputRoot��6#   $��1��66   $��Stretch=�5.   #   $��Stretch=�6A   .+�5/   "   �� $ contentPresenter��63   # z 51   -   #��z 52   -   #��z��53   -   $ False��54   -   ��50   -   �� $
 Text� �� *TemplatedParent+54   -   �� 55   "   $ PART_EditableTextBox��6*   $��Stretch=�57   $   $��Stretch=�58   $   8�� $y�	Collapsed=�5;   $    56   $   �� *
IsReadOnly+ �� *TemplatedParent+ 5:   $   ��  �� *TemplatedParent+$ BorderBrush�5;   $     5=   "   $
 Hint��6;   #��z��5?   *   # z 5@   *   # z 5A   *   # z 5F   *    5>   *   ��  �� *TemplatedParent+# Z  5B   *   �� $, &(materialDesign:HintAssist.IsFloating)� �� *TemplatedParent+ 5C   *   �� $/ )(materialDesign:HintAssist.FloatingScale)� �� *TemplatedParent+ 5D   *   �� $0 *(materialDesign:HintAssist.FloatingOffset)� �� *TemplatedParent+  5E   *   �� $- '(materialDesign:HintAssist.HintOpacity)� �� *TemplatedParent+5F   *   5G      �� 5H      $! 
Horizontal=�6)   $��2��6B   $	��Top=�6R   .+�5I   "   �� #��z��5J       5K      �� $- '(materialDesign:HintAssist.HintOpacity)� �� *TemplatedParent+��5L      �� $1 +(materialDesign:TextFieldAssist.SuffixText)� �� *TemplatedParent+�� 5N   "   $" PART_ClearButton��6)   $
��Auto��6C   $��2,0,-6,0q�6Q   #���  6d   $|�False��6�   y�5O   &   `� 5P   *   8#  .1�5Q   .   �� $
$ Hint��66   $ IsContentNullOrEmpty�6I   8  6e   �� 5R   .   $5 /(materialDesign:TextFieldAssist.HasClearButton)�66    6m   �� *TemplatedParent+5S   +   .��5U   &     $��0q�6>   $% CloseCircle=�6I   5V   #   5W      5X        5Y      $& 	Underline��63   $��2��5Z   "   ' 5[   "   �� $5 /(materialDesign:TextFieldAssist.UnderlineBrush)� �� *TemplatedParent+( 5\   "   �� $$ PART_EditableTextBox��$ IsKeyboardFocused�y�5]   "   �� $; 5(materialDesign:TextFieldAssist.DecorationVisibility)� �� *TemplatedParent+��5^   "   �� $5 /(materialDesign:TextFieldAssist.UnderlineBrush)� �� *TemplatedParent+�� 5_      $��0��6!   $��Bottom=�61   .+�5`      �� $) 2��6(   $��10(�67   ��6E   �� *ActualWidth+$$ toggleButton�� 5a   "   �� $- '(materialDesign:HintAssist.HintOpacity)� �� *TemplatedParent+��5b   "   �� $, &(materialDesign:HintAssist.HelperText)� �� *TemplatedParent+5c        5e      $* 
PART_Popup��67   $��0��5f   &   $
+ True��5g   &   $|�False��5h   &   $, -11.5��5i   &   $
 True��5l   &   $
 True��5m   &   $��Custom=�5n   &   $
��Fade=�5o   &   $- 0��5p   &   $. 5Q�5q   &   $/ -15.5Q�5r   &   $0 15Q�5s   &   $1 2��5t   &   $2 6q�5u   &   #3 �  5x   &   84  85  86  ��5j   &   �� *IsDropDownOpen+$ TwoWay=� �� *TemplatedParent+7 5k   &   �� $$ templateRoot��8 5v   &   �� $$ templateRoot��$ ActualWidth�8  $9 32��: 5w   &   �� $+ %(materialDesign:ColorZoneAssist.Mode)� �� *TemplatedParent+; 5y   &   �� $1 +(materialDesign:ComboBoxAssist.ClassicMode)� �� *TemplatedParent+< 5}      `� 5~   "   8# 	 .1�5   &   �� $ 
Background�6.    6@   �� *TemplatedParent+�� 5�   &   $	 Tag�6.   $$ 
PART_Popup��69   5�   #   .��5�      �� .��5�   "   �� #��z= 6/   $��1��5�   )   ��5�   )   �� *
Background+$$ 
PART_Popup��.��5�   &   �� $> ItemsPresenter��65   $? 	Contained=�6M   5�   #   5�      5�      5�      5�      5�      @ 5�      P� 5�      $A 
PART_Popup��6   B �@ PopupPlacement$C Classic=�6L   . �5�      �� 8D 
 E � ��6;   5�      P� 5�      $A 
PART_Popup��6   B � ��$
C True��6D   . �5�      �� $F templateRoot��63   D 6M   �� *
Background+$$ 
PART_Popup��E � ��5�      P� 5�      B � {�$C False��6/   . �5�      �� $F templateRoot��6   E �@J�Opacity$
D 0.56Q�6J   �� 5�      $F toggleButton��6   E � ��
D ���� 6N   5�      P� 5�      B �@��
IsEditable$
C True��60   . �5�      �� $F PART_EditableTextBox��6   E � y�$D Visible=�6U   �� 5�      $F 	Underline��6   D 6J   �� $; 5(materialDesign:TextFieldAssist.DecorationVisibility)� �� *TemplatedParent+E � y��� 5�      $F contentPresenter��6   E � y�$D 	Collapsed=�6Q   5�      P� 5�      B �@ 
IsFloating$
C True��6J   . �5�      �� $F 	InnerRoot��6   E � ��$D 
0 11.5 0 0q�6F   5�      ]� 5�      G 5�      �� 5�      H �@��
IsEditable$I False��6:   �� 5�      H �@��IsDropDownOpen$
I True��6>   ./�5�      �� $F 	Underline��6   E � y�$D Hidden=�6J   �� 5�      $F toggleButton��6   E � ��
D ���� 6N   5�      ]� 5�      G 5�      �� 5�      $
J Hint��6$   H �@ IsContentNullOrEmpty$I False��6V   �� 5�      H �@ 
IsFloating$
I True��6T   �� 5�      H �@J�IsKeyboardFocusWithin$
I True��6E   ./�5�      �� $
F Hint��6   D 6E   �� $, &(materialDesign:HintAssist.Foreground)� �� *TemplatedParent+E � ���� 5�      $
F Hint��6   E �@ HintOpacity$D 1Q�6F   5�      ]� 5�      G 5�      �� 5�      H �@ 
IsFloating$
I True��6T   �� 5�      $
J Hint��6$    H �@ IsHintInFloatingPosition$
I True��6Z   �� 5�      H �@J�IsKeyboardFocusWithin$
I True��6E   ./�5�      �� $
F Hint��6   D 6E   �� $, &(materialDesign:HintAssist.Foreground)� �� *TemplatedParent+E � ���� 5�      $
F Hint��6   E �@ HintOpacity$D 1Q�6F   5�      ]� 5�      G 5�      �� 5�      $
J Hint��6$   H �@ IsContentNullOrEmpty$I False��6V   �� 5�      $J PART_EditableTextBox��6$   H �@J�IsKeyboardFocused$
I True��6c   ./�5�      �� $
F Hint��6   D 6E   �� $, &(materialDesign:HintAssist.Foreground)� �� *TemplatedParent+E � ���� 5�      $
F Hint��6   E �@ HintOpacity$D 1Q�6F   5�      ]� 5�      G 5�      �� 5�      $
J Hint��6$   H �@ IsContentNullOrEmpty$I False��6V   �� 5�      H �@��IsDropDownOpen$
I True��6>   ./�5�      �� $
F Hint��6   D 6E   �� $, &(materialDesign:HintAssist.Foreground)� �� *TemplatedParent+E � ���� 5�      $
F Hint��6   E �@ HintOpacity$D 1Q�6F   5�      ]� 5�      G 5�      �� 5�      H �@��
IsGrouping$
I True��6:   �� 5�      "H �@%�IsVirtualizingWhenGrouping$I False��6\   ./�5�      �� E � ��$D False��6F   5�      P� 5�      B �@J�IsKeyboardFocused$
C True��67   . �5�      �� $F 	Underline��6   E �@ IsActive$
D True��6H   5�      P� 5�      B �@=�HasError$
C True��69   . �5�      �� #D �  64   E � ���� 5�      $F 	Underline��6   #D �  6J   E � ��5�      ]� 5�      G 5�      �� 5�      H �@J�IsMouseOver$
I True��6;   �� 5�      H �@=�HasError$
I True��6C   ./�5�      �� #D �  64   E � ���� 5�      $F 	Underline��6   #D �  6J   E � ��5�      ]� 5�      G 5�      �� 5�      H �@J�IsMouseOver$
I True��6;   �� 5�      H �@=�HasError$I False��6C   ./�5�      �� D 64   �� $5 /(materialDesign:TextFieldAssist.UnderlineBrush)� �� *Self+E � ���� 5�      $F 	Underline��6   D 6J   �� $5 /(materialDesign:TextFieldAssist.UnderlineBrush)� �� *Self+E � ��5�      ]� 5�      G 5�      �� 5�      $J 
PART_Popup��6$   H � ��$
I True��6N   �� 5�      $J 
PART_Popup��6$   H �@	 Mode$I Standard=�6k   ./�5�      �� $F 
PART_Popup��6   #D �  6D   E �@�Tag�� 5�      $F 
PART_Popup��6   D 5�      �� *Tag+ �� *Self+8  E �@ 
Background�� 5�      #D �  6?   E � ��5�      ]� 5�      G 5�      �� 5�      $J 
PART_Popup��6$   H � ��$
I True��6N   �� 5�      $J 
PART_Popup��6$   H �@	 Mode$I Inverted=�6k   ./�5�      �� $F 
PART_Popup��6   #D �  6D   E �@�Tag�� 5�      $F 
PART_Popup��6   D 5�      �� *Tag+ �� *Self+8  E �@ 
Background�� 5�      #D �  6?   E � ��5�      ]� 5�      G 5�      �� 5�      $J 
PART_Popup��6$   H � ��$
I True��6N   �� 5      $J 
PART_Popup��6$   H �@	 Mode$I PrimaryLight=�6k   ./�5     �� $F 
PART_Popup��6   #D �  6D   E �@�Tag�� 5     $F 
PART_Popup��6   D 5     �� *Tag+ �� *Self+8  E �@ 
Background�� 5     #D �  6?   E � ��5     ]� 5     G 5     �� 5	     $J 
PART_Popup��6$   H � ��$
I True��6N   �� 5
     $J 
PART_Popup��6$   H �@	 Mode$I 
PrimaryMid=�6k   ./�5     �� $F 
PART_Popup��6   #D �  6D   E �@�Tag�� 5     $F 
PART_Popup��6   D 5     �� *Tag+ �� *Self+8  E �@ 
Background�� 5     #D �  6?   E � ��5     ]� 5     G 5     �� 5     $J 
PART_Popup��6$   H � ��$
I True��6N   �� 5     $J 
PART_Popup��6$   H �@	 Mode$I PrimaryDark=�6k   ./�5     �� $F 
PART_Popup��6   #D �  6D   E �@�Tag�� 5     $F 
PART_Popup��6   D 5     �� *Tag+ �� *Self+8  E �@ 
Background�� 5     #D �  6?   E � ��5     ]� 5     G 5     �� 5     $J 
PART_Popup��6$   H � ��$
I True��6N   �� 5     $J 
PART_Popup��6$   H �@	 Mode$I Accent=�6k   ./�5      �� $F 
PART_Popup��6   #D �  6D   E �@�Tag�� 5!     $F 
PART_Popup��6   D 5"     �� *Tag+ �� *Self+8  E �@ 
Background�� 5#     #D �  6?   E � ��5$     ]� 5%     G 5&     �� 5'     $J 
PART_Popup��6$   H � ��$
I True��6N   �� 5(     $J 
PART_Popup��6$   H �@	 Mode$I Light=�6k   ./�5*     �� $F 
PART_Popup��6   #D �  6D   E �@�Tag�� 5+     $F 
PART_Popup��6   D 5,     �� *Tag+ �� *Self+8  E �@ 
Background�� 5-     #D �  6?   E � ��5.     ]� 5/     G 50     �� 51     $J 
PART_Popup��6$   H � ��$
I True��6N   �� 52     $J 
PART_Popup��6$   H �@	 Mode$
I Dark=�6k   ./�54     �� $F 
PART_Popup��6   #D �  6D   E �@�Tag�� 55     $F 
PART_Popup��6   D 56     �� *Tag+ �� *Self+8  E �@ 
Background�� 57     #D �  6?   E � ��58     5:     �� 5;  
   "K ��6,   .�5<     �� E �@�FocusVisualStyleD 61   Z� �� 5=     E � ��
D ���� 6+   �� 5>     E � ��#D �  6,   �� 5?     E � ��D 6+   ��  �� "L �$ (TextElement.Foreground)��� 5@     E � ��$D 0 0 0 1q�60   �� 5A     E � ��8D   63   �� 5B     E � ��$
D Auto=�6K   �� 5C     E � ��$
D Auto=�6I   �� 5D     E � ��$D 0 6 0 6q�6(   �� 5E     E � ��$	D Top=�69   �� 5F     E � ��$D Stretch=�6;   �� 5G     E � ��$D Stretch=�64   �� 5H     E � ��$D Center=�62   �� 5I     E � ��$
D True��6>   �� 5J     E �@��PanningMode$
D Both=�69   �� 5K     E �@��IsFlicksEnabled$D False��67   �� 5L     E �@=�ErrorTemplate8D  69   �� 5M     E �@ TextBoxViewMargin$D 1 0 1 0q�6Q   �� 5N     E �@ UnderlineBrush#D �  6N   �� 5O     E �@	 Mode$D Standard=�6D   �� 5P     E �@ 
Foreground#D �  6E   �� 5Q     E � ��8D  6)   M 5R     P� 5S     B �@J�IsKeyboardFocused$
C True��67   . �5T     �� E � ��D 64   �� $5 /(materialDesign:TextFieldAssist.UnderlineBrush)� �� *Self+5U     P� 5V     B �@J�IsKeyboardFocusWithin$
C True��6;   . �5W     �� E � ��D 64   �� $5 /(materialDesign:TextFieldAssist.UnderlineBrush)� �� *Self+5X     P� 5Y     B �@��
IsEditable$
C True��60   . �5Z     �� E � ��$D False��62   �� 5\     E �@ ShowSelectedItem8D  6W   5]     P� 5_     B �@ ShowSelectedItem8C  . �5`     �� E � ��8D  6;   5a     5c     5d     .��5e     �� -   5        N ��Name$N MultiSelectCombo��5f  	   #��[ 5g  	   O   
IsFloatingO 5h  	   �� $, &(materialDesign:HintAssist.IsFloating)� �� L UserControlP �� TextP 5l  	   �� $
 Text� �� Q �� Mode$Q FindAncestor=�L UserControl��5m  
   �� 5n     .R�5o     �� -   5        ��5o     �� *Title+ 5p     �� $ 
IsSelected�$ TwoWay=�5q     5r     5t     5u     