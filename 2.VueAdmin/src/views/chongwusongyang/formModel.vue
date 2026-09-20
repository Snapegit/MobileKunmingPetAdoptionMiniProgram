<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="12">
						<el-form-item label="宠物名称" prop="chongwumingcheng">
							<el-input class="list_inp" v-model="form.chongwumingcheng" placeholder="宠物名称"
								 type="text" 								:readonly="!isAdd||disabledForm.chongwumingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="宠物图片" prop="chongwutupian">
							<uploads
								:disabled="!isAdd||disabledForm.chongwutupian?true:false"
								action="file/upload" 
								tip="请上传宠物图片" 
								:limit="3" 
								style="width: 100%;text-align: left;"
								:fileUrls="form.chongwutupian?form.chongwutupian:''" 
								@change="chongwutupianUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="宠物类型" prop="chongwuleixing">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.chongwuleixing?true:false"
								v-model="form.chongwuleixing" 
								placeholder="请选择宠物类型"
								>
								<el-option v-for="(item,index) in chongwuleixingLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="宠物性别" prop="chongwuxingbie">
							<el-input class="list_inp" v-model="form.chongwuxingbie" placeholder="宠物性别"
								 type="text" 								:readonly="!isAdd||disabledForm.chongwuxingbie?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="宠物年龄" prop="chongwunianling">
							<el-input class="list_inp" v-model="form.chongwunianling" placeholder="宠物年龄"
								 type="text" 								:readonly="!isAdd||disabledForm.chongwunianling?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="是否已注射疫苗" prop="shifouyizhusheyimiao">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.shifouyizhusheyimiao?true:false"
								v-model="form.shifouyizhusheyimiao" 
								placeholder="请选择是否已注射疫苗"
								>
								<el-option v-for="(item,index) in shifouyizhusheyimiaoLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="是否已绝育" prop="shifouyijueyu">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.shifouyijueyu?true:false"
								v-model="form.shifouyijueyu" 
								placeholder="请选择是否已绝育"
								>
								<el-option v-for="(item,index) in shifouyijueyuLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="是否已驱虫" prop="shifouyiquchong">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.shifouyiquchong?true:false"
								v-model="form.shifouyiquchong" 
								placeholder="请选择是否已驱虫"
								>
								<el-option v-for="(item,index) in shifouyiquchongLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="是否免费" prop="shifoumianfei">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.shifoumianfei?true:false"
								v-model="form.shifoumianfei" 
								placeholder="请选择是否免费"
								>
								<el-option v-for="(item,index) in shifoumianfeiLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="发布时间" prop="fabushijian">
							<el-date-picker
								class="list_date"
								v-model="form.fabushijian"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.fabushijian?true:false"
								placeholder="请选择发布时间" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="账号" prop="zhanghao">
							<el-input class="list_inp" v-model="form.zhanghao" placeholder="账号"
								 type="text" 								:readonly="!isAdd||disabledForm.zhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="姓名" prop="xingming">
							<el-input class="list_inp" v-model="form.xingming" placeholder="姓名"
								 type="text" 								:readonly="!isAdd||disabledForm.xingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="手机" prop="shouji">
							<el-input class="list_inp" v-model="form.shouji" placeholder="手机"
								 type="text" 								:readonly="!isAdd||disabledForm.shouji?true:false" />
						</el-form-item>
					</el-col>

				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="formModel_cancel" @click="closeClick">取消</el-button>
					<el-button class="formModel_confirm" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'chongwusongyang'
	const formName = '宠物送养'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		chongwumingcheng : false,
		chongwutupian : false,
		chongwuleixing : false,
		chongwuxingbie : false,
		chongwunianling : false,
		shifouyizhusheyimiao : false,
		shifouyijueyu : false,
		shifouyiquchong : false,
		shifoumianfei : false,
		fabushijian : false,
		zhanghao : false,
		xingming : false,
		shouji : false,
		sfsh : false,
		shhf : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		chongwumingcheng: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		chongwutupian: [
		],
		chongwuleixing: [
		],
		chongwuxingbie: [
		],
		chongwunianling: [
		],
		shifouyizhusheyimiao: [
		],
		shifouyijueyu: [
		],
		shifouyiquchong: [
		],
		shifoumianfei: [
		],
		fabushijian: [
		],
		zhanghao: [
		],
		xingming: [
		],
		shouji: [
			{ validator: validateMobile, trigger: 'blur' },
		],
		sfsh: [
		],
		shhf: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//宠物图片上传回调
	const chongwutupianUploadSuccess=(e)=>{
		form.value.chongwutupian = e
	}
	//宠物类型列表
	const chongwuleixingLists = ref([])
	//是否已注射疫苗列表
	const shifouyizhusheyimiaoLists = ref([])
	//是否已绝育列表
	const shifouyijueyuLists = ref([])
	//是否已驱虫列表
	const shifouyiquchongLists = ref([])
	//是否免费列表
	const shifoumianfeiLists = ref([])
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			chongwumingcheng: '',
			chongwutupian: '',
			chongwuleixing: '',
			chongwuxingbie: '',
			chongwunianling: '',
			shifouyizhusheyimiao: '',
			shifouyijueyu: '',
			shifouyiquchong: '',
			shifoumianfei: '',
			fabushijian: '',
			zhanghao: '',
			xingming: '',
			shouji: '',
			sfsh: '待审核',
			shhf: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
			form.value.fabushijian = context?.$toolUtil.getCurDateTime()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='chongwumingcheng'){
					form.value.chongwumingcheng = row[x];
					disabledForm.value.chongwumingcheng = true;
					continue;
				}
				if(x=='chongwutupian'){
					form.value.chongwutupian = row[x];
					disabledForm.value.chongwutupian = true;
					continue;
				}
				if(x=='chongwuleixing'){
					form.value.chongwuleixing = row[x];
					disabledForm.value.chongwuleixing = true;
					continue;
				}
				if(x=='chongwuxingbie'){
					form.value.chongwuxingbie = row[x];
					disabledForm.value.chongwuxingbie = true;
					continue;
				}
				if(x=='chongwunianling'){
					form.value.chongwunianling = row[x];
					disabledForm.value.chongwunianling = true;
					continue;
				}
				if(x=='shifouyizhusheyimiao'){
					form.value.shifouyizhusheyimiao = row[x];
					disabledForm.value.shifouyizhusheyimiao = true;
					continue;
				}
				if(x=='shifouyijueyu'){
					form.value.shifouyijueyu = row[x];
					disabledForm.value.shifouyijueyu = true;
					continue;
				}
				if(x=='shifouyiquchong'){
					form.value.shifouyiquchong = row[x];
					disabledForm.value.shifouyiquchong = true;
					continue;
				}
				if(x=='shifoumianfei'){
					form.value.shifoumianfei = row[x];
					disabledForm.value.shifoumianfei = true;
					continue;
				}
				if(x=='fabushijian'){
					form.value.fabushijian = row[x];
					disabledForm.value.fabushijian = true;
					continue;
				}
				if(x=='zhanghao'){
					form.value.zhanghao = row[x];
					disabledForm.value.zhanghao = true;
					continue;
				}
				if(x=='xingming'){
					form.value.xingming = row[x];
					disabledForm.value.xingming = true;
					continue;
				}
				if(x=='shouji'){
					form.value.shouji = row[x];
					disabledForm.value.shouji = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			form.value.sfsh='待审核'
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('zhanghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.zhanghao = json.zhanghao
				disabledForm.value.zhanghao = true;
			}
			if(json.hasOwnProperty('xingming')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.xingming = json.xingming
				disabledForm.value.xingming = true;
			}
			if(json.hasOwnProperty('shouji')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.shouji = json.shouji
				disabledForm.value.shouji = true;
			}
		})
		context?.$http({
			url: `option/chongwufenlei/chongwuleixing`,
			method: 'get'
		}).then(res=>{
			chongwuleixingLists.value = res.data.data
		})
		shifouyizhusheyimiaoLists.value = "是,否".split(',')
		shifouyijueyuLists.value = "是,否".split(',')
		shifouyiquchongLists.value = "是,否".split(',')
		shifoumianfeiLists.value = "免费,收押金".split(',')
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		if(form.value.chongwutupian!=null) {
			form.value.chongwutupian = form.value.chongwutupian.replace(new RegExp(context?.$config.url,"g"),"");
		}
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									formVisible.value = false
									emit('formModelChange')
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							formVisible.value = false
							emit('formModelChange')
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		border: 0px solid rgba(254, 182, 203, 0.5);
		border-radius: 0px;
		padding: 40px 30px;
		margin: 0;
		background: #fff;
		// form item
		:deep(.el-form-item) {
			margin: 0 150px 20px 0;
			background: none;
			display: flex;
			//label
			.el-form-item__label {
			 color: #666;
			 background: none;
			 font-weight: 500;
			 display: block;
			 width: 150px;
			 text-align: right;
			 min-width: 150px;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 120px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					border: 1px solid rgba(255, 255, 255, 0.25);
					border-radius: 0px;
					padding: 0 10px;
					color: #666;
					background: rgba(0, 0, 0, 0.1);
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					height: 36px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
						padding: 0;
					}
					.is-focus {
						box-shadow: none !important;
					}
				}
				//日期选择器
				.list_date {
					border: 1px solid rgba(255, 255, 255, 0.25);
					border-radius: 0px;
					color: #666;
					background: rgba(0, 0, 0, 0.1);
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 250px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
					}
				}
				// 下拉框
				.list_sel {
					border: 1px solid rgba(255, 255, 255, 0.25);
					border-radius: 0px;
					padding: 0 10px;
					color: #666;
					background: rgba(0, 0, 0, 0.1);
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 300px;
					//去掉默认样式
					.select-trigger{
						height: 100%;
						.el-input{
							height: 100%;
							.el-input__wrapper{
								border: none;
								box-shadow: none;
								background: none;
								border-radius: 0;
								height: 100%;
								padding: 0;
							}
							.is-focus {
								box-shadow: none !important;
							}
						}
					}
				}
				//图片上传样式
				.el-upload-list  {
					//提示语
					.el-upload__tip {
						margin: 7px 0 0;
						color: #999;
						display: flex;
						font-size: 14px;
						justify-content: flex-start;
						align-items: center;
					}
					//外部盒子
					.el-upload--picture-card {
						border: 1px solid rgba(255, 255, 255, 0.25);
						cursor: pointer;
						border-radius: 0px;
						background: rgba(0, 0, 0, 0.1);
						width: 120px;
						line-height: 70px;
						text-align: center;
						height: 60px;
						//图标
						.el-icon{
							color: #999;
							font-size: 26px;
						}
					}
					.el-upload-list__item {
						border: 1px solid rgba(255, 255, 255, 0.25);
						cursor: pointer;
						border-radius: 0px;
						background: rgba(0, 0, 0, 0.1);
						width: 120px;
						line-height: 70px;
						text-align: center;
						height: 60px;
					}
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: center;
		.formModel_cancel {
			border: 1px solid #d43f3a;
			cursor: pointer;
			border-radius: 3px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #fff;
			background: rgba(217, 83, 79, 0.45);
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_cancel:hover {
		}
		
		.formModel_confirm {
			border: 1px solid #357ebd;
			cursor: pointer;
			border-radius: 3px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #fff;
			background: rgba(66, 139, 202, 0.55);
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_confirm:hover {
		}
	}
</style>