import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';
import 'package:studimer/src/presentation/widgets/notice/index.dart';
import 'package:studimer/src/presentation/widgets/repeat/index.dart';
import 'package:studimer/src/presentation/widgets/timer/index.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_controll_button.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);
  Widget _enableCheck(
      FocusNum focusValue, FocusNum compareFocusValue, Widget w) {
    return focusValue == FocusNum.none || focusValue == compareFocusValue
        ? w
        : const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('곰스터디머'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: CycleOptionPrvdConsumer(builder: (context, provider) {
          final TimerProvider studyTmProvider = TimerProvider(
              provider.oneCycle.studyTime, provider.setStudyTime, true);

          final TimerProvider restTmProvider = TimerProvider(
              provider.oneCycle.restTime, provider.setStudyTime, false);

          return Column(children: [
            _enableCheck(
                provider.focusOn,
                FocusNum.studytime,
                TimerWidget(
                    title: '공부 시간',
                    timerProvider: studyTmProvider,
                    focusNum: FocusNum.studytime)),
            _enableCheck(
                provider.focusOn,
                FocusNum.resttime,
                TimerWidget(
                  title: '쉬는 시간',
                  timerProvider: restTmProvider,
                  focusNum: FocusNum.resttime,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _enableCheck(provider.focusOn, FocusNum.repeat,
                    const Expanded(child: RepeatWidget())),
                _enableCheck(provider.focusOn, FocusNum.notice,
                    const Expanded(child: NoticeWidget()))
              ],
            ),
            _enableCheck(
                provider.focusOn,
                FocusNum.none,
                TimerControllButton(
                    studyTmProvider: studyTmProvider,
                    restTmProvider: restTmProvider))
          ]);
        }),
      ),
    );
  }
}
