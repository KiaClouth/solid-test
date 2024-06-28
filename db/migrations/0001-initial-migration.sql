-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('USER', 'ADMIN');

-- CreateEnum
CREATE TYPE "State" AS ENUM ('PRIVATE', 'PUBLIC');

-- CreateEnum
CREATE TYPE "Element" AS ENUM ('NO_ELEMENT', 'LIGHT', 'DARK', 'WATER', 'FIRE', 'EARTH', 'WIND');

-- CreateEnum
CREATE TYPE "MonsterType" AS ENUM ('COMMON_MOBS', 'COMMON_MINI_BOSS', 'COMMON_BOSS', 'EVENT_MOBS', 'EVENT_MINI_BOSS', 'EVENT_BOSS');

-- CreateEnum
CREATE TYPE "ModifiersName" AS ENUM ('STR', 'INT', 'VIT', 'AGI', 'DEX', 'MAX_MP', 'AGGRO', 'WEAPON_RANGE', 'HP_REGEN', 'MP_REGEN', 'PHYSICAL_ATK', 'MAGICAL_ATK', 'WEAPON_ATK', 'UNSHEATHE_ATK', 'PHYSICAL_PIERCE', 'MAGICAL_PIERCE', 'CRITICAL_RATE', 'CRITICAL_DAMAGE', 'MAGIC_CRT_CONVERSION_RATE', 'MAGIC_CRT_DAMAGE_CONVERSION_RATE', 'SHORT_RANGE_DAMAGE', 'LONG_RANGE_DAMAGE', 'STRONGER_AGAINST_NETURAL', 'STRONGER_AGAINST_LIGHT', 'STRONGER_AGAINST_DARK', 'STRONGER_AGAINST_WATER', 'STRONGER_AGAINST_FIRE', 'STRONGER_AGAINST_EARTH', 'STRONGER_AGAINST_WIND', 'STABILITY', 'ACCURACY', 'ADDITIONAL_PHYSICS', 'ADDITIONAL_MAGIC', 'ANTICIPATE', 'GUARD_BREAK', 'REFLECT', 'ABSOLUTA_ACCURACY', 'ATK_UP_STR', 'ATK_UP_INT', 'ATK_UP_VIT', 'ATK_UP_AGI', 'ATK_UP_DEX', 'MATK_UP_STR', 'MATK_UP_INT', 'MATK_UP_VIT', 'MATK_UP_AGI', 'MATK_UP_DEX', 'ATK_DOWN_STR', 'ATK_DOWN_INT', 'ATK_DOWN_VIT', 'ATK_DOWN_AGI', 'ATK_DOWN_DEX', 'MATK_DOWN_STR', 'MATK_DOWN_INT', 'MATK_DOWN_VIT', 'MATK_DOWN_AGI', 'MATK_DOWN_DEX', 'MAX_HP', 'PHYSICAL_DEF', 'MAGICAL_DEF', 'PHYSICAL_RESISTANCE', 'MAGICAL_RESISTANCE', 'NEUTRAL_RESISTANCE', 'LIGHT_RESISTANCE', 'DARK_RESISTANCE', 'WATER_RESISTANCE', 'FIRE_RESISTANCE', 'EARTH_RESISTANCE', 'WIND_RESISTANCE', 'DODGE', 'AILMENT_RESISTANCE', 'BASE_GUARD_POWER', 'GUARD_POWER', 'BASE_GUARD_RECHARGE', 'GUARD_RECHANGE', 'EVASION_RECHARGE', 'PHYSICAL_BARRIER', 'MAGICAL_BARRIER', 'FRACTIONAL_BARRIER', 'BARRIER_COOLDOWN', 'REDUCE_DMG_FLOOR', 'REDUCE_DMG_METEOR', 'REDUCE_DMG_PLAYER_EPICENTER', 'REDUCE_DMG_FOE_EPICENTER', 'REDUCE_DMG_BOWLING', 'REDUCE_DMG_BULLET', 'REDUCE_DMG_STRAIGHT_LINE', 'REDUCE_DMG_CHARGE', 'ABSOLUTE_DODGE', 'ASPD', 'CSPD', 'MSPD', 'DROP_RATE', 'REVIVE_TIME', 'FLINCH_UNAVAILABLE', 'TUMBLE_UNAVAILABLE', 'STUN_UNAVAILABLE', 'INVINCIBLE_AID', 'EXP_RATE', 'PET_EXP', 'ITEM_COOLDOWN', 'RECOIL_DAMAGE', 'GEM_POWDER_DROP');

