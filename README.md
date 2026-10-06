# School Management System (ASP.NET Web Forms)

વિઝ્યુઅલ સ્ટુડિયો ૨૦૨૨ (Visual Studio 2022) માં આ પ્રોજેક્ટ સેટઅપ કરવા અને રન કરવા માટેની સંપૂર્ણ સ્ટેપ-બાય-સ્ટેપ ગાઇડ નીચે મુજબ છે:

---

## ૧. પ્રી-રિક્વિઝિટ્સ (જરૂરી સોફ્ટવેર)
ખાતરી કરો કે તમારા કમ્પ્યુટરમાં નીચેના સોફ્ટવેર ઇન્સ્ટોલ કરેલા છે:
- **Visual Studio 2022** (વિથ **ASP.NET and web development** વર્કલોડ).
- **.NET Framework 4.8** (જો ઇન્સ્ટોલ ન હોય તો વિઝ્યુઅલ સ્ટુડિયો ઇન્સ્ટોલર દ્વારા ઉમેરી શકાય).
- **Microsoft SQL Server LocalDB** (સામાન્ય રીતે વિઝ્યુઅલ સ્ટુડિયો સાથે જ ઇન્સ્ટોલ થઈ જાય છે).

---

## ૨. ડેટાબેઝ સેટઅપ કરવાના સ્ટેપ્સ (Database Setup)
પ્રોજેક્ટ ચલાવવા માટે પહેલા ડેટાબેઝ બનાવવો જરૂરી છે:

1. **Visual Studio 2022** ઓપન કરો.
2. મેનુ બારમાંથી **View** -> **SQL Server Object Explorer** પર ક્લિક કરો.
3. ડાબી બાજુની પેનલમાં **SQL Server** એક્સપાન્ડ કરો, ત્યારબાદ `(localdb)\MSSQLLocalDB` પર ક્લિક કરો.
4. **Databases** ફોલ્ડર પર રાઇટ-ક્લિક (Right-click) કરો અને **Add New Database** પર ક્લિક કરો.
5. ડેટાબેઝ નું નામ **`SchoolManagementDb`** આપો અને **OK** બટન પર ક્લિક કરો.
6. હવે `SchoolManagementDb` ડેટાબેઝ પર રાઇટ-ક્લિક કરી **New Query** ઓપન કરો.
7. આ પ્રોજેક્ટના ફોલ્ડરમાં રહેલી **`database.sql`** ફાઈલનો બધો કોડ કોપી કરો અને અહીં ક્વેરી વિન્ડોમાં પેસ્ટ (Paste) કરો.
8. ઉપર આપેલા લીલા ત્રિકોણ બટન (**Execute**) પર ક્લિક કરો અથવા કીબોર્ડ પરથી `F5` દબાવો. 
   - *આ કરવાથી યુઝર્સ, સ્ટુડન્ટ્સ, ટીચર્સ, ક્લાસ અને અટેન્ડન્સના ટેબલ્સ અને ડેમો ડેટા બની જશે.*

---

## ૩. પ્રોજેક્ટ વિઝ્યુઅલ સ્ટુડિયોમાં ખોલવો (Opening the Project)
1. તમારા કમ્પ્યુટરમાં પ્રોજેક્ટ ફોલ્ડર (`c:\5BCA\schoolman`) પર જાઓ.
2. પ્રોજેક્ટની સોલ્યુશન ફાઇલ **`SchoolManagement.sln`** પર ડબલ-ક્લિક કરો.
3. આનાથી આખો પ્રોજેક્ટ **Visual Studio 2022** માં લોડ થઈ જશે.

---

## ૪. પ્રોજેક્ટ રન કરવો (Running the Application)
1. વિઝ્યુઅલ સ્ટુડિયોની જમણી બાજુ આવેલ **Solution Explorer** માં જાઓ.
2. **`Login.aspx`** ફાઈલ શોધો, તેના પર રાઇટ-ક્લિક (Right-click) કરો અને **Set As Start Page** સિલેક્ટ કરો.
3. ઉપર મેનુ બારમાં આપેલા **IIS Express** (પ્લે બટન) પર ક્લિક કરો અથવા કීબોર્ડ પરથી **`F5`** દબાવો.
4. તમારો પ્રોજેક્ટ બ્રાઉઝરમાં ઓપન થઈ જશે!

---

## ૫. લોગિન ક્રેડેન્શિયલ્સ (Login Credentials)
ડેશબોર્ડ એક્સેસ કરવા માટે નીચેની વિગતોનો ઉપયોગ કરો:
- **Username**: `admin`
- **Password**: `admin123`

---

## English Version (Quick Guide)

1. **Create Database**:
   - Open Visual Studio -> **View** -> **SQL Server Object Explorer**.
   - Expand `(localdb)\MSSQLLocalDB` -> right-click **Databases** -> **Add New Database** -> Name it **`SchoolManagementDb`**.
   - Right-click `SchoolManagementDb` -> **New Query** -> Copy-paste and execute all code from **`database.sql`**.
2. **Open Project**:
   - Double-click **`SchoolManagement.sln`** to load the workspace.
3. **Run Application**:
   - Right-click **`Login.aspx`** in Solution Explorer -> Select **Set As Start Page**.
   - Press **`F5`** to launch the web application.
4. **Sign In**:
   - User: `admin` | Pass: `admin123`
