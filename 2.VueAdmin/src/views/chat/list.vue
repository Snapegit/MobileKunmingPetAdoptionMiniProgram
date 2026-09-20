<template>
	<div>
		<div class="chat-contain">
			<el-table v-loading="listLoading" :data="list" border
				:stripe='true'>
				<el-table-column prop="ask" :resizable='true' :sortable='true' align="left" header-align="left" label="新消息">
					<template #default="scope">
						{{scope.row.ask}}
					</template>
				</el-table-column>
				<el-table-column prop="ask" :resizable='true' :sortable='true' align="left" header-align="left" label="状态">
					<template #default="scope">
						<el-tag v-if="scope.row.isreply==1" type="success">未回复</el-tag>
						<el-tag v-if="scope.row.isreply==0" type="info">已回复</el-tag>
					</template>
				</el-table-column>
				<el-table-column prop="ask" :resizable='true' :sortable='true' align="left" header-align="left" label="操作">
					<template #default="scope">
						<el-button type="primary" @click="replyClick(scope.row)">回复</el-button>
					</template>
				</el-table-column>
			</el-table>
			<el-pagination
				background
				:layout="layouts.join(',')"
				:total="total" 
				:page-size="listQuery.limit"
				prev-text="Prev"
				next-text="Next"
				:hide-on-single-page="false"
				:style='{"padding":"0","margin":"20px 0 0","whiteSpace":"nowrap","color":"#333","textAlign":"center","width":"100%","fontWeight":"500"}'
				@size-change="sizeChange"
				@current-change="currentChange" 
				@prev-click="prevClick"
				@next-click="nextClick"  />
			<el-dialog v-model="formVisible" :title="'客服回复'" width="70%" destroy-on-close @close="delTimer">
				<el-form ref="formRef" :model="form" class="chat_view">
					<div class="chat-content">
						<div :key="item.id" v-for="item in chatList">
							<div class="chat_time" v-if="item.showTime">{{item.addtime}}</div>
							<div v-if="item.ask" class="left-content">
								<el-alert v-if="!item.img" class="text-content" :title="item.ask" :closable="false"
									type="success"></el-alert>
								<el-image v-if="item.img" :src="$config.url + item.img"
									class="chat_img" fit="scale-down"
									:preview-src-list="[$config.url + item.img]"></el-image>
							</div>
							<div v-else class="right-content">
								<el-alert v-if="!item.img" class="text-content" :title="item.reply" :closable="false"
									type="warning"></el-alert>
								<el-image v-if="item.img" :src="$config.url + item.img"
									class="chat_img" fit="scale-down"
									:preview-src-list="[$config.url + item.img]"></el-image>
							</div>
							<div class="clear-float"></div>
						</div>
					</div>
					<div class="input_box">
						<el-input class="input" v-model="form.reply" placeholder="请回复" type="textarea" />
						<img src="http://chy2.gdnxeco.com/20230912/f60a0c39a6d34289b50c151949711b67.png" class="inp_add"
							@click="askType=!askType" alt="">
					</div>
					<div class="upload_box" v-if="askType">
						<el-upload class="upload-demo" :action="action" :on-success="uploadSuccess"
							:show-file-list="false">
							<el-button type="primary">上传图片</el-button>
						</el-upload>
					</div>
					<div class="save_box">
						<el-button type="primary" @click="replySave">发送</el-button>
					</div>
				</el-form>
			</el-dialog>
		</div>
	</div>
</template>

