Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 756B3CA46A0
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:11:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CF89C628D3;
	Thu,  4 Dec 2025 16:11:16 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013039.outbound.protection.outlook.com
 [40.107.162.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0379C628D0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:11:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0CG6yEtD5+4ambifkmfTgJbfIV0YSC0xolBzP3QwnUZcbVJ93HujjE24pHqQHaBdo3F52+cMAdYSebr/CISjRwDTPvMUu5GhGxE+xaxM19UCJLz2CqPVkzaBmP+JGTq/K7+RFbCrPblrajRs8EW3pxSEhtZe9L5MT5wHUSrRAEySyIgWDtsavBMG9Vj5qo1Dh94cYDEcAjVNA6/yR5pEzhxRHZDLth+nqVui1yoyr7K9a7TYPSUPq2wMAX8YQa7jjbvr4NkUJCFxTtCvfc7P+MwW+Z+Pzagi8bb7H21+ugdXN/H59sy2BWp6wrC1Gd34zbtoMhNi1UjjDQxUFH+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb+lnV58WW912DE1A7pvy4B3l6pz0rQMDEwA0hAPSq0=;
 b=j7qhiW1vv9zY1vwJzuGMXbwsT8l1O3xKJw+ut7u843l7MDxGXKxsnxdTlfY7LD8dE9PtqaTSUmVw7eMLv4aIiZM69mNx+dvQuG03gEaQ+6L+HHFMtfsm61Bn6aK3eYG/UVVPH7+44mYG2qGqKWc1NLvuLGr5PUfgJ4MWhue8k3tS/0h1IfvEicTyVaxuqqfHbnYtJbjJAusFd+XYWJPu4LPiYVYfcJ9ZNl3wrowsfh/GQSUbxv2gxINI9+vwSav1aqjok8vkLX8IoYDx3lHZcQVLTvPxt8L7xNvWJS1xZYbAB/XnZca6Sq1oOoESRfEOK21A/7UqWV6og7z6i0LKrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb+lnV58WW912DE1A7pvy4B3l6pz0rQMDEwA0hAPSq0=;
 b=jAsPqt0iZL1T4ZMmjD3Ibn8tHwYRueFebk9zr+LSFvfy28AIMK/cKnr1XmiLK1kmHPzgaRlxawgECDsR8hO48/nyo16SNNAiFtdg1XVrnvuxI53KrQnB6vJmMIjYkB1zFJfiitZcUYOzE70xRAOJZr0yd38L2QqRMhKg8oCitEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB9665.eurprd04.prod.outlook.com (2603:10a6:102:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:11:12 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:11:12 +0000
Message-ID: <bf65e7c7-41e3-416f-b9c6-f80893a80d8a@cherry.de>
Date: Thu, 4 Dec 2025 17:11:10 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-13-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-13-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: f632d162-9bc7-47a9-0f1d-08de334fbe5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGlpSFdUUUFBS0o1a2hLVExaZU9ZRWI1dGJ5VWFKam5rT3VZWTlZbU05R0hO?=
 =?utf-8?B?SVMvSmpZN1owMTVLRVhKdjgrZDl5c3VjYld2UXAweXJ4ZUx5eHlwVFovVHZ4?=
 =?utf-8?B?RWs5YWVST2x6WVdZb2lzY0pkZkNqNzZCVWVTRWx2Q2hKUHpYRjEzQUdzNzFw?=
 =?utf-8?B?bHVWSjlRbmE1d0hNZXNxdWU4am5jTUFva3NDaTRLMTFaNG90YXlycEQydmQ2?=
 =?utf-8?B?QnBDNVhuZlQzZzVNZGdVRktSZjZyRjRlYVpCS09zMzdRQTZ2QmdjQjJNVlgr?=
 =?utf-8?B?VVFVWjN1SEtDRVZIeU1MbzNZWFJaVTZYRVc5cUJBc3Y2ajNOakNXdDRJdDFv?=
 =?utf-8?B?U0tYTHU4QW5iOVRUWFBPRVgwMEZJRElhUGZjN3pSWUJ6aWFwQ2dnMkFoamJW?=
 =?utf-8?B?amFjRFZ2bk9zaFFYdlU1eVc2dzJMbkxKSkw3dVlBM2NuVUp3NDk4dzlWcWxS?=
 =?utf-8?B?bjUyRUFJY2c1NzdkbElGMlNVc2M0WGwvZDBPcUR4cytkemdZcWVvbmNDcnY1?=
 =?utf-8?B?Vll3RkV1c1pzekhWVTZyUGZuekZQSEYyOGxvRXd2TWc0bHZDbEFkMlBYb0ZK?=
 =?utf-8?B?a1FwdzhIMTNvNFpuNjhOVUNwVlc4Ui9hSTBQQjhxcExkbE1qSzN0cVpPUjB4?=
 =?utf-8?B?bTZVblNoQzFWTWNmUUs3cGI5UnV1YkwrVVZrWjJaVGQvZjU1L01aQjU5NXR2?=
 =?utf-8?B?Mm5vMmNiOEk1bVYxNjJEa0dSVkpBYzc1RFVFa0FiTU5VaXZOQ3drS1ZSR2Nr?=
 =?utf-8?B?dDdMaWgveE04eEV0bEQvTjFjVExBYm50WVVLMDBJTGJMQWx2SGZvY1NRVXBi?=
 =?utf-8?B?T2gzbjYzdWIyL0phVXV1cUZxK0RwMmp6Wk42Sm9MNlo4QXBBVFBQTEhOREl0?=
 =?utf-8?B?TExOVXhVNVovVUNuRE9Vd2F2OWZFZ0hQMCs5MWgvN0R2Q0d1NW9GNDFDdFJo?=
 =?utf-8?B?N3dRZ21HNHlOZU1qVVRJeXFadStaZVRTRG1ibEdtY0tOVnBQcVc4VlJMbVgz?=
 =?utf-8?B?eE9uZVNPbGhEOHdBZThXdWpHZk5IdkRGWWxRMWhkTzZ4SUpqUC9QOU0vTGhH?=
 =?utf-8?B?V05ONlFwMHM1STVMOExwR0FmRmU5cmMwNVpSNGxIVW1RSlhoY2FYbm5GSEpi?=
 =?utf-8?B?N05BNVBua3RxS0R0N2NqZ1Q1b3g3eWJTTE1sVzlleUg3S0xOV1BLSVRuMUJX?=
 =?utf-8?B?ZHBkOW9PQWU2eS9IdUZKbFJUQlNVSlAzY01SNmE2Q2MxNDB3RnRyZUtDUGZj?=
 =?utf-8?B?THJybnZpcTllSmxxdFhTZ2lHTVpSdGNNRFg1MTV1WnBEdWFUdjgvTXlXVGU2?=
 =?utf-8?B?bk90TWhYTWtsRlZ3SlBORTB0aFRNNURiQnhnZ2tmOU1sNHgzNE1DVDQxUzk3?=
 =?utf-8?B?T3Q1dHVZSy9PV25WZ2RrT3JMT1o2d2c4NHhzdC9QdExOc2tNT1FiSDYxNTRW?=
 =?utf-8?B?aWU2MHRoZnZ0cENFRnJ2WS8wbEpBcVJzY2QxNFhZK2hxbTZMTzROZmxlR1JK?=
 =?utf-8?B?L0JTWmNJVHR6bFVTVWZ2RGhyU1owZ2V2UXhrbW1KTG5yME9FcXpnQ21mRjRP?=
 =?utf-8?B?R2VnbGRRcUpYVmlzdVRIbFRmTTNFT1VYZ2V5NENwNTloemx3cWR1STljUDE0?=
 =?utf-8?B?bGtYT3pEREdtLzFId2tzTXB6U2FKSzN6ZUJSU3J5Kzg2RnpyNjd2U3FaLzgz?=
 =?utf-8?B?d3lFckQyM0QrQ1p2aUNYZ2FJR0V5VTM5QkFJbFJ1amZIbG5yT1BwTVBQc016?=
 =?utf-8?B?Tm9aRlBMNUZEYzZCdXpGQXl1aHhPNVZNQTJwTnkxVzJoa05ISm92NndlZ2pG?=
 =?utf-8?B?azNWT2M1bUpyOTBYUjRqL3V3MWxZeGI0M09LbUE3dFIrRklvdUFZcXBTYTVP?=
 =?utf-8?B?N2dLcnEzQ2UxQ0hMWkRKZy85dUpmVkxhVDJkSW1RUnMxWUNmcnQvZ1R2c1hD?=
 =?utf-8?Q?8c7NUgMworhLhnOd5LDAGefa3c7N8agB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGVheDQ2TURENDAyc05DZGRGTDZjNURwdEFkUWNsYlh6Y0FaaTBXcWRHcVNB?=
 =?utf-8?B?RHk4ck0rR1ZoWjFVbWJ2RGg5cUpRcFZpWVdRS2xEcXdOZVEvZlhtaEFxRGo4?=
 =?utf-8?B?RDlxTHNOdStVMkQ2YlByRUc4OW9UdVFmRlRuTjdBQ2xNVHE5bWZMU1JlRlJJ?=
 =?utf-8?B?MHBtTEF1UlR6cGxWZmlFQzZLaCs4WG9TcVB6WmljaC9zUHQ3aGYyR2djSXd5?=
 =?utf-8?B?Y0FycG1XNEVyWlRaQ25HQyt1OTlyZWdURFJTMGhHNExCQ1FkWXJGZlQvY2Zp?=
 =?utf-8?B?d1QzcG5PS0hwZUtZSldRWDV4TWVVblRUL1BPejl3RWhsb0xrUVJJWmw0N1k1?=
 =?utf-8?B?RUpKWCs4SVUxandKeFBGZDd4VlRLNnh2bVl6TkRWajNJeWdTUjdkRzM0S2Z0?=
 =?utf-8?B?eUNXb2QyK1dTcStRaWJpSVkvYmlLRDArNEVVSGcyaXFLZGJyOFNZUURiU2Vx?=
 =?utf-8?B?RmJKc0tGK1NDVXpMcHRNK2tOQzhLRGl6djdGL3BpWkdhNE5XcEVnajhMbXpQ?=
 =?utf-8?B?K29nRjJUTjI1cHNaVkc1VlRtT2tmcVlQc2hkVzhJdCtHNTkxbTVwa1QySFNh?=
 =?utf-8?B?YjU5enQxTk9lc25vVEVCcThnTzZoNlJoS0tFb3RocjdScHpGbTJpWVUrRWpJ?=
 =?utf-8?B?Mi82WU1uOFdLNmMxV1JwRVdUY2lwc29pcXhlS012OHc3VUpmTkx0eG5Sa05W?=
 =?utf-8?B?QWRLd2dYME02eUZPK1VvUmkrSjZMeDBudEFVbUpna2RpVmFaK0V1WjYzWUxr?=
 =?utf-8?B?WDRqRU1ZZ1ozWnc2R2pwVFZMdnYxSVh1VzBsazgxUXQzNHhXbGgyQTZsSDRi?=
 =?utf-8?B?cVBYY3FBVHhtUHl5ellCZlpDdXlBaWpJaUlaWm03NXVnNEdjRndpTzJJckds?=
 =?utf-8?B?bGJqZm14UDdzZ3B3UC9pTzBLOUZZWVE1enhxQ21HdkxDN2Y3d01qY0x4M3Fk?=
 =?utf-8?B?R3Erem1EVGpYY2JYaldFL2lOeDNMS2RkRjMvSVdOSUhDdWNvSjBTbjRKbEpS?=
 =?utf-8?B?QU1BWDlPZGl3SFFUVmJENURBUUN3UU5HUXBOd3dVN1NSbGF6cG9aeDdLMFF5?=
 =?utf-8?B?eUxoaktoWG9VSFJjekZoamdFb1RqMnVadUNjRHdEYzA3d0FMaUlpa0hnSFNN?=
 =?utf-8?B?T3BlcDl1aUhURGFlQVErRzVjZ0dLYTZiMFduSDdjZnJlYjBDS2JTLzZadCtF?=
 =?utf-8?B?YWtLOFl3WWI2b0VrVXFZQUFtQUZyNXJRbWtPRjVKV0hqT0M2eHNHTmF6aFov?=
 =?utf-8?B?eVBYU1ZWV1hpenVkSVc1WHVEZFhZWUlxc21Ua3JSdlQ4aXdzTlR6TnVmbWxQ?=
 =?utf-8?B?TGdqS1hvRVlIUGhJMzFGVkVaM1NkOTY3UE5zV1Y5VU1qNjJ0Y05Gc3NHVWNj?=
 =?utf-8?B?TnY3aHc3aE42ZE1BdnFFK1o5VWZwTHdNYmthYXYydXBERmpCY0JyTGF4NDZK?=
 =?utf-8?B?aEdjbFVQQjlwZ1RIYUZ0MWgzUGYrdFh5alNLQ0lLS2ZSbzFWRFFnakxwcXlo?=
 =?utf-8?B?YXd3d1ZHU0ZieHhpZ0pjQkJHVkpHTkRLVS96MkQzZ2FOMVpucXJCd3hSRkF4?=
 =?utf-8?B?REQwM1BlWDNjWE5RTVBPd2pVbEkzSjJLalNxSVJ3Z3J0bThubTdQelc3Y1Fw?=
 =?utf-8?B?d052S0NuQ0ZsZS9peGVOc09NMGpJYjc1c0FINFRWZVkxalVTMDNwQzFXYUlT?=
 =?utf-8?B?cmYzZ2lQZGRoMHJGSGtLYmRBRTB4NXdSaysrOFJOVngxTm1ZbU1CTFA2VG5C?=
 =?utf-8?B?elNtTnRGYjRQRUt1eG9IWG5vOWVXcHBXT2kvMVR6WGRCMElONlFvYVRHb1o2?=
 =?utf-8?B?aU9UODhVbkZCYVg3MVlLd1lYbkFlbU1rYmxUSk50Y05ydWk0N0RPV3dYdTE5?=
 =?utf-8?B?dGhEL2tCS3NqVHBOL2ZIc0I0ai8yMjdNSWV6OEVLT3RjSFNTc3FMU0RsK0lO?=
 =?utf-8?B?Y2F1NlBqZzJXZE9yWEtiaTU2MjJIYTJMdFhKdnNsSGpOakRsZ1VFTXB2TDIy?=
 =?utf-8?B?WnRzdGZEUkdTRktNWC9pT2NkTEc4M0tyWlhUcnhBZFdkK1puR1prbUtVTzJW?=
 =?utf-8?B?dktMWmFDWnFDbVpJdklEdSt3SHVWRjVQYmc1MG5CVUJmcVE1TWV0OTZRd2JG?=
 =?utf-8?B?MWJJYzB4R1ZmckNXNHkrOUJrYnBTQmFGay9LS01yck1ZbHp3S0MzNFo4d0JR?=
 =?utf-8?Q?FqwshDDSTkyjYLbMBrlMu2U=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f632d162-9bc7-47a9-0f1d-08de334fbe5e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:11:12.3803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gy5iO9n+gHwQT9PTYLVrqYoGcuQfDM1t5qfhpILkJ/Ybm4Z2t3Q9E0m8gz7xxt6webrc3/otsT8jxZNvjrtAyoBpOb+Pusf8vCFnW/IMb5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9665
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 12/23] configs: stm32mp15: Enable LED_BOOT
 for stm32mp15_defconfig
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

Same remark as previous patch. And I also forgot to say, the boot LED 
will be automatically turned on late in U-Boot proper.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
