-- Create app_role enum
CREATE TYPE public.app_role AS ENUM ('admin', 'user');

-- Create profiles table
CREATE TABLE public.profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL UNIQUE,
    email TEXT NOT NULL,
    full_name TEXT,
    avatar_url TEXT,
    date_of_birth DATE,
    gender TEXT CHECK (gender IN ('male', 'female', 'other')),
    height_cm NUMERIC(5,2),
    weight_kg NUMERIC(5,2),
    theme_preference TEXT DEFAULT 'light' CHECK (theme_preference IN ('light', 'dark')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- Create user_roles table (separate from profiles for security)
CREATE TABLE public.user_roles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    role app_role NOT NULL DEFAULT 'user',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    UNIQUE (user_id, role)
);

-- Create health_logs table
CREATE TABLE public.health_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    log_date DATE NOT NULL DEFAULT CURRENT_DATE,
    -- Vitals
    systolic_bp INTEGER CHECK (systolic_bp BETWEEN 60 AND 250),
    diastolic_bp INTEGER CHECK (diastolic_bp BETWEEN 40 AND 150),
    blood_sugar NUMERIC(5,1) CHECK (blood_sugar BETWEEN 20 AND 600),
    heart_rate INTEGER CHECK (heart_rate BETWEEN 30 AND 220),
    spo2 INTEGER CHECK (spo2 BETWEEN 50 AND 100),
    body_temp NUMERIC(4,1) CHECK (body_temp BETWEEN 90 AND 110),
    -- Lifestyle
    calories_intake INTEGER CHECK (calories_intake >= 0),
    steps_count INTEGER CHECK (steps_count >= 0),
    water_intake_ml INTEGER CHECK (water_intake_ml >= 0),
    sleep_hours NUMERIC(3,1) CHECK (sleep_hours BETWEEN 0 AND 24),
    weight_kg NUMERIC(5,2) CHECK (weight_kg > 0),
    height_cm NUMERIC(5,2) CHECK (height_cm > 0),
    -- Derived metrics
    bmi NUMERIC(4,1),
    health_score INTEGER CHECK (health_score BETWEEN 0 AND 100),
    health_status TEXT CHECK (health_status IN ('good', 'warning', 'critical')),
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    UNIQUE (user_id, log_date)
);

