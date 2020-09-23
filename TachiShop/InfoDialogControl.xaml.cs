using System.Windows.Controls;
using System.Windows.Media;
using MaterialDesignThemes.Wpf;
using TachiShop.Models.Annotations;

namespace TachiShop
{
    /// <summary>
    /// Interaction logic for InfoDialogControl.xaml
    /// </summary>
    public partial class InfoDialogControl : UserControl
    {
        public InfoDialogControl(string message, [CanBeNull] Brush textColor = null, PackIconKind? icon = null, [CanBeNull] Brush iconColor = null, string title = null, string buttonText = "OK", [CanBeNull] Brush buttonColor = null)
        {
            InitializeComponent();
            TbMessage.Text = message;
            if (textColor != null)
            {
                TbMessage.Foreground = textColor;
            }
            PiIcon.Kind = icon ?? PiIcon.Kind;
            if (iconColor != null)
            {
                PiIcon.Foreground = iconColor;
            }
            TbTitle.Text = title ?? TbTitle.Text;
            BtOk.Content = buttonText;
            if (buttonColor != null)
            {
                BtOk.Background = buttonColor;
                BtOk.BorderBrush = buttonColor;
            }
        }
    }
}
