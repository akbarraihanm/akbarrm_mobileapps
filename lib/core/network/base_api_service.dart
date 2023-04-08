class BaseApiService {
  final String _token = "\$2a\$16\$TlB6hYDRMSF5HBgxImeaU.itfBOu881/lI4mSPMR0jYRnMXklQKp6";

  Map<String, String> token() {
    return {
      "X-SECRET-TOKEN": _token,
    };
  }
}
