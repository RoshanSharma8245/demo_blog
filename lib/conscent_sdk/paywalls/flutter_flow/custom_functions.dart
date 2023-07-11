import '../../constants.dart';

bool conscentBalanceVisibilty() {
  if (Constants.conscentBalance != null && Constants.conscentBalance != "") {
    return false;
  } else {
    return false;
  }
}

bool micropaymentVisibilty() {
  return true;
}

bool weeklyPaymentVisibilty() {
  return true;
}

bool nameVisibilty() {
  return true;
}

bool emailVisibilty() {
  return true;
}
