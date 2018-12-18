#include "ScriptMgr.h"
#include "Chat.h"
#include "Language.h"
#include "AuctionHouseBot.h"

static const uint32 ahbotQualityIds[MAX_AUCTION_QUALITY] =
{
    LANG_AHBOT_QUALITY_GRAY, LANG_AHBOT_QUALITY_WHITE,
    LANG_AHBOT_QUALITY_GREEN, LANG_AHBOT_QUALITY_BLUE,
    LANG_AHBOT_QUALITY_PURPLE, LANG_AHBOT_QUALITY_ORANGE,
    LANG_AHBOT_QUALITY_YELLOW
};

class ahbot_commandscript : public CommandScript
{
public:
    ahbot_commandscript(): CommandScript("ahbot_commandscript") {}

	ChatCommand* GetCommands() const
    {
		static ChatCommand ahbotItemsAmountCommandTable[] =
        {
            { "gray",           SEC_ADMINISTRATOR,   true,  &HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_GRAY>,     "" },
            { "white",          SEC_ADMINISTRATOR,   true,  &HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_WHITE>,    "" },
            { "green",          SEC_ADMINISTRATOR,   true,  &HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_GREEN>,    "" },
            { "blue",           SEC_ADMINISTRATOR,   true,  &HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_BLUE>,     "" },
            { "purple",         SEC_ADMINISTRATOR,   true,  &HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_PURPLE>,   "" },
            { "orange",         SEC_ADMINISTRATOR,   true,  &HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_ORANGE>,   "" },
            { "yellow",         SEC_ADMINISTRATOR,   true,  &HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_YELLOW>,   "" },
            { "",               SEC_ADMINISTRATOR,   true,  &HandleAHBotItemsAmountCommand,                                  "" },
        };

		static ChatCommand ahbotItemsRatioCommandTable[] =
        {
            { "alliance",       SEC_ADMINISTRATOR,   true,  &HandleAHBotItemsRatioHouseCommand<AUCTION_HOUSE_ALLIANCE>,    "" },
            { "horde",          SEC_ADMINISTRATOR,   true,  &HandleAHBotItemsRatioHouseCommand<AUCTION_HOUSE_HORDE>,       "" },
            { "neutral",        SEC_ADMINISTRATOR,   true,  &HandleAHBotItemsRatioHouseCommand<AUCTION_HOUSE_NEUTRAL>,     "" },
            { "",               SEC_ADMINISTRATOR,   true,  &HandleAHBotItemsRatioCommand,                                 "" },
        };

		static ChatCommand ahbotCommandTable[] =
        {
            { "items",          SEC_ADMINISTRATOR,   true,   NULL,                       "", ahbotItemsAmountCommandTable },
            { "ratio",          SEC_ADMINISTRATOR,   true,   NULL,                       "", ahbotItemsRatioCommandTable },
            { "rebuild",        SEC_ADMINISTRATOR,   true,   &HandleAHBotRebuildCommand, "" },
            { "reload",         SEC_ADMINISTRATOR,   true,   &HandleAHBotReloadCommand,  "" },
            { "status",         SEC_ADMINISTRATOR,   true,   &HandleAHBotStatusCommand,  "" },
        };

		static ChatCommand commandTable[] =
        {
            { "ahbot",          SEC_ADMINISTRATOR,   false, NULL,    "", ahbotCommandTable },
        };

        return commandTable;
    }

    static bool HandleAHBotItemsAmountCommand(ChatHandler* handler, const char* args)
    {
        uint32 qVals[MAX_AUCTION_QUALITY];
        char* arg = strtok((char*)args, " ");
        for (int i = 0; i < MAX_AUCTION_QUALITY; ++i)
        {
            if (!arg)
                return false;
            qVals[i] = atoi(arg);
            arg = strtok(NULL, " ");
        }

        sAuctionBot->SetItemsAmount(qVals);

        for (int i = 0; i < MAX_AUCTION_QUALITY; ++i)
            handler->PSendSysMessage(LANG_AHBOT_ITEMS_AMOUNT, handler->GetTrinityString(ahbotQualityIds[i]), sAuctionBotConfig->GetConfigItemQualityAmount(AuctionQuality(i)));

        return true;
    }

