# Implementation Plan - Dynamic Text Color Selection

Add the ability for users to choose the text color while writing a new note. This will include a color picker in the AppBar and updating the text fields to reflect the selected color.

## User Review Required

> [!IMPORTANT]
> - I will add a row of color selection circles in the `CustomAppBarNewScreen`.
> - This color will apply to both the **Title** and **Description** text.
> - For now, this color will be session-based (UI state). If you want this color to be **saved** permanently with each note in the database, please let me know, as it would require updating the `NoteModel` and the database schema.

## Proposed Changes

### [New Note Feature]

#### [MODIFY] [NewNoteController](file:///E:/note_app/lib/controller/new_note_controller/new_note_controller.dart)
- Add `Color selectedTextColor`.
- Add a `StreamController<Color>` to manage and broadcast text color changes.
- Add `updateTextColor(Color color)` method.

#### [MODIFY] [CustomAppBarNewScreen](file:///E:/note_app/lib/features/new_note/widgets/custom_app_bar_new_screen.dart)
- Add a horizontal list of color options (e.g., using `ListView` or `Row`) in the `actions` or below the `title`.
- Each color circle will call `controller.updateTextColor(color)` when tapped.

#### [MODIFY] [NewNoteScreen](file:///E:/note_app/lib/features/new_note/screens/new_note_screen.dart)
- Wrap the text fields in another `StreamBuilder` that listens to `outPutTextColor`.

#### [MODIFY] [CustomTextFiledTitleNote](file:///E:/note_app/lib/features/new_note/widgets/custom_text_filed_title_note.dart) & [CustomTextFiledDescNote](file:///E:/note_app/lib/features/new_note/widgets/custom_text_filed_desc_note.dart)
- Accept a `Color textColor` parameter and use it in the `TextStyle`.

## Verification Plan

### Manual Verification
- Open the New Note screen.
- Tap different color circles in the AppBar.
- Verify that the text color of the Title and Description changes immediately.
