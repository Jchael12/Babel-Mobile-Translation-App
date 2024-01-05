import 'package:flutter/material.dart';
import "package:translate/utils/colors.dart";

class DirectionAndSurvival extends StatelessWidget {
  final Map<String, List<String>> phrases = {
    'Do you speak English ?': ['Korean - 당신은 영어를하십니까 ? (dangsin-eun yeong-eoleulhasibnikka ?)', 'Chinese - 你会说英语吗 ？ (Nǐ huì shuō yīngyǔ ma?)', 'Japanese - あなたは英語を話しますか ？ (Anata wa eigo o hanashimasu ka?)'],
    'I dont understand': ['Korean - 모르겠어요 (moleugess-eoyo)', 'Chinese - 我不明白 (Wǒ bù míngbái)', 'Japanese - 理解できない (Rikaidekinai)'],
    'Write it down please': ['Korean - 적어주세요 (jeog-eojuseyo)', 'Chinese - 请写下来 (Qǐng xiě xiàlái)', 'Japanese - 書いてください (Kaite kudasai)'],
    'Can you help me please': ['Korean - 도와 줄수있으세요 (dowa julsu-iss-euseyo)', 'Chinese - 你能帮我吗 (Nǐ néng bāng wǒ ma)', 'Japanese - 助けてもらえませんか (Tasukete moraemasen ka)'],
    'Turn left': ['Korean - 왼쪽으로 돌아 (oenjjog-eulo dol-a)', 'Chinese - 左转 (Zuǒ zhuǎn)', 'Japanese - 左折してください (Sasetsu shite kudasai)'],
    'Turn right': ['Korean - 우회전 (uhoejeon)', 'Chinese - 右转 (Yòu zhuǎn)', 'Japanese - 右折 (Usetsu)'],
    'Go straight': ['Korean - 직진 (jigjin)', 'Chinese - 直行 (Zhíxíng)', 'Japanese - 真っ直ぐ進んで下さい (Massugu susunde kudasai)'],
    'Can you show me the way ?': ['Korean - 나에게 길을 보여줄 수 있나요? (na-ege gil-eul boyeojul su issnayo?)', 'Chinese - 你能给我指路吗？ (Nǐ néng gěi wǒ zhǐ lù ma?)', 'Japanese - 道を教えてもらえますか？ (Michi o oshiete moraemasu ka?)'],
    "I dont speak your language": ['Korean -  나는 당신의 언어를 할 수 없습니다 (naneun dangsin-ui eon-eoleul hal su eobs-seubnida)', 'Chinese - 我不会说你的语言 (Wǒ bù huì shuō nǐ de yǔyán)', 'Japanese - 貴方の言語は喋れません (Anata no gengo wa shaberemasen)'],
    'Where is the station ?': ['Korean - 역이 어디야? (yeog-i eodiya?)', 'Chinese - 车站在哪 ？ (Chēzhàn zài nǎ?)', 'Japanese - 駅はどこですか ？ (Eki wa dokodesu ka?)'],
    // Add other phrases with their translations here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Direction And Survival Phrases'),
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
