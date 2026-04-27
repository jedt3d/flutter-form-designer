# Flutter Form Designer — Draft PRD

Status: Draft v0.3  
Product name: `Flutter Form Designer`  
Category: Developer-first RAD Visual View Composer for Flutter  
Repository: `Jedt3D/flutter-form-designer`

---

## 1. Conversation Recap

This PRD summarizes the product direction discussed so far.

### 1.1 Delphi / RAD Studio insight

Delphi remains distinctive not merely because it has drag-and-drop UI, but because it combines:

- visual components such as forms, buttons, panels, grids, inputs, and layout containers;
- non-visual components such as data sources, REST/database connectors, timers, bindings, and data modules;
- Object Inspector editing for properties and events;
- design-time data preview from database or REST-backed data sources;
- layout management, anchors, alignment, and screen-size variations;
- RAD-style application composition inside one IDE.

The major weakness identified was designer undo/redo. A modern product must make undo/redo a first-class editing architecture, not an afterthought.

### 1.2 Flutter / Dart insight

Flutter and Dart are stronger than Delphi in many modern framework areas: declarative UI, null safety, package ecosystem, hot reload, cross-platform targets, modern rendering, and app architecture. However, Flutter is still primarily code-first. It lacks a native Delphi-style RAD Visual Interface Designer.

FlutterFlow exists, but it is closer to a low-code/no-code app builder. The intended product is developer-first and should not take ownership of the whole application.

### 1.3 Product direction

The agreed direction is:

> A professional Visual View Composer for Flutter.

The designer owns the View layer / Presentation layer only. Business logic remains developer-owned.

A useful architecture boundary is:

```text
Developer-owned layer
  - Model
  - Repository / Service
  - Business Logic
  - State Management
  - ViewModel / Controller / Presenter

Contract boundary
  - ViewModel interface
  - Action handlers
  - Data fields
  - Command/event names
  - Validation contract

Designer-owned layer
  - Screen layout
  - Widget hierarchy
  - Styles / theme tokens
  - Responsive variants
  - Design-time sample data
  - Bindings to ViewModel fields/actions
  - Generated Flutter View code
```

### 1.4 ABC route decision

Three implementation paths were considered:

- Route A: Schema-first, generate Dart. Feasibility is high. Good for MVP.
- Route B: Dart AST-first, read/write arbitrary Dart UI code. Feasibility is low to medium. Avoid for MVP.
- Route C: Hybrid designer-owned View plus developer-owned logic. Feasibility is highest. Recommended.

The recommended path is C+: a contract-based hybrid RAD view designer.

The product should not try to parse and round-trip every possible Dart widget tree in version 1. Instead, it should own a designer schema and generate clean Dart view code.

### 1.5 JFormDesigner reference

JFormDesigner is an important reference because it is a professional UI/form designer for developers, not a no-code app platform.

Lessons to adopt:

- focus on UI/view design;
- integrate with developer workflow;
- provide strong layout editing;
- expose a property/object inspector;
- generate readable source code;
- avoid owning the whole application;
- use a designer-owned file format.

`Flutter Form Designer` can be framed as:

> JFormDesigner for Flutter, enhanced with Delphi-style design-time data preview and Flutter-native code generation.

### 1.6 Design-time data preview insight

Design-time data preview is essential. Without it, the product is only a visual layout tool. With it, the product becomes a true RAD View Composer.

Required capabilities include:

- JSON fixture preview;
- REST API preview through a design-time proxy;
- mock ViewModel preview;
- object and collection data sources;
- data-aware list/card/table/form widgets;
- binding editor;
- preview states: normal, loading, empty, error, long text, invalid/missing data;
- schema inference from JSON/REST responses;
- data masking;
- cached/offline preview data;
- broken binding detection.

---

## 2. Product Summary

`Flutter Form Designer` is a developer-first RAD visual designer for building Flutter View layers.

It provides a visual canvas, component palette, widget tree, Object Inspector, design-time data preview, responsive variants, type-safe bindings, and clean Dart code generation.

It intentionally does not own business logic. Instead, generated Flutter views bind to developer-owned ViewModel, Controller, or Presenter contracts.

---

## 3. Product Vision

