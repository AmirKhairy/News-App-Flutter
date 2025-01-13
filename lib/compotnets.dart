import 'package:flutter/material.dart';
import 'package:news_app/web_view.dart';

Widget newItem({
  required Map<String, dynamic> item,
  required BuildContext context, // Explicitly declare item type
}) =>
    InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewScreenn(url: item['link'],title: item['title'],),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(item['image_url'] ??
                      'https://play-lh.googleusercontent.com/Ay-iuiRibuc8BCPugwbSKqdRgIwZ8tLOo2lPBjypAp-BvxuWTWuuOn_RsBQoqjiitA'), // Fallback image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Builder(builder: (context) {
                        return Text(
                          item['title'] ??
                              'No Title Available', // Fallback title
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        );
                      }),
                    ),

                    Text(
                      item['pubDate'] ?? 'Unknown Date',
                      style: const TextStyle(color: Colors.grey),
                    ), // Fallback pubDate
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget seperaterBuilder() => Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    );
