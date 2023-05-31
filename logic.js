      // Game state variables
      let character = null;
      const missionsByRole = {
        //These are only examples koi bhi type ke missions daal saktey hain :D
        security_analyst: [
        { title: "Mission 1", description: "Analyze and identify security vulnerabilities in the system", difficulty: 1 },
        { title: "Mission 2", description: "Create a report on the security risks and mitigation strategies", difficulty: 2 },
        { title: "Mission 3", description: "Investigate a suspicious network activity and provide recommendations", difficulty: 3 }
        ],
        ethical_hacker: [ 
        { title: "Mission 1", description: "Perform penetration testing on the target system", difficulty: 1 },
        { title: "Mission 2", description: "Exploit a known vulnerability and gain unauthorized access", difficulty: 2 },
        { title: "Mission 3", description: "Securely hack into a target system and leave no trace", difficulty: 3 }
        ],
        network_defender: [
        { title: "Mission 1", description: "Monitor network traffic and detect suspicious activities", difficulty: 1 },
        { title: "Mission 2", description: "Implement network security measures and firewall rules", difficulty: 2 },
        { title: "Mission 3", description: "Respond to network incidents and perform incident analysis", difficulty: 3 }
        ]
      };

      // Function to create a character
      function createCharacter() {
        const nameInput = document.getElementById('name');
        const roleSelect = document.getElementById('role');
        const characterName = nameInput.value.trim();
        const characterRole = roleSelect.value;

        if (characterName && characterRole) {
          // Create the character object
          character = {
            name: characterName,
            role: characterRole,
            level: 1,
            experience: 0
          };

          // Hide character creation and display game world
          document.getElementById('characterCreation').style.display = 'none';
          document.getElementById('gameWorld').style.display = 'block';

          // Update the character information on the interface
          document.getElementById('characterName').textContent = character.name;
          document.getElementById('characterRole').textContent = character.role;

          // Display missions for the chosen role
          displayMissions();
        }
      }

      // Function to display missions based on the character's role
      function displayMissions() {
        const missionsContainer = document.getElementById('missions');
        const roleMissions = missionsByRole[character.role];

        missionsContainer.innerHTML = '';
        for (let mission of roleMissions) {
          const missionElement = document.createElement('div');
          missionElement.classList.add('mission');
          missionElement.textContent = mission.title;
          missionsContainer.appendChild(missionElement);
        }

        missionsContainer.style.display = 'block';
      }

      // Function to start a mission
      function startMission(missionId) {
  const mission = getMissionById(missionId);
  if (mission) {
    console.log(`Starting mission: ${mission.title}`);
    // Perform game logic based on mission and character role

    switch (character.role) {
      case 'security_analyst':
        // Game logic for security analyst missions
        if (mission.id === 1) {
          // Vulnerability Assessment mission
          console.log('Performing vulnerability assessment...');
          // Perform vulnerability assessment logic
        } else if (mission.id === 2) {
          // Incident Response mission
          console.log('Investigating security incident...');
          // Perform incident response logic
        } else if (mission.id === 3) {
          // Security Policy Review mission
          console.log('Reviewing security policies...');
          // Perform security policy review logic
        }
        break;

      case 'ethical_hacker':
        // Game logic for ethical hacker missions
        if (mission.id === 4) {
          // Penetration Testing mission
          console.log('Performing penetration testing...');
          // Perform penetration testing logic
        } else if (mission.id === 5) {
          // Wireless Network Audit mission
          console.log('Auditing wireless network...');
          // Perform wireless network audit logic
        } else if (mission.id === 6) {
          // Social Engineering Assessment mission
          console.log('Conducting social engineering assessment...');
          // Perform social engineering assessment logic
        }
        break;

      case 'network_defender':
        // Game logic for network defender missions
        if (mission.id === 7) {
          // Firewall Configuration mission
          console.log('Configuring firewall...');
          // Perform firewall configuration logic
        } else if (mission.id === 8) {
          // Intrusion Detection mission
          console.log('Monitoring for intrusions...');
          // Perform intrusion detection logic
        } else if (mission.id === 9) {
          // Security Device Management mission
          console.log('Managing security devices...');
          // Perform security device management logic
        }
        break;

      default:
        console.log('Invalid character role.');
        break;
    }
  }
}

      // Function to get a mission by ID
      function getMissionById(missionId) {
        const roleMissions = missionsByRole[character.role];
        return roleMissions.find(mission => mission.id === missionId);
      }

      // Background music playback
      const bgMusic = document.getElementById('bgMusic');
      bgMusic.play();