## Parameters:

### 1. SubjectID
* The entire subject directory name, e.g., `<UID>_<SessionID>_PL2017`
* An implicit /mindhive/evlab/u/Shared/SUBJECTS is prepended to the path.
### 2. ModelName
* The string used in the `#model_name` field during first level modeling.
### 3. Contrast
* The exact string used in the `#contrasts` field during first level modeling. E.g., `'S-N'`. 
### 4. Output path
* The full path to a preexisting output directory.
* If `[]` is provided, a default output directory will be created in this software folder. 
### 5. P-value (optional)
* Double value, `0.001` by default
