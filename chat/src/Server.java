import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Server  implements ActionListener {
    JTextField text;
    JPanel a1;
    static Box vertical = Box.createVerticalBox();
    static JFrame j = new JFrame();
    static DataOutputStream dout;
    Server(){
        j.setLayout(null);
        JPanel panel = new JPanel();
        panel.setLayout(null);
        panel.setBackground(new Color(7,94,84));
        panel.setBounds(0,0,450,70);
        j.add(panel);

        ImageIcon img = new ImageIcon(ClassLoader.getSystemResource("icons/3.png"));
        Image img2 = img.getImage().getScaledInstance(25,25,Image.SCALE_DEFAULT);
        ImageIcon img3 = new ImageIcon(img2);
        JLabel label  = new JLabel(img3);
        label.setBounds(5,20,25,25);
        panel.add(label);

        label.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                System.exit(0);
            }
        });

        ImageIcon i = new ImageIcon(ClassLoader.getSystemResource("icons/1.png"));
        Image i2 = i.getImage().getScaledInstance(50,50,Image.SCALE_DEFAULT);
        ImageIcon i3 = new ImageIcon(i2);
        JLabel l  = new JLabel(i3);
        l.setBounds(40,10,50,50);
        panel.add(l);

        ImageIcon ii = new ImageIcon(ClassLoader.getSystemResource("icons/video.png"));
        Image ii2 = ii.getImage().getScaledInstance(30,30,Image.SCALE_DEFAULT);
        ImageIcon ii3 = new ImageIcon(ii2);
        JLabel ll  = new JLabel(ii3);
        ll.setBounds(300,20,30,30);
        panel.add(ll);

        ImageIcon iii = new ImageIcon(ClassLoader.getSystemResource("icons/phone.png"));
        Image iii2 = iii.getImage().getScaledInstance(35,30,Image.SCALE_DEFAULT);
        ImageIcon iii3 = new ImageIcon(iii2);
        JLabel lll  = new JLabel(iii3);
        lll.setBounds(360,20,35,30);
        panel.add(lll);

        ImageIcon iiii = new ImageIcon(ClassLoader.getSystemResource("icons/3icon.png"));
        Image iiii2 = iiii.getImage().getScaledInstance(10,25,Image.SCALE_DEFAULT);
        ImageIcon iiii3 = new ImageIcon(iiii2);
        JLabel llll  = new JLabel(iiii3);
        llll.setBounds(420,20,10,25);
        panel.add(llll);

        JLabel name = new JLabel("Server");
        name.setBounds(110,15,100,20);
        name.setForeground(Color.white);
        name.setFont(new Font("SAN_SERIF",Font.BOLD,18));
        panel.add(name);

        JLabel status = new JLabel("Active Now");
        status.setBounds(110,35,100,15);
        status.setForeground(Color.white);
        status.setFont(new Font("SAN_SERIF",Font.BOLD,14));
        panel.add(status);


        a1=new JPanel();
        a1.setBounds(0,70,450,575);
        j.add(a1);

        text=new JTextField();
        text.setFont(new Font("SAN_SERIF", Font.PLAIN,16));
        text.setBounds(6,645,310,40);

        JButton send = new JButton("Send");
        send.setBounds(320,645,124,40);
        send.setBackground(new Color(7,94,84));
        send.setForeground(Color.white);
        send.setFont(new Font("SAN_SERIF",Font.PLAIN,16));
        send.addActionListener(this);
        j.add(send);

        j.add(text);

        j.setUndecorated(true);
        j.setSize(450,690);
        j.setVisible(true);
        j.setLocation(200, 50);
        j.getContentPane().setBackground(Color.WHITE);


        j.revalidate();
    }

    public static void main(String[] args) {
        new Server();
        try{
            ServerSocket skt = new ServerSocket(6001);
            while (true){
                Socket s = skt.accept();
                DataInputStream din = new DataInputStream(s.getInputStream());
                dout = new DataOutputStream(s.getOutputStream());

                while(true){
                    String msg=din.readUTF();
                    JPanel panel =formatLabel(msg);
                    JPanel left=new JPanel(new BorderLayout());
                    left.add(panel,BorderLayout.LINE_START);
                    vertical.add(left);
                    j.validate();
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        String out = text.getText();
//        JLabel output = new JLabel(out);
        JPanel p2 = formatLabel(out);
//        p2.add(output);
        a1.setLayout(new BorderLayout());
        JPanel right = new JPanel(new BorderLayout());
        right.add(p2,BorderLayout.LINE_END);
        vertical.add(right);
        vertical.add(Box.createVerticalStrut(15));
        a1.add(vertical,BorderLayout.PAGE_START);
        try {
            dout.writeUTF(out);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        text.setText(null);
        j.repaint();
        j.invalidate();
        j.validate();
    }
    public static JPanel formatLabel(String out){
        JPanel panel = new JPanel();
        panel.setLayout(new BoxLayout(panel,BoxLayout.Y_AXIS));

        JLabel output = new JLabel("<html><p style=\" width: 150px\">"+ out+"</p></html>");
        output.setFont(new Font("TAHOMA",Font.PLAIN,16));
        output.setBackground(new Color(37,211,102));
        output.setOpaque(true);
        output.setBorder(new EmptyBorder(10,15,10,20));
        panel.add(output);


        Calendar cal = Calendar.getInstance();
        SimpleDateFormat  sdf = new SimpleDateFormat("HH:mm");
        JLabel time = new JLabel();
        time.setText(sdf.format(cal.getTime()));
        panel.add(time);
        return panel;
    }
}