    template <AuctionQuality Q>
    static bool HandleAHBotItemsAmountQualityCommand(ChatHandler* handler, const char* args)
    {
        char* arg = strtok((char*)args, " ");
        if (!arg)
            return false;
        uint32 qualityVal = atoi(arg);

        sAuctionBot->SetItemsAmountForQuality(Q, qualityVal);
        handler->PSendSysMessage(LANG_AHBOT_ITEMS_AMOUNT, handler->GetTrinityString(ahbotQualityIds[Q]),
            sAuctionBotConfig->GetConfigItemQualityAmount(Q));

        return true;
    }

    static bool HandleAHBotItemsRatioCommand(ChatHandler* handler, const char* args)
    {
        uint32 rVal[MAX_AUCTION_QUALITY];
        char* arg = strtok((char*)args, " ");
        for (int i = 0; i < MAX_AUCTION_QUALITY; ++i)
        {
            if (!arg)
                return false;
            rVal[i] = atoi(arg);
            arg = strtok(NULL, " ");
        }

        sAuctionBot->SetItemsRatio(rVal[0], rVal[1], rVal[2]);

        for (int i = 0; i < MAX_AUCTION_HOUSE_TYPE; ++i)
            handler->PSendSysMessage(LANG_AHBOT_ITEMS_RATIO, AuctionBotConfig::GetHouseTypeName(AuctionHouseType(i)), sAuctionBotConfig->GetConfigItemAmountRatio(AuctionHouseType(i)));
        return true;
    }

    template<AuctionHouseType H>
    static bool HandleAHBotItemsRatioHouseCommand(ChatHandler* handler, const char* args)
    {
        char* arg = strtok((char*)args, " ");
        if (!arg)
            return false;
        uint32 ratioVal = atoi(arg);

        sAuctionBot->SetItemsRatioForHouse(H, ratioVal);
        handler->PSendSysMessage(LANG_AHBOT_ITEMS_RATIO, AuctionBotConfig::GetHouseTypeName(H), sAuctionBotConfig->GetConfigItemAmountRatio(H));
        return true;
    }

    static bool HandleAHBotRebuildCommand(ChatHandler* /*handler*/, const char* args)
    {
        char* arg = strtok((char*)args, " ");

        bool all = false;
        if (arg && strcmp(arg, "all") == 0)
            all = true;

        sAuctionBot->Rebuild(all);
        return true;
    }

    static bool HandleAHBotReloadCommand(ChatHandler* handler, const char* /*args*/)
    {
        sAuctionBot->ReloadAllConfig();
        handler->SendSysMessage(LANG_AHBOT_RELOAD_OK);
        return true;
    }

