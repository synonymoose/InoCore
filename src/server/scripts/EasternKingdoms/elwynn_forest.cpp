/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "World.h"
#include "PetAI.h"
#include "PassiveAI.h"
#include "CombatAI.h"
#include "GameEventMgr.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Cell.h"
#include "CellImpl.h"
#include "SpellAuras.h"
#include "Vehicle.h"
#include "Player.h"
#include "SpellScript.h"

enum Northshire
{
    NPC_BLACKROCK_BATTLE_WORG = 49871,
    NPC_STORMWIND_INFANTRY    = 49869,

    SAY_YELL                  = 1,

    SPELL_RENEWEDLIFE         = 93097,

    ACTION_HEAL               = 1,
    EVENT_HEALED_1            = 1,
    EVENT_HEALED_2            = 2,
};

/*######
## npc_stormwind_infantry
######*/

class npc_stormwind_infantry : public CreatureScript
{
public:
    npc_stormwind_infantry() : CreatureScript("npc_stormwind_infantry") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_stormwind_infantryAI (creature);
    }

    struct npc_stormwind_infantryAI : public ScriptedAI
    {
        npc_stormwind_infantryAI(Creature* creature) : ScriptedAI(creature) {}

        bool HasATarget;

        uint32 tYell, SayChance, WillSay;

        void Reset()
        {
            HasATarget = false;
            WillSay     = urand(0, 45);
            SayChance   = 25;			
            tYell       = urand(28.5 * IN_MILLISECONDS, 51.3 * IN_MILLISECONDS);
        }

        void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const*  /*p_SpellInfo*/)
        {
            if (doneBy->ToCreature())
                if (me->GetHealth() <= damage || me->GetHealthPct() <= 80.0f)
                    damage = 0;
        }

        void DamageDealt(Unit* target, uint32& damage, DamageEffectType /*damageType*/)
        {
            if (target->ToCreature())
                if (target->GetHealth() <= damage || target->GetHealthPct() <= 70.0f)
                    damage = 0;
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (who && !HasATarget)
                if (me->GetDistance(who) < 5.0f)
                    if (Creature* creature = who->ToCreature())
                        if (creature->GetEntry() == NPC_BLACKROCK_BATTLE_WORG)
                            AttackStart(who);
        }

        void EnterEvadeMode()
        {
            HasATarget = false;
        }

        void UpdateAI(const uint32 diff)
        {
            if (me->isInCombat() && me->FindNearestCreature(NPC_BLACKROCK_BATTLE_WORG, 6.0f, true))
            {
                if(tYell <= diff) 
                {
                    if (WillSay <= SayChance)
                    {			   
                        Talk(SAY_YELL);
                        tYell = urand(28.5 * IN_MILLISECONDS, 51.3 * IN_MILLISECONDS);          
                    }			   
                }
                else tYell -= diff;
            }

            if (!UpdateVictim())
                return;
            else
                DoMeleeAttackIfReady();
        }
    };
};

/*######
## npc_blackrock_battle_worg
######*/

class npc_blackrock_battle_worg : public CreatureScript
{
public:
    npc_blackrock_battle_worg() : CreatureScript("npc_blackrock_battle_worg") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_blackrock_battle_worgAI (creature);
    }

    struct npc_blackrock_battle_worgAI : public ScriptedAI
    {
        npc_blackrock_battle_worgAI(Creature* creature) : ScriptedAI(creature) { }

        void DamageTaken(Unit* who, uint32& damage)
        {
            if (who->GetEntry() == NPC_STORMWIND_INFANTRY && damage >= me->GetHealth())
                me->SetHealth(me->GetMaxHealth());

            if (who->GetTypeId() == TYPEID_PLAYER || who->isPet())
            {
                if (Creature* guard = me->FindNearestCreature(NPC_STORMWIND_INFANTRY, 6.0f, true))
                {
                    guard->getThreatManager().resetAllAggro();
                    guard->CombatStop(true);
                }

                me->getThreatManager().resetAllAggro();
                me->GetMotionMaster()->MoveChase(who);
                me->AI()->AttackStart(who);
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                if (Creature* guard = me->FindNearestCreature(NPC_STORMWIND_INFANTRY, 6.0f, true))
                {
                    me->SetReactState(REACT_AGGRESSIVE);
                    me->AI()->AttackStart(guard);
                }

            DoMeleeAttackIfReady();
        }
    };
};

/*######
## npc_stormwind_injured_soldier
######*/