Create the fastest professional way to design, preview, and generate Flutter business application views without abandoning normal Flutter/Dart development.

Long-term vision:

> A Delphi-class RAD visual design experience for Flutter Views, without turning Flutter development into a closed low-code platform.

---

## 4. Positioning

### 4.1 One-line positioning

`Flutter Form Designer` is a professional RAD Visual View Composer for Flutter developers.

### 4.2 It is not

- a full no-code app builder;
- a FlutterFlow replacement;
- a full Delphi clone;
- a business-logic visual programming environment;
- a full arbitrary-Dart round-trip designer in version 1.

### 4.3 It is

- a developer tool;
- a visual designer for Flutter View layers;
- a schema-first/hybrid code-generation tool;
- a design-time data-aware Flutter UI composer;
- a productivity layer for business apps.

---

## 5. Target Users

Primary users are Flutter developers building data-heavy applications such as:

- healthcare software;
- nursing home management systems;
- CRM systems;
- ERP-lite systems;
- internal tools;
- admin systems;
- form-heavy applications;
- master-detail applications;
- REST API front-ends;
- desktop/tablet business apps.

Secondary users:

- developers migrating from Delphi, WinForms, Java Swing, Xojo, or similar RAD environments;
- software houses building many similar CRUD screens;
- backend-heavy developers who want faster UI composition;
- product teams that need to iterate business screens quickly.

---

## 6. Core Problems

1. Flutter is powerful but code-first.
2. Flutter's existing tools are inspection/debugging tools, not RAD authoring tools.
3. Business apps need realistic data preview during design.
4. Low-code platforms often own too much of the stack.
5. Full Dart source-code round-trip is too complex for MVP.
6. Visual editing without strong undo/redo is unsafe.

---

## 7. Goals

### 7.1 Product goals

1. Provide a visual canvas for designing Flutter views.
2. Provide component-based editing similar to Delphi/JFormDesigner.
3. Provide visual and non-visual components.
4. Provide an Object Inspector for properties, events, and bindings.
5. Provide design-time data preview as a first-class feature.
6. Generate clean, predictable Flutter/Dart view code.
7. Support ViewModel/Controller contracts instead of owning business logic.
8. Support responsive variants for screen sizes and device classes.
9. Support custom component registration through manifests.
10. Provide safe undo/redo from the beginning.

### 7.2 Engineering goals

1. Use designer-owned schema as the View source of truth.
2. Keep generated code deterministic and readable.
3. Keep business logic outside generated files.
4. Keep preview data separate from production data.
5. Support type-safe binding validation.
6. Keep files version-control friendly.

---

## 8. Non-goals for MVP

MVP should not include:

- full arbitrary Dart AST round-trip editing;
- no-code app publishing;
- visual database schema designer;
- visual REST workflow engine;
- authentication workflow builder;
- backend hosting;
- replacement of Provider/Riverpod/Bloc/etc.;
- arbitrary Dart expression editor inside the designer;
- visual business-rule programming;
- automatic import of any existing Flutter UI.

---

## 9. Product Principles

1. View-only by default.
2. Developer-owned business logic.
3. Schema as source of truth for designed views.
4. Generated code should be boring, readable, and deterministic.
5. Layout should be Flutter-native, not absolute-positioned by default.
6. Data preview is required, not optional.
7. Undo/redo is an architectural requirement.
8. Design-time credentials must never leak into generated production code.

---

## 10. High-Level Architecture

The architecture diagram below uses fixed-width ASCII characters only. It should remain aligned in GitHub Markdown when viewed inside the fenced code block.

