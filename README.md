<h1 align="center">
  🐹 + 🚀
  <br>Spaceship Ember.js<br>
</h1>

<h4 align="center">
  <a href="https://emberjs.com" target="_blank">Ember.js</a> section for Spaceship prompt
</h4>

<p align="center">
  <a href="https://github.com/spaceship-prompt/spaceship-ember/releases">
    <img src="https://img.shields.io/github/v/release/spaceship-prompt/spaceship-ember.svg?style=flat-square"
      alt="GitHub Release" />
  </a>

  <a href="https://github.com/spaceship-prompt/spaceship-ember/actions">
    <img src="https://img.shields.io/github/workflow/status/spaceship-prompt/spaceship-ember/ci?style=flat-square"
      alt="GitHub Workflow Status" />
  </a>

  <a href="https://twitter.com/SpaceshipPrompt">
    <img src="https://img.shields.io/badge/twitter-%40SpaceshipPrompt-00ACEE.svg?style=flat-square"
      alt="Spaceship Twitter" />
  </a>

  <a href="https://discord.gg/NTQWz8Dyt9">
    <img
      src="https://img.shields.io/discord/859409950999707668?label=discord&logoColor=white&style=flat-square"
      alt="Chat on Discord"
    />
  </a>
</p>

Current Ember.js version, through ember-cli (`🐹`).

## Installing

You need to source this plugin somewhere in your dotfiles. Here's how to do it with some popular tools:

### [Oh-My-Zsh]

Execute this command to clone this repo into Oh-My-Zsh plugin's folder:

```zsh
git clone https://github.com/spaceship-prompt/spaceship-ember.git $ZSH_CUSTOM/plugins/spaceship-ember
```

Include `spaceship-ember` in Oh-My-Zsh plugins list:

```zsh
plugins=($plugins spaceship-ember)
```

### [zplug]

```zsh
zplug "spaceship-prompt/spaceship-ember"
```

### [antigen]

```zsh
antigen bundle "spaceship-prompt/spaceship-ember"
```

### [antibody]

```zsh
antibody bundle "spaceship-prompt/spaceship-ember"
```

### [zinit]

```zsh
zinit light "spaceship-prompt/spaceship-ember"
```

### [zgen]

```zsh
zgen load "spaceship-prompt/spaceship-ember"
```

### [sheldon]

```toml
[plugins.spaceship-ember]
github = "spaceship-prompt/spaceship-ember"
```

## Usage

After installing, add the following line to your `.zshrc` in order to include Ember section in the prompt:

```zsh
spaceship add ember
```

## Options

Ember.js section is shown only in directories containing a `ember-cli-build.js` file.

| Variable                 |              Default               | Meaning                                       |
| :----------------------- | :--------------------------------: | --------------------------------------------- |
| `SPACESHIP_EMBER_SHOW`   |               `true`               | Current Ember.js section                      |
| `SPACESHIP_EMBER_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Ember.js section                |
| `SPACESHIP_EMBER_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Ember.js section                 |
| `SPACESHIP_EMBER_SYMBOL` |               `🐹·`                | Character to be shown before Ember.js version |
| `SPACESHIP_EMBER_COLOR`  |               `210`                | Color of Ember.js section                     |

## License

MIT © [Denys Dovhan](http://denysdovhan.com) and [contributors][spaceship-contributors]

<!-- References -->

[Oh-My-Zsh]: https://ohmyz.sh/
[zplug]: https://github.com/zplug/zplug
[antigen]: https://antigen.sharats.me/
[antibody]: https://getantibody.github.io/
[zinit]: https://github.com/zdharma/zinit
[zgen]: https://github.com/tarjoilija/zgen
[sheldon]: https://sheldon.cli.rs/
[spaceship-contributors]: https://github.com/spaceship-prompt/spaceship-prompt/graphs/contributors
