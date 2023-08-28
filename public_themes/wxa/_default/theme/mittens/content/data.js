file = {
  title: 'Test',
  meta: {
    title: 'Test',
    featured_img: {
      src:'/uploads/pic1.jpg'
    },
    shelf: {
      price: 10000,
      dis_price: 8000,
      discounts: [
        {tagname: 'xxx'},
        {tagname: 'test'},
        {tagname: 'xxx'},
      ]
    }
  },
  date: '2018-12-12',
  price: 1200,
  tags: [],
  updated: parseInt(Date.now() / 1000),
  creation: parseInt(Date.now() / 1000),
  content: '',
}

var SIM_DATA = {
  'file': file,

  'contents': [
    file, file, file, file,
    file, file,
  ],

  'segements': [
  ],

  'visit': {
    ip: 0,
    page: 0,
    pv: 0,
    uv: 0,
    vs: 0,
  }

}