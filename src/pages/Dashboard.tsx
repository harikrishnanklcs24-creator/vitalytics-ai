import { DashboardLayout } from "@/components/layout/DashboardLayout";
import { motion } from "framer-motion";
import { Activity, Droplets, Heart, Scale, TrendingUp, Footprints, Moon, Flame } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { useAuth } from "@/contexts/AuthContext";
import { LineChart, Line, AreaChart, Area, BarChart, Bar, PieChart, Pie, Cell, ResponsiveContainer, XAxis, YAxis, Tooltip, Legend } from "recharts";

const mockBPData = [
  { date: "Mon", systolic: 120, diastolic: 80 },
  { date: "Tue", systolic: 118, diastolic: 78 },
  { date: "Wed", systolic: 125, diastolic: 82 },
  { date: "Thu", systolic: 122, diastolic: 79 },
  { date: "Fri", systolic: 119, diastolic: 77 },
  { date: "Sat", systolic: 121, diastolic: 80 },
  { date: "Sun", systolic: 118, diastolic: 76 },
];

const mockCaloriesData = [
  { date: "Mon", calories: 2100 },
  { date: "Tue", calories: 1950 },
  { date: "Wed", calories: 2300 },
  { date: "Thu", calories: 2050 },
  { date: "Fri", calories: 2200 },
  { date: "Sat", calories: 2400 },
  { date: "Sun", calories: 1900 },
];

const mockHealthScoreData = [
  { date: "Mon", score: 75 },
  { date: "Tue", score: 78 },
  { date: "Wed", score: 72 },
  { date: "Thu", score: 80 },
  { date: "Fri", score: 82 },
  { date: "Sat", score: 79 },
  { date: "Sun", score: 85 },
];

const lifestyleDistribution = [
  { name: "Sleep", value: 30, color: "hsl(var(--chart-1))" },
  { name: "Exercise", value: 25, color: "hsl(var(--chart-2))" },
  { name: "Nutrition", value: 25, color: "hsl(var(--chart-3))" },
  { name: "Hydration", value: 20, color: "hsl(var(--chart-4))" },
];

const summaryCards = [
  { icon: Heart, label: "Blood Pressure", value: "120/80", unit: "mmHg", status: "good" },
  { icon: Droplets, label: "Blood Sugar", value: "95", unit: "mg/dL", status: "good" },
  { icon: Flame, label: "Calories", value: "2,100", unit: "kcal", status: "good" },
  { icon: Scale, label: "BMI", value: "22.5", unit: "kg/m²", status: "good" },
  { icon: TrendingUp, label: "Health Score", value: "85", unit: "/100", status: "good" },
];

export default function Dashboard() {
  const { profile } = useAuth();

  return (
    <DashboardLayout>
      <div className="space-y-6 xl:mr-80">
        {/* Welcome */}
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }}>
          <h1 className="font-display text-2xl md:text-3xl font-bold">
            Welcome back, {profile?.full_name?.split(" ")[0] || "User"}! 👋
          </h1>
          <p className="text-muted-foreground">Here's your health overview for today.</p>
        </motion.div>

        {/* Summary Cards */}
        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
          {summaryCards.map((card, i) => (
            <motion.div key={i} initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: i * 0.1 }}>
              <Card className="glass-card hover-lift">
                <CardContent className="p-4">
                  <div className="flex items-center gap-2 mb-2">
                    <div className={`h-8 w-8 rounded-lg flex items-center justify-center status-${card.status}`}>
                      <card.icon className="h-4 w-4" />
                    </div>
                  </div>
                  <p className="text-xs text-muted-foreground">{card.label}</p>
                  <p className="text-xl font-bold">{card.value}<span className="text-sm font-normal text-muted-foreground"> {card.unit}</span></p>
                </CardContent>
              </Card>
            </motion.div>
          ))}
        </div>

        {/* Charts Grid */}
        <div className="grid md:grid-cols-2 gap-6">
          {/* BP Trend */}
          <Card className="glass-card">
            <CardHeader><CardTitle className="text-base">Blood Pressure Trend</CardTitle></CardHeader>
            <CardContent>
              <ResponsiveContainer width="100%" height={200}>
                <LineChart data={mockBPData}>
                  <XAxis dataKey="date" stroke="hsl(var(--muted-foreground))" fontSize={12} />
                  <YAxis stroke="hsl(var(--muted-foreground))" fontSize={12} />
                  <Tooltip contentStyle={{ background: "hsl(var(--card))", border: "1px solid hsl(var(--border))" }} />
                  <Legend />
                  <Line type="monotone" dataKey="systolic" stroke="hsl(var(--chart-1))" strokeWidth={2} dot={false} />
                  <Line type="monotone" dataKey="diastolic" stroke="hsl(var(--chart-2))" strokeWidth={2} dot={false} />
                </LineChart>
              </ResponsiveContainer>
            </CardContent>
          </Card>

          {/* Calories */}
          <Card className="glass-card">
            <CardHeader><CardTitle className="text-base">Daily Calorie Intake</CardTitle></CardHeader>
            <CardContent>
              <ResponsiveContainer width="100%" height={200}>
                <BarChart data={mockCaloriesData}>
                  <XAxis dataKey="date" stroke="hsl(var(--muted-foreground))" fontSize={12} />
                  <YAxis stroke="hsl(var(--muted-foreground))" fontSize={12} />
                  <Tooltip contentStyle={{ background: "hsl(var(--card))", border: "1px solid hsl(var(--border))" }} />
                  <Bar dataKey="calories" fill="hsl(var(--chart-3))" radius={[4, 4, 0, 0]} />
                </BarChart>
              </ResponsiveContainer>
            </CardContent>
          </Card>

          {/* Health Score */}
          <Card className="glass-card">
            <CardHeader><CardTitle className="text-base">Health Score Progress</CardTitle></CardHeader>
            <CardContent>
              <ResponsiveContainer width="100%" height={200}>
                <AreaChart data={mockHealthScoreData}>
                  <XAxis dataKey="date" stroke="hsl(var(--muted-foreground))" fontSize={12} />
                  <YAxis stroke="hsl(var(--muted-foreground))" fontSize={12} domain={[0, 100]} />
                  <Tooltip contentStyle={{ background: "hsl(var(--card))", border: "1px solid hsl(var(--border))" }} />
                  <Area type="monotone" dataKey="score" stroke="hsl(var(--chart-1))" fill="hsl(var(--chart-1) / 0.2)" />
                </AreaChart>
              </ResponsiveContainer>
            </CardContent>
          </Card>

          {/* Lifestyle Distribution */}
          <Card className="glass-card">
            <CardHeader><CardTitle className="text-base">Lifestyle Distribution</CardTitle></CardHeader>
            <CardContent>
              <ResponsiveContainer width="100%" height={200}>
                <PieChart>
                  <Pie data={lifestyleDistribution} cx="50%" cy="50%" innerRadius={50} outerRadius={80} dataKey="value" label={({ name }) => name}>
                    {lifestyleDistribution.map((entry, i) => (
                      <Cell key={i} fill={entry.color} />
                    ))}
                  </Pie>
                  <Tooltip />
                </PieChart>
              </ResponsiveContainer>
            </CardContent>
          </Card>
        </div>
      </div>
    </DashboardLayout>
  );
}
