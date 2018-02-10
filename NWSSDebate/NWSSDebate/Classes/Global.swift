//
//  Global.swift
//  NWSSDebate
//
//  Created by Selena Liu on 2018-01-06.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import Foundation

let globalVars = Global()

class Global {
    let menuLabels = ["Individual Timer", "Full Debate Timer", "Format Information"]
    let segueLabels = ["toTimer", "toFullDebateTimer", "toFormatInformation"]
    
    var speakerLabels = ["First Proposition",
                         "First Opposition",
                         "Second Proposition",
                         "Second Opposition",
                         "First Opposition",
                         "First Proposition"]
    
    var doneOnboarding = ""
    var speakerIndex = 0
    var fullDebateTimes = [6, 6, 6, 6, 3, 3]
    var timesIndex = 0
    
    let CNDFText = """
    a) First proposition speaker must:
        - Define the terms
        - Establish the caseline
        - Signpost their case division (state who will cover which points)
    This speaker will normally have two or three constructive arguments and must make the team’s position crystal clear.

    b) First opposition speaker must:
        - Refute the points just made by the first proposition
        - Establish the caseline,
        - Signpost their case division (state who will cover which points)
        This speaker will also likely deliver the first two arguments of the opposition side

    c) Second proposition speaker must:
        - Refute the case presented by the first opposition speaker
        - Develop the points of the first proposition speaker with new analysis or perspective if possible
        - Present one or two more constructive arguments for the proposition.

    d) Second opposition speaker must:
        - Refute the case presented by the second proposition speaker, as well as any inadequately refuted points from the first proposition speaker
        - Develop the points of the first proposition speaker with new analysis or perspective if possible
        - Present one or two more constructive arguments for the proposition.
    
    e) Rebuttal Speeches:
        - Speakers should attempt to summarize the key themes or ideas that have taken place in the debate.
        - This speech tries to put the debate in context and explain why their team has to win.
        - Should focus on the major areas of contention during the round rather than a point by point summary
        - This is the final opportunity for a team to convince the judge why their team has won.
        - No new constructive arguments may be introduced

    f) POI:
        - only allowed during constructive speeches, but not during the first and last minute (known as protected time)
        - Expected to \"Give two, take two\"
        - Should be short and to the point and used to gain tactical advantage
    """
    let BritshParliamentText = """
    a) Prime Minister
        - Defines and interprets the motion
        - Develops the case for that interpretation of the motion
        - A case consists of one or more arguments supporting the Prime Minister’s interpretation of the motion

    b) Leader of Opposition
        - Establishes a stance that both Opposition teams will defend throughout the debate.
        - Refutes the case of offered by the Prime Minister.
        - Constructs one or more arguments against the motion.

    c) Deputy Prime Minister
        - Refutes the arguments presented by the Leader of Opposition.
        - Rebuilds the case presented by the Prime Minister.
        - Adds new arguments to the case of the Prime Minister.

    d) Deputy Leader of Opposition
        - Advances important aspects of the refutation of case presented by the Prime Minister.
        - Refutes any new arguments presented by the Deputy Prime Minister.
        - Rebuilds arguments of the Leader of Opposition
        - Adds new arguments to those presented by the Leader of the Opposition.

    e) Member of Government
        - Defends the general direction and case of the 1st Government team.
        - Continues refutation of 1st Opposition team’s arguments focusing on new arguments introduced by the Deputy Leader of the Opposition.
        - Develops a new argument that is different from but consistent with the case of the 1st Government (extension).

    f) Member of Opposition
        - Briefly defends the general direction taken by the 1st Opposition team.
        - Briefly continues refutation of the case of the 1st Government team.
        - Refutes arguments introduced by the Member of Government.
        - Presents at least one new opposition argument (extension).

    g) Government Whip
        - Summarizes the debate from the POV of the Government, defending the general viewpoint of both proposition teams.
        - Usually does not provide new arguments.

    h) Opposition Whip
        - Summarizes the debate from the POV of Opposition, defending the general viewpoint of both opposition teams.
        - Does not provide new arguments.

    """

}
