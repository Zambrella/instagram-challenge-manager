enum EntryStatus {
  pending,
  valid,
  invalid;

  String get name => switch (this) {
        EntryStatus.pending => 'Pending',
        EntryStatus.valid => 'Valid',
        EntryStatus.invalid => 'Invalid',
      };
}
