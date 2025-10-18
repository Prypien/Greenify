# 🌿 Greenify

**Greenify** ist ein nativer iOS-App-Prototyp (SwiftUI), der nachhaltige Investitionen greifbar macht.  
Die App visualisiert weltweite Umweltprojekte, zeigt Klimaziele und erlaubt es Nutzern, CO₂-Zertifikate (Mockdaten) zu kaufen, zu verkaufen und zu verwalten.  
Dieses Projekt ist aktuell ein **reines Frontend-Mockup** – perfekt als Design- und Konzeptgrundlage für spätere Firebase-Integration.

---

## 🚀 Features

### 🌍 **Home**
- Interaktive Weltkarte (MapKit) mit nachhaltigen Projekten (Mockdaten)
- Globale Temperaturanzeige („+1.2 °C vs. pre-industrial level“)
- Fortschrittsbalken Richtung 1.5 °C-Klimaziel

### 🌱 **Projects**
- Liste von Beispielprojekten (z. B. Aufforstung, Solarenergie)
- Detailseiten mit Preis pro CO₂-Tonne, Zertifizierung und Beschreibung
- Navigierbar über `NavigationStack`

### 🏭 **Companies**
- Übersicht nachhaltiger Firmen mit aktuellem Kaufpreis für CO₂-Tonnen
- Design als ScrollView mit Karten-Layout
- „Sell CO₂“-Button (non-functional placeholder)

### 💼 **Wallet**
- Anzeige von aktuellem Guthaben (€) und CO₂-Bestand (t)
- Dummy-Transaktionsliste (Buy/Sell)
- Buttons „Buy CO₂“ & „Sell CO₂“ (aktuell nicht verknüpft)

### 👤 **Profile**
- Benutzerprofil mit Name, E-Mail, Verifizierungsstatus (KYC-Mock)
- Buttons für „Edit Profile“ und „Log Out“ (non-functional)

---

## 🧩 Architektur

| Komponente | Beschreibung |
|-------------|--------------|
| **Frontend** | SwiftUI + Combine |
| **Navigation** | `TabView` mit 5 Tabs (Home, Projects, Companies, Wallet, Profile) |
| **Map** | MapKit für Projektanzeige |
| **Mockdaten** | Lokale Dummy-Daten (`MockData.swift`) |
| **Designsystem** | SF Symbols, Apple HIG, Greenify Color Theme |

---

## ⚙️ Technologien

| Bereich | Stack |
|----------|-------|
| Programmiersprache | Swift 6 |
| Framework | SwiftUI |
| Karten | MapKit |
| Mock-Daten | Statische Arrays & Models |
| Architektur | MVVM-Light (Views + Models) |
| Farbschema | Grün (#3FA46A), Weiß, Hellgrau |
| Icons | SF Symbols (systemName) |

---

## 🧠 Projektstruktur

```
Greenify/
├── Models/
│   ├── Project.swift
│   ├── Company.swift
│   ├── Transaction.swift
├── Data/
│   ├── MockData.swift
├── Views/
│   ├── HomeView.swift
│   ├── ProjectsView.swift
│   ├── CompanyListView.swift
│   ├── WalletView.swift
│   ├── ProfileView.swift
├── GreenifyApp.swift
├── README.md
```

---

## 🧪 Ausführen in Xcode

1. **Xcode öffnen**
2. Oben ein Gerät auswählen → z. B. `iPhone 15 Pro`
3. **▶️ Run** drücken
4. App startet automatisch im iOS-Simulator

> 💡 Keine Konsole oder Terminal nötig.

---

## 🛠️ Geplante nächste Schritte

- [ ] Integration von **Firebase (Auth, Firestore, Storage)**
- [ ] KYC- und Payment-System (Stripe / SumSub)
- [ ] Dynamische CO₂-Preise via API
- [ ] Impact Dashboard mit Charts
- [ ] Veröffentlichung als TestFlight-Beta

---

## 📄 Lizenz
MIT License © 2025 Jen Preißer  
Designed & developed as a prototype for sustainable digital investment.
