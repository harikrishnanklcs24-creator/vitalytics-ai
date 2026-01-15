import { useState } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { Mic, X } from "lucide-react";
import { Button } from "@/components/ui/button";

export function ElevenLabsWidget() {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <>
      {/* Desktop: Fixed right sidebar */}
      <div className="hidden xl:block fixed right-0 top-0 h-full w-80 border-l border-border bg-card/50 backdrop-blur-sm z-30">
        <div className="p-4 border-b border-border">
          <h3 className="font-display font-semibold flex items-center gap-2">
            <Mic className="h-4 w-4 text-primary" />
            Voice Assistant
          </h3>
          <p className="text-xs text-muted-foreground mt-1">Talk to your health AI</p>
        </div>
        <div className="h-[calc(100%-80px)] flex items-center justify-center">
          <elevenlabs-convai agent-id="agent_9601kf039ctzf2jb1wjz4p8wr07g"></elevenlabs-convai>
        </div>
      </div>

      {/* Mobile/Tablet: Floating button */}
      <div className="xl:hidden fixed right-4 bottom-24 lg:bottom-8 z-50">
        <AnimatePresence>
          {isOpen && (
            <motion.div
              initial={{ opacity: 0, scale: 0.9, y: 20 }}
              animate={{ opacity: 1, scale: 1, y: 0 }}
              exit={{ opacity: 0, scale: 0.9, y: 20 }}
              className="absolute bottom-16 right-0 w-72 h-96 bg-card rounded-2xl shadow-2xl border border-border overflow-hidden"
            >
              <div className="p-3 border-b border-border flex items-center justify-between">
                <span className="font-medium text-sm">Voice Assistant</span>
                <Button variant="ghost" size="icon" className="h-8 w-8" onClick={() => setIsOpen(false)}>
                  <X className="h-4 w-4" />
                </Button>
              </div>
              <div className="h-[calc(100%-52px)] flex items-center justify-center">
                <elevenlabs-convai agent-id="agent_9601kf039ctzf2jb1wjz4p8wr07g"></elevenlabs-convai>
              </div>
            </motion.div>
          )}
        </AnimatePresence>

        <motion.button
          whileHover={{ scale: 1.05 }}
          whileTap={{ scale: 0.95 }}
          onClick={() => setIsOpen(!isOpen)}
          className="h-14 w-14 rounded-full gradient-primary shadow-lg flex items-center justify-center text-primary-foreground"
        >
          <Mic className="h-6 w-6" />
        </motion.button>
      </div>
    </>
  );
}
