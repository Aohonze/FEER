---
title: React入门笔记
date: 2020-05-07 11:07:19
permalink: /pages/30c68a/
categories: 
  - 个人博客
  - React篇
tags: 
  - 
---
# React入门学习总结

## 一、基本使用





## 二、





## 三、高级使用



### React性能优化

> React默认：父组件有更新，子组件无条件更新。

**SCU**：通过`shuldeComponentsUpdate`生命周期钩子函数设定子组件的更新条件，而不是默认的true值，从而对组建的更新时机优化。





## 四、Redux

### 基本概念 

#### store state

```js
import { createStore } from 'redux';

/**
 * 这是一个 reducer，形式为 (state, action) => state 的纯函数。
 * 描述了 action 如何把 state 转变成下一个 state。
 *
 * state 的形式取决于你，可以是基本类型、数组、对象、
 * 甚至是 Immutable.js 生成的数据结构。惟一的要点是
 * 当 state 变化时需要返回全新的对象，而不是修改传入的参数。
 *
 * 下面例子使用 `switch` 语句和字符串来做判断，但你可以写帮助类(helper)
 * 根据不同的约定（如方法映射）来判断，只要适用你的项目即可。
 */
function counter(state = 0, action) {
  switch (action.type) {
  case 'INCREMENT':
    return state + 1;
  case 'DECREMENT':
    return state - 1;
  default:
    return state;
  }
}

// 创建 Redux store 来存放应用的状态。
// API 是 { subscribe, dispatch, getState }。
let store = createStore(counter);

// 可以手动订阅更新，也可以事件绑定到视图层。
store.subscribe(() =>
  console.log(store.getState())
);

// 改变内部 state 惟一方法是 dispatch 一个 action。
// action 可以被序列化，用日记记录和储存下来，后期还可以以回放的方式执行
store.dispatch({ type: 'INCREMENT' });
// 1
store.dispatch({ type: 'INCREMENT' });
// 2
store.dispatch({ type: 'DECREMENT' });
// 1
```



### 单向数据流

#### dispatch(action)



#### reducer -> newState



#### subscribe触发通知



### React-redux



#### Provider



#### connect



### 异步action



### 中间件