    static bool HandleAHBotStatusCommand(ChatHandler* handler, const char* args)
    {
        char* arg = strtok((char*)args, " ");
        if (!arg)
            return false;

        bool all = false;
        if (strcmp(arg, "all") == 0)
            all = true;

        AuctionHouseBotStatusInfo statusInfo;
        sAuctionBot->PrepareStatusInfos(statusInfo);

        WorldSession* session = handler->GetSession();

        if (!session)
        {
            handler->SendSysMessage(LANG_AHBOT_STATUS_BAR_CONSOLE);
            handler->SendSysMessage(LANG_AHBOT_STATUS_TITLE1_CONSOLE);
            handler->SendSysMessage(LANG_AHBOT_STATUS_MIDBAR_CONSOLE);
        }
        else
            handler->SendSysMessage(LANG_AHBOT_STATUS_TITLE1_CHAT);

        uint32 fmtId = session ? LANG_AHBOT_STATUS_FORMAT_CHAT : LANG_AHBOT_STATUS_FORMAT_CONSOLE;

        handler->PSendSysMessage(fmtId, handler->GetTrinityString(LANG_AHBOT_STATUS_ITEM_COUNT),
            statusInfo[AUCTION_HOUSE_ALLIANCE].ItemsCount,
            statusInfo[AUCTION_HOUSE_HORDE].ItemsCount,
            statusInfo[AUCTION_HOUSE_NEUTRAL].ItemsCount,
            statusInfo[AUCTION_HOUSE_ALLIANCE].ItemsCount +
            statusInfo[AUCTION_HOUSE_HORDE].ItemsCount +
            statusInfo[AUCTION_HOUSE_NEUTRAL].ItemsCount);

        if (all)
        {
            handler->PSendSysMessage(fmtId, handler->GetTrinityString(LANG_AHBOT_STATUS_ITEM_RATIO),
                sAuctionBotConfig->GetConfig(CONFIG_AHBOT_ALLIANCE_ITEM_AMOUNT_RATIO),
                sAuctionBotConfig->GetConfig(CONFIG_AHBOT_HORDE_ITEM_AMOUNT_RATIO),
                sAuctionBotConfig->GetConfig(CONFIG_AHBOT_NEUTRAL_ITEM_AMOUNT_RATIO),
                sAuctionBotConfig->GetConfig(CONFIG_AHBOT_ALLIANCE_ITEM_AMOUNT_RATIO) +
                sAuctionBotConfig->GetConfig(CONFIG_AHBOT_HORDE_ITEM_AMOUNT_RATIO) +
                sAuctionBotConfig->GetConfig(CONFIG_AHBOT_NEUTRAL_ITEM_AMOUNT_RATIO));

            if (!session)
            {
                handler->SendSysMessage(LANG_AHBOT_STATUS_BAR_CONSOLE);
                handler->SendSysMessage(LANG_AHBOT_STATUS_TITLE2_CONSOLE);
                handler->SendSysMessage(LANG_AHBOT_STATUS_MIDBAR_CONSOLE);
            }
            else
                handler->SendSysMessage(LANG_AHBOT_STATUS_TITLE2_CHAT);

            for (int i = 0; i < MAX_AUCTION_QUALITY; ++i)
                handler->PSendSysMessage(fmtId, handler->GetTrinityString(ahbotQualityIds[i]),
                    statusInfo[AUCTION_HOUSE_ALLIANCE].QualityInfo[i],
                    statusInfo[AUCTION_HOUSE_HORDE].QualityInfo[i],
                    statusInfo[AUCTION_HOUSE_NEUTRAL].QualityInfo[i],
                    sAuctionBotConfig->GetConfigItemQualityAmount(AuctionQuality(i)));
        }

        if (!session)
            handler->SendSysMessage(LANG_AHBOT_STATUS_BAR_CONSOLE);

        return true;
    }

};

template bool ahbot_commandscript::HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_GRAY>(ChatHandler* handler, const char*);
template bool ahbot_commandscript::HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_WHITE>(ChatHandler* handler, const char*);
template bool ahbot_commandscript::HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_GREEN>(ChatHandler* handler, const char*);
template bool ahbot_commandscript::HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_BLUE>(ChatHandler* handler, const char*);
template bool ahbot_commandscript::HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_PURPLE>(ChatHandler* handler, const char*);
template bool ahbot_commandscript::HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_ORANGE>(ChatHandler* handler, const char*);
template bool ahbot_commandscript::HandleAHBotItemsAmountQualityCommand<AUCTION_QUALITY_YELLOW>(ChatHandler* handler, const char*);

template bool ahbot_commandscript::HandleAHBotItemsRatioHouseCommand<AUCTION_HOUSE_ALLIANCE>(ChatHandler* handler, const char*);
template bool ahbot_commandscript::HandleAHBotItemsRatioHouseCommand<AUCTION_HOUSE_HORDE>(ChatHandler* handler, const char*);
template bool ahbot_commandscript::HandleAHBotItemsRatioHouseCommand<AUCTION_HOUSE_NEUTRAL>(ChatHandler* handler, const char*);

void AddSC_ahbot_commandscript()
{
    new ahbot_commandscript();
}