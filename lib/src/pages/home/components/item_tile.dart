import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/product/product_screen.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class ItemTile extends StatefulWidget {
  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;

  const ItemTile({
    Key? key,
    required this.item,
    required this.cartAnimationMethod,
  }) : super(key: key);

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGK = GlobalKey();

  final UtilsServices utilsServices = UtilsServices();

  IconData tileIcon = Icons.add_shopping_cart_outlined;

  // Função - Troca Icone quando adicionando ao carrinho
  Future<void> switchIcon() async {
    setState(() => tileIcon = Icons.check);

    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() => tileIcon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Conteudo
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreen(item: widget.item);
            }));
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Imagem
                  Expanded(
                    child: Hero(
                      tag: widget.item.imgUrl,
                      // O key da imageKe tem que ser adicionando em um container
                      child: Image.asset(
                        widget.item.imgUrl,
                        key: imageGK,
                      ),
                    ),
                  ),

                  // Nome
                  Text(
                    widget.item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Preço - unidade
                  Row(
                    children: [
                      // Preço
                      Text(
                        utilsServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),

                      // Unidade Medida
                      Text(
                        '/${widget.item.unit}',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),

        // Botão Adicionar Carrinho
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(20),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  // Troca Icone quando adicionando ao carrinho
                  switchIcon();

                  widget.cartAnimationMethod(imageGK);
                },
                child: Ink(
                  width: 35,
                  height: 40,
                  decoration: BoxDecoration(
                    color: CustomColors.customSwatchColor,
                  ),
                  child: Icon(
                    tileIcon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
