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

Post code versus genetic code: ethnicity and racism in the time of COVID-19
========================================================
author: Dr Miqdad Asaria (LSE)
date: 8th May 2020
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

Index of multiple deprivation
========================================================
![imd](figures/imd_covid.png) 

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
![over](figures/overcrowded_age.png)

Workforce in precarious jobs (%)
========================================================
![over](figures/lfs_plot.png)

Transport, drivers and operatives (%)
========================================================
![over](figures/workforce_transport.png)

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
* Death certificates do not record ethnicity
* Ethnicity not always recorded on health records
* Hard to find ethnicity data in other key administrative datasets

Structural vs individual factors
========================================================
* <font color="red">more frontline roles and poor public health advice</font> versus <font color="blue">cultural differences result in poor isolation</font>
* <font color="red">higher allostatic load</font> versus <font color="blue">vitamin D deficiency from hijab and diet</font>
* <font color="red">discrimination in 111/GP/Ambulance/Hospital</font> verus <font color="blue">reluctance to use healthcare</font>
* Probably a mixture of causes any role found for individual factors should not allow us to ignore structural

Government response
========================================================
* NHS England released advice to all Hospitals to consider BAME staff vulnerable
* Public Health England has launched an inquiry advised by Trevor Phillips 
<small><small>
<ol>
<li>He has a history of leading inquiries that find 'cultural deficit' within the groups that are ‘failing’ and overlook structural issues</li>
<li>He is currently suspended from Labour party over allegations of Islamophobia</li>
<li>He works for a private sector firm who has produced software for the police that has been described as "data-driven identification technologies and databases [that] can replicate racialised stereotypes and reinforce institutionalised prejudices"</li></ol>
</small></small>
* It will be unsurprising to see this inquiry reporting back citing the individual factors
* The enquiry is unlikely to win the confidence of people from BAME communities

The individual narrative already emerging
========================================================
<small><small>
“As it happens, prior medical complications are not found in equal proportions in all ethnic groups. 73% of black adults in England are overweight or obese, some ten percentage points above the rate for the white British, and fifteen percentage points above the rate for all Asians. People classified as black or south Asian have much higher rates of diabetes than the population as a whole. And ‘older Pakistani men’ have ‘particularly high’ levels of cardiovascular disease. <font color="red" face="bold">These differences have no connection to discrimination.</font>“

“Then there are cultural differences. South Asians are more likely to live in large households comprising three generations, thereby bringing vulnerable older people into more frequent contact with younger people who may carry the disease without realising. In London nearly one-third of households contain one person, but if the household is Bangladeshi, Indian or Pakistani the figures are  11pc, 17pc and 13pc respectively. <font color="red" face="bold">These are lifestyle choices unrelated to discrimination</font>.”

Source: [David Green - Campaigners are twisting BAME Covid data to further their 'victimhood' agenda - Telegraph - 5th May 2020](https://www.telegraph.co.uk/news/2020/05/04/campaigners-twisting-bame-covid-data-victimhood-agenda/)
</small></small>

How do we respond
========================================================
* How do we find out and document what is going on
* What are the immediate interventions we can think of to help
* What are the longer term interventions to fix the structural issues
* How do we ensure structural factors are not brushed under the carpet

References
========================================================
<small><small> 
* [Are there more COVID-19 deaths than expected in BAME communities in England – What does the data say?] (https://discoversociety.org/2020/04/29/are-there-more-covid-19-deaths-than-expected-in-bame-communities-in-england-what-does-the-data-say/) (Discover Society, 29th April 2020)
* [Coronavirus will increase race inequalities](https://www.runnymedetrust.org/blog/coronavirus-will-increase-race-inequalities) (Runnymede Trust, 26th March 2020)
* [Trevor Phillips' firm's Origins software linked ethnic groups to crime]() (Guardian, 6th May 2020)
* [Exclusive: deaths of NHS staff from covid-19 analysed](https://www.hsj.co.uk/exclusive-deaths-of-nhs-staff-from-covid-19-analysed/7027471.article) (HSJ, 22nd April 2020)
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
* [Coronavirus (COVID-19) in the UK](https://coronavirus.data.gov.uk/?_ga=2.65262190.117505651.1588761177-840766805.1579178025) (PHE, 2020)
* [COVID-19 Daily Deaths](https://www.england.nhs.uk/statistics/statistical-work-areas/covid-19-daily-deaths/) (NHS England, 7th May 2020)
* [English indices of deprivation 2019](https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019) (MHCLG, 26th September 2019)
</small></small>
