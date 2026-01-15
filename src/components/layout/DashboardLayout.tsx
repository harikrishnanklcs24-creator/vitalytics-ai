import { useAuth } from "@/contexts/AuthContext";
import { Navbar } from "./Navbar";
import { ElevenLabsWidget } from "@/components/voice/ElevenLabsWidget";
import { AIChatbot } from "@/components/chat/AIChatbot";

interface DashboardLayoutProps {
  children: React.ReactNode;
}

export function DashboardLayout({ children }: DashboardLayoutProps) {
  const { loading } = useAuth();

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-background">
        <div className="flex flex-col items-center gap-4">
          <div className="h-12 w-12 rounded-full border-4 border-primary border-t-transparent animate-spin" />
          <p className="text-muted-foreground">Loading...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background">
      <Navbar />
      
      {/* Main content */}
      <main className="lg:pl-64 pt-16 lg:pt-0 pb-20 lg:pb-0 min-h-screen">
        <div className="p-4 md:p-6 lg:p-8">
          {children}
        </div>
      </main>

      {/* AI Chatbot */}
      <AIChatbot />

      {/* ElevenLabs Voice Widget */}
      <ElevenLabsWidget />
    </div>
  );
}
