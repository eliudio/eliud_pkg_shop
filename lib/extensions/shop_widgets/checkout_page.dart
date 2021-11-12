import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/member_form.dart';
import 'package:eliud_core/model/member_list_bloc.dart';
import 'package:eliud_core/model/member_list_event.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutPage extends StatefulWidget {
  final ActionModel? checkoutAction;

  const CheckOutPage({Key? key, this.checkoutAction}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        return BlocProvider<MemberListBloc>(
            create: (context) => MemberListBloc(
                  memberRepository: memberRepository()!,
                )..add(LoadMemberList()),
            child: MemberAddressForm(
                submitAction: widget.checkoutAction!,
                value: accessState.getMember(),
                formAction: FormAction.UpdateAction));
      } else {
        return progressIndicator(context);
      }
    });
  }
}
