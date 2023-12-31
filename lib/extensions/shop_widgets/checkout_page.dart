import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_helpers/etc/enums.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_core_main/model/member_form.dart';
import 'package:eliud_core_main/model/member_list_bloc.dart';
import 'package:eliud_core_main/model/member_list_event.dart';
import 'package:eliud_core_main/tools/main_abstract_repository_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutPage extends StatefulWidget {
  final AppModel app;
  final ActionModel? checkoutAction;

  const CheckOutPage({super.key, required this.app, this.checkoutAction});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
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
                app: widget.app,
                submitAction: widget.checkoutAction!,
                value: accessState.getMember(),
                formAction: FormAction.updateAction));
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }
}
