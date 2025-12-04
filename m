Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F68CA4554
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 16:47:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4162C60468;
	Thu,  4 Dec 2025 15:47:24 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85942C5F1FC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 15:47:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUokWzKi+CZpc5N6mfVJGh6Fyxoe7anw2ZI10MGdb4eLapUdGtt/6Cf+i4Ao8VoheCdCKR0Bv6lTWSelukLFt3agneCPWIXwAyE32pQIzDVWIomSyTwqNyLpfij8P50ty1VKilAjqErRW7kxAAmZP3WUAuC0NRWB9QCSrC/3owbE5ZAhRN1FY2oEnC3xbeKhW6/H5o49GcVOhhKwkOLtFIdqjhZaQS0eNG3Ye1E4peJMFKnaKne1yxFHL36exTAuUiCVRaEcIWaquFAnhXdeAhrcSPH+yT+CZ48V+9tj1tytdhzMP929+f7n48i/GajWX8DDNOIM/1LbuIWg0TaMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=P4r5A2OyMyCXfL+dFndtq6d0Ond3/yIdthJ2xHfBkPuuyab5qn1DJRb1WjQpvLvYfy9QkFm4iKbc44llfwt4YE9Sx5mTacMhtbEwM7GNGjzFX39UCjE74oteq2luteXemnfzh84fszZVv9fxnT3TGBmKchS1f9ysRN/do8fmkBVmmI5eGlbU4VmJyIZi5Y109dcNMCBqKAAb3RrskUojMzQhC5XQMF0rm9NSlyoIkYs1Y8ikWx8/6Uoe5PYgz0odujYMxKQtl08v9Vc/Q+G5w3VW9ejkZbA4w9SMU26/HPJ3wm/ItnPLFBeG95oN1eMTJcV3Qlkx64EzvhBEDpUxfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=GTZZ/0MhyL+TxXAG/NDApc6NzPPx+TwOSuQ/yzFPpDHAhBEmP2MK3JiCpwR4xAj+Z/E4rniHl/flgRxgXnrFjDm6DOXZ1yc8Wd/Ww5exs0TMLcsNdLRTyw3guqhl3GF++0RcVTrfVZEn28KQxJ2lpP5gobUnSqpRQnpbXYiJIyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB11453.eurprd04.prod.outlook.com (2603:10a6:102:4f4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 15:47:22 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:47:22 +0000
Message-ID: <4f8e991c-b93a-4e05-8937-d3741c2ac159@cherry.de>
Date: Thu, 4 Dec 2025 16:46:51 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-5-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-5-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB11453:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ccd4e7f-33b4-4e0a-c085-08de334c6a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akRCLzlkK3k0YXFGcDRJaTdSTUc2V0pUa2p2cXIydnpOYXFVbkVDTkZUSEhx?=
 =?utf-8?B?OUtNTkR0Q2hqVDNRaVM3ZnJYNnM0WU5WaVF4a0M4T285V3ZmNnBDR09XK2M0?=
 =?utf-8?B?bHFWajh6YzNHTjVEa2kxdXpBRlhrNWg1bGVtTm1uU01CSGlTd0RrTkxEazBK?=
 =?utf-8?B?S09pQ2RhOGpOYUc2Wm9rTStsZHN3aW1SaHBpM1Mra09KdzB5ZU12SXFLQm1v?=
 =?utf-8?B?WllqbkV1RitGMTRnMTZBc2Jja2VRLzM2U0ZFUm44c244Z1UyQW5Wbm1RRDQv?=
 =?utf-8?B?aVlIRXV4ZENrdkxnbnR3bW40NkpxZ2wwSVI5QTdBNGNPV3N1TEdxOHd2M0du?=
 =?utf-8?B?UUlPWGxLYXMrajZHNzFZQUt5Y1daSXIxOG44UU5Lb08vK05jazdEK0VEaFJj?=
 =?utf-8?B?akRuTzVTSzhsSm1iaXdHa2dlOThCcEpFTnc3b3M5dC9DUTd1a2gxUzJYUWcv?=
 =?utf-8?B?bDgyMnZBZlh2WW9CdmplOFJxV3Y0UzlTQU9FQTRyUFJaMjVLKzMxdWFVcjNz?=
 =?utf-8?B?VkdYUTRFazJrZFY0K2pPdzM0Q0JEV3RKMUt5TTJmYjBqOWljYWRZaGkwY3Ni?=
 =?utf-8?B?U2ZucU1keDdCTTAxSVhkTlNZcERUWGdmbUdwZ3RiOHVZMWNCSnhQd2s4aUJ2?=
 =?utf-8?B?UDlwbEpZejlvczVScGxmQ2toV2liTFRvSUc0bkdRK3pDcTJpdldoWVI0a0hL?=
 =?utf-8?B?N2VMS0k2bXBobXNJNUwyQWdWOXpQQWdmRW5WaUEwQkR6ang3VXFrNnVyTGdC?=
 =?utf-8?B?SWZGaC9BREQ1TG1RNkRsYjNadGEwekM1cVBGTXYxWkI5TkwyUlR3YTJXMytD?=
 =?utf-8?B?NnhVcExXZkczSEUrUGFpYVJoVlZjUFhYYWYycHVqaWhnYStlaHFZYnY0Vlh0?=
 =?utf-8?B?VVYrOUxZZG9pYTJKK0FaTE14RGpJZmhobEpQRk9xMWlndUowUzQ5K1JCdFRG?=
 =?utf-8?B?OTgybFZDL2JxWklYU3VMb3ZCZjFUcG9WL3lFS1NBOGU4QUtDLzlydklWQVBC?=
 =?utf-8?B?dWNNZVZrbjREVEVraTREQWV2bVJtNVJEZGxFUzVITkJZR3psUmZ0ZUNQUzZo?=
 =?utf-8?B?bkxFbXBUNFpHTEJjb01TWkZUZTdiVHIwT0orbzRoYmhaTDFZeEV4MWluOStN?=
 =?utf-8?B?bnowTlA0azB1SjZ1OWZMUUx5clEya3duM1E1a3R5QWp4eTVaY0Zqb21qUDlv?=
 =?utf-8?B?UHJ2bGNyeTJjMFJPbC9HeEdJblk1UFFyWUtCR1FxT1ZtWGZrSzVGaTZmOFdO?=
 =?utf-8?B?YXVIR1VTZUswcTFwRFZhRll1Nk9FTlFPS1RkZlZnWFhvSlZ4ZDFqZ0FWWTRG?=
 =?utf-8?B?RWczWVA1N0RyNlNrUGhwQU5BQ3NUN24vekx6dkI0cGdNU2hnNEhNRW9QTWVy?=
 =?utf-8?B?SzZ5R2Z4dldWZzlNeEgzY0NOeURXdmxZSUJFRmtwREFlcjkrWDljcXhoaFNy?=
 =?utf-8?B?VkhCOEhZLzd6M0lMWjYxWVJIclFMUjV2RDJYanBtQVhvcnZwSlR5cW1YN1dj?=
 =?utf-8?B?d2hRZ3V4dGtjRmZCSmM5dGFLVDBISFN1UzN4bnBuU3E5dkRtaXJUN3lMNUlM?=
 =?utf-8?B?SmNMK3RINGNBNVoxYTJMaW45ZURaTUpRZUljK0xDL2w3OG03Wm0vcm55SHA1?=
 =?utf-8?B?THZEYWlLMUszRWltd0tMVStnaS9Zd2Fqck04L2xMUUwrSE0wMFFORTdDeHBC?=
 =?utf-8?B?RVpVcitOeE9jaW5ncEUyU3B1VlNtbkg4RzhlUGZzODFlclZydlRnMGRCQUZR?=
 =?utf-8?B?VGx3cGh5UEFnU2p6UGRiZzFkVkJFR1c0bUUzMTNzVit1Wi9XTTVXQlRIUE5k?=
 =?utf-8?B?MkduRjZqdFBQTldJcGdpajZtbEdvVThrQlc5aHdXbDNXSzhkclF4QWZZaDI1?=
 =?utf-8?B?ZlRubjZmYUpwcm5KUVNqeFhoWEY0ZkZrVE5qc29hMFBaM2J4T1J6ZFZpWEt2?=
 =?utf-8?Q?MqfbTT8nTEaQbOUiiPtTJdWEx3uRDFpE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUI0Z0x1VThlNVhaUEx1cVZTWWFaSmhveUc2MTYxWGlHTUorNGFCSmk4R2F5?=
 =?utf-8?B?WGczSWtHa2poUTlkZGtxNE9zQnpXOXdZUXMxbDkwV1dHSTlQK3ppVGUvVDRF?=
 =?utf-8?B?OGQwV01UWFM2QTY0M3YrZVVvS2poNWV4aWR3dkI2Y051T0NHYkM1ZVd0TnVi?=
 =?utf-8?B?V1hta21Gc2I5Z3FWVThtbUJNVWpyd0FwcGhvYVJVZENGT3dlTlpqNG0zbVlM?=
 =?utf-8?B?RWRXZVdMQUdwNE1IY3pqNEpRVXlDTUM4RjhESWtYMXcxT1Y5Mjk5REhrdXlY?=
 =?utf-8?B?OWN3MVN2b2t5RDBRY21DLzFxQXZObVRxMlgvTUhrM3pVcVc1OUtVRmYwem9M?=
 =?utf-8?B?ZFdGaUUzN3pVRWlJS3ovUTNxNXNlU2ZzTDgwV3VQb3d6ejBZSFNwdS9IU2Z5?=
 =?utf-8?B?VkE4ZWtYSFUyeUJPWGpVWk44ak1nZEpiR2l1MlVzcC9leitDajQwaVNEZEJM?=
 =?utf-8?B?aFV1WHlkdDhpL0IyYUtoYWNkTzRiM2dTMVNmWVJuWnVQWkdvRGhpdXNyT0Zx?=
 =?utf-8?B?czVHZ2paVjJlR3dRVXM3TURmQWtabVhCRSt2ejdzSXMzS1VyMC9YKzg3UjFJ?=
 =?utf-8?B?dkxxdXBHU2NhUkJ2RGxocFBVTHRCbjc0TFZQUnRSVnlLOG8xOVlrRnB1dDk1?=
 =?utf-8?B?Y2RTWUQwZVdGRjdLZml5Y0JONkd4MUJBUE1sL2J0bFBWQXIwVTdRSFFCZTQ2?=
 =?utf-8?B?czZWeHlTeEVLSm5KTGxFV29CU2c2U0lQejVRUTV2dCtIdFgvZFY1S3c1WUpx?=
 =?utf-8?B?Y2pEeURaRGkwRnc5SU1peUUraXg0VFk4M2NEMVhwNjN0OXBGN0dzOVUzQnVq?=
 =?utf-8?B?MWVwSWdkcWtGSkxBOVlwelFtV2JUM244TFh5U09vYkVMcmNHeHpEL1JaSC9w?=
 =?utf-8?B?eXpYeThqTk5mNzZsZXFZcS9vc2lmS3Z6bUg1SGtoVi9GK0dod3pNRU1YQ0t4?=
 =?utf-8?B?K1RWcHBTaExyQW8vdXpRVEtCUDdLbXh0TGFFNTlzY2lncTVvbis1QjFhU29W?=
 =?utf-8?B?NVpHZmkwWE1uK3NJN2l3YUo1TDEreGJvQWVmUXdCQncyaHE1ZExteXIxMHhO?=
 =?utf-8?B?R1BQaks1TWdPOHAvZUhjcUNEUEF5VEN6TlA1TGVYZWs3RTA3cEZVWWhUc3RK?=
 =?utf-8?B?VVhLaS9rYTVsZ1k2d1d0aDgxdGE1UFZCTkpxUERGVDhTUmJTbUdyWkYzSENp?=
 =?utf-8?B?bWYwWEJhdVZ6NUZPQllIUExKd044K0FvOEdsU2o1bWRnc01mT0tOTm9QQXlD?=
 =?utf-8?B?QUtxMGVpeGdIbDRKdjI2MTJOVVJWVGxCVU1JeTZQemRNZ0FHRkJvQUZDazdk?=
 =?utf-8?B?ak96MDU0ZWp2STgxY2FLd2d5amFSTVJ0dEFYN216TS9CV0ZIZWFHUG9UTWQ2?=
 =?utf-8?B?Vy9tY05nVWdnZWYwWXltdWpiWUFrM1BQU3hoMEtlMUJFUWJQRGJnVXBRdEdK?=
 =?utf-8?B?TDRUa04rWW50SE13SDFOVnJhUTg3a1BJdU5kVGhYR3BOeXpaejl4aE1ZZ295?=
 =?utf-8?B?ZWc1YXNCcjE3a0N0MDhkV0FvTHV5VGlCN2NRZzhpa1ZUcEtTVnFPSE5uNVBp?=
 =?utf-8?B?NkM5MGVoNkFKa05ONnNYVlhXcTV4MkFiOCt6QjVDdDFwdjI2WEZyOU5USzBR?=
 =?utf-8?B?TkZkSmNZRXpmeGFsc081UWlZRTVWVUNnM2s5dzk2MEtqQmdtTm1FdkJUU2Ew?=
 =?utf-8?B?enExUFplNTBmeVBuREhib3gxSmVRYkZJTkQ1WElaamU0RG01Q0Z5NGF1Tmk0?=
 =?utf-8?B?dkppam5vb3RnQ0R4anFySnhhY0w1VkhQQWxsOTlaa1RlMVNPTS9odHM1c21x?=
 =?utf-8?B?MHdheTc5a25BQzJVNzFHd2RPUDFNU0dnNitHejh3U3VDOEJWMi9CWWRvMXJi?=
 =?utf-8?B?WVlRZG50Mm9aSzA2K0NaVkkvaVVJMFpyNE54SDZ3SG0yL0tzT0lQdGJOTXVx?=
 =?utf-8?B?ZDVEdXp0enRnVjhyY1NleGtWUmFVb3JCOGk4WjRrdXFKNmFScWx1V1h2MG1P?=
 =?utf-8?B?ZFR6ZmMrUjVvTDZ2enZGVXUxczBiTXJBTnJVTFNPT1RSdk9SMWtQRDdKM2xh?=
 =?utf-8?B?K3R2bzBvbnIweGMzRW1aT0N1eGpDZGhySzd0bmF1VnRBcktYcWNad2U1eGdF?=
 =?utf-8?B?cXN6dndNYlFkNldqU09kcms5UW9tcEFxblp6TWpZSDlGUFRsQWNzQ0NHMExU?=
 =?utf-8?Q?HUqS9zhQv7gHYHiQwkCqQsM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ccd4e7f-33b4-4e0a-c085-08de334c6a2f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:47:22.6768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZXVhQ/uDv9NRf9fQ4m/G+JHlrGGmg1NhLX3N4diBBnajFOVjiKiX5p2s2JtbpK99K7eXneB9Efqeg/uaz/08A4svNpbfCuNxsatQd8+/Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11453
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 04/23] configs: stm32: Enable LED config
 flags for stm32f429-disco
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrice,

On 11/14/25 5:23 PM, Patrice Chotard wrote:
> Enable LED, LED_BOOT and LED_GPIO flags.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
