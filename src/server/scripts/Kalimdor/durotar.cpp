/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
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
#include "SpellScript.h"

/*######
## Quest 25134: Lazy Peons
## npc_lazy_peon
######*/

enum LazyPeonData
{
    //Spells
    SPELL_PEON_SLEEPING = 17743,
    SPELL_AWAKEN_PEON   = 19938,
    //Gameobject
    GO_LUMBERPILE       = 175784,
    //Quest
    QUEST_LAZY_PEONS    = 25134,
    //Events
    EVENT_AWAKEN_PEON   = 1,
    EVENT_IN_POINT,
    EVENT_HOME,
    EVENT_PEON_SLEEPING,
    //Point
    POINT_1             = 1
};

class npc_lazy_peon : public CreatureScript
{
    public:
        npc_lazy_peon() : CreatureScript("npc_lazy_peon") { }

        struct npc_lazy_peonAI : public ScriptedAI
        {
            npc_lazy_peonAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_PEON_SLEEPING, 1000);
            }

            void MovementInform(uint32 /*type*/, uint32 id)
            {
                if (id == POINT_1)
                    events.ScheduleEvent(EVENT_IN_POINT, 1000);
            }

            void SpellHit(Unit* caster, const SpellInfo* spell)
            {
                if (spell->Id == SPELL_AWAKEN_PEON && caster->GetTypeId() == TYPEID_PLAYER && CAST_PLR(caster)->GetQuestStatus(QUEST_LAZY_PEONS) == QUEST_STATUS_INCOMPLETE)
                {
                    caster->ToPlayer()->KilledMonsterCredit(me->GetEntry(), me->GetGUID());
                    events.ScheduleEvent(EVENT_AWAKEN_PEON, 500);
                    events.CancelEvent(EVENT_PEON_SLEEPING);
                }
            }

            void UpdateAI(uint32 const diff)
            {
                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_AWAKEN_PEON:
                            me->RemoveAllAuras();
                            Talk(urand(0, 3));
                            if (GameObject* Lumberpile = me->FindNearestGameObject(GO_LUMBERPILE, 20))
                                me->GetMotionMaster()->MovePoint(POINT_1, Lumberpile->GetPositionX() - 1, Lumberpile->GetPositionY(), Lumberpile->GetPositionZ());
                            break;
                        case EVENT_IN_POINT:
                            me->HandleEmoteCommand(EMOTE_STATE_WORK_CHOPWOOD);
                            events.ScheduleEvent(EVENT_HOME, 300000);
                            break;
                        case EVENT_HOME:
                            me->HandleEmoteCommand(EMOTE_STATE_NONE);
                            me->GetMotionMaster()->MoveTargetedHome();
                            events.ScheduleEvent(EVENT_PEON_SLEEPING, 1000);
                            break;
                        case EVENT_PEON_SLEEPING:
                            DoCast(SPELL_PEON_SLEEPING);
                            events.ScheduleEvent(EVENT_PEON_SLEEPING, 120000);
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                EventMap events;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_lazy_peonAI(creature);
        }
};

enum VoodooSpells
{
    SPELL_BREW      = 16712, // Special Brew
    SPELL_GHOSTLY   = 16713, // Ghostly
    SPELL_HEX1      = 16707, // Hex
    SPELL_HEX2      = 16708, // Hex
    SPELL_HEX3      = 16709, // Hex
    SPELL_GROW      = 16711, // Grow
    SPELL_LAUNCH    = 16716, // Launch (Whee!)
};

// 17009
class spell_voodoo : public SpellScriptLoader
{
    public:
        spell_voodoo() : SpellScriptLoader("spell_voodoo") {}

        class spell_voodoo_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_voodoo_SpellScript);

            bool Validate(SpellInfo const* /*spell*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_BREW) || !sSpellMgr->GetSpellInfo(SPELL_GHOSTLY) ||
                    !sSpellMgr->GetSpellInfo(SPELL_HEX1) || !sSpellMgr->GetSpellInfo(SPELL_HEX2) ||
                    !sSpellMgr->GetSpellInfo(SPELL_HEX3) || !sSpellMgr->GetSpellInfo(SPELL_GROW) ||
                    !sSpellMgr->GetSpellInfo(SPELL_LAUNCH))
                    return false;
                return true;
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                uint32 spellid = RAND(SPELL_BREW, SPELL_GHOSTLY, RAND(SPELL_HEX1, SPELL_HEX2, SPELL_HEX3), SPELL_GROW, SPELL_LAUNCH);
                if (Unit* target = GetHitUnit())
                    GetCaster()->CastSpell(target, spellid, false);
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_voodoo_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_voodoo_SpellScript();
        }
};

void AddSC_durotar()
{
    new npc_lazy_peon();
    new spell_voodoo();
}