```text
+--------------------------------------------------------------+
| Flutter Form Designer                                        |
+--------------------------------------------------------------+
| Visual Canvas | Widget Tree | Object Inspector               |
| Component Palette | Binding Designer | Data Source Tray      |
| Responsive Preview                                           |
+-----------------------------+--------------------------------+
                              |
                              v
+--------------------------------------------------------------+
| Designer Schema (.ffd.yaml / .ffd.json)                      |
+--------------------------------------------------------------+
| widget tree | layout properties | style tokens               |
| responsive variants | data sources | bindings                |
| preview profiles                                             |
+-----------------------------+--------------------------------+
                              |
              +---------------+---------------+
              |                               |
              v                               v
+-----------------------------+   +----------------------------+
| Preview Runtime             |   | Code Generator             |
+-----------------------------+   +----------------------------+
| schema -> live view         |   | schema -> Flutter/Dart     |
|                             |   | code                       |
+---------------+-------------+   +-------------+--------------+
                |                               |
                v                               v
+-----------------------------+   +----------------------------+
| Design-time Preview         |   | Generated Flutter View     |
+-----------------------------+   | Code                       |
                                  +-------------+--------------+
                                                |
                                                v
                                  +----------------------------+
                                  | Developer-owned ViewModel  |
                                  | / Controller / Logic       |
                                  +----------------------------+
```

---

## 11. Suggested Repository Structure

```text
flutter-form-designer/
  README.md
  docs/
    PRD.md
    architecture.md
    schema-format.md
    design-time-data-preview.md
    code-generation.md
  packages/
    designer_schema/
    designer_core/
    designer_commands/
    designer_codegen/
    flutter_preview_runtime/
    component_registry/
  apps/
    desktop_designer/
    example_flutter_app/
  examples/
    login_form/
    patient_list/
    invoice_editor/
```

Package responsibilities:

- `designer_schema`: schema model for screens, widgets, properties, bindings, data sources, preview profiles, and variants.
- `designer_core`: canvas model, selection, component tree, property editing, layout editing, validation.
- `designer_commands`: undo/redo command system.
- `designer_codegen`: Dart/Flutter code generation.
- `flutter_preview_runtime`: renders schema in a Flutter preview environment.
- `component_registry`: metadata for built-in and custom components.
- `desktop_designer`: visual designer application.
- `example_flutter_app`: sample app consuming generated views.

---

## 12. Key Concepts

### 12.1 Visual Components

Components that render UI:

- Text
- Button
- IconButton
- TextField
- Dropdown
- Checkbox
- Switch
- Card
- Container
- Row
- Column
- Stack
- ListView
- GridView
- DataTable
- Form
- AppBar
- NavigationRail
- BottomNavigationBar
- Dialog

### 12.2 Non-Visual Components

Components that participate in design/runtime behavior but do not directly render UI:

- JsonFixtureDataSource
- RestDataSource
- MockViewModelDataSource
- ObjectDataSource
- CollectionDataSource
- Formatter
- Validator
- CommandBinding
- ThemeTokenSet
- ResponsiveBreakpointSet

These should appear in a component tray, similar to Delphi non-visual components.

### 12.3 Object Inspector

The Object Inspector edits:

- properties;
- layout settings;
- style tokens;
- events/actions;
- bindings;
- data source settings;
- responsive overrides;
- preview configuration.

### 12.4 Widget Tree

The Widget Tree supports:

- selecting components;
- reordering components;
- wrapping components;
- grouping;
- deleting;
- naming IDs;
- inspecting broken bindings.

### 12.5 Binding Designer

Binding types:

1. Property binding
2. Collection binding
3. Action binding
4. Style/state binding
5. Visibility/enabled binding

---

## 13. Design-Time Data Preview

Design-time data preview is a core requirement.

### 13.1 Purpose

Allow users to design Flutter views while seeing realistic data inside lists, cards, tables, forms, and detail views.

### 13.2 Initial data source types

#### JSON Fixture Data Source

```yaml
dataSources:
  patients:
    type: jsonFixture
    file: samples/patients.json
    rootPath: $.data
    itemType: Patient
```

#### REST Preview Data Source

```yaml
dataSources:
  patients:
    type: rest
    method: GET
    url: "{{DEV_API_URL}}/patients"
    headers:
      Authorization: "{{DESIGN_TIME_TOKEN}}"
    rootPath: $.data
    fallbackFixture: samples/patients.json
    itemType: Patient
```

#### Mock ViewModel Data Source

```yaml
dataSources:
  patientListViewModel:
    type: mockViewModel
    contract: PatientListViewModelContract
    profile: normal
```

#### Object / Collection Data Sources

```yaml
dataSources:
  selectedPatient:
    type: object
    model: Patient
    source: patients.selectedItem

  patientRows:
    type: collection
    model: Patient
    source: patients.items
```