-- CreateEnum
CREATE TYPE "CharacterType" AS ENUM ('Tank', 'Mage', 'Ranger', 'Marksman');

-- CreateEnum
CREATE TYPE "SpecialAbiType" AS ENUM ('NULL', 'LUK', 'CRI', 'TEC', 'MEN');

-- CreateEnum
CREATE TYPE "CrystalType" AS ENUM ('GENERAL', 'WEAPONCRYSTAL', 'BODYCRYSTAL', 'ADDITIONALCRYSTAL', 'SPECIALCRYSTAL');

-- CreateEnum
CREATE TYPE "MainWeaponType" AS ENUM ('NO_WEAPON', 'ONE_HAND_SWORD', 'TWO_HANDS_SWORD', 'BOW', 'BOWGUN', 'STAFF', 'MAGIC_DEVICE', 'KNUCKLE', 'HALBERD', 'KATANA');

-- CreateEnum
CREATE TYPE "SubWeaponType" AS ENUM ('NO_WEAPON', 'ONE_HAND_SWORD', 'MAGIC_DEVICE', 'KNUCKLE', 'KATANA', 'ARROW', 'DAGGER', 'NINJUTSUSCROLL', 'SHIELD');

-- CreateEnum
CREATE TYPE "BodyArmorType" AS ENUM ('NORMAL', 'LIGHT', 'HEAVY');

-- CreateEnum
CREATE TYPE "SkillTreeName" AS ENUM ('BLADE', 'SHOT', 'MAGIC', 'MARTIAL', 'DUALSWORD', 'HALBERD', 'MONONOFU', 'CRUSHER', 'SPRITE');

-- CreateEnum
CREATE TYPE "WeaponElementDependencyType" AS ENUM ('TRUE', 'FALSE');

-- CreateEnum
CREATE TYPE "SkillType" AS ENUM ('ACTIVE_SKILL', 'PASSIVE_SKILL');

-- CreateEnum
CREATE TYPE "SkillExtraActionType" AS ENUM ('None', 'Chanting', 'Charging');

-- CreateEnum
CREATE TYPE "YieldType" AS ENUM ('ImmediateEffect', 'PersistentEffect');

-- CreateEnum
CREATE TYPE "DurationType" AS ENUM ('FRAME', 'SKILL', 'UNLIMITED');

-- CreateEnum
CREATE TYPE "ConsumableType" AS ENUM ('HP', 'MP', 'ATK', 'MATK', 'SPEED', 'CSPEED', 'STRONGER', 'HIT', 'AVO');

-- CreateEnum
CREATE TYPE "ComboType" AS ENUM ('NULL');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "emailVerified" TIMESTAMP(3),
    "image" TEXT,
    "userRole" "UserRole" NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Account" (
    "id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "sessionToken" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "Post" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdById" TEXT NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserCreateData" (
    "userId" TEXT NOT NULL,

    CONSTRAINT "UserCreateData_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "UserUpdateData" (
    "userId" TEXT NOT NULL,

    CONSTRAINT "UserUpdateData_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "Rate" (
    "id" TEXT NOT NULL,
    "rate" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,
    "statisticsId" TEXT,

    CONSTRAINT "Rate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageTimestamps" (
    "timestamp" TIMESTAMP(3) NOT NULL,
    "statisticsId" TEXT,

    CONSTRAINT "UsageTimestamps_pkey" PRIMARY KEY ("timestamp")
);

-- CreateTable
CREATE TABLE "ViewTimestamps" (
    "timestamp" TIMESTAMP(3) NOT NULL,
    "statisticsId" TEXT,

    CONSTRAINT "ViewTimestamps_pkey" PRIMARY KEY ("timestamp")
);

