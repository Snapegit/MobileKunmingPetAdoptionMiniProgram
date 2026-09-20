const config = {
    get() {
        return {
            url : process.env.VUE_APP_BASE_API_URL + process.env.VUE_APP_BASE_API + '/',
            name: process.env.VUE_APP_BASE_API,
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/cl62366192/client/h5/index.html'
        }
    },
    getProjectName(){
        return {
            projectName: "微信小程序昆明地区宠物领养平台"
        } 
    }
}
export default config
