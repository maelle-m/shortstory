import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", function() {
  const settingDropdown = document.getElementById('setting-dropdown');
  const customSettingField = document.getElementById('custom-setting-field');
  const themeDropdown = document.getElementById('theme-dropdown');
  const customThemeField = document.getElementById('custom-theme-field');
  const namesContainer = document.getElementById('names-container');
  const addNameBtn = document.getElementById('add-name-btn');

  addNameBtn.addEventListener('click', function(e) {
    e.preventDefault();
    const newField = document.createElement('input');
    newField.setAttribute('type', 'text');
    newField.setAttribute('name', 'story[character_names][]');
    newField.classList.add('form-control', 'character-name-field', 'mt-2');
    namesContainer.appendChild(newField);
  });

  function toggleCustomField(dropdown, customField) {
    if (dropdown.value === 'Other') {
      customField.style.display = 'block';
    } else {
      customField.style.display = 'none';
    }
  }

  settingDropdown.addEventListener('change', function() {
    toggleCustomField(this, customSettingField);
  });

  themeDropdown.addEventListener('change', function() {
    toggleCustomField(this, customThemeField);
  });

  toggleCustomField(settingDropdown, customSettingField);
  toggleCustomField(themeDropdown, customThemeField);
});