### 13.3 Preview profiles

```yaml
previewProfiles:
  normal:
    source: samples/patients.normal.json
  empty:
    source: samples/patients.empty.json
  loading:
    state: loading
  error:
    state: error
    message: "Cannot connect to server"
  longText:
    source: samples/patients.long_text.json
  invalidData:
    source: samples/patients.invalid.json
```

Required states:

- Normal
- Empty
- Loading
- Error
- Long text
- Missing data
- Invalid data

### 13.4 REST preview proxy

REST preview should run through a design-time proxy:

```text
+-------------+     +------------------------+     +-------------------------------+
| Designer UI | --> | Design-Time Data Proxy | --> | REST API / Mock / Fixture     |
+-------------+     +------------------------+     +-------------------------------+
```

The proxy should support:

- design-time credential storage;
- request testing;
- response caching;
- save response as fixture;
- schema inference;
- sensitive data masking;
- endpoint allowlist/blocklist;
- no production-code emission of design-time secrets.

### 13.5 Data masking

Important for healthcare/business data:

```yaml
masking:
  fullName: fakeName
  phone: fakePhone
  nationalId: hidden
  address: fakeAddress
  dateOfBirth: fakeDate
```

### 13.6 Broken binding detection

Example warnings:

```text
Broken Binding:
PatientCard.nameText.text -> patient.fullName
Reason: Field 'fullName' does not exist in Patient schema.
```

```text
Type Error:
Button.enabled <- patient.status
Reason: Button.enabled expects bool, but patient.status is String.
```

---

## 14. ViewModel / Controller Contract

The designer binds to a contract, not directly to business logic.

```dart
abstract class PatientListViewModelContract {
  List<Patient> get patients;
  bool get isLoading;
  String? get errorMessage;

  Future<void> refresh();
  void openPatient(Patient patient);
}
```

Generated view code depends on this contract:

```dart
class PatientListView extends StatelessWidget {
  final PatientListViewModelContract viewModel;

  const PatientListView({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    // generated view code
  }
}
```

Developer-owned implementation remains separate:

```dart
class PatientListViewModel extends ChangeNotifier
    implements PatientListViewModelContract {
  @override
  List<Patient> patients = [];

  @override
  bool isLoading = false;

  @override
  String? errorMessage;

  @override
  Future<void> refresh() async {
    // developer-owned business logic
  }

  @override
  void openPatient(Patient patient) {
    // developer-owned navigation/action logic
  }
}
```

---

## 15. Schema Example

Simplified `.ffd.yaml` example:

```yaml
screen: PatientListScreen
version: 0.1

models:
  Patient:
    fields:
      id: String
      fullName: String
      age: int
      roomNo: String
      status: String
      lastVisitAt: DateTime?

dataSources:
  patients:
    type: jsonFixture
    file: samples/patients.json
    rootPath: $.data
    itemType: Patient

viewModelContract:
  name: PatientListViewModelContract
  fields:
    patients: List<Patient>
    isLoading: bool
    errorMessage: String?
  actions:
    refresh: Future<void>
    openPatient: void(Patient patient)

widgets:
  - id: root
    type: Scaffold
    properties:
      appBarTitle: Patients
    children:
      body:
        id: mainColumn
        type: Column
        children:
          - id: summaryText
            type: Text
            bindings:
              text: patients.totalLabel
          - id: patientList
            type: ListView
            bindings:
              items: patients.items
            itemTemplate:
              type: PatientCard
              bindings:
                title: item.fullName
                subtitle: item.roomNo
                status: item.status
                onTap: openPatient(item)

previewProfiles:
  normal:
    source: samples/patients.normal.json
  empty:
    source: samples/patients.empty.json
  loading:
    state: loading
  error:
    state: error
    message: Cannot load patients
```

---

## 16. Code Generation Requirements

Generated code must be:

- deterministic;
- readable;
- formatted with standard Dart formatting;
- lint-friendly;
- testable;
- free from design-time credentials;
- separated from developer-owned logic;
- regenerated safely.

Generated files might be:

