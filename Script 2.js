document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById('login-form');
    form.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent default form submission

        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        
        // Using Fetch API to post data to login.php
        fetch('login.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `username=${encodeURIComponent(username)}&password=${encodeURIComponent(password)}`
        })
        .then(response => response.json())
        .then(data => {
            if (data.authenticated) {
                window.location.href = 'dashboard.html'; // Redirect to dashboard on success
            } else {
                alert('Invalid username or password.'); // Show error message on failure
            }
        })
        .catch(error => console.error('Error:', error));
    });
});



    const userData = {
        name: "Drippy Coffman",
        email: "drippyjoel@drip.com",
        age: 25,
        gender: "Male",
        recentWorkouts: [
            { activity: "Sit Ups", reps: 50, sets: 3 },
            { activity: "Jogging/Running", distance: "3 km", duration: "25 minutes" }
        ]
    };

    function displayUserData() {
        document.getElementById('userName').innerText = userData.name;
        document.getElementById('userEmail').innerText = userData.email;
        document.getElementById('userAge').innerText = userData.age;
        document.getElementById('userGender').innerText = userData.gender;
    }

    function displayRecentWorkouts() {
        const workoutsContainer = document.getElementById('recentWorkouts');
        if (workoutsContainer) {
            userData.recentWorkouts.forEach(workout => {
                const workoutElement = document.createElement('li');
                workoutElement.innerText = `${workout.activity}: ${workout.reps || ''} reps, ${workout.sets || ''} sets, ${workout.distance || ''}, ${workout.duration || ''}`;
                workoutsContainer.appendChild(workoutElement);
            });
        }
    }

    if (window.location.pathname.includes('dashboard.html')) {
        displayUserData();
        displayRecentWorkouts();
    }

    // Implementing swipe functionality to navigate through authenticated pages
    let startX, startY;
    document.addEventListener('mousedown', function(e) {
        startX = e.clientX;
        startY = e.clientY;
    });
    document.addEventListener('mouseup', function(e) {
        let distX = e.clientX - startX;
        let distY = e.clientY - startY;
        if (Math.abs(distX) > Math.abs(distY)) {
            if (distX > 0) {
                navigateRight();
            } else {
                navigateLeft();
            }
        }
    });

    function navigateRight() {
        switch (window.location.pathname.split("/").pop()) {
            case 'index.html':
                window.location.href = 'dashboard.html';
                break;
            case 'dashboard.html':
                window.location.href = 'exercises.html';
                break;
            case 'exercises.html':
                window.location.href = 'plans.html';
                break;
            case 'plans.html':
                window.location.href = 'progress.html';
                break;
        }
    }

    function navigateLeft() {
        switch (window.location.pathname.split("/").pop()) {
            case 'dashboard.html':
                window.location.href = 'index.html';
                break;
            case 'exercises.html':
                window.location.href = 'dashboard.html';
                break;
            case 'plans.html':
                window.location.href = 'exercises.html';
                break;
            case 'progress.html':
                window.location.href = 'plans.html';
                break;
        }
    }

    document.addEventListener('mousedown', swipeStart);
    document.addEventListener('mouseup', swipeEnd);
    document.querySelectorAll('nav a').forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            const url = this.getAttribute('href');
            window.location.href = url;
        });
    });
