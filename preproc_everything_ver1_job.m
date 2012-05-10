%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 3599 $)
%-----------------------------------------------------------------------
matlabbatch{1}.spm.tools.fieldmap.presubphasemag.subj.phase = {'/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/s-fieldmap_phase.img,1'};
matlabbatch{1}.spm.tools.fieldmap.presubphasemag.subj.magnitude = {'/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/s-fieldmap_mag-01.img,1'};
matlabbatch{1}.spm.tools.fieldmap.presubphasemag.subj.defaults.defaultsfile = {'/ncf/mri/01/users/mcmains/spm_scripting/pm_defaults.m'};
matlabbatch{1}.spm.tools.fieldmap.presubphasemag.subj.session(1).epi = {'/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00001.img,1'};
matlabbatch{1}.spm.tools.fieldmap.presubphasemag.subj.session(2).epi = {'/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00001.img,1'};
matlabbatch{1}.spm.tools.fieldmap.presubphasemag.subj.matchvdm = 1;
matlabbatch{1}.spm.tools.fieldmap.presubphasemag.subj.sessname = 'session';
matlabbatch{1}.spm.tools.fieldmap.presubphasemag.subj.writeunwarped = 1;
matlabbatch{1}.spm.tools.fieldmap.presubphasemag.subj.anat = {'/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/s-struct.img,1'};
matlabbatch{1}.spm.tools.fieldmap.presubphasemag.subj.matchanat = 1;
%%
matlabbatch{2}.spm.spatial.realignunwarp.data(1).scans = {
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00001.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00002.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00003.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00004.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00005.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00006.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00007.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00008.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00009.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00010.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00011.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00012.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00013.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00014.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00015.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00016.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00017.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00018.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00019.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00020.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00021.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00022.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00023.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00024.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00025.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00026.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00027.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00028.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00029.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00030.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00031.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00032.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00033.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00034.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00035.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00036.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00037.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00038.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00039.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00040.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00041.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00042.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00043.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00044.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00045.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00046.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00047.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00048.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00049.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00050.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00051.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00052.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00053.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00054.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00055.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00056.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00057.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00058.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00059.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00060.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00061.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00062.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00063.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00064.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00065.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00066.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00067.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00068.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00069.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00070.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00071.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00072.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00073.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00074.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00075.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00076.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00077.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00078.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00079.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00080.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00081.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00082.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00083.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00084.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00085.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00086.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00087.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00088.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00089.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00090.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00091.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00092.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00093.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00094.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00095.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00096.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00097.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00098.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00099.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00100.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00101.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00102.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00103.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00104.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00105.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00106.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00107.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00108.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00109.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00110.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00111.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00112.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00113.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00114.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00115.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00116.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00117.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run001-00118.img,1'
                                                          };
