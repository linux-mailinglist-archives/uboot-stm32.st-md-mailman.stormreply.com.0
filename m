Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 377EDCA48E6
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:40:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE32AC628D3;
	Thu,  4 Dec 2025 16:40:29 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FC67C628D0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zI15X7DDx6byOoSoh5euqG/9GEUHQzjsr08U5OTX8hba4zuxL/lRlECJabF5B7u5kUtOEjnWyw+6EHGrOSF+r2E+a+80LIWZx5cYrTIPGnjFmjWVsOzJJ0NLSufLeeR2jtbH3P7Vl1Q0Z3xOGK6Ti4AIJR4fXuX/BmeiW+SuJNaCw0T+sjK9Oj/HCYKhRe4HX5TEHHNmXjrlR4rtKAl/28kIRJsMA4YFP4IKZf2wQOM3cJfqOYoBgbac/84xgG5+RCWEsMDJ2Wi7gRUPCcJeIyk/NYs3eM5OmSdygWHXK0bKiZWgzGC+eFA0isfjMqSTOvFKv9Vso31SRcYtqrjnXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jpxr6Ggae7r3Ecfq5czokxAKnIPKVh6SkL83suB+jtY=;
 b=uU/iRCRBzXVhEWFglT0xUzzgJHiThe96gtkVuTF1nUa8mdLkfTSgQ5yVLsM6yHbquibuVyQjHGpJHq+HTqL3RUyIgdJDJdl6WP+UDKi+ZxjyyaPNKNrb2dY+2a1/xZiDNWS0GZyUoodtZ4ozHytiz+EVvQ/2jIBR3i/s7oStqyD7KueMNRW26e4gJ/Ig2v4BsEFC/eZYkG+2sbTheFmRT7mLa7/YsO3e61zZpihZ4eBuPD/41ee17MyL+LF1TIKBSKVsxqvI+d9QmnxHJH/T1x65cisPevASzpE+T23QC8uwHpqXs6h+VrRFuEeyfcv/yHj+FQBiAWGgTqvihi5LpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jpxr6Ggae7r3Ecfq5czokxAKnIPKVh6SkL83suB+jtY=;
 b=XLSWO9eZQJRhxVD2NzabPobkk2AzLbi2t6LyuMGNTa20wcZ4d6Fvo/eZ4LEIktxBp2fQY8zL73YnBuDgVbf7AxSnD/66CNRupOPENvT9FiIFFcK1VqyIt9QdSzL9DLKPDrCR36tZCPEbV4E4Rrlhl4FcjutRlQ3kJl5hj5kyEVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA2PR04MB10159.eurprd04.prod.outlook.com (2603:10a6:102:406::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 16:40:22 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:40:22 +0000
Message-ID: <e381223f-1b78-4d5a-8676-75ec8239d4ea@cherry.de>
Date: Thu, 4 Dec 2025 17:40:21 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-23-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-23-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA2P291CA0048.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA2PR04MB10159:EE_
X-MS-Office365-Filtering-Correlation-Id: af0598ed-7594-487b-552c-08de3353d15d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djJCOW0rU2hNZTNzdUR0OS9ibVhxdkx4N3pZVXBnR3Y5eTN1Z285eE0xZVQ2?=
 =?utf-8?B?Rm8wdStJaDc3TFhNVFd6TzJMdHdQMG4vM1BWNkpzTmV4QnplMm1NT0tzdURm?=
 =?utf-8?B?VVRuOTZvTmErQ0plajJtYktnNEMrTDQxemIyeUZRVVBnN3drdTJtNDFJbjRD?=
 =?utf-8?B?SkhZcDlxMWs0QlcyMjcvZE9jcm9LdGN5djlSeTdleXc0c3FFZmV1U09XSmJK?=
 =?utf-8?B?VGUzK3FXbkJHbE55L3RCUHJWd3dlc0k1c011SW94Z2RWWm1WV3NrVEdmRjVq?=
 =?utf-8?B?RzBGT3B2L2dPT0FzVi9Mc2hzNStYWnJ2d1NqSTAvVFhNa0ozOWZ3V3BPWG84?=
 =?utf-8?B?Zzd3QW5nY1ExVDNHQmdxZkREZzVCTmRieFFiSEVuZENmbUhVSEJYVlhObGZ6?=
 =?utf-8?B?bGhGUDkzZDEwT2I3MU5PbHA3U3BReXJVeFJGVG5lMS9ScDVNQndsTk9lUm1n?=
 =?utf-8?B?L3Fudkc2V2ZGcUE1bGh2NzBmWGdxaDdmTUNQckhQdlYwVmZobnY2SUQxUVJ5?=
 =?utf-8?B?bm9SWlVaRlpOWHlNbzZqZTVONDhZRFVucDlzRjJPMXVDS2FsUkxSNWVhVU9U?=
 =?utf-8?B?RWZVN0xZOTV5WFIvSDZsRWxlUFk5TDNvTVpQdlR1d3A2a2ZRZmdteXYwSU5R?=
 =?utf-8?B?anBGY1JxUWUvQVE5YjNmbjdIWTJxT0ZzREtJUXpTQ2pCeVZNUENlQzhla3JE?=
 =?utf-8?B?VGwyNlNJVVFFUTZoL205dHgyV2xuazAzTkhFNU1ZZGd2ZjRZcEtFOWI1NTFP?=
 =?utf-8?B?TTJOeExYWWh0ZXVQUWJMTTlmS1dWL0ZXQUM5YjUvbHRDSmVtZFRaeXllVm0v?=
 =?utf-8?B?Mkdibm9IQWJYNUFQUWR6d1J0UTBsWVo5OUh5b05hYi9zMTZCdDlFZkRKSENT?=
 =?utf-8?B?b2hlazJ3a0VXR1BzbTk2NzZDMVFxdVlnd21FR0NaN1ljZWcvaFVUUkxsNStX?=
 =?utf-8?B?RkZMUTdsYTM0SWRyTStJUVlsUDdTVUFzanJNN3h2TC9UeTNiaWpzRDJYVUJJ?=
 =?utf-8?B?SDgwV3VNY2M1bGpWWXlWaW1IYVFXTWVXVHlWMDlaYVJSZ1NRZU9JeVpRTXBW?=
 =?utf-8?B?SkRHbFg1WXdkMkVyaThIdXZuL0E0TytrSTY4ckUzeDYyaTVPMXhkZ3F4Yloz?=
 =?utf-8?B?ZVQ3enJmNVkwcnA0eE5Ya1J0SGczMDNZZFlWTmhoUDJpU3Aybm03ZkxEY2Nv?=
 =?utf-8?B?U2pEeG82ZHlQOTB1ZWh4NUdxVUVYRURjVkIzVWNYdU9wT3RacmIzeHZRQlNS?=
 =?utf-8?B?TW9RcVFXYW85OEtlOC8yN2JrMi9udVNQTmN5VkVoRHRFOEVYMWdZbmpSaDNL?=
 =?utf-8?B?SWdBNjBTMWM5NFJxRVZCMFNMOEVPN0pGWXRCejB5aUVUM2gxaEh2V0pjTCtK?=
 =?utf-8?B?NmVZRGU0UVlLMkdGdFNtRzIvWjZPWm96U2JRMlJNOGgxSlpBQ1ZZa3NHQzVr?=
 =?utf-8?B?OWFQVWh6VCtWazFwRHNHVXFDaGFVSWtXbHExSmZJdWtjRXorbTFJek9ITnFI?=
 =?utf-8?B?RDR3MFNhNUtzNHJPMTJPOC8vYlZ5WUwrTFhDSFN4b1F0OW95bXVMZUpOSWhp?=
 =?utf-8?B?dWN3enpmcG9RNnQvb2lTdnZwTEhTKzBGc0YrRGlIdVFiZ3FOaEFFa0s4NzhJ?=
 =?utf-8?B?aUdLd3VoZDNWdVRxMDRpdFF0aHBhdkVjZ2w2NU11Um1xMmU5bG91MlpsQlh0?=
 =?utf-8?B?MnBLc09zWm05TjlZK2I1bWZ3SkpOYW5BYU5URldiNlRwVGxvNU9NK1plamp1?=
 =?utf-8?B?ekFtbHhiQVpGaDBqWDF2alJGUlV2aHh2Vnk0ZjhFbHptQnQ4R0c1aHdkQ1dE?=
 =?utf-8?B?a0tZWnlYWDhQSHFJSi9kU284YmN6ZGVZbUM1MGFac1Bwbit5QmdydEp4djY1?=
 =?utf-8?B?RExVOEU2K01TZEgvaVhpVHIwTkJtL28ySE9TUC9Dd3RxN290bWZGeUphOFRl?=
 =?utf-8?Q?UwN2Ro942ZoV6otudg438BhWNffQUxac?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnZwdTd6UEZoV01rcGt1b05DWGpsd0NvazdrbGZHbUJMT3BsdnQ2RmpuZlA5?=
 =?utf-8?B?STFid3hpamIxT2Q1ai91R1JmdzVTUURwempsdEdqSFhRM1lkZ2hBUUZWZTFw?=
 =?utf-8?B?a1B1NVM2RGI3Z1dPenJMdmxnc2xUOGVzdHRkQlUyUGNIdU0zUFEyeTdiM2pS?=
 =?utf-8?B?WHR2Tnp2eE5TcVNveU9XR1ZlVzRGRkZ1Nng3U0tsc0VwaUFidDhITXRRTDF5?=
 =?utf-8?B?bjNrTmYzV2pTZVFqR1hyOU9QY08rb2hqMDVkb1hkTXppbFNYbU9aY0lwc1lx?=
 =?utf-8?B?THBKMnVZd3ExTE1ocmJZNGtGQXl6d1dBU3JZOU4zKzU0MEpENDFvMmd4SVdn?=
 =?utf-8?B?L0wvVGFNSmc0cFc5OUdib0padk9Tb3hNcWdqTlE5RVQ2OTQxTEVZVDFiZnJJ?=
 =?utf-8?B?eWdYMVkvbHJqQmNtODkvNzluRmlXajNjQ1NNajc0eGZhSE4rZnpGNnVwZnBG?=
 =?utf-8?B?N2Z5WitBb25WeW8zL0JYalcxcitMQlFXNnlmL3BVNUx3N3FFZ0xIS1Q4WGFw?=
 =?utf-8?B?bUZpU095VVlSMlpVTDlQaFV4NG5vbXhrd0ZMY2dpQUhBSTJyaCt3WVRZRGc5?=
 =?utf-8?B?MGRTMjd1K2kzTTBCTDQrc3ErY2pDbGlLTjhZS1hLQUtwVy9RNWRnS0tNVnlz?=
 =?utf-8?B?SFE3MG1ZRm5QWVcrMG42TlN5VnluTnhhT2FjZXhlWE5wdVh6T1p0R3FXenNs?=
 =?utf-8?B?d0VvcEV1OFFHeWZQdWRtVW1CWXY5VERkTmpLVnV1N1kydVBNVXIvNk5ueGVx?=
 =?utf-8?B?dTBMTnFRNVBaSEV0TElwWTRnbDd1QU9rYnlDQzdBYml0NGVNeXVBblc2allp?=
 =?utf-8?B?NXhGbzZTQ3lKQkpEWE14V3J3ZzBxTDkxVVVOR0V6WkMzbTZlRzRZNnJxaFRU?=
 =?utf-8?B?bXJxU3JYcDBiaUZ1Tk9DSXlXTmsvM1QyQU1XREFhZVR0WXUxY2NYNEtrakpL?=
 =?utf-8?B?NzBSajNNSTE0OWpGZWs1NW9QK2piS3VDMUVCK2Z2dmZiZ3haa3RyT29YcGRH?=
 =?utf-8?B?K3dNczg2eHY0TDFEVEROTThKSXVqblVBbjd2ZHhVT2ttaElqVTYxTjZocnZm?=
 =?utf-8?B?bE9ybm9NdHJFaDdyS1FkbDhNd1k1ZFBYWTc4Mmk4MU5tNUFmTEVMMkJna2Vs?=
 =?utf-8?B?VHVzZVdhbG15bXJYVkwzd2ZOWE9HWlNjdHBwOG1pSTRJNE9IVEgrbkdzN3ZO?=
 =?utf-8?B?ak9lUDQ2cDVsNk9kbUk0R0tMZXZnSWIzaW9qcUNabEpHb0E1eDVnK2tXZkht?=
 =?utf-8?B?c1g5Qjk5OEJ6VWUwbWZNUGdMTm4wRVl5WWRobUE3YzJWYW82N3d3TXo1M2ZB?=
 =?utf-8?B?SnhEYmhDNkpqenBTZnlvNDZIVE9hWHBBNWk5SU5TRFNYdE40Y3dtajJBQ0xv?=
 =?utf-8?B?c3c2VlBmc1N5cGJPV1orWS9GelJRNGgwWEo3Y3lzaUk5VVhjTDF4QmQxUE5q?=
 =?utf-8?B?RU5DbjNCRnk2dEVub1N5b3ZlMlB4WGJQNXV4VE55ekNoWFB6UWxnVm5SVUdx?=
 =?utf-8?B?bTNHeWUrL3BOdXhRbFJMZWtheFRvYWo4V1lkUXJUTVpEZ1d2MnFlZk1EZ1N3?=
 =?utf-8?B?aHlzcWJVN0RsMG9LdWlNZno4TEM3TktRaXBDOXVsMGZkeVJCWmpPNERRT0ZD?=
 =?utf-8?B?QlVOMlo3MGs4eEduNkgvclk5aGxFNDArWDdmOWp3ZEVIcjlPbXZHaGJxSlBJ?=
 =?utf-8?B?SEVFWEFOckdiTjhQVVVsaW9lc3BoT3B3TFE3RjM5VHJZU0FvbGNya3dZQm1i?=
 =?utf-8?B?L2Y1REYvR0xvTkRvOHFjTGxxN1h6dW5ramZyaytSaWZmaExrTnNuai9xVmVK?=
 =?utf-8?B?cXQzODUrR2JyaE9iOTgycFZJZlJzUVJHTDVvaDM4c0VQRFlRaDVSa1RxbGNz?=
 =?utf-8?B?cGxBdkMreXdaeDdiK0k0VnFpQjYxeTJjREZGM1NZRFJtNXk1NzAvMW5NWGhH?=
 =?utf-8?B?WHVHQmRHb01aNlhWb1JFb2htVTFUNGJkMXR3RjlCN0RBWTJJRERhSkEwcEx6?=
 =?utf-8?B?aGtOMkRlcDN0OEVNNi9RWmZ0eVNGK1M4MnlhVFN2Z1I3UkEyQU5FWUgxR1RW?=
 =?utf-8?B?TTRES3RUWHhuVVB5RFY0Qm4ydHdMZzZzakZvU3E3TGFHUHptQWZnZVN1eHJQ?=
 =?utf-8?B?YXlmMnQ3ODhuOStMbjYzY2ZHYzNvZ2YzTXErYXVFL0gvdTVpZENHOG9IUGhP?=
 =?utf-8?Q?oPVpq7riKms9bPEfbGquNQs=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: af0598ed-7594-487b-552c-08de3353d15d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:40:22.2500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvVwJO0tAWzrsc0+XINSWECYB1XkjVC1Y/21HOBEWcpE6rkYdQhWLWDxswAV5zlkUYFA5DP6jodlXU4mBXrWRUKUWi4thwbqfnMo4RipYCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10159
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 22/23] ARM: dts: stm32: Drop "u-boot-led"
 from stm32mp235f-dk-u-boot
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
> Remove obsolete property "u-boot, u-boot-led" from
> stm32mp235f-dk-u-boot.dtsi.
> 

There'll be a replacement once the Linux kernel merges 
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251112-upstream_add_boot-led_for_stm32_boards-v1-13-50a3a9b339a8@foss.st.com/

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