```text
lib/generated/views/patient_list_view.dart
lib/generated/contracts/patient_list_view_model_contract.dart
lib/generated/models/patient.dart
```

Developer-owned files might be:

```text
lib/features/patients/patient_list_view_model.dart
lib/features/patients/patient_repository.dart
lib/features/patients/patient_service.dart
```

Generated files should include:

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// Source: screens/patient_list.ffd.yaml
```

---

## 17. Custom Component Manifest

Custom widgets should be exposed through a manifest.

```yaml
component: PatientCard
import: package:my_app/widgets/patient_card.dart
category: Healthcare
props:
  title:
    type: String
    bindable: true
  subtitle:
    type: String
    bindable: true
  status:
    type: String
    bindable: true
  isSelected:
    type: bool
    bindable: true
events:
  onTap:
    type: void Function()
preview:
  sampleData:
    title: Somchai Prasert
    subtitle: Room A203
    status: Active
    isSelected: false
```

The designer does not need to parse the custom widget implementation. It only needs props, events, preview values, and code-generation mapping.

---

## 18. Layout System

The designer should generate Flutter-native layout using:

- Row
- Column
- Stack
- Expanded
- Flexible
- Padding
- Align
- Center
- SizedBox
- ConstrainedBox
- Container
- ListView
- GridView
- SingleChildScrollView
- LayoutBuilder
- Wrap

Absolute positioning should not be the default.

Required layout operations:

- wrap with Padding;
- wrap with Container;
- wrap with Expanded/Flexible;
- convert Row/Column where safe;
- reorder children;
- adjust spacing/gap;
- edit alignment;
- edit constraints;
- edit margin/padding visually;
- configure safe area;
- configure scroll behavior.

---

## 19. Responsive Variants

The designer should support a master layout with breakpoint/platform overrides.

```yaml
variants:
  mobile:
    breakpoint: "width < 600"
    overrides:
      navigation.type: BottomNavigationBar
      content.padding: spacing.md

  tablet:
    breakpoint: "600 <= width < 1024"
    overrides:
      navigation.type: NavigationRail
      content.maxWidth: 840

  desktop:
    breakpoint: "width >= 1024"
    overrides:
      navigation.type: NavigationRail
      content.maxWidth: 1180
