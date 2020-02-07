import 'package:miniapp/miniapp1/models/Burger.dart';
import 'package:miniapp/miniapp1/repositories/SpecialOffersRepository.dart';
import 'package:rxdart/rxdart.dart';

class SpecialOfferBloc {

  SpecialOffersRepository _offersRepository = new SpecialOffersRepository();
  PublishSubject<List<Burger>> _publishSubject = new PublishSubject<List<Burger>>();

  Stream<List<Burger>> get allOffers => _publishSubject.stream;

  void fetchOffers() async {
    var data = await _offersRepository.fetchSpecialOffers();
    _publishSubject.sink.add(data);
  }

  dispose(){
    _offersRepository = null;
    _publishSubject.close();
  }
}