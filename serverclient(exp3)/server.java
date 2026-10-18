import java.io.*;
import java.net.*;

public class server {
    public static void main(String[] args) {
        int port = 5000;

        try (ServerSocket serverSocket = new ServerSocket(port)) {
            System.out.println("Server started...");
            System.out.println("Waiting for client...");

            try (Socket socket = serverSocket.accept();
                 BufferedReader input = new BufferedReader(
                         new InputStreamReader(socket.getInputStream()));
                 PrintWriter output = new PrintWriter(socket.getOutputStream(), true)) {

                System.out.println("Client connected.");

                String message = input.readLine();
                if (message != null) {
                    System.out.println("Client says: " + message);
                    output.println("Hello Client");
                }
            }

            System.out.println("Connection closed.");
        } catch (IOException e) {
            System.out.println(e);
        }
    }
}