import App from './App.svelte';
import './mobile.css';

const app = new App({
	target: document.body,
	props: {
		name: 'world'
	}
});

export default app;