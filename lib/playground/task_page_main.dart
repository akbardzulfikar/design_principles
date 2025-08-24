import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//SRP
import 'srp/example/task_page_example.dart';
// anti example
import 'srp/example/task_page_anti_example.dart';

//OCP
import 'ocp/ocp.dart';
// anti example
import 'ocp/ocp_anti_example.dart';

//LSP
import 'lsp/lsp.dart';
// anti examplle
import 'lsp/lsp_anti_example.dart';

// contoh lain LSP
import 'lsp/vehicle_lsp_example.dart';
//anti example
import 'lsp/vehicle_lsp_anti_example.dart';

// ISP
import 'isp/isp.dart';
//anti example
import 'isp/isp_anti_example.dart';

// DIP
import 'dip/dip.dart';
// anti example
import 'dip/dip_anti_example.dart';

//observe patter
import 'observe_pattern/observe.dart';
// anti example
import 'observe_pattern/observe_anti.dart';

// dependency injection
import 'dependency_injection/di.dart';
// anti example
import 'dependency_injection/di_anti_example.dart';

class TaskPageScaffold extends StatelessWidget {
  final String title;

  const TaskPageScaffold({super.key, this.title = 'Tasks'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      // SRP
      // body: const TaskPageSrp()
      // SRP anti example
      // body: const TaskPageSrpAnti()

      // OCP
      // body: TaskListOcp()
      // OCP anti example
      // body: const TaskPageOcpAnti()

      // LSP
      // body: LspButton()
      // anti example
      // body: LspButtonBad()

      // ISP
      // body: IconButtonTileIsp(
      //   tap: MyTapActionIsp(context),
      //   longPress: MyLongPressActionIsp(context),
      //   swipe: MySwipeActionIsp(context),
      // ),
      // ISP anti example
      // body: IconButtonTileAnti(actions: IconOnlyActions(context)),

      // contoh lain ISP
      body: VehicleLspGood()
      // anti example
      // body: VehicleLspBad(),

      // DIP
      // body: TaskPageDip(repo: InMemoryTaskRepositoryDip())
      // body: TaskPageDip(repo: RemoteTaskRepositoryDip())
      //anti example
      // body: TaskPageDipAnti()

      // Observe Pattern
      // body: ChangeNotifierProvider(
      //   create: (_) => CounterController(),
      //   child: CounterPage(),
      // )
      // anti example
      // body: CounterPageAnti()

      // dependency injection example
      // body: Builder(
      //   builder: (context) {
      //     setupLocatorDi();
      //     return TaskPageGood();
      //   },
      // ),
      // anti example
      // body: Builder(
      //   builder: (context) {
      //     setupBadLocator();
      //     return TaskPageBad();
      //   },
      // ),
    );
  }
}
