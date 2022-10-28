import 'package:flutter/material.dart';

import '../assets/constants.dart';
import '../entities.dart';

class CreateMemberForm extends StatefulWidget {
  final Function(String name, int age, String relation) onSubmit;
  final Function() onCancel;
  const CreateMemberForm({
    super.key,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  State<CreateMemberForm> createState() => _CreateMemberFormState();
}

class _CreateMemberFormState extends State<CreateMemberForm> {
  bool _isOtherRelation = false;
  final _ageFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  Member member = Member(
    name: '',
    age: null,
    relation: 'Self',
    avatar: '',
    isAvatarImage: false,
  );
  String customRelation = '';

  @override
  void dispose() {
    _ageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _isOtherRelation ? 350 : 300,
      child: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_ageFocusNode);
                },
                onSaved: (newValue) {
                  if (newValue != null && newValue.trim().isNotEmpty) {
                    member.name = newValue;
                  }
                },
                validator: (value) {
                  if (value != null && value.trim().isNotEmpty) {
                    return null;
                  }
                  return "Please enter name";
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Age",
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
                textInputAction: TextInputAction.next,
                focusNode: _ageFocusNode,
                onSaved: (newValue) {
                  if (newValue != null && newValue.trim().isNotEmpty) {
                    member.age = double.tryParse(newValue)?.round();
                  }
                },
                validator: (value) {
                  var trimmedValue = value?.trim();
                  var valueNotEmpty = trimmedValue?.isNotEmpty ?? false;
                  if (valueNotEmpty && double.tryParse(trimmedValue!) != null) {
                    return null;
                  }
                  return "Please enter valid age";
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: "Select Relation",
                ),
                value: member.relation,
                items: defaultRelations.map((relation) {
                  return DropdownMenuItem(
                    value: relation,
                    child: Text(relation),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _isOtherRelation = val == "Other";
                    if (val != null) {
                      member.relation = val;
                    }
                  });
                },
              ),
              const SizedBox(height: 10),
              _isOtherRelation
                  ? TextFormField(
                      autofocus: true,
                      autocorrect: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: "Enter Relation",
                      ),
                      textInputAction: TextInputAction.done,
                      onSaved: (newValue) {
                        if (newValue != null && newValue.trim().isNotEmpty) {
                          customRelation = newValue;
                        }
                      },
                    )
                  : const SizedBox(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: widget.onCancel,
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _saveForm,
                    child: const Text(
                      "SAVE",
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _saveForm() {
    _form.currentState?.save();
    if (_form.currentState?.validate() == true) {
      widget.onSubmit(
        member.name,
        member.age!,
        customRelation.isNotEmpty ? customRelation : member.relation,
      );
    }
  }
}