import { writable } from "svelte/store";

export const chatHistory = writable([]);
export const currentChatId = writable(null);