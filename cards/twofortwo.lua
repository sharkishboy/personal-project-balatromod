SMODS.Joker{
    key = "twofortwo",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    config = {extra = {mult_mod = 10, mult = 0}},
    rarity = 2,
    atlas = "jokers",
    pos = { x = 0, y = 0},
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult_mod, localize('Four of a Kind', 'poker_hands'), card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.mult > 0 then
            return {
                mult = card.ability.extra.mult
            }
        elseif context.before and next(context.poker_hands['Four of a Kind']) and not context.blueprint then
            -- no need to check context.poker_hands for 'Full House', since 'Two Pair' will be provided even with bigger hands present
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            return {
                message = localize('k_upgrade_ex'),
                card = card,
                colour = G.C.MULT
            }
        end
    end
}