<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		onMounted,
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const list = ref([])
	const listQuery = ref({
		page: 1,
		limit: 20,
		sort: 'id',
		order: 'desc',
		isreply: 1
	})
	const listLoading = ref(false)
	//获取列表
	const getList = () => {
		let params = listQuery.value
		listLoading.value = true
		context?.$http({
			url: 'chat/page',
			method: 'get',
			params: params
		}).then(res => {
			listLoading.value = false
			list.value = res.data.data.list
			total.value = Number(res.data.data.total)
		})
	}
	//分页
	const total = ref(0)
	const layouts = ref(["prev","pager","next"])
	const sizeChange = (size) => {
		listQuery.value.limit = size
		getList()
	}
	const currentChange = (page) => {
		listQuery.value.page = page
		getList()
	}
	const prevClick = () => {
		listQuery.value.page = listQuery.value.page - 1
		getList()
	}
	const nextClick = () => {
		listQuery.value.page = listQuery.value.page + 1
		getList()
	}
	//分页
	//form
	const formVisible = ref(false)
	const nowId = ref(0)
	const form = ref({
		reply: ''
	})
	//对话列表
	const chatList = ref([])
	//回复按钮
	const replyClick = (row) => {
		nowId.value = row.userid
		getChatList()
		formVisible.value = true
		timer.value = setInterval(() => {
			getChatList()
		}, 3000)
	}
	//定时器
	const timer = ref(null)
	const delTimer = () => {
		clearInterval(timer.value)
	}
	const getChatList = () => {
		context?.$http({
			url: 'chat/page',
			method: 'get',
			params: {
				limit: 1000,
				sort: 'addtime',
				order: 'asc',
				userid: nowId.value
			}
		}).then(res => {
			for (let x in res.data.data.list) {
				if (res.data.data.list[x].ask) {
					if (res.data.data.list[x].ask.split('/').length > 1) {
						if (res.data.data.list[x].ask.split('/')[0] == 'file') {
							res.data.data.list[x].img = res.data.data.list[x].ask
						}
					}
				}
				if (res.data.data.list[x].reply) {
					if (res.data.data.list[x].reply.split('/').length > 1) {
						if (res.data.data.list[x].reply.split('/')[0] == 'file') {
							res.data.data.list[x].img = res.data.data.list[x].reply
						}
					}
				}
				if(x==0){
					res.data.data.list[x].showTime = 1
				}else{
					let jian = new Date(res.data.data.list[x].addtime).getTime() - new Date(res.data.data.list[x-1].addtime).getTime()
					if(jian>18000){
						res.data.data.list[x].showTime = 1
					}else{
						res.data.data.list[x].showTime = 0
					}
				}
			}
			chatList.value = res.data.data.list
			nextTick(() => {
				let div = document.getElementsByClassName('chat-content')[0]
				setTimeout(() => {
					if (div)
						div.scrollTop = div.scrollHeight
				}, 100)
			})
		})
	}
	//发送信息
	const replySave = () => {
		form.value.userid = nowId.value
		if (form.value.reply) {
			context?.$http({
				url: 'chat/save',
				method: 'post',
				data: form.value
			}).then(res => {
				context?.$toolUtil.message('发送成功', 'success', () => {
					getChatList()
					form.value.reply = ''

				})
			})
		}
	}
	//图片
	const action = ref(`${context?.$config.name}/file/upload`)
	const askType = ref(false)
	const uploadSuccess = (e) => {

		let params = {
			reply: 'file/' + e.file,
			userid: nowId.value
		}
		context?.$http({
			url: 'chat/save',
			method: 'post',
			data: params
		}).then(res => {
			context?.$toolUtil.message('发送成功', 'success', () => {
				getChatList()
				form.value.reply = ''

			})
		})
	}
	const init = () => {
		getList()
	}
	init()
</script>

