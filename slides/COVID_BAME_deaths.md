<style>
.small-code pre code {
  font-size: 1em;
}

.table{
  width:auto;
  font-size: 8px;
}

.reveal h1, .reveal h2, .reveal h3 {
  word-wrap: normal;
  -moz-hyphens: none;
}
</style>

Postcode versus genetic code: ethnicity and racism in the time of COVID-19
========================================================
author: Miqdad Asaria (LSE)
date: 14th May 2020
autosize: true

Disclaimer
========================================================
incremental: true
- Data on COVID-19 is constantly being updated as the pandemic progresses 
- Data that is presented here represents the best available information at the time of compiling the slides 
- Data for different measures are available for different time points so care must be taken to read across results
- Historical data are constantly being revised and corrected by the NHS, PHE and the ONS so precise reproducibility of any analysis presented here may be tricky
- Despite this conclusions drawn are general and likely robust to these challenges


What do we know?
========================================================
incremental: true
- A lot of anecdotal evidence that large numbers of patients in hospital with COVID-19 are from Black, Asian and Minority Ethnic (BAME) communities
- BAME communities make up <font color="red">14%</font> of the population of England (ONS 2011) 
- BAME doctors make up <font color="red">44%</font> of all NHS doctors but <font color="red">95%</font> of deaths (HSJ, 22nd April 2020)
- BAME nurses make up <font color="red">20%</font> of all NHS nurses but <font color="red">71%</font> of deaths (HSJ, 22nd April 2020)
- Areas that have the most COVID-19 deaths (population adjusted) are the more ethnically diverse areas such as Newham, Harrow and Brent (ONS)

COVID-19 by local authority
========================================================
type: section

Deaths per 100,000 population
========================================================
![map](figures/map.png)
* https://miqdad.freeasinspeech.org.uk/ons_deaths_explorer/

Cases & deaths by BAME population (%)
========================================================
incremental: true
![cases](figures/phe_cases_eth.png)
***
![asmr](figures/ons_deaths_eth.png)

Is this a London specific thing?
========================================================
![london](figures/asmr_bame_plot_london.png)

COVID-19 in hospital
========================================================
type: section

Data from the NHS
========================================================
- Intensive care admissions data by ethnicity
- COVID-19 death data published daily but only includes Hospital deaths
- Deaths broken down by age group and ethnicity weekly

Intensive care admissions by ethnicity
========================================================
![icnarc](figures/icnarc_obs_exp_plot.png)

Excess ICU admissions by ethnicity (%)
========================================================
![icnarc_diff](figures/icnarc_diff_plot_perc.png)

Deaths by age
========================================================
![age_at_death](figures/deaths_by_age.png)

Population data from ONS census
========================================================
incremental: true
![pop_structure](figures/pop_structure_plot.png)
* 26% of the White population is over 60 years
* 8% of the non-White population is over 60 years

Age adjusted deaths
=========================================================
![obs_exp](figures/obs_exp_plot.png)

Excess deaths (%)
=========================================================
![excess](figures/diff_plot_perc.png)

Excess deaths (%) detailed
=========================================================
![excess_details](figures/diff_plot_perc_detail.png) 

Expected versus observed
========================================================
![table](figures/covid_deaths_by_ethnicity.png)

Possible explanations
========================================================
type: section

How do we get more COVID-19 deaths
========================================================
incremental: true
* Number of deaths is a function of:
<br>
<small>
<ol>
<li>number of cases</li>
<li>severity of cases</li>
<li>treatment of cases</li>
</ol>
</small>
* How and why might each of these differ in BAME communities?
* What can we do to mitigate this?

Number of cases
========================================================
incremental: true
* Exposure through employment e.g. NHS, precarious or zero hours contracts, front line jobs
* Exposure due to living conditions e.g. multi-generation household, higher housing density, more urban
* Exposure due to lack of effective design and communication of public health advice e.g. culture appropriate messaging
* Exposure due to inadequate testing and tracing
* All these factors would mean it is harder for BAME people to successfully lockdown so a higher BAME "R"
* <font color="red">More cases even if severity and treatment are the same will result in more deaths</font>

Severity of cases
========================================================
incremental: true
* Increased severity due to co-morbidities e.g. CVD, diabetes
* Increased severity due overcrowded housing resulting in higher viral load
* Increased severity associated with poor air quality and other environmental factors
* <font color="red">More severe cases even if equal numbers of cases and equal treatment will result in more deaths</font>