-- CreateTable
CREATE TABLE "Statistics" (
    "id" TEXT NOT NULL,
    "monsterId" TEXT,
    "crystalId" TEXT,
    "mainWeaponId" TEXT,
    "subWeaponId" TEXT,
    "bodyArmorId" TEXT,
    "additionalEquipmentId" TEXT,
    "specialEquipmentId" TEXT,
    "skillId" TEXT,
    "petId" TEXT,
    "consumableId" TEXT,
    "characterId" TEXT,
    "analyzerId" TEXT,

    CONSTRAINT "Statistics_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Monster" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "monsterType" "MonsterType" NOT NULL,
    "baseLv" INTEGER,
    "experience" INTEGER,
    "address" TEXT,
    "element" "Element" NOT NULL,
    "radius" INTEGER,
    "maxhp" INTEGER,
    "physicalDefense" INTEGER,
    "physicalResistance" INTEGER,
    "magicalDefense" INTEGER,
    "magicalResistance" INTEGER,
    "criticalResistance" INTEGER,
    "avoidance" INTEGER,
    "dodge" INTEGER,
    "block" INTEGER,
    "normalAttackResistanceModifier" INTEGER,
    "physicalAttackResistanceModifier" INTEGER,
    "magicalAttackResistanceModifier" INTEGER,
    "difficultyOfTank" INTEGER NOT NULL,
    "difficultyOfMelee" INTEGER NOT NULL,
    "difficultyOfRanged" INTEGER NOT NULL,
    "possibilityOfRunningAround" INTEGER NOT NULL,
    "extraDetails" TEXT,
    "dataSources" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "updatedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT,
    "statisticsId" TEXT,

    CONSTRAINT "Monster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Modifier" (
    "id" TEXT NOT NULL,
    "formula" TEXT NOT NULL,

    CONSTRAINT "Modifier_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModifiersList" (
    "id" TEXT NOT NULL,
    "name" TEXT,

    CONSTRAINT "ModifiersList_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Character" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "characterType" "CharacterType" NOT NULL,
    "lv" INTEGER NOT NULL,
    "baseStr" INTEGER NOT NULL,
    "baseInt" INTEGER NOT NULL,
    "baseVit" INTEGER NOT NULL,
    "baseAgi" INTEGER NOT NULL,
    "baseDex" INTEGER NOT NULL,
    "specialAbiType" "SpecialAbiType" NOT NULL,
    "specialAbiValue" INTEGER NOT NULL,
    "mainWeaponId" TEXT NOT NULL,
    "subWeaponId" TEXT NOT NULL,
    "bodyArmorId" TEXT NOT NULL,
    "additionalEquipmentId" TEXT NOT NULL,
    "specialEquipmentId" TEXT NOT NULL,
    "fashionModifiersListId" TEXT NOT NULL,
    "CuisineModifiersListId" TEXT NOT NULL,
    "petId" TEXT NOT NULL,
    "modifiersListId" TEXT NOT NULL,
    "extraDetails" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "updatedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT,
    "statisticsId" TEXT,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Crystal" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "crystalType" "CrystalType" NOT NULL,
    "front" INTEGER NOT NULL,
    "modifiersListId" TEXT NOT NULL,
    "extraDetails" TEXT,
    "dataSources" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "updatedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT,
    "statisticsId" TEXT,

    CONSTRAINT "Crystal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MainWeapon" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "mainWeaponType" "MainWeaponType" NOT NULL,
    "baseAtk" INTEGER NOT NULL,
    "refinement" INTEGER NOT NULL,
    "stability" INTEGER NOT NULL,
    "element" "Element" NOT NULL,
    "modifiersListId" TEXT NOT NULL,
    "extraDetails" TEXT,
    "dataSources" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "updatedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT,
    "statisticsId" TEXT,

    CONSTRAINT "MainWeapon_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubWeapon" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "subWeaponType" "SubWeaponType" NOT NULL,
    "baseAtk" INTEGER NOT NULL,
    "refinement" INTEGER NOT NULL,
    "stability" INTEGER NOT NULL,
    "element" "Element" NOT NULL,
    "modifiersListId" TEXT NOT NULL,
    "extraDetails" TEXT,
    "dataSources" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "updatedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT,
    "statisticsId" TEXT,

    CONSTRAINT "SubWeapon_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BodyArmor" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "bodyArmorType" "BodyArmorType" NOT NULL,
    "refinement" INTEGER NOT NULL,
    "baseDef" INTEGER NOT NULL,
    "modifiersListId" TEXT NOT NULL,
    "extraDetails" TEXT,
    "dataSources" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "updatedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT,
    "statisticsId" TEXT,

    CONSTRAINT "BodyArmor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdditionalEquipment" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "refinement" INTEGER NOT NULL,
    "modifiersListId" TEXT NOT NULL,
    "extraDetails" TEXT,
    "dataSources" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "updatedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT,
    "statisticsId" TEXT,

    CONSTRAINT "AdditionalEquipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpecialEquipment" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "modifiersListId" TEXT NOT NULL,
    "extraDetails" TEXT,
    "dataSources" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "updatedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT,
    "statisticsId" TEXT,

    CONSTRAINT "SpecialEquipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Skill" (
    "id" TEXT NOT NULL,
    "skillTreeName" "SkillTreeName" NOT NULL,
    "name" TEXT NOT NULL,
    "skillType" "SkillType" NOT NULL,
    "weaponElementDependencyType" "WeaponElementDependencyType" NOT NULL,
    "element" "Element" NOT NULL,
    "skillDescription" TEXT,
    "extraDetails" TEXT,
    "dataSources" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "updatedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT,
    "statisticsId" TEXT,

    CONSTRAINT "Skill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SkillEffect" (
    "id" TEXT NOT NULL,
    "condition" TEXT NOT NULL,
    "description" TEXT,
    "actionBaseDurationFormula" TEXT NOT NULL,
    "actionModifiableDurationFormula" TEXT NOT NULL,
    "skillExtraActionType" "SkillExtraActionType" NOT NULL,
    "chantingBaseDurationFormula" TEXT NOT NULL,
    "chantingModifiableDurationFormula" TEXT NOT NULL,
    "chargingBaseDurationFormula" TEXT NOT NULL,
    "chargingModifiableDurationFormula" TEXT NOT NULL,
    "skillStartupFramesFormula" TEXT,
    "belongToskillId" TEXT NOT NULL,

    CONSTRAINT "SkillEffect_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SkillCost" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "costFormula" TEXT NOT NULL,
    "skillEffectId" TEXT,

    CONSTRAINT "SkillCost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SkillYield" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "yieldType" "YieldType" NOT NULL,
    "yieldFormula" TEXT NOT NULL,
    "mutationTimingFormula" TEXT,
    "skillEffectId" TEXT,

    CONSTRAINT "SkillYield_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pet" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "extraDetails" TEXT,
    "dataSources" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "updatedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT,
    "statisticsId" TEXT,

    CONSTRAINT "Pet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Consumable" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "modifiersListId" TEXT NOT NULL,
    "extraDetails" TEXT,
    "dataSources" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "updatedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT,
    "statisticsId" TEXT,

    CONSTRAINT "Consumable_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Analyzer" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "monsterId" TEXT,
    "characterId" TEXT,
    "extraDetails" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "updatedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "createdByUserId" TEXT,
    "statisticsId" TEXT,

    CONSTRAINT "Analyzer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Combo" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "userCreateUserId" TEXT,

    CONSTRAINT "Combo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ComboStep" (
    "id" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "comboType" "ComboType" NOT NULL,
    "skillId" TEXT NOT NULL,
    "comboId" TEXT NOT NULL,

    CONSTRAINT "ComboStep_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Process" (
    "id" TEXT NOT NULL,
    "analyzerId" TEXT NOT NULL,

    CONSTRAINT "Process_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Step" (
    "id" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "skillId" TEXT NOT NULL,
    "processId" TEXT NOT NULL,

    CONSTRAINT "Step_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ModifierToModifiersList" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_CharacterToSkill" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_CharacterToConsumable" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_CharacterToCombo" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_CrystalToMainWeapon" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_CrystalToSpecialEquipment" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_BodyArmorToCrystal" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_AdditionalEquipmentToCrystal" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON "Account"("provider", "providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "Session"("sessionToken");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "VerificationToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON "VerificationToken"("identifier", "token");

-- CreateIndex
CREATE INDEX "Post_name_idx" ON "Post"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Statistics_monsterId_key" ON "Statistics"("monsterId");

-- CreateIndex
CREATE UNIQUE INDEX "Statistics_crystalId_key" ON "Statistics"("crystalId");

-- CreateIndex
CREATE UNIQUE INDEX "Statistics_mainWeaponId_key" ON "Statistics"("mainWeaponId");

-- CreateIndex
CREATE UNIQUE INDEX "Statistics_subWeaponId_key" ON "Statistics"("subWeaponId");

-- CreateIndex
CREATE UNIQUE INDEX "Statistics_bodyArmorId_key" ON "Statistics"("bodyArmorId");

-- CreateIndex
CREATE UNIQUE INDEX "Statistics_additionalEquipmentId_key" ON "Statistics"("additionalEquipmentId");

-- CreateIndex
CREATE UNIQUE INDEX "Statistics_specialEquipmentId_key" ON "Statistics"("specialEquipmentId");

-- CreateIndex
CREATE UNIQUE INDEX "Statistics_skillId_key" ON "Statistics"("skillId");

-- CreateIndex
CREATE UNIQUE INDEX "Statistics_petId_key" ON "Statistics"("petId");

-- CreateIndex
CREATE UNIQUE INDEX "Statistics_consumableId_key" ON "Statistics"("consumableId");

-- CreateIndex
CREATE UNIQUE INDEX "Statistics_characterId_key" ON "Statistics"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "Statistics_analyzerId_key" ON "Statistics"("analyzerId");

-- CreateIndex
CREATE UNIQUE INDEX "Character_fashionModifiersListId_key" ON "Character"("fashionModifiersListId");

-- CreateIndex
CREATE UNIQUE INDEX "Character_CuisineModifiersListId_key" ON "Character"("CuisineModifiersListId");

-- CreateIndex
CREATE UNIQUE INDEX "Character_modifiersListId_key" ON "Character"("modifiersListId");

-- CreateIndex
CREATE UNIQUE INDEX "_ModifierToModifiersList_AB_unique" ON "_ModifierToModifiersList"("A", "B");

-- CreateIndex
CREATE INDEX "_ModifierToModifiersList_B_index" ON "_ModifierToModifiersList"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToSkill_AB_unique" ON "_CharacterToSkill"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToSkill_B_index" ON "_CharacterToSkill"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToConsumable_AB_unique" ON "_CharacterToConsumable"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToConsumable_B_index" ON "_CharacterToConsumable"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToCombo_AB_unique" ON "_CharacterToCombo"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToCombo_B_index" ON "_CharacterToCombo"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CrystalToMainWeapon_AB_unique" ON "_CrystalToMainWeapon"("A", "B");

-- CreateIndex
CREATE INDEX "_CrystalToMainWeapon_B_index" ON "_CrystalToMainWeapon"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CrystalToSpecialEquipment_AB_unique" ON "_CrystalToSpecialEquipment"("A", "B");

-- CreateIndex
CREATE INDEX "_CrystalToSpecialEquipment_B_index" ON "_CrystalToSpecialEquipment"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BodyArmorToCrystal_AB_unique" ON "_BodyArmorToCrystal"("A", "B");

-- CreateIndex
CREATE INDEX "_BodyArmorToCrystal_B_index" ON "_BodyArmorToCrystal"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AdditionalEquipmentToCrystal_AB_unique" ON "_AdditionalEquipmentToCrystal"("A", "B");

-- CreateIndex
CREATE INDEX "_AdditionalEquipmentToCrystal_B_index" ON "_AdditionalEquipmentToCrystal"("B");

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCreateData" ADD CONSTRAINT "UserCreateData_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserUpdateData" ADD CONSTRAINT "UserUpdateData_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rate" ADD CONSTRAINT "Rate_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rate" ADD CONSTRAINT "Rate_statisticsId_fkey" FOREIGN KEY ("statisticsId") REFERENCES "Statistics"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UsageTimestamps" ADD CONSTRAINT "UsageTimestamps_statisticsId_fkey" FOREIGN KEY ("statisticsId") REFERENCES "Statistics"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ViewTimestamps" ADD CONSTRAINT "ViewTimestamps_statisticsId_fkey" FOREIGN KEY ("statisticsId") REFERENCES "Statistics"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistics" ADD CONSTRAINT "Statistics_monsterId_fkey" FOREIGN KEY ("monsterId") REFERENCES "Monster"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistics" ADD CONSTRAINT "Statistics_crystalId_fkey" FOREIGN KEY ("crystalId") REFERENCES "Crystal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistics" ADD CONSTRAINT "Statistics_mainWeaponId_fkey" FOREIGN KEY ("mainWeaponId") REFERENCES "MainWeapon"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistics" ADD CONSTRAINT "Statistics_subWeaponId_fkey" FOREIGN KEY ("subWeaponId") REFERENCES "SubWeapon"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistics" ADD CONSTRAINT "Statistics_bodyArmorId_fkey" FOREIGN KEY ("bodyArmorId") REFERENCES "BodyArmor"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistics" ADD CONSTRAINT "Statistics_additionalEquipmentId_fkey" FOREIGN KEY ("additionalEquipmentId") REFERENCES "AdditionalEquipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistics" ADD CONSTRAINT "Statistics_specialEquipmentId_fkey" FOREIGN KEY ("specialEquipmentId") REFERENCES "SpecialEquipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistics" ADD CONSTRAINT "Statistics_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skill"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistics" ADD CONSTRAINT "Statistics_petId_fkey" FOREIGN KEY ("petId") REFERENCES "Pet"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistics" ADD CONSTRAINT "Statistics_consumableId_fkey" FOREIGN KEY ("consumableId") REFERENCES "Consumable"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistics" ADD CONSTRAINT "Statistics_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistics" ADD CONSTRAINT "Statistics_analyzerId_fkey" FOREIGN KEY ("analyzerId") REFERENCES "Analyzer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Monster" ADD CONSTRAINT "Monster_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "UserUpdateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Monster" ADD CONSTRAINT "Monster_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_mainWeaponId_fkey" FOREIGN KEY ("mainWeaponId") REFERENCES "MainWeapon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_subWeaponId_fkey" FOREIGN KEY ("subWeaponId") REFERENCES "SubWeapon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_bodyArmorId_fkey" FOREIGN KEY ("bodyArmorId") REFERENCES "BodyArmor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_additionalEquipmentId_fkey" FOREIGN KEY ("additionalEquipmentId") REFERENCES "AdditionalEquipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_specialEquipmentId_fkey" FOREIGN KEY ("specialEquipmentId") REFERENCES "SpecialEquipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_fashionModifiersListId_fkey" FOREIGN KEY ("fashionModifiersListId") REFERENCES "ModifiersList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_CuisineModifiersListId_fkey" FOREIGN KEY ("CuisineModifiersListId") REFERENCES "ModifiersList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_petId_fkey" FOREIGN KEY ("petId") REFERENCES "Pet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_modifiersListId_fkey" FOREIGN KEY ("modifiersListId") REFERENCES "ModifiersList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "UserUpdateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Crystal" ADD CONSTRAINT "Crystal_modifiersListId_fkey" FOREIGN KEY ("modifiersListId") REFERENCES "ModifiersList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Crystal" ADD CONSTRAINT "Crystal_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "UserUpdateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Crystal" ADD CONSTRAINT "Crystal_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MainWeapon" ADD CONSTRAINT "MainWeapon_modifiersListId_fkey" FOREIGN KEY ("modifiersListId") REFERENCES "ModifiersList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MainWeapon" ADD CONSTRAINT "MainWeapon_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "UserUpdateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MainWeapon" ADD CONSTRAINT "MainWeapon_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubWeapon" ADD CONSTRAINT "SubWeapon_modifiersListId_fkey" FOREIGN KEY ("modifiersListId") REFERENCES "ModifiersList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubWeapon" ADD CONSTRAINT "SubWeapon_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "UserUpdateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubWeapon" ADD CONSTRAINT "SubWeapon_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BodyArmor" ADD CONSTRAINT "BodyArmor_modifiersListId_fkey" FOREIGN KEY ("modifiersListId") REFERENCES "ModifiersList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BodyArmor" ADD CONSTRAINT "BodyArmor_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "UserUpdateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BodyArmor" ADD CONSTRAINT "BodyArmor_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdditionalEquipment" ADD CONSTRAINT "AdditionalEquipment_modifiersListId_fkey" FOREIGN KEY ("modifiersListId") REFERENCES "ModifiersList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdditionalEquipment" ADD CONSTRAINT "AdditionalEquipment_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "UserUpdateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdditionalEquipment" ADD CONSTRAINT "AdditionalEquipment_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpecialEquipment" ADD CONSTRAINT "SpecialEquipment_modifiersListId_fkey" FOREIGN KEY ("modifiersListId") REFERENCES "ModifiersList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpecialEquipment" ADD CONSTRAINT "SpecialEquipment_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "UserUpdateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpecialEquipment" ADD CONSTRAINT "SpecialEquipment_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Skill" ADD CONSTRAINT "Skill_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "UserUpdateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Skill" ADD CONSTRAINT "Skill_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SkillEffect" ADD CONSTRAINT "SkillEffect_belongToskillId_fkey" FOREIGN KEY ("belongToskillId") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SkillCost" ADD CONSTRAINT "SkillCost_skillEffectId_fkey" FOREIGN KEY ("skillEffectId") REFERENCES "SkillEffect"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SkillYield" ADD CONSTRAINT "SkillYield_skillEffectId_fkey" FOREIGN KEY ("skillEffectId") REFERENCES "SkillEffect"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pet" ADD CONSTRAINT "Pet_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "UserUpdateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pet" ADD CONSTRAINT "Pet_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consumable" ADD CONSTRAINT "Consumable_modifiersListId_fkey" FOREIGN KEY ("modifiersListId") REFERENCES "ModifiersList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consumable" ADD CONSTRAINT "Consumable_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "UserUpdateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consumable" ADD CONSTRAINT "Consumable_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Analyzer" ADD CONSTRAINT "Analyzer_monsterId_fkey" FOREIGN KEY ("monsterId") REFERENCES "Monster"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Analyzer" ADD CONSTRAINT "Analyzer_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Analyzer" ADD CONSTRAINT "Analyzer_updatedByUserId_fkey" FOREIGN KEY ("updatedByUserId") REFERENCES "UserUpdateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Analyzer" ADD CONSTRAINT "Analyzer_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Combo" ADD CONSTRAINT "Combo_userCreateUserId_fkey" FOREIGN KEY ("userCreateUserId") REFERENCES "UserCreateData"("userId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComboStep" ADD CONSTRAINT "ComboStep_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComboStep" ADD CONSTRAINT "ComboStep_comboId_fkey" FOREIGN KEY ("comboId") REFERENCES "Combo"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Process" ADD CONSTRAINT "Process_analyzerId_fkey" FOREIGN KEY ("analyzerId") REFERENCES "Analyzer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Step" ADD CONSTRAINT "Step_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Step" ADD CONSTRAINT "Step_processId_fkey" FOREIGN KEY ("processId") REFERENCES "Process"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ModifierToModifiersList" ADD CONSTRAINT "_ModifierToModifiersList_A_fkey" FOREIGN KEY ("A") REFERENCES "Modifier"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ModifierToModifiersList" ADD CONSTRAINT "_ModifierToModifiersList_B_fkey" FOREIGN KEY ("B") REFERENCES "ModifiersList"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSkill" ADD CONSTRAINT "_CharacterToSkill_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSkill" ADD CONSTRAINT "_CharacterToSkill_B_fkey" FOREIGN KEY ("B") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToConsumable" ADD CONSTRAINT "_CharacterToConsumable_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToConsumable" ADD CONSTRAINT "_CharacterToConsumable_B_fkey" FOREIGN KEY ("B") REFERENCES "Consumable"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToCombo" ADD CONSTRAINT "_CharacterToCombo_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToCombo" ADD CONSTRAINT "_CharacterToCombo_B_fkey" FOREIGN KEY ("B") REFERENCES "Combo"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CrystalToMainWeapon" ADD CONSTRAINT "_CrystalToMainWeapon_A_fkey" FOREIGN KEY ("A") REFERENCES "Crystal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CrystalToMainWeapon" ADD CONSTRAINT "_CrystalToMainWeapon_B_fkey" FOREIGN KEY ("B") REFERENCES "MainWeapon"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CrystalToSpecialEquipment" ADD CONSTRAINT "_CrystalToSpecialEquipment_A_fkey" FOREIGN KEY ("A") REFERENCES "Crystal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CrystalToSpecialEquipment" ADD CONSTRAINT "_CrystalToSpecialEquipment_B_fkey" FOREIGN KEY ("B") REFERENCES "SpecialEquipment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BodyArmorToCrystal" ADD CONSTRAINT "_BodyArmorToCrystal_A_fkey" FOREIGN KEY ("A") REFERENCES "BodyArmor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BodyArmorToCrystal" ADD CONSTRAINT "_BodyArmorToCrystal_B_fkey" FOREIGN KEY ("B") REFERENCES "Crystal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AdditionalEquipmentToCrystal" ADD CONSTRAINT "_AdditionalEquipmentToCrystal_A_fkey" FOREIGN KEY ("A") REFERENCES "AdditionalEquipment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AdditionalEquipmentToCrystal" ADD CONSTRAINT "_AdditionalEquipmentToCrystal_B_fkey" FOREIGN KEY ("B") REFERENCES "Crystal"("id") ON DELETE CASCADE ON UPDATE CASCADE;
