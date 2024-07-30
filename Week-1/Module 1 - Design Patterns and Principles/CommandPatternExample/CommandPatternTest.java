public class CommandPatternTest {
    public static void main(String[] args) {
        Light livingRoomLight = new Light();

        Command lightsOn = new LightOnCommand(livingRoomLight);
        Command lightsOff = new LightOffCommand(livingRoomLight);

        RemoteControl remote = new RemoteControl();

        remote.setCommand(lightsOn);
        remote.pressButton();

        remote.setCommand(lightsOff);
        remote.pressButton();
    }
}