%%
matlabbatch{2}.spm.spatial.realignunwarp.data(1).pmscan(1) = cfg_dep;
matlabbatch{2}.spm.spatial.realignunwarp.data(1).pmscan(1).tname = 'Phase map (vdm* file)';
matlabbatch{2}.spm.spatial.realignunwarp.data(1).pmscan(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{2}.spm.spatial.realignunwarp.data(1).pmscan(1).tgt_spec{1}(1).value = 'image';
matlabbatch{2}.spm.spatial.realignunwarp.data(1).pmscan(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{2}.spm.spatial.realignunwarp.data(1).pmscan(1).tgt_spec{1}(2).value = 'e';
matlabbatch{2}.spm.spatial.realignunwarp.data(1).pmscan(1).sname = 'Presubtracted Phase and Magnitude Data: Voxel displacement map (Subj 1, Session 1)';
matlabbatch{2}.spm.spatial.realignunwarp.data(1).pmscan(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{2}.spm.spatial.realignunwarp.data(1).pmscan(1).src_output = substruct('()',{1}, '.','vdmfile', '{}',{1});
%%
matlabbatch{2}.spm.spatial.realignunwarp.data(2).scans = {
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00001.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00002.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00003.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00004.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00005.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00006.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00007.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00008.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00009.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00010.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00011.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00012.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00013.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00014.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00015.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00016.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00017.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00018.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00019.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00020.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00021.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00022.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00023.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00024.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00025.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00026.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00027.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00028.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00029.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00030.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00031.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00032.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00033.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00034.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00035.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00036.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00037.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00038.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00039.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00040.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00041.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00042.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00043.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00044.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00045.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00046.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00047.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00048.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00049.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00050.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00051.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00052.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00053.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00054.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00055.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00056.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00057.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00058.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00059.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00060.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00061.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00062.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00063.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00064.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00065.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00066.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00067.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00068.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00069.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00070.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00071.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00072.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00073.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00074.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00075.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00076.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00077.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00078.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00079.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00080.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00081.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00082.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00083.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00084.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00085.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00086.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00087.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00088.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00089.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00090.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00091.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00092.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00093.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00094.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00095.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00096.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00097.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00098.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00099.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00100.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00101.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00102.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00103.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00104.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00105.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00106.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00107.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00108.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00109.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00110.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00111.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00112.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00113.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00114.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00115.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00116.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00117.img,1'
                                                          '/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/f-run002-00118.img,1'
                                                          };
%%
matlabbatch{2}.spm.spatial.realignunwarp.data(2).pmscan(1) = cfg_dep;
matlabbatch{2}.spm.spatial.realignunwarp.data(2).pmscan(1).tname = 'Phase map (vdm* file)';
matlabbatch{2}.spm.spatial.realignunwarp.data(2).pmscan(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{2}.spm.spatial.realignunwarp.data(2).pmscan(1).tgt_spec{1}(1).value = 'image';
matlabbatch{2}.spm.spatial.realignunwarp.data(2).pmscan(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{2}.spm.spatial.realignunwarp.data(2).pmscan(1).tgt_spec{1}(2).value = 'e';
matlabbatch{2}.spm.spatial.realignunwarp.data(2).pmscan(1).sname = 'Presubtracted Phase and Magnitude Data: Voxel displacement map (Subj 1, Session 2)';
matlabbatch{2}.spm.spatial.realignunwarp.data(2).pmscan(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{2}.spm.spatial.realignunwarp.data(2).pmscan(1).src_output = substruct('()',{1}, '.','vdmfile', '{}',{2});
matlabbatch{2}.spm.spatial.realignunwarp.eoptions.quality = 0.9;
matlabbatch{2}.spm.spatial.realignunwarp.eoptions.sep = 4;
matlabbatch{2}.spm.spatial.realignunwarp.eoptions.fwhm = 5;
matlabbatch{2}.spm.spatial.realignunwarp.eoptions.rtm = 1;
matlabbatch{2}.spm.spatial.realignunwarp.eoptions.einterp = 2;
matlabbatch{2}.spm.spatial.realignunwarp.eoptions.ewrap = [0 0 0];
matlabbatch{2}.spm.spatial.realignunwarp.eoptions.weight = {''};
matlabbatch{2}.spm.spatial.realignunwarp.uweoptions.basfcn = [12 12];
matlabbatch{2}.spm.spatial.realignunwarp.uweoptions.regorder = 1;
matlabbatch{2}.spm.spatial.realignunwarp.uweoptions.lambda = 100000;
matlabbatch{2}.spm.spatial.realignunwarp.uweoptions.jm = 0;
matlabbatch{2}.spm.spatial.realignunwarp.uweoptions.fot = [4 5];
matlabbatch{2}.spm.spatial.realignunwarp.uweoptions.sot = 1;
matlabbatch{2}.spm.spatial.realignunwarp.uweoptions.uwfwhm = 4;
matlabbatch{2}.spm.spatial.realignunwarp.uweoptions.rem = 1;
matlabbatch{2}.spm.spatial.realignunwarp.uweoptions.noi = 5;
matlabbatch{2}.spm.spatial.realignunwarp.uweoptions.expround = 'Average';
matlabbatch{2}.spm.spatial.realignunwarp.uwroptions.uwwhich = [2 1];
matlabbatch{2}.spm.spatial.realignunwarp.uwroptions.rinterp = 4;
matlabbatch{2}.spm.spatial.realignunwarp.uwroptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.realignunwarp.uwroptions.mask = 1;
matlabbatch{2}.spm.spatial.realignunwarp.uwroptions.prefix = 'u';
matlabbatch{3}.spm.temporal.st.scans{1}(1) = cfg_dep;
matlabbatch{3}.spm.temporal.st.scans{1}(1).tname = 'Session';
matlabbatch{3}.spm.temporal.st.scans{1}(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{3}.spm.temporal.st.scans{1}(1).tgt_spec{1}(1).value = 'image';
matlabbatch{3}.spm.temporal.st.scans{1}(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{3}.spm.temporal.st.scans{1}(1).tgt_spec{1}(2).value = 'e';
matlabbatch{3}.spm.temporal.st.scans{1}(1).sname = 'Realign & Unwarp: Unwarped Images (Sess 1)';
matlabbatch{3}.spm.temporal.st.scans{1}(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{3}.spm.temporal.st.scans{1}(1).src_output = substruct('.','sess', '()',{1}, '.','uwrfiles');
matlabbatch{3}.spm.temporal.st.scans{2}(1) = cfg_dep;
matlabbatch{3}.spm.temporal.st.scans{2}(1).tname = 'Session';
matlabbatch{3}.spm.temporal.st.scans{2}(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{3}.spm.temporal.st.scans{2}(1).tgt_spec{1}(1).value = 'image';
matlabbatch{3}.spm.temporal.st.scans{2}(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{3}.spm.temporal.st.scans{2}(1).tgt_spec{1}(2).value = 'e';
matlabbatch{3}.spm.temporal.st.scans{2}(1).sname = 'Realign & Unwarp: Unwarped Images (Sess 2)';
matlabbatch{3}.spm.temporal.st.scans{2}(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{3}.spm.temporal.st.scans{2}(1).src_output = substruct('.','sess', '()',{2}, '.','uwrfiles');
matlabbatch{3}.spm.temporal.st.nslices = 40;
matlabbatch{3}.spm.temporal.st.tr = 2.56;
matlabbatch{3}.spm.temporal.st.ta = 2.496;
matlabbatch{3}.spm.temporal.st.so = [1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40];
matlabbatch{3}.spm.temporal.st.refslice = 39;
matlabbatch{3}.spm.temporal.st.prefix = 'a';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1) = cfg_dep;
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).tname = 'Reference Image';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).tgt_spec{1}(1).value = 'image';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).tgt_spec{1}(2).value = 'e';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).sname = 'Realign & Unwarp: Unwarped Mean Image';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).src_output = substruct('.','meanuwr');
matlabbatch{4}.spm.spatial.coreg.estimate.source = {'/ncf/mri/01/users/mcmains/spm_scripting/120418_spmtest/preproc/s-struct.img,1'};
matlabbatch{4}.spm.spatial.coreg.estimate.other = {''};
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
matlabbatch{5}.spm.spatial.preproc.data(1) = cfg_dep;
matlabbatch{5}.spm.spatial.preproc.data(1).tname = 'Data';
matlabbatch{5}.spm.spatial.preproc.data(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{5}.spm.spatial.preproc.data(1).tgt_spec{1}(1).value = 'image';
matlabbatch{5}.spm.spatial.preproc.data(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{5}.spm.spatial.preproc.data(1).tgt_spec{1}(2).value = 'e';
matlabbatch{5}.spm.spatial.preproc.data(1).sname = 'Coreg: Estimate: Coregistered Images';
matlabbatch{5}.spm.spatial.preproc.data(1).src_exbranch = substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{5}.spm.spatial.preproc.data(1).src_output = substruct('.','cfiles');
matlabbatch{5}.spm.spatial.preproc.output.GM = [0 0 1];
matlabbatch{5}.spm.spatial.preproc.output.WM = [0 0 1];
matlabbatch{5}.spm.spatial.preproc.output.CSF = [0 0 0];
matlabbatch{5}.spm.spatial.preproc.output.biascor = 1;
matlabbatch{5}.spm.spatial.preproc.output.cleanup = 0;
matlabbatch{5}.spm.spatial.preproc.opts.tpm = {
                                               '/ncf/apps/spm8/tpm/grey.nii'
                                               '/ncf/apps/spm8/tpm/white.nii'
                                               '/ncf/apps/spm8/tpm/csf.nii'
                                               };
matlabbatch{5}.spm.spatial.preproc.opts.ngaus = [2
                                                 2
                                                 2
                                                 4];
matlabbatch{5}.spm.spatial.preproc.opts.regtype = 'mni';
matlabbatch{5}.spm.spatial.preproc.opts.warpreg = 1;
matlabbatch{5}.spm.spatial.preproc.opts.warpco = 25;
matlabbatch{5}.spm.spatial.preproc.opts.biasreg = 0.0001;
matlabbatch{5}.spm.spatial.preproc.opts.biasfwhm = 60;
matlabbatch{5}.spm.spatial.preproc.opts.samp = 2;
matlabbatch{5}.spm.spatial.preproc.opts.msk = {''};
matlabbatch{6}.spm.spatial.normalise.write.subj(1).matname(1) = cfg_dep;
matlabbatch{6}.spm.spatial.normalise.write.subj(1).matname(1).tname = 'Parameter File';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).matname(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).matname(1).tgt_spec{1}(1).value = 'mat';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).matname(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).matname(1).tgt_spec{1}(2).value = 'e';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).matname(1).sname = 'Segment: Norm Params Subj->MNI';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).matname(1).src_exbranch = substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{6}.spm.spatial.normalise.write.subj(1).matname(1).src_output = substruct('()',{1}, '.','snfile', '()',{':'});
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(1) = cfg_dep;
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(1).tname = 'Images to Write';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(1).tgt_spec{1}(1).value = 'image';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(1).tgt_spec{1}(2).value = 'e';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(1).sname = 'Slice Timing: Slice Timing Corr. Images (Sess 1)';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(1).src_exbranch = substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(1).src_output = substruct('()',{1}, '.','files');
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(2) = cfg_dep;
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(2).tname = 'Images to Write';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(2).tgt_spec{1}(1).name = 'filter';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(2).tgt_spec{1}(1).value = 'image';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(2).tgt_spec{1}(2).name = 'strtype';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(2).tgt_spec{1}(2).value = 'e';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(2).sname = 'Slice Timing: Slice Timing Corr. Images (Sess 2)';
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(2).src_exbranch = substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{6}.spm.spatial.normalise.write.subj(1).resample(2).src_output = substruct('()',{2}, '.','files');
matlabbatch{6}.spm.spatial.normalise.write.subj(2).matname(1) = cfg_dep;
matlabbatch{6}.spm.spatial.normalise.write.subj(2).matname(1).tname = 'Parameter File';
matlabbatch{6}.spm.spatial.normalise.write.subj(2).matname(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{6}.spm.spatial.normalise.write.subj(2).matname(1).tgt_spec{1}(1).value = 'mat';
matlabbatch{6}.spm.spatial.normalise.write.subj(2).matname(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{6}.spm.spatial.normalise.write.subj(2).matname(1).tgt_spec{1}(2).value = 'e';
matlabbatch{6}.spm.spatial.normalise.write.subj(2).matname(1).sname = 'Segment: Norm Params Subj->MNI';
matlabbatch{6}.spm.spatial.normalise.write.subj(2).matname(1).src_exbranch = substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{6}.spm.spatial.normalise.write.subj(2).matname(1).src_output = substruct('()',{1}, '.','snfile', '()',{':'});
matlabbatch{6}.spm.spatial.normalise.write.subj(2).resample(1) = cfg_dep;
matlabbatch{6}.spm.spatial.normalise.write.subj(2).resample(1).tname = 'Images to Write';
matlabbatch{6}.spm.spatial.normalise.write.subj(2).resample(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{6}.spm.spatial.normalise.write.subj(2).resample(1).tgt_spec{1}(1).value = 'image';
matlabbatch{6}.spm.spatial.normalise.write.subj(2).resample(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{6}.spm.spatial.normalise.write.subj(2).resample(1).tgt_spec{1}(2).value = 'e';
matlabbatch{6}.spm.spatial.normalise.write.subj(2).resample(1).sname = 'Coreg: Estimate: Coregistered Images';
matlabbatch{6}.spm.spatial.normalise.write.subj(2).resample(1).src_exbranch = substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{6}.spm.spatial.normalise.write.subj(2).resample(1).src_output = substruct('.','cfiles');
matlabbatch{6}.spm.spatial.normalise.write.roptions.preserve = 0;
matlabbatch{6}.spm.spatial.normalise.write.roptions.bb = [-78 -112 -50
                                                          78 76 85];
matlabbatch{6}.spm.spatial.normalise.write.roptions.vox = [2 2 2];
matlabbatch{6}.spm.spatial.normalise.write.roptions.interp = 1;
matlabbatch{6}.spm.spatial.normalise.write.roptions.wrap = [0 0 0];
matlabbatch{6}.spm.spatial.normalise.write.roptions.prefix = 'w';
matlabbatch{7}.spm.spatial.smooth.data(1) = cfg_dep;
matlabbatch{7}.spm.spatial.smooth.data(1).tname = 'Images to Smooth';
matlabbatch{7}.spm.spatial.smooth.data(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{7}.spm.spatial.smooth.data(1).tgt_spec{1}(1).value = 'image';
matlabbatch{7}.spm.spatial.smooth.data(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{7}.spm.spatial.smooth.data(1).tgt_spec{1}(2).value = 'e';
matlabbatch{7}.spm.spatial.smooth.data(1).sname = 'Normalise: Write: Normalised Images (Subj 1)';
matlabbatch{7}.spm.spatial.smooth.data(1).src_exbranch = substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{7}.spm.spatial.smooth.data(1).src_output = substruct('()',{1}, '.','files');
matlabbatch{7}.spm.spatial.smooth.data(2) = cfg_dep;
matlabbatch{7}.spm.spatial.smooth.data(2).tname = 'Images to Smooth';
matlabbatch{7}.spm.spatial.smooth.data(2).tgt_spec{1}(1).name = 'filter';
matlabbatch{7}.spm.spatial.smooth.data(2).tgt_spec{1}(1).value = 'image';
matlabbatch{7}.spm.spatial.smooth.data(2).tgt_spec{1}(2).name = 'strtype';
matlabbatch{7}.spm.spatial.smooth.data(2).tgt_spec{1}(2).value = 'e';
matlabbatch{7}.spm.spatial.smooth.data(2).sname = 'Normalise: Write: Normalised Images (Subj 2)';
matlabbatch{7}.spm.spatial.smooth.data(2).src_exbranch = substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{7}.spm.spatial.smooth.data(2).src_output = substruct('()',{2}, '.','files');
matlabbatch{7}.spm.spatial.smooth.fwhm = [6 6 6];
matlabbatch{7}.spm.spatial.smooth.dtype = 0;
matlabbatch{7}.spm.spatial.smooth.im = 0;
matlabbatch{7}.spm.spatial.smooth.prefix = 's';