<style lang="scss" scoped>

	// 表格样式
	.el-table {
		border-radius: 0px;
		padding: 0;
		box-shadow: 0 1px 3px rgba(33,33,33,.2);
		background: rgba(68,70,79,0.5);
		width: 100%;
		border-color: rgba(254, 182, 203, 0.5);
		border-width: 0px 0 0 0px;
		border-style: solid;
		:deep(.el-table__header-wrapper) {
			thead {
				color: #ccc;
				font-weight: 500;
				width: 100%;
				tr {
					background: #24262d;
					th {
						padding: 4px 0;
						background: none;
						border-color: #333;
						border-width: 0 0px 1px 0;
						border-style: solid;
						text-align: left;
						.cell {
							padding: 0 10px;
							word-wrap: normal;
							word-break: break-all;
							white-space: normal;
							font-weight: bold;
							display: inline-block;
							vertical-align: middle;
							width: 100%;
							line-height: 24px;
							position: relative;
							text-overflow: ellipsis;
						}
					}
				}
			}
		}
		:deep(.el-table__body-wrapper) {
			tbody {
				width: 100%;
				tr {
					background: none;
					td {
						padding: 6px 0;
						color: #ccc;
						background: none;
						border-color: #d2d2d2;
						border-width: 0 0px 0px 0;
						border-style: solid;
						text-align: left;
						.cell {
							padding: 0 10px;
							overflow: hidden;
							word-break: break-all;
							white-space: normal;
							line-height: 24px;
							text-overflow: ellipsis;
							// 回复
							.el-button--primary {
								border: 0px solid #d58512;
								cursor: pointer;
								border-radius: 0px;
								padding: 6px 12px;
								margin: 0 6px 6px 0;
								color: #fff;
								background: #4CAF50;
								width: auto;
								font-size: 13px;
								height: auto;
							}
							// 回复-悬浮
							.el-button--primary:hover {
							}
						}
					}
				}
				tr.el-table__row--striped {
					td {
						background: #24262d !important;
					}
				}
				tr:hover {
					td {
						padding: 6px 0;
						color: #fff;
						background: rgba(0, 0, 0, 0.10);
						border-color: #d2d2d2;
						border-width: 0 0px 0px 0;
						border-style: solid;
						text-align: left;
					}
				}
			}
		}
	}
	// 分页器
	.el-pagination {
		// 总页码
		:deep(.el-pagination__total) {
			margin: 0 10px 0 0;
			color: #666;
			font-weight: 400;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 28px;
			height: 28px;
		}
		// 上一页
		:deep(.btn-prev) {
			border: none;
			border-radius: 0px;
			padding: 0 5px;
			margin: 0 5px;
			color: #fff;
			background: none;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 26px;
			min-width: 35px;
			height: 26px;
		}
		// 下一页
		:deep(.btn-next) {
			border: none;
			border-radius: 0px;
			padding: 0 5px;
			margin: 0 5px;
			color: #fff;
			background: none;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 26px;
			min-width: 35px;
			height: 26px;
		}
		// 上一页禁用
		:deep(.btn-prev:disabled) {
			border: none;
			cursor: not-allowed;
			border-radius: 0px;
			padding: 0 5px;
			margin: 0 5px;
			color: #fff;
			background: none;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 26px;
			height: 26px;
		}
		// 下一页禁用
		:deep(.btn-next:disabled) {
			border: none;
			cursor: not-allowed;
			border-radius: 0px;
			padding: 0 5px;
			margin: 0 5px;
			color: #fff;
			background: none;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 26px;
			height: 26px;
		}
		// 页码
		:deep(.el-pager) {
			padding: 0;
			margin: 0;
			display: inline-block;
			vertical-align: top;
			// 数字
			.number {
				cursor: pointer;
				border: 1px solid rgba(255, 255, 255, 0.3);
				padding: 0 4px;
				margin: 0 5px;
				color: #fff;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 26px;
				border-radius: 0px;
				background: none;
				text-align: center;
				min-width: 30px;
				height: 26px;
			}
			// 数字悬浮
			.number:hover {
				cursor: pointer;
				border: 1px solid rgba(0, 0, 0, 0.05);
				padding: 0 4px;
				margin: 0 5px;
				color: #fff;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 26px;
				border-radius: 0px;
				background: rgba(0, 0, 0, 0.25);
				text-align: center;
				min-width: 30px;
				height: 26px;
			}
			// 选中
			.number.active {
				cursor: default;
				border: 1px solid rgba(0, 0, 0, 0.05);
				padding: 0 4px;
				margin: 0 5px;
				color: #fff;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 26px;
				border-radius: 0px;
				background: rgba(0, 0, 0, 0.25);
				text-align: center;
				min-width: 30px;
				height: 26px;
			}
		}
		// sizes
		:deep(.el-pagination__sizes) {
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 28px;
			height: 28px;
			.el-select {
				border: 1px solid #DCDFE6;
				cursor: pointer;
				padding: 0;
				color: #606266;
				display: inline-block;
				font-size: 13px;
				line-height: 28px;
				border-radius: 3px;
				outline: 0;
				background: #FFF;
				width: 100%;
				text-align: center;
				height: 28px;
			}
		}
		// 跳页
		:deep(.el-pagination__jump) {
			margin: 0 0 0 24px;
			color: #606266;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 28px;
			height: 28px;
			// 输入框
			.el-input {
				border: 1px solid #DCDFE6;
				cursor: pointer;
				padding: 0 3px;
				color: #606266;
				display: inline-block;
				font-size: 14px;
				line-height: 28px;
				border-radius: 3px;
				outline: 0;
				background: #FFF;
				width: 100%;
				text-align: center;
				height: 28px;
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
		}
	}
	// 聊天总盒子
	.chat_view {
		border: 0px solid rgba(254, 182, 203, 0.5);
		border-radius: 4px;
		padding: 30px;
		margin: 30px 0;
		flex-direction: column;
		background: #fff;
		display: flex;
		// 聊天内容盒子
		.chat-content {
			border: 1px solid #eee;
			border-radius: 4px;
			padding: 0 0 30px;
			max-height: 300px;
			margin: 0 0 30px 0;
			background: #fff;
			overflow-y: scroll;
			height: 300px;
			// 聊天时间
			.chat_time{
				padding: 6px 0;
				color: #bbb;
				width: 100%;
				font-size: 14px;
				text-align: center;
			}
			// 提问盒子
			.left-content {
				padding: 10px;
				margin: 0 0 10px;
				float: left;
				// 文字样式
				:deep(.el-alert--success){
					color: #67C23A;
					background: #f0f9eb;
					.el-alert__title {
						font-size: inherit;
					}
				}
				// 聊天图片
				.chat_img {
					margin: 10px;
					width: 120px;
				}
			}
			// 回复盒子
			.right-content {
				padding: 10px;
				margin: 0 0 10px;
				float: right;
				// 文字样式
				:deep(.el-alert--warning){
					color: #E6A23C;
					background: #fdf6ec;
					.el-alert__title {
						font-size: inherit;
					}
				}
				// 聊天图片
				.chat_img {
					margin: 10px;
					width: 120px;
				}
			}
		}
		// 输入内容盒子
		.input_box{
			display: flex;
			align-items: center;
			// 输入框
			:deep(.el-textarea__inner) {
				border: 1px solid #eee;
				border-radius: 4px;
				padding: 12px;
				color: #333;
				background: #fff;
				width: 100%;
				font-size: 14px;
				min-height: 120px;
			}
			// 操作按钮
			.inp_add {
				cursor: pointer;
				margin: 0 0 0 10px;
				width: 30px;
			}
		}
		// 操作盒子
		.upload_box {
			margin: 20px 0 0;
			display: flex;
			width: 100%;
			justify-content: flex-start;
			align-items: center;
			:deep(.upload-demo) {
				// 按钮
				.el-button--primary {
					border: 1px solid #eea23680;
					cursor: pointer;
					border-radius: 3px;
					padding: 0 24px;
					margin: 0 10px 0 0;
					color: #eea236;
					background: rgba(240, 173, 78, 0.2);
					width: auto;
					font-size: 14px;
					height: 36px;
				}
				// 按钮悬浮
				.el-button--primary:hover {
				}
			}
		}
		// 发送盒子
		.save_box {
			margin: 10px 0 0;
			display: flex;
			width: 100%;
			justify-content: center;
			// 按钮
			:deep(.el-button--primary) {
				border: 1px solid #357ebd80;
				cursor: pointer;
				border-radius: 3px;
				padding: 0 24px;
				margin: 0 10px 0 0;
				color: #357ebd;
				background: rgba(66, 139, 202, 0.2);
				width: auto;
				font-size: 14px;
				min-width: 100px;
				height: 36px;
			}
			// 按钮悬浮
			:deep(.el-button--primary:hover) {
			}
		}
		.clear-float {
			clear: both;
		}
	}
</style>