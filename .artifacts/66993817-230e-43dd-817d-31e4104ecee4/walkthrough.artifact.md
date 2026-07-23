# Walkthrough - Dynamic Text Color Selection

Implemented a color selection feature in the `NewNoteScreen` that allows users to change the color of the note's Title and Description text.

## Changes Made

### Color State Management
- **[NewNoteController](file:///E:/note_app/lib/controller/new_note_controller/new_note_controller.dart)**:
    - Added `selectedTextColor` to hold the current choice.
    - Implemented `outPutTextColor` stream to broadcast color updates to the UI.
    - Added `updateTextColor(Color color)` to handle user selections.

### UI Integration
- **[CustomAppBarNewScreen](file:///E:/note_app/lib/features/new_note/widgets/custom_app_bar_new_screen.dart)**:
    - Added a `palette` icon button that opens a color picker menu.
    - Users can now select from a predefined list of colors (Black, Red, Blue, Green, Orange, Purple).
- **[NewNoteScreen](file:///E:/note_app/lib/features/new_note/screens/new_note_screen.dart)**:
    - Added a nested `StreamBuilder` to listen for color changes and pass the selected color down to the text fields.
- **Text Fields**:
    - Updated [CustomTextFiledTitleNote](file:///E:/note_app/lib/features/new_note/widgets/custom_text_filed_title_note.dart) and [CustomTextFiledDescNote](file:///E:/note_app/lib/features/new_note/widgets/custom_text_filed_desc_note.dart) to accept and apply the dynamic `textColor`.

## Verification Results

- [x] **Real-time Updates**: Changing the color in the AppBar immediately updates the text color in the Title and Description fields.
- [x] **Visual Feedback**: The color picker menu provides a clear visual representation of the available colors.
- [x] **Consistency**: The selected color is applied to both the title and the body of the note.

> [!NOTE]
> Currently, the color selection is per-session (not saved to the database). If you want this color to be remembered for each note, we can update the `NoteModel` next.
