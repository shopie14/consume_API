





















child:padding(
        padding:EdgeInsets.synmetric(horizontal:size.width * 0.03),
        child:column(
          crossAxisAlignment: CrossAxisAlignment.start,
          childern: [
            Text(widget.post.title,
            style: const Textstyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizeBox(
              height: size.height*0.01,
            ),
            SizeBox(
              width: size.widht,
              child:Text(
                widget.post.body,
                textAlign: TextAlign.justify,
              ), 
            ),
            sizeBox(
              height:size.height * 0.02,
            ),
            Expanded(
              child:FutureBuilder(
                future:postControler.fetchComments(widget.post.id),
                build: (context, snapshot){},
                ),
            ),
          ],
        ),
      ),



