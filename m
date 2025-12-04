Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19038CA4702
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:19:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF88CC628D1;
	Thu,  4 Dec 2025 16:19:27 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010058.outbound.protection.outlook.com [52.101.84.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D862EC628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:19:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6cg2taJwnpwwrO9ZI4mXvfqkGL1JhK2VUbv3YYTEjJTvR7X6+Bm7l2gHlHa/oJZ7aQWAarc1WJ6Rqzw3EsdNOkEAbNNGSADWFL4bYCrRz77pD1iId9eiwWD/J+FxyUup4tn7lFsCGyL4G89sF7LPzzxlUfgVoSJXkoKe17jE+kBD2IsEYoszegN/QxQhBiM7U78UT1R2oG1TskYPycbDARmxfBfhyir2u/GLMbrAU2GQ//F60UC/tgTpAK97q7JPWuH+fCTseeeMRRi1ecaLulB+h6BVabAywo516U03MTs9iOCvKnBtg0Z2emcFtJSebzFuSfzbW4oeWSlfA52Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXFGxh0rMBG5R5RRBgr18z9rkaRqfUNK/RmWUk+7cEc=;
 b=k9BK56sCtzY5GG9FLi6UI3Z0tYLqJm/s4cd1libozYyI/fKO8iEVdE+MWOBIhqZpGDA6dq+tpNdmPjJoEhhgxtIvnPAxwyGLflMY7VotmctslJgVS3F8OWhjmFeLMV5nwfR2YNORrt4UoGR9Gsegl5h7DhcKDCh4NCXoDphasJeUHfln2AqEfEwQX0PcJoFflFfblsDgaojnrm0CXooesKjFJjgu2jPHSE1o+7LUzmiGKpEWAP3rD9SuIDvAEyNoQJWd+O421Q5PljWy+eL8EDgfyTdctUlzhHOELjTgkqj6dq5ipdBy1Nl0XLuX9k7tucnPsE6c1DBSzwWWEoyIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXFGxh0rMBG5R5RRBgr18z9rkaRqfUNK/RmWUk+7cEc=;
 b=QQZKoSXe/GhNmYenx8w9lVF5SoZxmGKdWG3LGeALlJEaQ/+lHVRq2NRQCuyghu54n1Fn+eGSN3CDJBu0Rw8H2pGTQl03pzPDnR1KAmo9+jF1UqQ1GifgV1MYjrlm8rw0H19Ha1Kb1cz95p3TUvCoLe3uWrcONda5tUbN5b4fFnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7755.eurprd04.prod.outlook.com (2603:10a6:10:1e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 16:19:24 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:19:24 +0000
Message-ID: <6d19e765-ae58-4216-851e-8085d84e4883@cherry.de>
Date: Thu, 4 Dec 2025 17:19:23 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-15-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-15-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e2d615-bc73-4e2f-a77f-08de3350e376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVYrM2NpVktwalNTL0FOKytRVnRQc3RNSkc2aFNhazFXOCszb1kwVHRpR0hW?=
 =?utf-8?B?bFA1YW1DSkRiOWEvWld5eVhzVXpCK0N6dDI5MTJqLzZkRHFIa2Jsb1RoYW9u?=
 =?utf-8?B?dHJFK0l5MXpUVDVqaWV2R0d6MlFlanM3dy91d0tPNVVsWGhwQnNmZHBmTWdv?=
 =?utf-8?B?dDVoQ0g3UDZSR24rSU9IcVFVb2dsSmRCcHlDMXA5VllFUEVMb1plaDRWSG1z?=
 =?utf-8?B?Z3U2eWFGSlZib0NiRktrd1BWNi9UOGJCUlMrSFhOYzhiV0V6a3lHbkQrRlJz?=
 =?utf-8?B?N2d2Y21pMnpvWlMrNlNTWUhQdTNVc1hCUlZTcWQrMmtRNXJBMVlZUWFseEY0?=
 =?utf-8?B?Qm1jUjdFcnBlUjR1M2FyaStJcWVkcDJPU1ZQYmYyNG52UDlmeVdwWGhoODNa?=
 =?utf-8?B?MFVxVkl0c0Vxc09VRW8vNU5MeGd6UThIR3p5VGl1WThubzhQa2t0Ym84MTAx?=
 =?utf-8?B?V09vaEdUL0RoNHAxVzl2dHdXL1JOekpHTDFYMlVPVEZCUUNqcFE4TDgxSmQx?=
 =?utf-8?B?VVRRQkdhdEo1dXZuait0dnVZV2Q0eUtxbUYxcmsyZjJmRGRuck01ZDJsci9U?=
 =?utf-8?B?cWVOWTNnVTExMm14S3lDeFVRZy9xN2Frc0tVR3FZQjhSWmU0L1VreFJ5RVg2?=
 =?utf-8?B?T2plRE1xSUw0aTgyWmkxSjNuOGQvMHBBNk0yVnZxVy9Jd2tGWGJSZ0tqeTZy?=
 =?utf-8?B?RnFZVXNubHRram9hYURzMXdEb3dTZ28xcEdUWGdnREFwTi9PTCtmRW9iT042?=
 =?utf-8?B?aVVseFY0REtScWxidWdLckVBUHJTYmxQbXN5RGlDMzlxU3FaYXluNU9rcUdv?=
 =?utf-8?B?Nk4vamdMSnpIbFZ0VFBObmNkTXBCSGF3TUZWU2RQSVFiLzRjNVN6R3FRQ3Rt?=
 =?utf-8?B?elJRNEtZWHZqUUVWQ1hBZVUzdnVnZU5PUWFGeGdoeml1SisxT1hQczdnUGFy?=
 =?utf-8?B?RzFiK3hoSXZQNUFqaUNKY2NtaHhQQXE4ZXV5NVJXRFdGOHlEcEdpNmtZWmZM?=
 =?utf-8?B?Sk45aXlENUtqYXBlWjJ4VFNYN3JrZlgrSHZsQWlBeUtOcDFCYnVGdjd0UGE1?=
 =?utf-8?B?MnVwR1NJOGkxYUo1bERpckZxQys0cnZaYU5HNGdQUGJnRkV5RDFlcE1pYzEv?=
 =?utf-8?B?R1ZPK3pDNm9IUUFzd213NDdJOVRUd0NaRHlsOE5rN0VZdUpTNGpWa2k1UU02?=
 =?utf-8?B?a1VyQjdUYkJMVTZScFN3NVFLaGkzVEhWUFZJaE5acUJUTDI5a0tDQWRmZXND?=
 =?utf-8?B?SXEwQy8xRlo2RVNvTE9icUtIalpzRTJiRk9IUGU1eE1uWlB0UGhhNmVrbERD?=
 =?utf-8?B?RHdlblZEMkJUSXRpUVhUdjk3c0Z2eHAzWEF6RlU3UFUwbW43dUczUVA3TEZq?=
 =?utf-8?B?bDZFNmNCbFBNM2wzWmNDSXpnRmRmSlAyODFHYnNVTEVVSWhraEkxMTNQb0da?=
 =?utf-8?B?QUdOV294MklwdzhjeURITGpQby8rQ0w0RUVNMzFiOUlpeWpuL3hwQytEbCtO?=
 =?utf-8?B?SUZRYms3OS9SSnRCNXZqVWJ2UndqRWpKN2I1TlhHRkdPYUVKdFFZaUExcDcr?=
 =?utf-8?B?WDkxbWorM3Nna1JDQzg4aU5aZVpXQTV1YldjemxqTEtsWisvUTdqK2U3ZGE2?=
 =?utf-8?B?TG80L1RPQlk2b0poTFJiNjNTSjVkMG40a1BkcE0wV1VNYVEwVFdaZmo1UkZa?=
 =?utf-8?B?a0FwT29RQlN4WC81bWhnVXRDL3FCTUJsK1dheFZLclgwcnp2TDlLdHI5MmJo?=
 =?utf-8?B?MlBUVjhFTm9aWDlKNjMvdjE3NWorMFdmQ2gwbXptREhKcGMra2RoeHlxUkYx?=
 =?utf-8?B?akhoVGJmQk1yWWFLVFBZalJjNTc1L0RKV0NDVE5pM05qV0Vubi8zTXN5czV1?=
 =?utf-8?B?M0VaTVBNRzJwY2g0cmtKRXhib1ljTGV1cHpMOFlWMFlkVHZLYm84ZTdTTVUy?=
 =?utf-8?Q?w3Qq/cyifeBDjlqf6PamTN1iI2Vacl/p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUxDZFl4QTAvS1RWdk4wT21QQ3M0WmVwY1ZsR0xoQ2NDZVRBMlVweXY5bS9H?=
 =?utf-8?B?YjVvdjdFWkI4Yld2TjI2NWc4SmFGR0pHbm1wN2NlSXZxQVZsdWY1Q2NuN1U2?=
 =?utf-8?B?aUJzRGttWmd2T3pZZjF6bWVSbHFZRzY2bXJ2YkNTSkpiV2ZkR1BHdXd6NXIx?=
 =?utf-8?B?aXRJMzRSRGpXeENjbzdZS2RzSTJ4V2FBOVZWZ1V6SS9xN1lJaWg5Sy9SL0Nk?=
 =?utf-8?B?Q1p1MldUZktGcFJvaTIwWnFQRWxBR01vdjYvYzRMUHN0RWtIZEFRSWpvR3lh?=
 =?utf-8?B?bHNweHZLd1o1SUgvZlFTVVJ6RlcyN3AxbWo3eThsWGxON2ozUlJHR0RzeHlX?=
 =?utf-8?B?NnBNK0ZxaDI4MXIzeHc4Z2hjd2taTk1KclJtSXVSZzVRT1hiZEtWSVQ0aklP?=
 =?utf-8?B?Q0lXSTYvNU80dFJwaDl3TUZVakZuc1BoaUlLdldVaTJmcXF0ek93TXlNM0JP?=
 =?utf-8?B?Vm1QTTBRZnYrbHJJb2QrWDkvQ3E3LzdUUmZvdzU5RHJtTzg3cW03US9aa2ZH?=
 =?utf-8?B?YUdnSG50UDlDalJncUdyeXVROFlxbUxkWDAwMzduaG92Rjd4WUtaUmgyUFBB?=
 =?utf-8?B?RUN6WXdEZk5BS1QxRzVzeTVsRUtxUGp3RjJhSkFLZlJHY0ducjZST1pSUkVq?=
 =?utf-8?B?UUM5TCtlU2pSK3pwR3dxbVd6QldVR3d4VVhZS1NFVEIyZlBmblJBWTZFQ3pI?=
 =?utf-8?B?Si9leXRoT1FYa0lLT2ZBMGpjQVljUjhJd283bnZXYU5Ed0R4bm5MWUZKdFg0?=
 =?utf-8?B?QUJaRENmTHE3bjUvNlpsZXlkbkZHemN2a2I0a3I2Tm9XUW1XYVVxRTlKMEJs?=
 =?utf-8?B?aUQwTFFDQTFDTlRvYk10TjNpZnJ0eTJrMGo4TUFsY0RuajJIUEdabmtWcXJm?=
 =?utf-8?B?UnlPQW0wcUhHY0RnbjlhUHRqUFM4ZFdaMTFEVmpnY1pHZmswZ3VKckQyNzFV?=
 =?utf-8?B?WUNvTU1UWDFkSDgzcWFrOWs4Y0gzdVdXSW9pNWxFWm5xWmxoMGtXQXNDeERr?=
 =?utf-8?B?ekxRMC9MREx3ZEpyWmlEUVVCMTErQnRkSjBiMVpab2RlV2Q0bHY1UVlYQjhV?=
 =?utf-8?B?UTN5c285YmcwRFBwYW5rRVByK0QxTUVjWm52VVVmTmNxbnI4dCtna0VVbitQ?=
 =?utf-8?B?dzNhSy93MzJ5TUxTNGQ3Ni9Bd3haUDRBM2dlZ1lDR1FOZWJvY0k5NGZxODRl?=
 =?utf-8?B?SEYxMWtkR1JjKzZURWdZd2EvZFBsbEw4NE5BcnlKLzQ5UklLVHlVZ3gxNEhK?=
 =?utf-8?B?YnpucSt0blI3MHJmRCtNNEdlaFRMM0pvZUl2SXEzUGZlN3ljekpuSzV4UnQy?=
 =?utf-8?B?QnVpSDRra0t6b3dBb1BlL0VuS05BODFES1poTHo5SjJjdWNmM0dPL2w3Rnpk?=
 =?utf-8?B?RVJMWmVXcDRtMUo1Y1Vxc29yaG1Cak9GeklaN2JOa3JDQ1JoTnZaMUl0VFpv?=
 =?utf-8?B?MzA4eEpvQ1h0MTQ1RGY2UDJselVQZnZFZHZGK3VnK1gxeWFJc3RBeWIwNG1U?=
 =?utf-8?B?eStZQzFBUjZ5a1pWU2Y5TTM2YjBBNFZNenZkc3ZzWmpSM0ZGbkwycG9nQng1?=
 =?utf-8?B?WTVwOThmMlE3VGxXUG5kT2JLVnlucUJTeWVZZ29mRzlkV2grTk9rUHV1cmxV?=
 =?utf-8?B?aVVjeHppZWtKWW84ZHZLY3VVL2lEcXEwNzVMRmVpV2wrdFdhTlZpSE04NkRv?=
 =?utf-8?B?OVpMMkZ6US9OR3B6eVlxeklOVVc3RVh2VlV0TlhjN1dEN1BSc3J6akFFUkZp?=
 =?utf-8?B?ZTRyNmdSTlUra0krTmZ0UWFrWTF5UG45OVZWRVJ1cmU4T0xDZE9NWGJ2dWg5?=
 =?utf-8?B?NGJwZFdQN3lYblZrOEtwSjRjY3JQSE1mZmg4S2JOQkw5d3RrRFF6akt4WDB2?=
 =?utf-8?B?bWYxSFlObHBFeUtrSFB3SEwxUTlMVVdtckV3M0F6MnY1TFBzTEY3VENnNWI1?=
 =?utf-8?B?dU16eDdRN0dURGx2ZHB6dngrNTlpZG1haU9kYUJXM2Fpdm5jbjRWSVl1eUI3?=
 =?utf-8?B?NkwxdERSZjRPdm1xZU40RTRPSG8rWWV5N1YwWmNFNU5VRGhrcXR0WEg5SGdC?=
 =?utf-8?B?TUFEQ2JibElWaW5OSzZvazdxMjBoRGRHMTcxZDVSTTBVdnNJRXNnbkd1d1l6?=
 =?utf-8?B?UlZVU0ozc2E0TkhNNHRQUkxYc0dVNHhGNnp2clcxMThhS1RrM3c1T1lBT2lj?=
 =?utf-8?Q?Fn51KR0OwK9ASVTtbsmY71w=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e2d615-bc73-4e2f-a77f-08de3350e376
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:19:24.1334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSa+94K1WVZR6wQklbq5bwJgVESkeHEJ1nYIZ3Ia4NG2l6EsSm7xEKU2EO8MLTdqoJe9B9+ZGPzJSZ3GPH1QvICwIWvrKaqZ9HtNzBmbdro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7755
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 14/23] configs: stm32mp15: Enable LED_BOOT
 for stm32mp15_trusted_defconfig
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
> Enable LED_BOOT to use led_boot_on/off() API in board file.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
