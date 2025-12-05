Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F72CA6E34
	for <lists+uboot-stm32@lfdr.de>; Fri, 05 Dec 2025 10:24:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ECF4C628D4;
	Fri,  5 Dec 2025 09:24:51 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53953C01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 09:24:50 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B59GtaS2186811; Fri, 5 Dec 2025 10:24:31 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013052.outbound.protection.outlook.com
 [52.101.83.52])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4autdg0psd-2
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 05 Dec 2025 10:24:31 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSGeHRTkWnBQ44ZKDlTlKHUL8TIBwYWT+8pJNpsE9wXNcaIdFS6gza3tUZsKHtQz1k6JOCVUA5YQMLubK6toAN8e914HeV5OwlJmAlujN+u5cEhweIHm8vY7p+FB1Kd+2kJPApQYkZ9Ok8ZR08a740MgvF4jJZv9j/4mVROCCkEqXmewa79fgNKwBqSZguO+XnyAmmcXktN3T1ROqo5FJPR5ZthpryYn9KxpwWPN8VPmnpuoeGhpSieqFvy0zYDuCNnxVdY8YFGA0mzmt03v9vP8uQgkGkxC5KNvoVyID7TphQB7KRfB/rRbLkQInzSwPK/zn723oB4Hynci0fySNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PJHjP2h93EcGy8Mj2zlaYUusE4U7Ds2bb58TBpyrUk=;
 b=Qj4KOVY3tkXYVof1gFudmpKmVOqy1I96y6x71sQNTcw145XvBIVCN16Klcdgc72ZZi6+n/fWt9KAKNT7DlTTG5dp3V2sJ9BvBhsQ5P1Z30c1IPS0kLgb5GJHx1Y88APl6fIp86BPKnNPbOGBWwndGX/mIdvTzmhylfFHJA78mlE1Wzwk9j522lHLEMxVMBEyoSJ5Wh2S9DDCmV//YZJouGPrCx0oarAAoSw5ro41bGdryThnIJEs1wzqb7KQ7TWbcS0oCF1uNx1f3wD2eknG6sxVlK0ToJX2adaqGxyoSFxRFI5iOjPI656/g/CLA0wVQ5+VdWuK2ZiQJg7ydUW2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=cherry.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PJHjP2h93EcGy8Mj2zlaYUusE4U7Ds2bb58TBpyrUk=;
 b=P57D9hAvW5TOgAZQgj72k8Yc0Ps3CqJ2zwNTk/2rEs2TYPOjytEtF89guG3Rhg1aRTR7r14nuYcEMzXpeQiwykCFkMCT1HGgcihz3ZWWRuCjDn7oDwiut8tIOUDEBldByATlLjnSFpCul7bm3Qf/Mb8w/vOaOmkZdd1eYKj3+JEZAxthKZ3BX3/leTUaDz87jWZYvbcxtWqM8qb9m0QfQxiPIIaqwqJXNGMoeERUCryGuMTe5V9R3XgBO6N76vaOsGtuNnW5nEm7wGZZPiNWjAjAaCSwC21TiDV8KHFL5jeYaax4envzL1fYhEfCmeSMh1qo7knD7iZvg1pHZ/4OEA==
