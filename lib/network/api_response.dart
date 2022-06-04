
class ApiResponse<T> {
  bool _isSuccessful = false;
  int _statusCode = 0;
  T? _data;
  String? _errorMessage;

  bool get isSuccessful => _isSuccessful;

  int get statusCode => _statusCode;

  String? get errorMessage => _errorMessage;

  T? get data => _data;

  T get requiredData => _data!;

  ApiResponse({required int statusCode, T? data, String? errorMessage}) {
    _statusCode = statusCode;
    _data = data;
    _errorMessage = errorMessage;
    if (statusCode >= 200 && statusCode < 300) {
      if (data != null) {
        _isSuccessful = true;
      } else {
        _statusCode = 888;
      }
    }
  }
}
