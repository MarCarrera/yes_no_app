import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatefulWidget {
  const HerMessageBubble({super.key, required this.message});
  final Message message;

  @override
  State<HerMessageBubble> createState() => _HerMessageBubbleState();
}

class _HerMessageBubbleState extends State<HerMessageBubble> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.tertiary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(widget.message.text,
            style: TextStyle(color: Colors.white),),
          ),
        ),
        SizedBox(height: 5),
        _ImageBubble(widget.message.imageUrl!),
        SizedBox(height: 10),


      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String urlImage;

  const _ImageBubble (this.urlImage);


  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
           urlImage,
           // width: 250,
            width: sizeWidth * 0.7,
            height: sizeHeight * 0.17,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return Container(
                width: sizeWidth * 0.7,
                height: sizeHeight * 0.17,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                  ),
                ),
              );
            },
          ),
        );
  }
}