/* eslint-disable func-names */
const { getProof, setDefaultEpoch, helpers } = require('./exportHandler');
const { PUBLIC_RANGE } = require('./base/types');

/**
 * Export the PublicRangeProof for a default epoch
 *
 * @method PublicRangeProof
 * @param  {...any} args - rest parameter representing the proof inputs
 * @returns A PublicRangeProof construction for the default epoch
 */
function PublicRangeProof(...args) {
    const Proof = getProof(PUBLIC_RANGE.name, this.epochNum);

    return new Proof(...args);
}

/**
 * Export the PublicRangeProof for a given epoch number
 *
 * @method epoch
 * @param {Number} epochNum - epoch number for which a PublicRangeProof is to be returned
 * @param {bool} setAsDefault - if true, sets the inputted epochNum to be the default. If false, does
 * not set the inputted epoch number to be the default
 * @returns A PublicRangeProof construction for the given epoch number
 */
PublicRangeProof.epoch = function(epochNum, setAsDefault = false) {
    helpers.validateEpochNum(PUBLIC_RANGE.name, epochNum);

    if (setAsDefault) {
        setDefaultEpoch(PUBLIC_RANGE.name, epochNum);
    }

    return (...args) => {
        return PublicRangeProof.call({ epochNum }, ...args);
    };
};

module.exports = PublicRangeProof;
