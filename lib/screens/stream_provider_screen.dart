import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_samples/providers/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    print('build');
    return Scaffold(
      appBar: AppBar(title: Text("Stream provider")),
     
      body: Consumer(builder: (context, ref, child){
        final provider = ref.watch(streamProvider);
        return Center(
          child: provider.when(
            skipLoadingOnRefresh: false,
            data:
                (value) => Text(value.toStringAsFixed(2),
              style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),),
            error: (error, stack) => TextButton(onPressed: (){
              ref.invalidate(streamProvider);
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh, color: Colors.redAccent,),
                SizedBox(width: 8,),
                Text(error.toString())
              ],
            )),
            loading: () => CircularProgressIndicator(),
          ),
        );
      })

    );
  }
}
