import 'package:budget_app/enums/transaction_type_enum.dart';
import 'package:budget_app/service/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatefulWidget {
  final Transaction transaction;
  final int index;
  final String sign;
  final Color color;
  final IconData icon;

  TransactionTile({
    Key? key,
    required this.transaction,
    required this.index,
  })  : sign = transaction.type == TransactionTypeEnum.income ? '+' : '-',
        color = transaction.type == TransactionTypeEnum.income
            ? const Color(0xff00c79c)
            : const Color(0xffdb7059),
        icon = transaction.type == TransactionTypeEnum.income
            ? Icons.add
            : Icons.remove,
        super(key: key);

  @override
  State<TransactionTile> createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  Offset _offset = const Offset(1, 0);

  @override
  void initState() {
    animate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: _offset,
      curve: Curves.ease,
      duration: Duration(milliseconds: widget.index * 100 + 300),
      child: ListTile(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        // tileColor: Theme.of(context).colorScheme.primaryVariant,
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: widget.color),
          ),
          child: Icon(widget.icon, color: widget.color),
        ),
        title: Text(
          '${widget.sign} ${widget.transaction.value}',
          style: TextStyle(color: widget.color),
        ),
        subtitle: Text(
          widget.transaction.category,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> animate() async {
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _offset = Offset.zero;
      });
    });
  }
}
