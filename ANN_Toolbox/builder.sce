// =============================================================================
// Copyright INRIA 2008
// Copyright DIGITEO 2010 - 2011
// Allan CORNET
// =============================================================================
mode(-1);
lines(0);

function builder_main()

TOOLBOX_NAME  = "ANN_toolbox";
TOOLBOX_TITLE = "ANN toolbox";
toolbox_dir   = get_absolute_file_path("builder.sce");

// Check Scilab's version
// =============================================================================

try
    v = getversion("scilab");
catch
    error(gettext("Scilab 5.4 or more is required."));
end

if v(2) < 4 then
    // new API in scilab 5.4
    error(gettext('Scilab 5.4 or more is required.'));
end
clear v;

// Check modules_manager module availability
// =============================================================================
if ~isdef('tbx_build_loader') then
  error(msprintf(gettext('%s module not installed."), 'modules_manager'));
end

// Action
// =============================================================================

tbx_builder_macros(toolbox_dir);
// tbx_builder_help(toolbox_dir);
tbx_build_loader(TOOLBOX_NAME, toolbox_dir);
tbx_build_cleaner(TOOLBOX_NAME, toolbox_dir);

endfunction
// =============================================================================
builder_main()
clear builder_main;
// =============================================================================
