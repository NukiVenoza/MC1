//
//  SubtitleViewModel.swift
//  MC1
//
//  Created by Angela Christabel on 04/05/23.
//

import Foundation

class SubtitleViewModel: ObservableObject {
    var offsets: [[Double]] = [
        [13, 18, 22, 25, 30, 34, 41, 45, 52, 56, 60, 68, 72, 76, 82, 86, 100, 104, 108, 111, 116, 120, 125, 129, 134, 139, 147, 151, 156, 161, 165, 168, 172, 178, 182, 185],
        [14, 17, 22, 30, 34, 38, 42, 46, 52, 55, 62, 67, 73, 86, 89, 94, 99, 102, 108, 114, 120, 125, 134, 138, 148, 153, 163, 167, 173, 175, 180, 184, 189, 196, 199, 204, 209, 213, 218, 221, 227, 232, 236, 242, 248, 254, 264, 269, 272, 276, 281, 287, 289, 290],
        [14, 20, 24, 28, 33, 38, 43, 52, 60, 68, 71, 78, 89, 96, 102, 115, 118, 120, 130, 134, 144, 153, 162, 166, 193, 197],
    ]
    
    var subtitles: [SubtitleModel] = [
        SubtitleModel(exerciseId: 1, subtitles: [
            Subtitle(text: "Now we’re going to practice a short breathing exercise", animation: .easeOut),
            Subtitle(text: "that may allow you to step out of automatic mode", animation: .easeInOut),
            Subtitle(text: "and reconnect with the present moment.", animation: .easeInOut),
            Subtitle(text: "Find a comfortable, upright position, and either close your eyes", animation: .easeInOut),
            Subtitle(text: "or focus on a spot in front of you.", animation: .easeInOut),
            Subtitle(text: "Now take a deep breath to bring yourself into the present moment,", animation: .easeInOut),
            Subtitle(text: "just noticing whatever you are experiencing right now.", animation: .easeInOut),
            Subtitle(text: "Notice any sensations, be they of discomfort or tension.", animation: .easeInOut),
            Subtitle(text: "Notice your feet on the ground, or, if you’re sitting,", animation: .easeInOut),
            Subtitle(text: "notice whatever you are sitting on;", animation: .easeInOut),
            Subtitle(text: "notice your clothes against your body and the air against the skin.", animation: .easeInOut),
            Subtitle(text: "And now, notice whatever is in your mind.", animation: .easeInOut),
            Subtitle(text: "Whatever thoughts are there, and as best you can,", animation: .easeInOut),
            Subtitle(text: "just observe your thoughts as they are in your mind right now.", animation: .easeInOut),
            Subtitle(text: "Now notice whatever you are feeling emotionally. ", animation: .easeInOut),
            Subtitle(text: "Don’t try to change it, but just notice how you are feeling.", animation: .easeInOut),
            Subtitle(text: "And now, bring your attention to your breath,", animation: .easeInOut),
            Subtitle(text: "just noticing the rise and fall of your stomach as you breathe in,", animation: .easeInOut),
            Subtitle(text: "and as you breathe out.", animation: .easeInOut),
            Subtitle(text: "Notice the cool air flowing in through your nose as you inhale", animation: .easeInOut),
            Subtitle(text: "and the warm air as you exhale,", animation: .easeInOut),
            Subtitle(text: "as you breathe in and out.", animation: .easeInOut),
            Subtitle(text: "If you find your mind wandering away from your breath,", animation: .easeInOut),
            Subtitle(text: "simply bring it back to noticing each breath in, and out,", animation: .easeInOut),
            Subtitle(text: "as they follow, one after the other.", animation: .easeInOut),
            Subtitle(text: "And now, allow your awareness to expand to encompass your breath moving in your body,", animation: .easeInOut),
            Subtitle(text: "bringing your awareness to your thinking,", animation: .easeInOut),
            Subtitle(text: "and whatever you are feeling emotionally right now.", animation: .easeInOut),
            Subtitle(text: "Gently broaden this awareness to notice the whole experience,", animation: .easeInOut),
            Subtitle(text: "holding everything in awareness.", animation: .easeInOut),
            Subtitle(text: "Now bring your attention back to the room;", animation: .easeInOut),
            Subtitle(text: "open your eyes if they are closed.", animation: .easeInOut),
            Subtitle(text: "Notice what you can see; notice what you can hear.", animation: .easeInOut),
            Subtitle(text: "Push your feet into the ground and have a stretch;", animation: .easeInOut),
            Subtitle(text: "notice yourself stretching.", animation: .easeInOut),
            Subtitle(text: "Welcome back!", animation: .easeInOut),
        ]),
        
        SubtitleModel(exerciseId: 2, subtitles: [
            Subtitle(text: "Welcome to our mindful body scan exercise.", animation: .easeOut),
            Subtitle(text: "Find a comfortable position either seated or lying down.", animation: .easeOut),
            Subtitle(text: "Allow your body to be at ease and your breath to be natural.", animation: .easeOut),
            Subtitle(text: "Begin by taking a deep breath in,", animation: .easeOut),
            Subtitle(text: "filling your lungs with fresh air,", animation: .easeOut),
            Subtitle(text: "and exhale, releasing any tension from your body.", animation: .easeOut),
            Subtitle(text: "Take another deep breath in,", animation: .easeOut),
            Subtitle(text: "hold it for a few seconds,", animation: .easeOut),
            Subtitle(text: "and slowly exhale.", animation: .easeOut),
            Subtitle(text: "Now, bring your attention to the top of your head.", animation: .easeOut),
            Subtitle(text: "Focus on any sensations you might be feeling in this area.", animation: .easeOut),
            Subtitle(text: "Is there any tightness or tension?", animation: .easeOut),
            Subtitle(text: "Simply observe and allow yourself to be present in the moment.", animation: .easeOut),
            Subtitle(text: "As you move down to your forehead,", animation: .easeOut),
            Subtitle(text: "release any tension in this area by gently furrowing your eyebrows,", animation: .easeOut),
            Subtitle(text: "then release them.", animation: .easeOut),
            Subtitle(text: "Move down to your eyes,", animation: .easeOut),
            Subtitle(text: "notice any sensations you might be feeling around your eyes.", animation: .easeOut),
            Subtitle(text: "Notice if they feel heavy", animation: .easeOut),
            Subtitle(text: "or if there is any tension.", animation: .easeOut),
            Subtitle(text: "Continue to move your attention down your face,", animation: .easeOut),
            Subtitle(text: "your cheeks, your nose, your mouth, and your chin.", animation: .easeOut),
            Subtitle(text: "Allow yourself to feel any sensations that arise", animation: .easeOut),
            Subtitle(text: "and observe them without judgment.", animation: .easeOut),
            Subtitle(text: "Now move your attention down to your neck and shoulders.", animation: .easeOut),
            Subtitle(text: "Release any tension in this area by rolling your shoulders back and down.", animation: .easeOut),
            Subtitle(text: "Observe any sensations you might be feeling,", animation: .easeOut),
            Subtitle(text: "whether it's tightness or relaxation.", animation: .easeOut),
            Subtitle(text: "As you move down your arms,", animation: .easeOut),
            Subtitle(text: "notice any sensations in your hands and fingers.", animation: .easeOut),
            Subtitle(text: "Do they feel heavy or light?", animation: .easeOut),
            Subtitle(text: "Observe any sensation with curiosity", animation: .easeOut),
            Subtitle(text: "and without judgment.", animation: .easeOut),
            Subtitle(text: "Now move your attention to your chest and your stomach.", animation: .easeOut),
            Subtitle(text: "Take a deep breath in,", animation: .easeOut),
            Subtitle(text: "filling your lungs and belly with fresh air,", animation: .easeOut),
            Subtitle(text: "and exhale,", animation: .easeOut),
            Subtitle(text: "releasing any tension or discomfort.", animation: .easeOut),
            Subtitle(text: "Notice any sensation in this area,", animation: .easeOut),
            Subtitle(text: "whether it's relaxation or tightness.", animation: .easeOut),
            Subtitle(text: "Move your attention down to your hips and pelvis.", animation: .easeOut),
            Subtitle(text: "Allow yourself to feel any sensation in this area,", animation: .easeOut),
            Subtitle(text: "whether it's tightness or relaxation.", animation: .easeOut),
            Subtitle(text: "Observe any sensation without judgment.", animation: .easeOut),
            Subtitle(text: "Finally, move your attention down your legs,", animation: .easeOut),
            Subtitle(text: "your knees, your calves, your ankles, and your feet.", animation: .easeOut),
            Subtitle(text: "Notice any sensation you might be feeling in your legs and feet.", animation: .easeOut),
            Subtitle(text: "Are they heavy or light?", animation: .easeOut),
            Subtitle(text: "Do they feel warm or cold?", animation: .easeOut),
            Subtitle(text: "Take a deep breath in,", animation: .easeOut),
            Subtitle(text: "and exhale.", animation: .easeOut), //
            Subtitle(text: "When you're ready, ", animation: .easeOut),
            Subtitle(text: "gently open your eyes and return to the present moment.", animation: .easeOut)
        ]),
        
        SubtitleModel(exerciseId: 3, subtitles: [
            Subtitle(text: "Hello there, today we're going to do a mindful listening exercise together.", animation: .easeOut),
            Subtitle(text: "This exercise is designed to help us be more present in the moment", animation: .easeOut),
            Subtitle(text: "and more aware of the sounds around us.", animation: .easeOut),
            Subtitle(text: "To begin, find a comfortable place to sit or lie down.", animation: .easeOut),
            Subtitle(text: "Close your eyes and take a deep breath in, then exhale slowly.", animation: .easeOut),
            Subtitle(text: "Now, focus your attention on the sounds around you.", animation: .easeOut),
            Subtitle(text: "First, take a moment to listen to the sounds that are farthest away.", animation: .easeOut),
            Subtitle(text: "You might notice sounds you haven't heard before.", animation: .easeOut),
            Subtitle(text: "Now, focus on the sounds that are closest to you.", animation: .easeOut),
            Subtitle(text: "Maybe it's the sound of your breath", animation: .easeOut),
            Subtitle(text: "or your heartbeat.", animation: .easeOut),
            Subtitle(text: "As you continue to listen, try to identify each sound you hear.", animation: .easeOut),
            Subtitle(text: "Can you hear the sound of traffic outside,", animation: .easeOut),
            Subtitle(text: "the hum of your computer?", animation: .easeOut),
            Subtitle(text: "Take a few moments to really pay attention to each sound.", animation: .easeOut),
            Subtitle(text: "Notice its volume,", animation: .easeOut),
            Subtitle(text: "pitch,", animation: .easeOut),
            Subtitle(text: "and duration.", animation: .easeOut),
            Subtitle(text: "If your mind starts to wander, that's okay.", animation: .easeOut),
            Subtitle(text: "Just gently bring your attention back to the sounds around you.", animation: .easeOut),
            Subtitle(text: "Try to stay present with each sound for a few moments.", animation: .easeOut),
            Subtitle(text: "Let's continue to listen mindfully for a few more minutes.", animation: .easeOut),
            Subtitle(text: "If you're having trouble focusing,", animation: .easeOut),
            Subtitle(text: "take a deep breath in and exhale slowly.", animation: .easeOut),
            Subtitle(text: "And when you're ready, slowly open your eyes.", animation: .easeOut),
            Subtitle(text: "Take a moment to notice how you feel.", animation: .easeOut),
        ]),
    ]
    
    func getSubtitles(exerciseId: Int) -> [Subtitle] {
        return subtitles[exerciseId - 1].subtitles
    }
    
    func getOffsets(exerciseId: Int) -> [Double] {
        return offsets[exerciseId - 1]
    }
}
