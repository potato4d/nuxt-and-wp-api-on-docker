<template lang="html">
  <div class="">
    {{JSON.stringify(data)}}
  </div>
</template>

<script>
import axios from 'axios'

export default {
  async asyncData ({ params, isServer, redirect }) {
    console.log(process.env)
    const { slug } = params
    const API_ROOT = `${isServer ? 'http://nuxtandwpapi_wp_1' : 'http://localhost:8000'}/wp-json/wp/v2`
    let data = null

    try {
      console.log(`${API_ROOT}/posts?_embed=true&slug=${slug}`)
      const res = await axios.get(`${API_ROOT}/posts?_embed=true&slug=${slug}`)
      data = res.data
    } catch (e) {
      // console.log(e)
      // redirect('/')
    }

    return {
      data
    }
  }
}
</script>

<style lang="css">
</style>