Treatment of cases
========================================================
incremental: true
* Concious or unconcious bias in primary care interactions (111 or GP) e.g. leading to sub-optimal advice
* Worse treatment by ambulance service e.g. leading to later hospitalisation
* Worse treatment by hospitals leading to poorer treatment choices (DNR)
* <font color="red">Poorer outcomes from interaction with health care system even if numbers and severity of cases are the same would result in more deaths </font>

Evidence of socio-economic vulnerability in BAME communities
========================================================
type: section

Index of multiple deprivation & BAME
========================================================
![imd](figures/imd_bame.png)

Index of multiple deprivation (cont.)
========================================================
![imd](figures/imd_dimensions.png)
* All dimensions of deprivation worse in more BAME areas
* Particularly important are income, employment, health, housing, environment

Index of multiple deprivation
========================================================
![imd](figures/imd_covid.png) 

Index of multiple deprivation (indicators)
========================================================
![imd](figures/key_indicators.png)
* Key indicators that may be directly relevant to COVID-19
* Over-crowded households have fewer bedrooms than needed to avoid undesirable sharing

Over-crowded households
========================================================
![over](figures/overcrowded_detail.png)

Over-crowded households by age
========================================================
![over_age](figures/overcrowded_age.png)

Workforce in precarious jobs (%)
========================================================
![precarious](figures/lfs_plot.png)

Transport, drivers and operatives (%)
========================================================
![drivers](figures/workforce_transport.png)

Deaths by occupation
========================================================
![occupation](figures/occupation.png)

Studies controlling for health and socio-economic vulnerability
========================================================
type: section

ONS individual level analysis
========================================================
* Linked census (2011) records with mortality (2nd March 2020 to 10th April 2020)
* Logistic model of COVID-19 deaths vs random weighted 1% population sample
* Separate model run for males and females
* Control for:
<small><small>
<ol>
<li>Five-year age bands</li>
<li>IMD decile</li>
<li>Household composition (living alone, family with no children, family with children, other) and country of birth (UK born, non-UK born)</li>
<li>Socio-economic status: highest qualification held, NS-SEC of household person of reference, household tenure</li>
<li>Health: self-reported health and having a limiting health problem or disability.</li>
</ol>
</small></small>

ONS individual level analysis results (age)
========================================================
![logistic](figures/ons_model_a.png)
<small><small>Source: [Coronavirus (COVID-19) related deaths by ethnic group, England and Wales: 2 March 2020 to 10 April 2020 (ONS)](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/articles/coronavirusrelateddeathsbyethnicgroupenglandandwales/2march2020to10april2020)</small></small>
* Black people <font color="red">4</font> times as likely to die of COVID-19
* Bangladeshi/Pakistani <font color="red">3.5</font> times as likely to die of COVID-19

ONS individual level analysis results (full model)
========================================================
![logistic](figures/ons_model_b.png)
<small><small>Source: [Coronavirus (COVID-19) related deaths by ethnic group, England and Wales: 2 March 2020 to 10 April 2020 (ONS)](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/articles/coronavirusrelateddeathsbyethnicgroupenglandandwales/2march2020to10april2020)</small></small>
* Black people <font color="red">1.9</font> times as likely to die of COVID-19
* Bangladeshi/Pakistani men <font color="red">1.8</font> and women <font color="red">1.6</font> times as likely to die of COVID-19
* Beware of table 2 fallacy

ONS individual level odds ratios
========================================================
![odds](figures/odds_ratios.png)
<small>Source: [Coronavirus-related deaths by ethnic group, England and Wales methodology](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/methodologies/coronavirusrelateddeathsbyethnicgroupenglandandwalesmethodology)</small>
* Shows how odds of dying of COVID-19 change as you control for more factors 
* After controlling for age and geography other factors make little difference

