	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import discusschongwuxinxi from '@/views/discusschongwuxinxi/list'
	import chongwuxinxi from '@/views/chongwuxinxi/list'
	import news from '@/views/news/list'
	import chongwulingyang from '@/views/chongwulingyang/list'
	import yonghu from '@/views/yonghu/list'
	import chat from '@/views/chat/list'
	import lingyangxuqiu from '@/views/lingyangxuqiu/list'
	import messages from '@/views/messages/list'
	import storeup from '@/views/storeup/list'
	import config from '@/views/config/list'
	import chongwusongyang from '@/views/chongwusongyang/list'
	import chongwufenlei from '@/views/chongwufenlei/list'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页Home',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/discusschongwuxinxi',
			name: '宠物信息评论',
			component: discusschongwuxinxi
		}
		,{
			path: '/chongwuxinxi',
			name: '宠物信息',
			component: chongwuxinxi
		}
		,{
			path: '/news',
			name: '宠物资讯',
			component: news
		}
		,{
			path: '/chongwulingyang',
			name: '宠物领养',
			component: chongwulingyang
		}
		,{
			path: '/yonghu',
			name: '用户',
			component: yonghu
		}
		,{
			path: '/chat',
			name: '在线咨询',
			component: chat
		}
		,{
			path: '/lingyangxuqiu',
			name: '领养需求',
			component: lingyangxuqiu
		}
		,{
			path: '/messages',
			name: '在线反馈',
			component: messages
		}
		,{
			path: '/storeup',
			name: '我的收藏',
			component: storeup
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		,{
			path: '/chongwusongyang',
			name: '宠物送养',
			component: chongwusongyang
		}
		,{
			path: '/chongwufenlei',
			name: '宠物分类',
			component: chongwufenlei
		}
		]
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
