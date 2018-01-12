<template lang="html">
  <div class="">
    <p><nuxt-link to="/">投稿一覧へ</nuxt-link></p>
    <h1>post.title.rendered</h1>
    <div v-html="post.content.rendered" />
  </div>
</template>

<script>
import axios from 'axios'

export default {
  async asyncData ({ params, isServer, redirect }) {
    const { slug } = params
    const API_ROOT = `${isServer ? 'http://nuxtandwpapi_wp_1:8080' : 'http://localhost:5000'}/wp-json/wp/v2`
    let data = null

    try {
      console.log(`${API_ROOT}/posts?_embed=true&slug=${slug}`)
      const res = await axios.get(`${API_ROOT}/posts?_embed=true&slug=${slug}`)
      data = res.data
    } catch (e) {
      console.log(e)
      redirect('/')
    }

    return {
      post: data[0]
    }
  }
}
</script>

<style lang="css">
</style>
