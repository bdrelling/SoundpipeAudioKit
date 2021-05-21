// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import AudioKit
import CAudioKit

/// This is an implementation of Zoelzer's parametric equalizer filter.
public class LowShelfParametricEqualizerFilter: Node {

    let input: Node

    /// Connected nodes
    public var connections: [Node] { [input] }

    /// Underlying AVAudioNode
    public var avAudioNode = instantiate(effect: "peq1")

    // MARK: - Parameters

    /// Specification details for cornerFrequency
    public static let cornerFrequencyDef = NodeParameterDef(
        identifier: "cornerFrequency",
        name: "Corner Frequency (Hz)",
        address: akGetParameterAddress("LowShelfParametricEqualizerFilterParameterCornerFrequency"),
        defaultValue: 1_000,
        range: 12.0 ... 20_000.0,
        unit: .hertz)

    /// Corner frequency.
    @Parameter(cornerFrequencyDef) public var cornerFrequency: AUValue

    /// Specification details for gain
    public static let gainDef = NodeParameterDef(
        identifier: "gain",
        name: "Gain",
        address: akGetParameterAddress("LowShelfParametricEqualizerFilterParameterGain"),
        defaultValue: 1.0,
        range: 0.0 ... 10.0,
        unit: .generic)

    /// Amount at which the corner frequency value shall be changed. A value of 1 is a flat response.
    @Parameter(gainDef) public var gain: AUValue

    /// Specification details for q
    public static let qDef = NodeParameterDef(
        identifier: "q",
        name: "Q",
        address: akGetParameterAddress("LowShelfParametricEqualizerFilterParameterQ"),
        defaultValue: 0.707,
        range: 0.0 ... 2.0,
        unit: .generic)

    /// Q of the filter. sqrt(0.5) is no resonance.
    @Parameter(qDef) public var q: AUValue

    // MARK: - Initialization

    /// Initialize this equalizer node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - cornerFrequency: Corner frequency.
    ///   - gain: Amount at which the corner frequency value shall be changed. A value of 1 is a flat response.
    ///   - q: Q of the filter. sqrt(0.5) is no resonance.
    ///
    public init(
        _ input: Node,
        cornerFrequency: AUValue = cornerFrequencyDef.defaultValue,
        gain: AUValue = gainDef.defaultValue,
        q: AUValue = qDef.defaultValue
        ) {
        self.input = input

        setupParameters()

        self.cornerFrequency = cornerFrequency
        self.gain = gain
        self.q = q
   }
}