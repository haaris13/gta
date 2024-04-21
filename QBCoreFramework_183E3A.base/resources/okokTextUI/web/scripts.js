const notification = document.querySelector(".notification");
const iconContainer = document.querySelector(".icon-container");
const text = document.querySelector(".text");

fetch(`https://${GetParentResourceName()}/request_config`)
	.then((response) => response.json())
	.then((Config) => {
		window.addEventListener("message", (e) => {
			if (e.data.action === "show") {
				text.innerHTML = e.data.message;

				const kind = Config.Kinds[e.data.kind];
				notification.style.backgroundColor = kind?.backgroundColor;
				notification.style.borderColor = kind?.highlightColor;
				iconContainer.style.color = kind?.highlightColor;
				text.style.color = kind?.textColor;

				if (kind?.icon) {
					iconContainer.style.display = "block";
					const icon = document.createElement('i');
					icon.className = '';
					iconContainer.innerHTML = '';
					icon.className = kind.icon;

					// Append the icon to the icon container
					iconContainer.appendChild(icon);
				} else iconContainer.style.display = "none";

				if (e.data.rightAligned !== notification.classList.contains("is-right")) {
					notification.style.transition = "none";
					if (e.data.rightAligned === "right")
						notification.classList.add("is-right");
					else notification.classList.remove("is-right");
					notification.offsetWidth;
					notification.style.transition = "";
				}

				notification.classList.add("is-shown");

				if (e.data.playSound !== false) {
					const sound = new Audio("sound.mp3");
					sound.volume = 0.5;
					sound.play();
				}
			} else if (e.data.action === "hide") {
				notification.classList.remove("is-shown");
			}
		});
	});