Received: from DUZPR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::6) by GV1PR10MB8733.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1d5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 09:24:28 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::15) by DUZPR01CA0043.outlook.office365.com
 (2603:10a6:10:468::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 09:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Fri, 5 Dec 2025 09:24:28 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 10:25:08 +0100
Received: from [10.252.31.202] (10.252.31.202) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 10:24:27 +0100
Message-ID: <8f529291-5903-4fb1-a695-dbad5287cd25@foss.st.com>
Date: Fri, 5 Dec 2025 10:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <quentin.schulz@cherry.de>, <u-boot@lists.denx.de>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-3-patrice.chotard@foss.st.com>
 <309e316f-1be0-49bb-be93-609d8b29ccaa@cherry.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <309e316f-1be0-49bb-be93-609d8b29ccaa@cherry.de>
X-Originating-IP: [10.252.31.202]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|GV1PR10MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 935a392f-13cc-40a2-a941-08de33e016e5
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bCtSd1lWVGllcTlER3VHRDBadnFmSklQSC9qK1BOdTd4RlAvRmwxdXNhbGRE?=
 =?utf-8?B?bHVkTmozMkl1Zk9kcXl0LzNxUmx2YVJ2M0F5R3VxY1RhV2l3Yy9oRENsczFJ?=
 =?utf-8?B?VldlS1Y1TWl0VnlweFNLNWFjNUNpcS8vY0N1bDFPUEg2VmJsTkRtcTBIYWNQ?=
 =?utf-8?B?SE5DWGxSVkw0Q1ZuWlZCUzh5SUZtVXQzSTBGYUZ2MlZLSHV6NkxUb2xEQU5O?=
 =?utf-8?B?VlZGYThKbksxNHdyZnYzdHY2YzJRNmhxWUF6aElWSnNzWEFtc1RNTEFsVEg3?=
 =?utf-8?B?M3RvVTVYWGxacCs0ZnkwWkdqSk9QR3M4SEJIcUJ3L0l2V1JydDZHZGZoRXBB?=
 =?utf-8?B?bVgyOGtCNmJEK1l2UWRNdWswVUVzbTA2S3RoUndvaSt2YkVGeWw3bFJFMkNU?=
 =?utf-8?B?NEVOb1ZTNTRXR2lNTHhaenA5d1VYbmxPbi9SZjJQRWhoYUNIRDBHVG1XZkdi?=
 =?utf-8?B?TlM3ckEvV1lEWkJyTW5wSUFhMTZJN0daM3R4NmRVMHI0VlJpVmZna1c3SVMw?=
 =?utf-8?B?VTAyT3g3V1NYTmkyVkJ3SmREc1pmMzdSbUdBOXZhcVl0ZGM1aG81VmlmRTJs?=
 =?utf-8?B?YkZnNWc0L2hyUUY4QW5HNy83OUZxSzNma2Zoa1FEVjRSM0lITExKTnFGZDlW?=
 =?utf-8?B?dGJUVFZLenRzY004Z1FjcGtIenV6bUxOWDliZWFFSEZ1MGR0VlVpV2FzeXgy?=
 =?utf-8?B?ajFoYU9reG5rc2w0TndaRDlmeEVyN3doampOQktVZU5nRndsVXdNVGdFZ1Nk?=
 =?utf-8?B?TWwwd1dOTzBQQU1lQ1p0TWp3K08zbXMyRCtid3RTb3lIZk51Y3ZaZ00xOTdj?=
 =?utf-8?B?azdUT3NZVDV6OTVqeElHUWw5UnBnRXgxNVh3OUFHSzU5SGZtZE9SVWZIdEp4?=
 =?utf-8?B?YjVVa0xKdHQrQy9XRjFLTnVZRW1wL3c5QzhVbVBVd0VSVm1MZ3FsYnpoM2lt?=
 =?utf-8?B?dXNSbkNMSWVQeXVkeGt2RWFpbk1MelZxVG9VbG9DcHJBcFYxOUVmVlI5REJY?=
 =?utf-8?B?VFFsRzFPSDFvanc0OE5Nb2pHdjdGdG5KdVhEMzB6d1cvTG04ZWgvWllNdDFR?=
 =?utf-8?B?NVdTN0tYMUZGT3c3V09HY2lDYUp1VGNoTGtObWRGUjFFdEFENTZ1ZUV2R2JF?=
 =?utf-8?B?WTNNbDE1aTc4N0d6M1BJTkVMd3F4NzkrY29oMThkY3VNV3NLbTZiK0FRUWU5?=
 =?utf-8?B?MUlLdHU1S0Z1SmMrY1pwd3VZa1ZyeFRYblh1VzQ0QWRkQXQwS3B6UDZ0aE0y?=
 =?utf-8?B?aEJUUkRLOFJHTnc0QTdvekY4SG1WTURlOXRBS0tuWlVnZmtiMlJOeUlUVXFz?=
 =?utf-8?B?WWJKbHNJT3M3ZTJTNTVXeW05WTRCUHBnTG5uTlFwbVN6TklaVDFIM3UrZ3BI?=
 =?utf-8?B?UFBhbmJrQTJPOTB3R2NjZUs0SjdsQXFTK29QdDAxSmF1amNSZ1pEeUJZdmZG?=
 =?utf-8?B?cjM2ZXYrVFdBWDRobE5QVzJpejdJYStMVldJZTNsV3JIL2Fvc2lVd0xlV2Zy?=
 =?utf-8?B?blFUeTAyZ1l0NUtNS2x1SkhhZkNsRGRzV2NPeWJMaWQzcm5SYThQaTgvbTJN?=
 =?utf-8?B?eGhTc3Y3dWdJVjZWSEl3Rm9ZWjhDNHJFM1paMEtPVFJaK0VodU1Ga2o3NTdi?=
 =?utf-8?B?SSt2Nm4rb0hiTDZVbG5FemJKT1JONEQrRWY5OEpJYjdwb0pDSWREYXh2cFUx?=
 =?utf-8?B?Mjd5U3U0M2RwSlZKbEhSaHV0OG04c2JuVVVGcTJjVDFBMXRDbDJ0czgyVlkx?=
 =?utf-8?B?eERGU0NuS0hseTBGUmx4R2doN0t0ZVRJU1E3a3Z4anNzbmp1SUtwZ2MxbDRv?=
 =?utf-8?B?WUpNdFpIRlZnMEc3ckNYeUlSS296NWp2bDFWdk1LT3o0L3NUTE55ZGI1NlFp?=
 =?utf-8?B?NmNiQnhFbTEvYUZMZWdZZmcwMVFpRmVjY0pOejhaVjZoQ0JZbzJyWjEzME5C?=
 =?utf-8?B?R1hZQ0FCU2haazhTYlNIdmZTZUJIdkFHdzhjdHRQeXhldlExRUtRZnNMKzUz?=
 =?utf-8?B?eXNoRFJrMTRoV201Y2VNRkQycWNpYk5RMGVRSDJsd0NDVG4zdFROd01CeWds?=
 =?utf-8?B?UGhlNVdKVUN0akdDNHZWR2hPaTdhQmV3Mm1WT1hHYk9MU00wM3I5Qkp6TXZq?=
 =?utf-8?Q?WQb/v8X7wlV4ClGam1zumKBbX?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:24:28.1843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 935a392f-13cc-40a2-a941-08de33e016e5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8733
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA2NyBTYWx0ZWRfX/6ZACxsE2jIO
 YrwA7Ms+bZKOi8MlcBM7Ku3iSi2zZtfYic5+AnvGZUjET1dwEzw7oaXU97TayxAai4yYiqz+vmR
 bMR1OwWKMIXMryIn7WWdrY3QIMxBKpMw0Bp9ZYsX6wdzi0wU8ukd8DUhTwCnk2/xK7Ia1YHcFzy
 V3oOFoR7yE4+9nWa06y4RsFJxSDngy/ekL9pDHyhhJOOSoHWgSGSQ24bW3tdGNyri7Ul0ZTeadk
 Uki/7z7lZ8FKg8Qcgt/CtoArbWBRBQtmku+vB6TCDp4IWQ/aTxBc9k8B8DZgT4D2g1hw4JRrVUc
 2YIHqnGO4aiR+Z/yrt7cEswXDl7PXyBVAproSo2bA81q1+AieEs+4DN/8GU9kS76ABJydj63bXW
 xosiKglwslR//LPRgFq5x5gKoxa9EA==
X-Proofpoint-GUID: Dgv4Z04cDUu-MmmBrMOdSpwFzaYxbO6F
X-Proofpoint-ORIG-GUID: Dgv4Z04cDUu-MmmBrMOdSpwFzaYxbO6F
X-Authority-Analysis: v=2.4 cv=YrEChoYX c=1 sm=1 tr=0 ts=6932a4cf cx=c_pps
 a=lyBMIn+woRaeXRd1+Vm5YQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Uo5EeBN78AAA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VQKGgfk8fe0PobWZ_dsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050067
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>,
 Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH 02/23] board: st: Update LED management
	for stm32mp1
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 12/4/25 16:38, Quentin Schulz wrote:
> Hi Patrice,
> 
> On 11/14/25 5:23 PM, Patrice Chotard wrote:
>> Remove get_led() and setup_led() which became obsolete since
>> led_boot_on() introduction. led_boot_on() is automatically called
>> from board_r.c
>>
> 
> Yes, but called later than board_init(). If this compromise is fine then it's ok.
> 
>> Regarding "u-boot,error-led" property can't be used anymore since commit
>> Since commit 516a13e8db32 ("led: update LED boot/activity to new property implementation")
>>
>> Instead get the LED labeled "red:status".
> 
> Would this work with stm32mp157a-dhcor-avenger96 (led4), stm32mp157c-odyssey (red but not "status" as function?) and stm32mp15xx-dhcom (error but possibly broken since commit 332facce6f5669fc1bb8d150c08cee2ebdae6d2b which removed the led with that label)? Seems like Odissey has LED=y and LED_GPIO=y so it probably worked before this patch? The other two, their defconfigs don't seem to enable LED support (new or legacy) so I guess it never was used anyway?

Hi Quentin

Regarding stm32mp157a-dhcor-avenger96, stm32mp157c-odyssey, stm32mp15xx-dhcom, these boards are not
STMicroelectronics board, so i don't maintain them.

> 
> I'm also wondering how you get this string... I don't see any label or LED_FUNCTION_STATUS function for the LED devices on ST boards. I'm probably missing on something?

As indicated in the cover-letter, the LED "red:status" has been added in kernel device tree by this serie:

[4] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1023034

U-Boot will inherit of these properties when the above kernel serie will be merged and U-Boot device tree 
synchronization will be performed.

Thanks
Patrice

> 
> Cheers,
> Quentin

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
