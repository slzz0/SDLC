package lab1.view;

import lab1.util.FormatUtils;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import java.awt.Component;

public final class InputDialog {
    private InputDialog() {
    }

    public static Double showDialog(Component parent, double previousHours, boolean hasPreviousValue) {
        JTextField hoursField = new JTextField(12);
        if (hasPreviousValue) {
            hoursField.setText(FormatUtils.formatInput(previousHours));
        }

        JPanel panel = new JPanel();
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
        panel.add(new JLabel("Сколько часов в день вы проводите онлайн?"));
        panel.add(Box.createVerticalStrut(8));
        panel.add(hoursField);

        while (true) {
            int option = JOptionPane.showConfirmDialog(
                    parent,
                    panel,
                    "Ввод данных",
                    JOptionPane.OK_CANCEL_OPTION,
                    JOptionPane.PLAIN_MESSAGE
            );

            if (option != JOptionPane.OK_OPTION) {
                return null;
            }

            try {
                return FormatUtils.parseHours(hoursField.getText());
            } catch (NumberFormatException exception) {
                showError(parent, "Введите число. Например: 2.5");
            } catch (IllegalArgumentException exception) {
                showError(parent, exception.getMessage());
            }
        }
    }

    private static void showError(Component parent, String message) {
        JOptionPane.showMessageDialog(parent, message, "Ошибка ввода", JOptionPane.ERROR_MESSAGE);
    }
}
