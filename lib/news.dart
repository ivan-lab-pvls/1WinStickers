class News {
  final String title;
  final String content;
  final String imageLink;

  News({
    required this.title,
    required this.content,
    required this.imageLink,
  });
}

final List<News> newsList = [
  News(
    title: 'Porsche Could Confirm A New Supercar This Year',
    content: '''
Porsche celebrated its 75th anniversary in 2023 with the Mission X supercar. The concept offered a glimpse into the electric future, but there hasn't been much news since then. Recently though, Porsche CEO Oliver Blume said a decision regarding whether or not to put the car into production will happen later this year.

Porsche's head honcho told the Australian magazine CarSales that the feedback received following the Mission X's debut last June has been "massively positive." The 55-year-old executive said, "It's a great motivation for us to do the car." If approved, it would be only the fourth supercar flagship from Zuffenhausen, following in the footsteps of the 959, Carrera GT, and the 918 Spyder.

Porsche has been tight-lipped about the technical specifications of the spectacular concept, but we do know Mission X is about 177.1 inches long, 78.7 inches wide, and less than 47.2 inches tall. It has a wheelbase of 107.5 inches and staggered wheels (20 inches front and 21 inches rear), with a battery pack mounted behind the seats. When the concept debuted, we were told the supercar had a power-to-weight ratio of at least one horsepower per 1 kilogram (2.2 pounds).
''',
    imageLink:
        'https://cdn.motor1.com/images/mgl/YAlePq/s1/porsche-mission-x-concept.webp',
  ),
  News(
    title: 'Zagato\'s New Sports Car Has A Removable Long-Tail Rear Bumper',
    content: '''
Zagato has a lovely new car called the AGTZ Twin Tail. It pays homage to the Alpine A220 that raced at Le Mans, and it's based on the mid-engined Alpine A110 sports car. But this is more than just another lovely looking, ultra-expensive vehicle.

Like the Alfa Romeo TZ1, the Iso Rivolta GTZ, and other Zagato builds before it, the AGTZ has a shapely rear end design. But here the back end is actually removable; The Twin Tail gives you the option of a long tail look for better aerodynamics or a stocky short tail design for daily cruising. Both iterations of the Alpine-based sports car look stunning.

Zagato doesn’t say what powers the Twin Tail, but it likely retains the factory A110’s turbocharged 1.8-liter four-cylinder engine, rated at 249 horsepower from the factory. In the A110 the engine is paired to a seven-speed dual-clutch automatic and rear-wheel drive, which helps it to 62 miles per hour in about 4.5 seconds. Zagato doesn’t say how much weight it added with the extra bodywork, either, but the base A110 weighs a scant 2,429 pounds—so it shouldn’t be much more than that.
''',
    imageLink:
        'https://cdn.motor1.com/images/mgl/NGj70y/s1/zagato-agtz-twin-tail.webp',
  ),
  News(
    title:
        'This Boring Box Truck Is Actually A Stealth Camper Built For Beach Life',
    content: '''
Stealth campers are one of the most exciting trends in the motorhome scene. The builders take a box truck or plain white van and craft a comfy living space inside. In this video, an owner named Scott shows off his creation that he parks next to the beach to go surfing every day for six months of the year.

As with all stealth campers, this build's exterior is the least exciting part. It's a white 2008 GMC W-Series box truck with no identification on the outside that this is a tiny home on wheels. A hidden spot underneath the rear lets Scott store his 11-foot surfboard. 

Lifting the rear panel reveals a facade that looks like a tiny cabin. There's a wood-paneled wall with a pair of large windows and a door. Inside, Scott has 120 square feet of living space  using that area with impressive efficiency. It's not too often we see a builder put the pantry for food storage in the floor to avoid having cabinets lining the upper walls.
''',
    imageLink:
        'https://cdn.motor1.com/images/mgl/g4EmME/s1/white-stealth-camper-for-surfing.webp',
  ),
  News(
    title: 'Chevy Silverado And GMC Sierra Plug-In Hybrids Are Coming: Report',
    content: '''
"We're not going to dilute our investment with hybrids"—is what General Motors President Mark Reuss told Business Insider in 2022. But apparently the company has had a change of heart. During an investor briefing last month, CEO Mary Barra announced new plug-in hybrid models, with reports indicating the Chevrolet Silverado and GMC Sierra PHEVs are on the way.

Citing sources familiar with the matter, Autoweek claims GM is in a hurry to launch PHEV versions of the two trucks. The company has apparently initiated a "crash program" to speed up the development and market launch of the two electrified derivatives. We've reached out to both Chevy and GMC for comment, and we'll update the story if we hear back.
''',
    imageLink:
        'https://cdn.motor1.com/images/mgl/Kb1X0l/s1/2024-chevrolet-silverado-hd.webp',
  ),
  News(
    title:
        'This Rothmans-Wrapped BMW 7 Series Overlander Is Better Than Any SUV',
    content: '''
Friends, it's time for another fish-out-of-water project car. Lifting a BMW 7 Series, installing off-road tires, and wrapping it in a Rothmans livery isn't something we'd ever thought of. But it's real. And it's good. Very, very good.

The BMW in question is a fourth-gen E65 7 Series, which heralded the Chris Bangle design era at BMW starting in 2001. The car's shape had no shortage of detractors back in the day, but a two-inch suspension lift and Hella quad lights do wonders in to clean up the look. It rides on 18-inch Rota wheels shod with Yokohama Geolanders, giving this luxury sedan a downright cool aesthetic.
''',
    imageLink:
        'https://cdn.motor1.com/images/mgl/AkgvR2/s1/bmw-7-series-overlander.webp',
  ),
  News(
    title: 'Build Your Dream 2024 Land Cruiser With Toyota\'s New Configurator',
    content: '''
Yesterday Toyota released the pricing for the 2024 Land Cruiser. Now, the company has unleashed its official configurator to the world, allowing you to build your ideal version of the most anticipated SUV of the year. Here are the cool options and features that you should know about. 

The base 1958 trim is available in just three colors: Black, Meteor Shower grey, and Ice Cap white. The interior only comes in Black fabric upholstery. No options are available, but buyers can load up on accessories like a ball mount for towing, side steps, an integrated dashcam, a roof rack, and more.
''',
    imageLink:
        'https://cdn.motor1.com/images/mgl/P3WyzX/s1/2024-toyota-land-cruiser-1958-exterior.webp',
  ),
  News(
    title: 'The 2025 Mazda CX-70 Doesn\'t Cost Any Less Than The CX-90',
    content: '''
The Mazda CX-70 is, essentially, a CX-90 with its third row deleted. Mazda just announced pricing for the 2025 CX-70, and interestingly, each version of the two-row SUV costs the same as its 2024 CX-90 equivalent. But as the CX-70 is offered only in higher-spec trims, its base price is actually higher than the CX-90.

At the bottom of the range is the CX-70 3.3 Turbo Preferred at \$41,820, while the most expensive is the PHEV Premium Plus at \$58,825.
''',
    imageLink:
        'https://cdn.motor1.com/images/mgl/7ZvkmA/s1/2025-mazda-cx-70-phev-exterior-front-quarter.webp',
  ),
  News(
    title: 'The 2024 Jeep Gladiator Is \$1,095 Cheaper Than Before',
    content: '''
The Jeep Gladiator rolls into the 2024 model year with several updates. The automaker refreshed the truck’s design, tweaked the cabin, and added more airbags. While everything seems to be getting more expensive, the updated truck is actually \$1,095 cheaper to start than the outgoing model.

The 2024 Gladiator Sport will serve as the entry-level offering, which starts at \$39,790 (all prices include the \$1,895 destination charge). The 2023 Sport started at \$40,885. The Sport S is the next trim up, and it’s cheaper than its predecessor – \$43,290 vs \$46,375.
''',
    imageLink:
        'https://cdn.motor1.com/images/mgl/nAmAkk/s1/2024-jeep-gladiator-mojave-x.webp',
  ),
  News(
    title: 'I Want This Aston Martin DBR9 More Than I Want My Next Breath',
    content: '''
The early to mid 2000s was a wonderful time for sports-car racing, especially if you like GT cars. At Le Mans and beyond, fans were lucky to see some of the coolest production-based cars duke it out. Corvettes, Ferrari 550s and 430s, plus oddballs like the Saleen S7R among them. I don't want to say that the Aston Martin DBR9 is the coolest of this bunch, but it certainly is one of the coolest cars on sale today.

For sale at Girardo and Co. in the UK, this is just one of 10 Aston Martin works cars, built in 2006 and campaigned by the BMS Scuderia Italia Team in 2006 and 2007. Chassis number 9, this DBR9 nabbed four FIA GT podium finishes in its racing career, and placed sixth and 11th in class at Le Mans in 2006 and 2007, respectively. Since 2018, it's enjoyed a second life as a historic racer, and it was recently refinished in its 2007 Le Mans livery, which celebrated Pirelli's 100th anniversary. Hence the number.
''',
    imageLink:
        'https://cdn.motor1.com/images/mgl/XBGxLp/s1/aston-martin-dbr9.webp',
  ),
  News(
    title: 'You Know Porsche, Right? They Have Basketball Shoes Now',
    content: '''
When you think of basketball, you think Porsche, right? Joking aside, Porsche and Puma have a long history of teaming up on sneaker collabs, most of the time for lifestyle or racing. But now the two companies are partnering on basketball shoes, believe it or not.

The first of two pairs is the LaMelo Ball MB.03—the Charlotte Hornet star's third signature sneaker. It gets the Porsche treatment with a black and yellow colorway inspired by the iconic 930 Turbo's factory gold paint job, with the Porsche logo on the heel.

The second shoe is the All-Pro Nitro. It has a nearly identical design to the MB.03 with an all-yellow colorway and subtle black accents. It even has a Porsche Turbo logo near the heel, which makes it ultra-fast, obviously. And this isn't Porsche's first on-court shoe; the company teamed up with Puma in 2021 for a pair of Clyde All-Pros.
''',
    imageLink:
        'https://cdn.motor1.com/images/mgl/7ZvOKp/s1/porsche-puma-basketball-shoes.webp',
  ),
];