-- Create enquiries table for chatbot interactions
CREATE TABLE public.enquiries (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    question TEXT NOT NULL,
    response TEXT,
    category TEXT DEFAULT 'general',
    health_snapshot JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- Create admin_settings table
CREATE TABLE public.admin_settings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    setting_key TEXT UNIQUE NOT NULL,
    setting_value JSONB NOT NULL,
    updated_by UUID REFERENCES auth.users(id),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- Insert default admin settings
INSERT INTO public.admin_settings (setting_key, setting_value) VALUES
('max_daily_calories', '{"value": 2500}'::jsonb),
('bp_ranges', '{"systolic_low": 90, "systolic_high": 140, "diastolic_low": 60, "diastolic_high": 90}'::jsonb),
('sugar_limits', '{"fasting_low": 70, "fasting_high": 100, "post_meal_high": 140}'::jsonb),
('bmi_categories', '{"underweight": 18.5, "normal": 24.9, "overweight": 29.9}'::jsonb),
('alert_thresholds', '{"critical_bp_systolic": 180, "critical_bp_diastolic": 120, "critical_sugar": 300}'::jsonb);

-- Enable RLS on all tables
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.health_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.enquiries ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.admin_settings ENABLE ROW LEVEL SECURITY;

-- Security definer function to check roles
CREATE OR REPLACE FUNCTION public.has_role(_user_id UUID, _role app_role)
RETURNS BOOLEAN
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
    SELECT EXISTS (
        SELECT 1
        FROM public.user_roles
        WHERE user_id = _user_id AND role = _role
    )
$$;

-- Function to get current user's role
CREATE OR REPLACE FUNCTION public.get_user_role(_user_id UUID)
RETURNS TEXT
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
    SELECT role::TEXT
    FROM public.user_roles
    WHERE user_id = _user_id
    LIMIT 1
$$;

-- Profiles policies
CREATE POLICY "Users can view own profile"
ON public.profiles FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all profiles"
ON public.profiles FOR SELECT
TO authenticated
USING (public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Users can insert own profile"
ON public.profiles FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own profile"
ON public.profiles FOR UPDATE
TO authenticated
USING (auth.uid() = user_id);

-- User roles policies
CREATE POLICY "Users can view own role"
ON public.user_roles FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all roles"
ON public.user_roles FOR SELECT
TO authenticated
USING (public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Admins can manage roles"
ON public.user_roles FOR ALL
TO authenticated
USING (public.has_role(auth.uid(), 'admin'));

-- Health logs policies
CREATE POLICY "Users can view own health logs"
ON public.health_logs FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all health logs"
ON public.health_logs FOR SELECT
TO authenticated
USING (public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Users can insert own health logs"
ON public.health_logs FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own health logs"
ON public.health_logs FOR UPDATE
TO authenticated
USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own health logs"
ON public.health_logs FOR DELETE
TO authenticated
USING (auth.uid() = user_id);

-- Enquiries policies
CREATE POLICY "Users can view own enquiries"
ON public.enquiries FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all enquiries"
ON public.enquiries FOR SELECT
TO authenticated
USING (public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Users can insert own enquiries"
ON public.enquiries FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = user_id);

-- Admin settings policies
CREATE POLICY "Anyone can view settings"
ON public.admin_settings FOR SELECT
TO authenticated
USING (true);

CREATE POLICY "Only admins can modify settings"
ON public.admin_settings FOR ALL
TO authenticated
USING (public.has_role(auth.uid(), 'admin'));

-- Function to auto-calculate BMI and health score
CREATE OR REPLACE FUNCTION public.calculate_health_metrics()
RETURNS TRIGGER AS $$
DECLARE
    calculated_bmi NUMERIC(4,1);
    calculated_score INTEGER;
    calculated_status TEXT;
BEGIN
    -- Calculate BMI if height and weight are provided
    IF NEW.height_cm IS NOT NULL AND NEW.height_cm > 0 AND NEW.weight_kg IS NOT NULL THEN
        calculated_bmi := ROUND((NEW.weight_kg / ((NEW.height_cm / 100) ^ 2))::NUMERIC, 1);
        NEW.bmi := calculated_bmi;
    END IF;
    
    -- Calculate health score (simplified algorithm)
    calculated_score := 100;
    
    -- BP scoring
    IF NEW.systolic_bp IS NOT NULL THEN
        IF NEW.systolic_bp > 140 OR NEW.systolic_bp < 90 THEN
            calculated_score := calculated_score - 15;
        ELSIF NEW.systolic_bp > 130 OR NEW.systolic_bp < 100 THEN
            calculated_score := calculated_score - 5;
        END IF;
    END IF;
    
    -- Blood sugar scoring
    IF NEW.blood_sugar IS NOT NULL THEN
        IF NEW.blood_sugar > 200 OR NEW.blood_sugar < 70 THEN
            calculated_score := calculated_score - 20;
        ELSIF NEW.blood_sugar > 140 THEN
            calculated_score := calculated_score - 10;
        END IF;
    END IF;
    
    -- SpO2 scoring
    IF NEW.spo2 IS NOT NULL THEN
        IF NEW.spo2 < 90 THEN
            calculated_score := calculated_score - 25;
        ELSIF NEW.spo2 < 95 THEN
            calculated_score := calculated_score - 10;
        END IF;
    END IF;
    
    -- BMI scoring
    IF NEW.bmi IS NOT NULL THEN
        IF NEW.bmi < 18.5 OR NEW.bmi > 30 THEN
            calculated_score := calculated_score - 10;
        ELSIF NEW.bmi > 25 THEN
            calculated_score := calculated_score - 5;
        END IF;
    END IF;
    
    -- Sleep scoring
    IF NEW.sleep_hours IS NOT NULL THEN
        IF NEW.sleep_hours < 5 OR NEW.sleep_hours > 10 THEN
            calculated_score := calculated_score - 10;
        ELSIF NEW.sleep_hours < 6 THEN
            calculated_score := calculated_score - 5;
        END IF;
    END IF;
    
    -- Ensure score is between 0 and 100
    calculated_score := GREATEST(0, LEAST(100, calculated_score));
    NEW.health_score := calculated_score;
    
    -- Determine health status
    IF calculated_score >= 80 THEN
        calculated_status := 'good';
    ELSIF calculated_score >= 50 THEN
        calculated_status := 'warning';
    ELSE
        calculated_status := 'critical';
    END IF;
    NEW.health_status := calculated_status;
    
    NEW.updated_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SET search_path = public;

-- Trigger for health metrics calculation
CREATE TRIGGER calculate_health_metrics_trigger
BEFORE INSERT OR UPDATE ON public.health_logs
FOR EACH ROW
EXECUTE FUNCTION public.calculate_health_metrics();

-- Function to create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.profiles (user_id, email)
    VALUES (NEW.id, NEW.email);
    
    INSERT INTO public.user_roles (user_id, role)
    VALUES (NEW.id, 'user');
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

-- Trigger for new user signup
CREATE TRIGGER on_auth_user_created
AFTER INSERT ON auth.users
FOR EACH ROW
EXECUTE FUNCTION public.handle_new_user();

-- Function to update profile updated_at
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SET search_path = public;

CREATE TRIGGER update_profiles_updated_at
BEFORE UPDATE ON public.profiles
FOR EACH ROW
EXECUTE FUNCTION public.update_updated_at_column();