class npc_stormwind_injured_soldier : public CreatureScript
{
public:
    npc_stormwind_injured_soldier() : CreatureScript("npc_stormwind_injured_soldier") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_stormwind_injured_soldierAI (creature);
    }

    struct npc_stormwind_injured_soldierAI : public ScriptedAI
    {
        npc_stormwind_injured_soldierAI(Creature* creature) : ScriptedAI(creature) { }

        EventMap events;
        Player* owner;

        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_14);
            //me->SetUInt32Value(UNIT_FIELD_BYTES_1, 7);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        }

        void SpellHit(Unit* caster, SpellInfo const* spell)
        {
            if (spell->Id == SPELL_RENEWEDLIFE)
            {
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_15);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_14);
                //me->SetUInt32Value(UNIT_FIELD_BYTES_1, 0);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                DoAction(ACTION_HEAL);
                owner = me->FindNearestPlayer(8.0f, true);
            }
        }

        void DoAction(int32 const action)
        {
            switch (action)
            {
                case ACTION_HEAL:
                    events.ScheduleEvent(EVENT_HEALED_1, 2 * IN_MILLISECONDS);
                    break;
            }
        }

        void UpdateAI(uint32 const diff)
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_HEALED_1:
                    {
                        if (owner)
                        {
                            switch(urand(0, 5))
                            {
                                case 0:
                                    me->MonsterSay("I will fear no evil!", 0, NULL);
                                    break;
                                case 1:
                                    me->MonsterSay("I... I'm okay! I'm okay!", 0, NULL);
                                    break;
                                case 2:
                                    me->MonsterSay("Bless you, hero!", 0, NULL);
                                    break;
                                case 3:
                                    me->MonsterSay("You are $p! The hero that everyone has been talking about! Thank you!", 0, owner->GetGUID());
                                    break;
                                case 4:
                                    me->MonsterSay("Thank the Light!", 0, NULL);
                                    break;
                                case 5:
                                    me->MonsterSay("I live to fight another day!", 0, NULL);
                                    break;
                                default:
                                    break;
                            }

                            me->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
                            owner->KilledMonsterCredit(me->GetEntry(), NULL);
                            events.ScheduleEvent(EVENT_HEALED_2, 2.5 * IN_MILLISECONDS);
                        }
                        break;
                    }

                    case EVENT_HEALED_2:
                    {
                        me->GetMotionMaster()->MovePoint(0, -8914.525f, -133.963f, 80.534f);
                        me->DespawnOrUnsummon(8 * IN_MILLISECONDS);
                        break;
                    }

                    default:
                        break;
                }
            }
        }
    };
};

/*######
## spell_quest_fear_no_evil
######*/

class spell_quest_fear_no_evil : public SpellScriptLoader
{
    public:
        spell_quest_fear_no_evil() : SpellScriptLoader("spell_quest_fear_no_evil") { }

        class spell_quest_fear_no_evil_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_quest_fear_no_evil_SpellScript);

            void OnDummy(SpellEffIndex /*effIndex*/)
            {
                if (GetCaster())
                    if (GetCaster()->ToPlayer())
                        GetCaster()->ToPlayer()->KilledMonsterCredit(50047, 0);
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_quest_fear_no_evil_SpellScript::OnDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_quest_fear_no_evil_SpellScript();
        }
};

/*######
## spell_quest_extincteur
######*/

#define SPELL_VISUAL_EXTINGUISHER   96028

class spell_quest_extincteur : public SpellScriptLoader
{
    public:
        spell_quest_extincteur() : SpellScriptLoader("spell_quest_extincteur") { }

        class spell_quest_extincteur_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_quest_extincteur_AuraScript);

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (GetCaster())
                    GetCaster()->AddAura(SPELL_VISUAL_EXTINGUISHER, GetCaster());
            }

            void OnPeriodic(AuraEffect const* /*aurEff*/)
            {
                if (!GetCaster())
                    return;

                if (Creature* fire = GetCaster()->FindNearestCreature(42940, 5.0f, true))
                {
                    if (Player* player = GetCaster()->ToPlayer())
                        player->KilledMonsterCredit(42940, 0);

                    fire->ForcedDespawn();
                }
            }

            void OnRemove(AuraEffect const*, AuraEffectHandleModes)
            {
                if (GetCaster())
                    GetCaster()->RemoveAurasDueToSpell(SPELL_VISUAL_EXTINGUISHER);
            }

            void Register()
            {
                OnEffectApply += AuraEffectApplyFn(spell_quest_extincteur_AuraScript::OnApply, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_quest_extincteur_AuraScript::OnPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
                OnEffectRemove += AuraEffectRemoveFn(spell_quest_extincteur_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_quest_extincteur_AuraScript();
        }
};

void AddSC_elwyn_forest()
{
    new npc_stormwind_infantry();
    new npc_blackrock_battle_worg();
    new npc_stormwind_injured_soldier();
    new spell_quest_fear_no_evil();
    new spell_quest_extincteur();
}
