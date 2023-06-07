





























































                  child :Card(
                    child: ListTile(
                      onTap: (){
                        GoRouter.of(context).pushNamed(AppRoutes.post, extra: snapshot.data![index],
                        );
                      }
                    )
                  )










