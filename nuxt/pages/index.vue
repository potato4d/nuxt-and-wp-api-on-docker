<template lang="html">
  <div>
    <h1>投稿一覧</h1>
    <ul>
      <li v-for="post in posts">
        <nuxt-link :to="`/posts/${post.slug}`">
          {{post.title.rendered}}
        </nuxt-link>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  async asyncData ({ isServer }) {
    const API_ROOT = `${isServer ? 'http://wp:8080' : 'http://localhost:5000'}/wp-json/wp/v2`
    let posts = null

    try {
      console.log(`${API_ROOT}/posts`)
      const res = await axios.get(`${API_ROOT}/posts`)
      posts = res.data
    } catch (e) {
      console.log(e)
    }

    return {
      posts
    }
  }
}
</script>

<style lang="css">
</style>
