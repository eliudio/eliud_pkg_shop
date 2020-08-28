import 'package:eliud_model/core/global_data.dart';
import 'package:eliud_model/model/member_form.dart';
import 'package:eliud_model/model/member_list_bloc.dart';
import 'package:eliud_model/model/member_list_event.dart';
import 'package:eliud_model/model/abstract_repository_singleton.dart';
import 'package:eliud_model/shared/action_model.dart';
import 'package:eliud_model/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutPage extends StatefulWidget {
  final ActionModel checkoutAction;

  const CheckOutPage({Key key, this.checkoutAction}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MemberListBloc>(
            create: (context) =>
            MemberListBloc(
              memberRepository: AbstractRepositorySingleton.singleton
                  .memberRepository(),
            )
              ..add(LoadMemberList()),
          )
        ],
        child: MemberAddressForm(
            submitAction: widget.checkoutAction,
            value: GlobalData.member(),
            formAction: FormAction.UpdateAction));
  }
}
