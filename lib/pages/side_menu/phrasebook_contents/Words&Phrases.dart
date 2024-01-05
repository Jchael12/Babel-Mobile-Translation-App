import 'package:flutter/material.dart';
import "package:translate/utils/colors.dart";

class WordsPhrases extends StatelessWidget {
  final Map<String, List<String>> phrases = {
    'Good Morning Teacher': ['Korean - 선생님 안녕하세요 (seonsaengnim annyeonghaseyo)', 'Chinese - 老师早上好 (Lǎoshī zǎoshang hǎo)', 'Japanese - おはようございます先生 (Ohayōgozaimasu sensei)'],
    'I forgot to do my homework': ['Korean - 숙제하는 걸 깜빡했어요 (sugjehaneun geol kkamppaghaess-eoyo)', 'Chinese - 我忘了做作业 (Wǒ wàngle zuò zuo yè)', 'Japanese - 宿題をするのを忘れた (Shukudai o suru no o wasureta)'],
    'Listen carefully': ['Korean - 잘 들어 (jal deul-eo)', 'Chinese - 仔细听 (Zǐxì tīng)', 'Japanese - 注意深く耳を傾ける (Chūibukaku mimiwokatamukeru)'],
    'Be quiet': ['Korean - 조용히 해 (joyonghi hae)', 'Chinese - 安静 (Ānjìng)', 'Japanese - 静かに (Shizukani)'],
    'I have question': ['Korean - 질문이 있습니다 (jilmun-i issseubnida)', 'Chinese - 我有问题 (Wǒ yǒu wèntí)', 'Japanese - 質問があります (Shitsumon ga arimasu)'],
    'Sorry I am late': ['Korean - 미안 늦었 어 (mian neuj-eoss eo)', 'Chinese - 不好意思我迟到了 (Bù hǎoyìsi wǒ chídàole)', 'Japanese - すいません遅れました (Suimasen okuremashita)'],
    'Textbook': ['Korean - 교과서 (gyogwaseo)', 'Chinese - 教科书 (Jiàokēshū)', 'Japanese - 教科書 (Kyōkasho)'],
    'Notebook': ['Korean - 공책 (gongchaeg)', 'Chinese - 笔记本 (Bǐjìběn)', 'Japanese - ノート (Nōto)'],
    'Pen': ['Korean -  펜 (pen)', 'Chinese - 笔 (Bǐ)', 'Japanese - ペン (Pen)'],
    'Book': ['Korean - 책 (chaeg)', 'Chinese - 书 (Shū)', 'Japanese - 本 (Hon)'],
    // Add other phrases with their translations here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Words and Phrases in School'),
        backgroundColor: darkColor,
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (BuildContext context, int index) {
          String phrase = phrases.keys.elementAt(index);
          List<String> translations = phrases.values.elementAt(index);

          return ExpansionTile(
            title: Text(
              phrase,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            children: translations.map((translation) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  translation,
                  style: TextStyle(fontSize: 16),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
