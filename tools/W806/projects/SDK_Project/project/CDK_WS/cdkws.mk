.PHONY: clean All Project_Title Project_Build Project_PostBuild

All: Project_Title Project_Build Project_PostBuild

Project_Title:
	@echo "----------Building project:[ W806_SDK - BuildSet ]----------"

Project_Build:
	@make -r -f W806_SDK.mk -j 4 -C  W806_SDK 

Project_PostBuild:
	@echo Executing Post Build commands ...
	@cd "W806_SDK" && export CDKPath="D:/C-Sky/CDK" CDK_VERSION="V2.10.1" ProjectPath="E:/github/w806-pro/tools/W806/projects/SDK_Project/project/CDK_WS/W806_SDK/" && ../../../../../../../tools/W806/utilities/cdk_aft_build.sh;../../../../../../../tools/W806/utilities/aft_build_project.sh 
	@echo Done


clean:
	@echo "----------Cleaning project:[ W806_SDK - BuildSet ]----------"

