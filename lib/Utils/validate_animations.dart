import 'dart:math';
import 'package:provider/provider.dart';

String getAnimation(name, context) {
  if (name == "exodia") {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/exodia.mp4';
  } else if (name == 'Earthbound Immortal Wiraqocha Rasca' ||
      name == 'Imortal Terrestre Wiraqocha Rasca') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_allasta.mp4';
  } else if (name == 'Embodiment of Apophis' ||
      name == 'Encarnação de Apophis') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_aphopis.mp4';
  } else if (name == 'Arcana Force EX - The Light Ruler' ||
      name == 'Força Arcana EX - O Governador da Luz') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_arcana_ex.mp4';
  } else if (name == 'Armed Dragon LV7' || name == 'Dragão Armado LV7') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_armed_dragon_lv7.mp4';
  } else if (name == 'Earthbound Immortal Aslla piscu' ||
      name == 'Imortal Terrestre Aslla piscu') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_aslla.mp4';
  } else if (name == 'Barrel Dragon' || name == 'Dragão Revólver') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_barrel_dragon.mp4';
  } else if (name == 'Black Luster Soldier' ||
      name == 'Soldado do Lustro Negro') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_black_luster_soldier.mp4';
  } else if (name == 'Black Rose Dragon' || name == 'Dragão da Rosa Negra') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_black_rose.mp4';
  } else if (name == 'Black-Winged Dragon' || name == 'Dragão de Asas Negras') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_black_wind_dragon_Trim.mp4';
  } else if (name == 'Bloom Diva the Melodious Choir' ||
      name == ' Diva Florescente, a Coral Melodiosa') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_bloom_diva.mp4';
  } else if (name == 'Blue-Eyes White Dragon' ||
      name == 'Dragão Branco de Olhos Azuis') {
    var rng = Random();
    List<String> videos = [
      'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_blue_eyes_1.mp4',
      'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_blue_eyes_2.mp4'
    ];
    int number = rng.nextInt(videos.length);
    return videos[number];
  } else if (name == 'Blue-Eyes Ultimate Dragon' ||
      name == 'Dragão Definitivo de Olhos Azuis') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_blue_eyes_ultimate_dragon.mp4';
  } else if (name == 'Blue-Eyes Alternative White Dragon' ||
      name == 'Dragão Branco Alternativo de Olhos Azuis') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_blue_eyes_alternative.mp4';
  } else if (name == 'Indiora Doom Volt the Cubic Emperor' ||
      name == 'Indiora Volt Mortal, o Imperador Cúbico') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_cubic_indiora.mp4';
  } else if (name == 'Cyber Blader' || name == 'Lâmina Ciber') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_cyber_blade.mp4';
  } else if (name == 'Cyber End Dragon' || name == 'Dragão Final Cibernético') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_cyber_end_dragon.mp4';
  } else if (name == 'Dark Necrofear' || name == 'Necrofear das Trevas') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_dark_necrofear.mp4';
  } else if (name == 'Dark Magician' || name == 'Mago Negro') {
    var rng = Random();
    List<String> videos = [
      'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_dark_magica_yugi.mp4',
      'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_dark_magica_yugi.mp4',
      'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_dark_magican_arkana.mp4'
    ];
    int number = rng.nextInt(videos.length);
    return videos[number];
  } else if (name == 'Dark Magician Girl' || name == 'Pequena Maga Negra') {
    var rng = Random();
    List<String> videos = [
      'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_dark_magican_girl_2.mp4',
      'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_dark_magican_girl.mp4'
    ];
    int number = rng.nextInt(videos.length);
    return videos[number];
  } else if (name == 'D/D/D Doom King Armageddon' ||
      name == 'D/D/D Armagedom, o Rei do Fim') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_ddd_king.mp4';
  } else if (name == 'Earthbound Immortal Ccapac Apu' ||
      name == 'Imortal Terrestre Ccapac Apu') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_descente_ccapuc.mp4';
  } else if (name == 'Infernity Doom Dragon') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_doom_dragon.mp4';
  } else if (name == 'The Winged Dragon of Ra' ||
      name == 'O Dragão Alado de Rá') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_dragon_of_la.mp4';
  } else if (name == 'Rainbow Dragon' || name == 'Dragão Arco-Íris') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_dragon_rainbow.mp4';
  } else if (name == 'Ancient Fairy Dragon' || name == 'Dragão Fada Antigo') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_dragon_wind.mp4';
  } else if (name == 'Elemental HERO Flame Wingman' ||
      name == 'Homem-Alado das Chamas, o HERÓI do Elemento') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_elemental_hero.mp4';
  } else if (name == 'Evil HERO Malicious Fiend' ||
      name == 'HERÓI Maligno Demônio Malicioso') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_evil_hero.mp4';
  } else if (name == 'Fairy Cheer Girl' || name == 'Fada Menina de Torcida') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_fairy_girl.mp4';
  } else if (name == 'The Legendary Fisherman' ||
      name == 'O Pescador Lendário') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_fishman.mp4';
  } else if (name == 'Galaxy-Eyes Photon Dragon' ||
      name == 'Dragão de Fóton de Olhos das Galáxias') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_galayx_eyes_dragon.mp4';
  } else if (name == 'Gandora the Dragon of Destruction' ||
      name == 'Gandora o Dragão da Destruição') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_gandora.mp4';
  } else if (name == 'Gate Guardian' || name == 'Guardião do Portão') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_gate_guardian.mp4';
  } else if (name == 'Goyo Guardian' || name == 'Guardião Goyo') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_goyo_guardian.mp4';
  } else if (name == 'Hamon, Lord of Striking Thunder' ||
      name == 'Hamon, o Senhor do Trovão Impactante') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_hamon.mp4';
  } else if (name == 'Destiny HERO - Plasma' ||
      name == ' HERÓI do Destino - Plasma') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_hero_destiny_plasma.mp4';
  } else if (name == 'Meklord Emperor Wisel' ||
      name == 'Senhormek Imperador Wisel') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_imperator_merlok.mp4';
  } else if (name == 'Insect Queen' || name == 'Rainha dos Insetos') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_insect_queen.mp4';
  } else if (name == 'Jinzo') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_jinzo.mp4';
  } else if (name == 'Junk Warrior' || name == 'Guerreiro Sucata') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_junk_warrior.mp4';
  } else if (name == 'Harpie Lady Sisters' || name == 'Irmãs de Lady Harpia') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_lady_harpys.mp4';
  } else if (name == 'Lava Golem' || name == 'Golem de Lava') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_lava_golem.mp4';
  } else if (name == 'Life Stream Dragon' ||
      name == 'Dragão do Fluxo de Vida') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_life_strem_dragon.mp4';
  } else if (name == 'Ancient Gear Golem' ||
      name == 'Golem do Mecanismo Antigo') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_machine_antigy.mp4';
  } else if (name == 'Masked Beast Des Gardius' ||
      name == 'Demnio Mascarado Des Gardius') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_mask_beast.mp4';
  } else if (name == 'Meklord Astro Mekanikle' ||
      name == 'Senhormek Astro Mekanikle') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_meklord.mp4';
  } else if (name == 'Elemental HERO Divine Neos' ||
      name == 'Herói Elemental Neos Divino') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_neo_divine.mp4';
  } else if (name == 'Elemental HERO Neos' ||
      name == 'Neos, o HERÓI do Elemento') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_neos.mp4';
  } else if (name == 'Number 6: Chronomaly Atlandis' ||
      name == 'Número 6: Cronomalia Atlande') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_number_6.mp4';
  } else if (name == 'Number 15: Gimmick Puppet Giant Grinder' ||
      name == 'Número 15: Engenhoca Marionete Amolador Gigante') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_number_15.mp4';
  } else if (name == 'Number C39: Utopia Ray' ||
      name == 'Número C39: Raio Utopia') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_number_39_utopia_c.mp4';
  } else if (name == 'Number 39: Utopia' || name == 'Número 39: Utopia') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_number_39.mp4';
  } else if (name == 'Number 32: Shark Drake' ||
      name == 'Número 32: Dragonete Tubarão') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_number32.mp4';
  } else if (name == 'Obelisk the Tormentor' ||
      name == 'Obelisco, o Atormentador') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_obelisk.mp4';
  } else if (name == 'Odd-Eyes Dragon' ||
      name == 'Dragão Pêndulo de Olhos Anômalos') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_odd_eyes_dragon_pendulum.mp4';
  } else if (name == 'Ojama King' || name == 'Rei Ojama') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_ojama_king.mp4';
  } else if (name == 'Orgoth the Relentless' ||
      name == 'Orgoth, o Implacável') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_orgoth.mp4';
  } else if (name == 'Power Tool Dragon' || name == 'Dragão Ferramenteiro') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_power_tool_dragon.mp4';
  } else if (name == 'Raviel, Lord of Phantasms' ||
      name == 'Raviel, o Senhor dos Fantasmas') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_raviel.mp4';
  } else if (name == 'Red Dragon Archfiend' ||
      name == 'Dragão Vermelho Arquidemônio') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_red_dragon_arctype.mp4';
  } else if (name == 'Red-Eyes Black Dragon' ||
      name == 'Dragão Negro de Olhos Vermelhos') {
    var rng = Random();
    List<String> videos = [
      'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_red_eyes_black_dragon.mp4',
      'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_red_eyes_black_dragon2.mp4'
    ];
    int number = rng.nextInt(videos.length);
    return videos[number];
  } else if (name == 'Relinquished' || name == 'Renunciado') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_reliqished.mp4';
  } else if (name == 'Superheavy Samurai Big Benkei' ||
      name == 'Samurai Superpesado Grande Benkei') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_samurai_big_benkei.mp4';
  } else if (name == 'Shooting Star Dragon' ||
      name == 'Dragão da Explosão Estelar') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_shooting_star_dragon.mp4';
  } else if (name == 'Silent Magician LV8' || name == 'Mago Silencioso LV8') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_silent_magican_lv8.mp4';
  } else if (name == 'Slifer the Sky Dragon' ||
      name == 'Slifer, o Dragão Celeste') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_slifer.mp4';
  } else if (name == 'Stardust Dragon' || name == 'Dragão da Poeira Estelar') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_stardust_dragon.mp4';
  } else if (name == 'Abyss Actor - Superstar' ||
      name == 'Ator do Abismo - Superstar') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_super_start.mp4';
  } else if (name == 'Super Vehicroid Jumbo Drill') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_super_vehicroid.mp4';
  } else if (name == 'T.G. Halberd Cannon' || name == 'T.G. Canho Alabarda') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_tg_halberd.mp4';
  } else if (name == 'Tin Archduke' || name == 'Arquiduque de Lata') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_tim_archudke.mp4';
  } else if (name == 'Ultimate Tyranno') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_ultimate_tirano.mp4';
  } else if (name == 'Uria, Lord of Searing Flames' ||
      name == 'Uria, o Senhor das Chamas Cortantes') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_uria.mp4';
  } else if (name == 'Vampire Lord' || name == 'Senhor dos Vampiros') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_vampire_lord.mp4';
  } else if (name == 'Volcanic Doomfire' ||
      name == 'Condenação de Fogo Vulcânico') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_volvanic_doomfire.mp4';
  } else if (name == 'Water Dragon' || name == 'Dragão de Água') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_water_dragon.mp4';
  } else if (name == 'Yubel') {
    return 'https://salsicha1001.github.io/repository_images_videos/assets/animation/en/card_yubel.mp4';
  } else {
    return null;
  }
}