Patient level data
========================================================
* [OpenSAFELY](https://www.medrxiv.org/content/10.1101/2020.05.06.20092999v1) study using patient level GP data for 17 million patients (7th May 2020)
* Controls for host of socio-economic factors, health risk factors and comorbidites
* Ethnicity has independent effect of similar magnitude to ONS data after controls
* Black people <font color="red">1.7</font> and Asian people <font color="red">1.6</font> times as likely to die as Whites

Discussion of studies
========================================================
incremental: true
* Should we be controlling for indirect pathways e.g. socio-economic factors or is total effect more relevant?
* The ethnicity effect does not appear to be mediated through comorbidities or obvious socio-economic factors
* What is causing residual BAME effect?
<small>
* increased exposure on ethnic grounds e.g. <font color="red">more frontline roles</font>, <font color="blue">cultural differences</font>
* increased health risk on ethnic grounds e.g. <font color="red">higher allostatic load</font>, <font color="blue">vitamin D</font>
* poorer interaction with the health service e.g. <font color="red">discrimination in 111/GP/Ambulance/Hospital</font>, <font color="blue">reluctance to use healthcare</font>
</small>
* These are all above and beyond health and socio-economic factors controlled for in the study

Challenges
========================================================
type: section

Data challenges
========================================================
incremental: true
* Death certificates do not record ethnicity
* Ethnicity not always recorded on health records
* Hard to find ethnicity data in other key administrative datasets
* Bad data science already used in many areas of policy to step in and fill data gaps by extrapolating societal prejudices implicitly encoded into administrative data 

Structural vs individual factors
========================================================
* <font color="red">more frontline roles and poor public health advice</font> versus <font color="blue">cultural differences result in poor isolation</font>
* <font color="red">higher allostatic load</font> versus <font color="blue">vitamin D deficiency</font>
* <font color="red">discrimination in 111/GP/Ambulance/Hospital</font> verus <font color="blue">reluctance to use healthcare</font>
* Probably a mixture of causes any role found for individual factors should not conveniently obscure structural factors
* How do we unpick the causal effects of the various factors using the observational data available

Structural issues
========================================================
![belly](figures/mujinga.png)
<small><small>
Source: [Guardian, 12th May 2020](https://www.theguardian.com/uk-news/2020/may/12/uk-rail-worker-dies-coronavirus-spat-belly-mujinga)
</small></small>
***
<small>
* Belly Mujinga was a railway ticket office worker at London Victoria station
* Her employers knew she had respiratory problems but still insisted she work on the concourse without PPE and interact with passengers
* Man claiming to have coronavirus spat at her on the 22nd March 2020
* She died from COVID-19 on the 5th April 2020
</small>

Individual narrative
========================================================
![civitas](figures/civitas.png)
<small><small>Source: [Telegraph, 5th May 2020](https://www.telegraph.co.uk/news/2020/05/04/campaigners-twisting-bame-covid-data-victimhood-agenda/)
</small></small>
* structural issues seen as a <font color="red">"victimhood agenda"</font>

***
<small><small>
“<font color="red">As it happens</font>, prior medical complications are not found in equal proportions in all ethnic groups. 73% of black adults in England are overweight or obese ... people classified as black or south Asian have much higher rates of diabetes than the population as a whole. And ‘older Pakistani men’ have ‘particularly high’ levels of cardiovascular disease. <font color="red">These differences have no connection to discrimination.</font>“

“Then there are <font color="red">cultural differences</font>. South Asians are more likely to live in large households comprising three generations, thereby bringing vulnerable older people into more frequent contact with younger people who may carry the disease without realising. ... <font color="red">These are lifestyle choices unrelated to discrimination</font>.”
</small></small>

"Political" science
========================================================
incremental: true
<small><small>
![bmj](figures/bmj.png)
<small>[Theodoratou, Evropi, et al. Bmj 348 (2014): g2035.](https://www.bmj.com/content/348/bmj.g2035)</small>
* Poorly controlled observational studies and badly designed trials
* <font color="red">No convincing evidence of vitamin D effect</font>

***
![beta blocker](figures/beta_blocker.png)
<small>[Terbeck, Sylvia, et al. Psychopharmacology 222.3 (2012): 419-424.](https://link.springer.com/content/pdf/10.1007/s00213-012-2657-5.pdf)</small>
* Double blind placebo controlled RCT the gold standard of clinical study design
* <font color="red">Propranolol abolished implicit racial bias</font>

</small></small>

Government response
========================================================
incremental: true
* NHS England released advice to all hospitals to consider BAME staff vulnerable
* Public Health England has launched an inquiry advised by Trevor Phillips 
<small><small>
<ol>
<li>Former chairman of Equalities and Human Rights Commission who has a history of leading inquiries that identify 'cultural deficit' and overlook structural issues</li>
<li>Is currently suspended from the Labour party over allegations of Islamophobia</li>
<li>Works for a private sector firm that produces software for the police: "data-driven identification technologies and databases [that] can replicate racialised stereotypes and reinforce institutionalised prejudices" [(Guardian, 6 May 2020)](https://www.theguardian.com/world/2020/may/06/trevor-phillips-firms-origins-software-linked-ethnic-groups-to)</li></ol>
</small></small>
* It will be unsurprising to see this inquiry reporting back citing the individual factors
* The enquiry is unlikely to win the confidence of people from BAME communities

PHE Terms of Reference
========================================================
![ToR](figures/ToR_1.png)
***
![ToR](figures/ToR_2.png)
<small>
"The review <font color="red">will not ascertain root causes of findings</font> that are likely to be driven by complex interactions"
</small>
<small><small>

Source: [Public Health England, May 2020](https://khub.net/documents/135939561/287909059/COVID-19+Impact+Review+ToRs.pdf/611bea2c-0cbe-4c71-57fe-abfeccdbf273?t=1588688788954)
</small></small>

Research questions
========================================================
<small><small>
* What interventions exists to help <font color="red">mitigate</font> these impacts in the immediate term?
* Is it possible to unpick the <font color="red">causal effects</font> of the various individual and structural factors using the observational data available?
* What does the response to the disease both in clinical terms and in economic terms tell us about the implicit valuation of different lives - i.e. what do the policy choices made so far reveal about the <font color="red">societal exchange rate</font> between Black lives and White lives - how does this compare across countries and correlate with other social values?
* Do people voluntarily take on uncompensated risk or must <font color="red">power dynamics</font> be included in economic studues: implications for VSL, WTP etc.
* Should we be conducting less simplistic epidemiological and [economic](https://aheblog.com/2018/09/12/method-of-the-month-distributional-cost-effectiveness-analysis/) analysis in order to understand the impact of policies on <font color="red">health inequalities</font> rather than roll out policies that exacerbate these inequalities?

</small></small>

References & data sources
========================================================
type: section

References
========================================================
<small><small> 
* [Are there more COVID-19 deaths than expected in BAME communities in England – What does the data say?] (https://discoversociety.org/2020/04/29/are-there-more-covid-19-deaths-than-expected-in-bame-communities-in-england-what-does-the-data-say/) (Discover Society, 29th April 2020)
* [Coronavirus will increase race inequalities](https://www.runnymedetrust.org/blog/coronavirus-will-increase-race-inequalities) (Runnymede Trust, 26th March 2020)
* [Are some ethnic groups more vulnerable to COVID-19 than others?] (https://www.ifs.org.uk/inequality/wp-content/uploads/2020/04/Are-some-ethnic-groups-more-vulnerable-to-COVID-19-than-others-V2-IFS-Briefing-Note.pdf) (Institute for Fiscal Studies, May 2020)
* [Deaths of NHS staff from covid-19 analysed](https://www.hsj.co.uk/exclusive-deaths-of-nhs-staff-from-covid-19-analysed/7027471.article) (HSJ, 22nd April 2020)
* [Local action on health inequalities Understanding and reducing ethnic inequalities in health](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/730917/local_action_on_health_inequalities.pdf) (PHE, 2018)
* [BME workers far more likely to be trapped in insecure work, TUC analysis reveals](https://www.tuc.org.uk/news/bme-workers-far-more-likely-be-trapped-insecure-work-tuc-analysis-reveals) (TUC, 12 April 2019)
</small></small>

Data Sources
========================================================
<small><small>
* [ICNARC report on COVID-19 in critical care - 01 May 2020](https://www.icnarc.org/DataServices/Attachments/Download/f48efee2-d38b-ea11-9125-00505601089b) (ICNARC, 1st May 2020)
* [Deaths involving COVID-19 by local area and socioeconomic deprivation: deaths occurring between 1 March and 17 April 2020](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/bulletins/deathsinvolvingcovid19bylocalareasanddeprivation/deathsoccurringbetween1marchand17april) (ONS, 1st May 2020)
* [Coronavirus (COVID-19) related deaths by ethnic group, England and Wales: 2 March 2020 to 10 April 2020](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/articles/coronavirusrelateddeathsbyethnicgroupenglandandwales/2march2020to10april2020) (ONS, 7th May 2020)
* [Coronavirus-related deaths by ethnic group, England and Wales methodology](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/methodologies/coronavirusrelateddeathsbyethnicgroupenglandandwalesmethodology) (ONS, 7th May 2020)
* [Coronavirus (COVID-19) related deaths by occupation, England and Wales: deaths registered up to and including 20 April 2020](https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/causesofdeath/bulletins/coronaviruscovid19relateddeathsbyoccupationenglandandwales/deathsregistereduptoandincluding20april2020) (ONS, 11th May 2020)
* [Coronavirus (COVID-19) in the UK](https://coronavirus.data.gov.uk/?_ga=2.65262190.117505651.1588761177-840766805.1579178025) (PHE, 2020)
* [COVID-19 Daily Deaths](https://www.england.nhs.uk/statistics/statistical-work-areas/covid-19-daily-deaths/) (NHS England, 7th May 2020)
* [English indices of deprivation 2019](https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019) (MHCLG, 26th September 2019)
</small></small>



