// modifier_final.dart

final class JunkFood {
  void prepare() {
    print("Opening packet and eating junk food");
  }
}

// can't extend final class outside the library
final class Chips extends JunkFood {
  @override
  void prepare() {
    print("Opening packet and eating chips");
  }
}

void main() {
  var chips = Chips();
  chips.prepare();
}
