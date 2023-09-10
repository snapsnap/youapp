

const String baseURL = "https://techtest.youapp.ai";

const double constPaddingScaffold = 20.0;
const double buttonHeight = 45.0;
const int timeOutRequest = 30;
const int idleDuration = 30;
const String errorText = "Ups.. Terjadi kesalahan";

enum ErrorCode {
  // ignore: constant_identifier_names
  RTO, // PROSES REQUEST MELEBIHI BATAS WAKTU
  // ignore: constant_identifier_names
  NoConnection, // DEVICE TIDAK ADA INTERNET ATAU KONEKSI TIDAK SAMPAI
  // ignore: constant_identifier_names
  InvalidApi,
  // ignore: constant_identifier_names
  ResponseRejected, // RESPONSE DARI API TIDAK SESUAI ATAU TIDAK SUKSES
}

// ignore: constant_identifier_names
enum OtpType { VerifiOrder, VerifiLogin, VerifiChangePass, VerifiResetPass }