```

Required preview targets:

- phone portrait;
- phone landscape;
- tablet portrait;
- tablet landscape;
- desktop 720p;
- desktop 1080p;
- custom size.

---

## 20. Undo / Redo

Undo/redo must be command-based.

Example commands:

```text
AddWidgetCommand
DeleteWidgetCommand
MoveWidgetCommand
SetPropertyCommand
SetBindingCommand
WrapWidgetCommand
ChangeLayoutCommand
ChangeVariantOverrideCommand
AddDataSourceCommand
UpdateDataSourceCommand
DeleteDataSourceCommand
```

Requirements:

1. Every canvas operation must be undoable.
2. Every Object Inspector edit must be undoable.
3. Every binding edit must be undoable.
4. Every data source edit must be undoable.
5. Composite edits should be grouped where appropriate.
6. Redo must work symmetrically.
7. Schema changes must be transaction-safe.

---

## 21. MVP Scope

### Phase 1: Static Visual Designer

- desktop designer shell;
- component palette;
- visual canvas;
- widget tree;
- Object Inspector;
- basic built-in components;
- schema save/load;
- undo/redo command system;
- static Dart view code generation.

Initial components:

- Text
- Button
- TextField
- Container
- Row
- Column
- Padding
- Center
- Card
- ListView
- Form

### Phase 2: JSON Fixture Data Preview

- JSON fixture data source;
- schema inference from JSON;
- object and collection bindings;
- list/card/form preview;
- binding validation;
- normal/empty/loading/error preview states.

### Phase 3: ViewModel Contract Binding

- contract definition;
- generated contract interface;
- mock ViewModel preview;
- action binding;
- enabled/visible/text binding;
- generated view depends on contract.

### Phase 4: Responsive Preview

- preview multiple screen sizes;
- breakpoint definitions;
- responsive overrides;
- layout overflow warnings.

### Phase 5: REST Preview Proxy

- design-time REST data source;
- fetch preview data;
- save response as fixture;
- cache response;
- infer schema;
- mask sensitive data;
- prevent design-time credentials from entering generated code.

---

## 22. Example User Stories

### Story 1: Create a login form

As a Flutter developer, I want to visually create a login form so that I can generate a clean Flutter view and connect it to my own login ViewModel.

Acceptance criteria:

- user can drag TextField and Button components;
- user can edit labels, hint text, padding, and alignment;
- user can bind username/password fields to a ViewModel contract;
- user can bind login button to a login action;
- generated code compiles in a Flutter app.

### Story 2: Preview patient list with sample data

As a healthcare app developer, I want to preview a patient list with sample data during design so that I can adjust card layout, text density, and empty/loading states before running the app.

Acceptance criteria:

- user can add a JSON fixture data source;
- user can infer Patient schema;
- user can bind ListView items to Patient collection;
- user can design PatientCard item template;
- user can switch between normal, empty, loading, and error preview states.

### Story 3: Bind generated view to developer-owned ViewModel

As a Flutter developer, I want the generated view to depend on a contract so that my business logic remains separate and testable.

Acceptance criteria:

- designer generates an abstract contract;
- generated view accepts the contract as a constructor parameter;
- developer can implement the contract manually;
- view does not contain API logic.

### Story 4: Use REST response as design-time data

As a developer, I want to fetch a REST response during design so that I can create accurate UI from real API structure without embedding secrets in production code.

Acceptance criteria:

- REST data source supports URL, method, headers, and root path;
- request runs through design-time proxy;
- response can be saved as fixture;
- schema can be inferred;
- sensitive fields can be masked;
- credentials are not generated into app code.

### Story 5: Use undo/redo safely

As a user, I want every visual edit to be undoable so that I can experiment with layout without fear.

Acceptance criteria:

- moving, deleting, adding, wrapping, and property editing are undoable;
- redo restores undone operations;
- undo/redo works for Object Inspector edits;
- undo/redo works for bindings and data sources.

---

## 23. Functional Requirements

### 23.1 Designer shell

- Provide a desktop visual designer.
- Support opening/saving designer schema files.
- Show canvas, component palette, widget tree, Object Inspector, and data source tray.

### 23.2 Component palette

- Expose built-in Flutter-compatible components.
- Group components by category.
- Allow dragging components to the canvas or widget tree.

### 23.3 Object Inspector

- Show editable properties for the selected component.
- Validate property types.
- Support responsive override editing.
- Support binding selection from available data sources/contracts.

### 23.4 Schema

- Store screen design in a text-based schema.
- Include widgets, layout, properties, styles, variants, data sources, preview profiles, and bindings.
- Support schema versioning.

### 23.5 Preview

- Render a preview from schema.
- Support switching screen sizes.
- Support switching preview data profiles.
- Display overflow and broken binding warnings.

### 23.6 Code generation

- Generate Flutter/Dart view code from schema.
- Generate ViewModel contract code where configured.
- Format generated code.
- Avoid emitting design-time secrets.

### 23.7 Data preview

- Support JSON fixture data sources.
- Support REST preview data sources in a later phase.
- Support mock ViewModel sources.
- Support object and collection binding.
- Validate binding types.

### 23.8 Undo/redo

- Support undo/redo for all user-visible editing operations.
- Use a command-based model.

---

## 24. Non-Functional Requirements

### 24.1 Performance

- Canvas edits should feel immediate.
- Preview updates should be fast enough for iterative design.
- Large forms should remain editable.
- Code generation should be deterministic and fast.

### 24.2 Reliability

- Schema save/load must be robust.
- Designer should avoid corrupting schema files.
- Broken bindings should be shown clearly.
- Generated code should be reproducible.

### 24.3 Security

- Design-time credentials must not be written into generated production code.
- REST proxy should support masking sensitive data.
- Cached preview data should be explicit and controllable.

### 24.4 Version control

- Schema files should be readable and diffable.
- Generated files should be deterministic.
- Project structure should work well with Git.

### 24.5 Extensibility

- Built-in components should use the same metadata model as custom components.
- Custom widgets should be registerable via manifests.
- Future state-management integrations should be possible.

---

## 25. Risks and Mitigations

### Risk: Generated code is rejected by Flutter developers

Mitigation: keep code simple, idiomatic, and predictable.

### Risk: Designer becomes too much like a low-code platform

Mitigation: keep business logic outside scope and focus on View composition.

### Risk: Full Dart round-trip becomes a trap

Mitigation: use schema as View source of truth and avoid arbitrary Dart round-trip in MVP.

### Risk: Data preview leaks sensitive information

Mitigation: support masking, fixtures, credential separation, and no design-time secret generation.

### Risk: Layout generated by visual designer is poor Flutter

Mitigation: use Flutter-native layout primitives and avoid absolute positioning by default.

### Risk: Undo/redo becomes unreliable

Mitigation: implement command-based editing from day one.

---

## 26. Open Questions

1. Should the first designer app itself be built in Flutter desktop?
2. Should schema format be JSON, YAML, or both?
3. Should generated code be state-management neutral, or support Provider/Riverpod first?
4. Should ViewModel contracts be generated as abstract classes, interfaces, mixins, or adapters?
5. Should preview runtime render schema directly, generate temporary Dart code, or use a hybrid approach?
6. How much theming should be managed by the designer in MVP?
7. How should custom widget manifests be discovered?
8. Should REST proxy be local-only in MVP?
9. Should web preview be supported later?
10. What extension should be used: `.ffd.yaml`, `.ffd.json`, or another extension?

---

## 27. Recommended Initial Technical Direction

1. Use schema-first for the View.
2. Generate Dart from schema.
3. Keep state management neutral.
4. Start with JSON fixtures before REST preview.
5. Build undo/redo before complex visual editing.
6. Add REST preview after fixture preview works.
7. Use custom component manifests instead of parsing arbitrary custom widget code.

---

## 28. Suggested Milestones

### M0 — Design Schema and Static Designer Prototype

Deliverables:

1. Initial schema model.
2. Minimal designer app shell.
3. Widget tree model.
4. Object Inspector for basic properties.
5. Command-based undo/redo.
6. Basic canvas preview.
7. Code generation for simple screens.
8. Login form example.

Success criteria:

- user can create a simple login form visually;
- user can save/open schema;
- user can undo/redo edits;
- user can generate Dart code;
- generated Dart code compiles in example Flutter app.

### M1 — Design-Time Data Preview

Deliverables:

1. JSON fixture data source.
2. Schema inference from JSON.
3. Collection binding.
4. Object binding.
5. ListView item template designer.
6. Preview profiles: normal, empty, loading, error.
7. Binding validation.
8. Patient list example.

Success criteria:

- user can import JSON fixture;
- user can bind ListView to collection;
- user can design card template using item fields;
- user can preview normal/empty/loading/error states;
- broken bindings are detected.

### M2 — ViewModel Contract Binding

Deliverables:

1. Contract editor.
2. Generated abstract contract.
3. Mock ViewModel preview.
4. Action binding.
5. Enabled/visible binding.
6. Patient list with refresh/open actions.

Success criteria:

- generated view accepts ViewModel contract;
- developer can implement contract manually;
- designer can preview mock contract data;
- actions are generated as calls to contract methods.

---

## 29. Draft Product Definition

`Flutter Form Designer` is a developer-first RAD Visual View Composer for Flutter.

It helps developers visually design Flutter views using component-based editing, Object Inspector configuration, Flutter-native layout management, responsive variants, design-time data preview, and type-safe binding to developer-owned ViewModel/Controller contracts.

The product intentionally owns only the View layer. It generates clean Flutter/Dart view code while preserving developer freedom over business logic, APIs, repositories, services, and state management.

Its key differentiator is:

> Delphi-style design-time data-aware visual composition for Flutter business application views.

---

## 30. Immediate Next Steps

1. Create `docs/architecture.md`.
2. Create `docs/schema-format.md`.
3. Create `docs/design-time-data-preview.md`.
4. Create `README.md` with product overview and project status.
5. Create issues/milestones for M0, M1, and M2.
6. Decide whether to prototype the designer as a Flutter desktop app.
7. Define initial `.ffd.yaml` schema.
8. Build login form example.
9. Build patient list JSON fixture example.
10. Build first code generator spike.
