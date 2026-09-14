package lab1;

import lab1.controller.InternetLifeController;
import lab1.model.InternetLifeModel;
import lab1.view.MainFrame;

import javax.swing.SwingUtilities;

public class Main {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                InternetLifeModel model = new InternetLifeModel();
                MainFrame view = new MainFrame();
                InternetLifeController controller = new InternetLifeController(model, view);
                controller.start();
            }
        });
    }
}
