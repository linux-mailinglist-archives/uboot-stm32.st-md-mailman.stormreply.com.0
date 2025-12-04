Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 765ADCA473B
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:22:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40050C628D0;
	Thu,  4 Dec 2025 16:22:01 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013053.outbound.protection.outlook.com [52.101.72.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5F38C628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:21:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhxQr7ClXUjAxSUNMrI1BuVCgVQswJvt4CaKzqy5/wDOx4fksnjV6gmzvO65AU5wFiE64HBSYk3xnK8FYCfTkbxKG84ygYq0pk28K9BVTOfcUv4W7bFAYD68SBGYwI4bVRnJxcfO/HKsxHiBfDW+CscrMFelYrbqZuqbES/U9KyBFj7Kb/LOMQw/j/Oe7zSmDI3GYsYC2eBL2pDbXv2TwbqPBsn4AlFOI5XODsSH3JkoWF+tjObqH3liZRWuvSvyvNViWLrPOMc6QkTqe7GOR5lZYsVLM7ePlKl8eWFoxrZMJQldnnNqJvqtHf6GzTizff2zpaUXSg6BiF+/DNDN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXFGxh0rMBG5R5RRBgr18z9rkaRqfUNK/RmWUk+7cEc=;
 b=SCVdv5uhCj+S6Q4g8XFLWplEpl0P/gGUTjH1ZiY/I4E/EoYLYq4My5zyz+0dXZYPvmh9yTTsaHG2N+pf+y6qrrqJH8VR8vnq3DVe9gdve7E78+y74eEr+fsS8s+kabKsjU5plHXBMNAs65tmlfbHq8uUd1Wl1uCkXjaPdeX7MSmdpNsl/fr8qZiHZtsfF3WA848YUpRpoKXMmj03cb3iWxC+7xai0Q4zmOcp86PEG/42lv73dZ+Fi2LR05nwiPbHJW5D8Dh4e9OxywteJ3trWH1e3flCgpSdt3E7TOwY0EGD8JtIGpvQN9xPxCdQ1AAoeTvj0HBIvKJW0gLYp3DOCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXFGxh0rMBG5R5RRBgr18z9rkaRqfUNK/RmWUk+7cEc=;
 b=kbUE1WeyzHBTkjeQtIsiZVtsriyOPmlBEsqWHWnHTYHm+Yohga+S8O+Ub5w0+go0l5PX+mVnPanTHsMYJ5JSRYKFVHlNI1u9PjkGh5l5vmf5fRC6wwJRNqNZACpl1vritmVtQ2GO6N85RZf89aRXrrDGEoTZNOQSo/GYu46l3g4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB8PR04MB7148.eurprd04.prod.outlook.com (2603:10a6:10:12d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 16:21:57 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:21:57 +0000
Message-ID: <12eaa971-c14d-48c4-9677-1382ac94e7d3@cherry.de>
Date: Thu, 4 Dec 2025 17:21:56 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-17-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-17-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB8PR04MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: a78010bb-50f7-47d2-8be2-08de33513f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnE5dHo4NCtuRjlYalVsS3JTbFBrcHFEM2paNWkwL2lGNnI5UStmUmhETkI2?=
 =?utf-8?B?ckNLQmxldHBmZENHdGNpOU1FMnk4RTgvSEZHZTRlQlB5U2xMdEZ6WnFVNWtT?=
 =?utf-8?B?dXFCa3hBcUdnZk9tY1NPSkpSS3NKdlhFNmNsOFhyY2dLZVNSTWpmekh5SjB0?=
 =?utf-8?B?alBvMGdId1ZDd0VIdzM3d1UySVUvdk9yYk91bXlDT05ScVBSYlUvcXQ5U25v?=
 =?utf-8?B?Q09hL2I3d1haNlEyZ3JzcHNDbVI5c3hJeE9RTUp3N24vMzZxZEJ0TUxnb05D?=
 =?utf-8?B?M293bWRvVjJ5d244aHd1YVU4MnFpNWtPdFlEOENkWWhRNzNxVFhjeXpDTkNa?=
 =?utf-8?B?SFRTWk44cWVWVTVHU1FtVTM3MEdGQWJobmhGQXRRWXNTUkJ1b1MwZ0hqaENC?=
 =?utf-8?B?VzFjaXMrSi9WcU1yNWdTbnJiM0x1WmZmTWNvRzdTMW9pMXNLTy9GLzlKQ2Qy?=
 =?utf-8?B?ak1lbnhOQ0xRdlZucEdaVHFXcEs3SGVmdlNUZndZR2xMV1BnUTc1enA4RU5R?=
 =?utf-8?B?ZjFPclFPUzZqRStzcU1uZ284YUp6cUg0SFE4a3BPcmRtNDBZcjZPM0krSm1m?=
 =?utf-8?B?czNOb1Ezc2djc3FrUjRxMEM3VzZJaWZGMVFKSTJBNmlSSDVBT1ZlNGRNVHFF?=
 =?utf-8?B?aDhadm80T2VYVFhnWjlIQ1JQM2hTQW1vRzVMcUtEYitFcFZIVC9wa2pGbitw?=
 =?utf-8?B?eEZoaVl2R2RiMEdXTkZvbEJCZzkzSy9hc1lUb3IyTlROU2dTK2QwM1hsbEZT?=
 =?utf-8?B?bDZkUGtXNXprbW5aOWZwT2dMRlJxOTFUYkJZT3l6Y2swajJhV2tTczhKQ3Zm?=
 =?utf-8?B?TlNjY2IxeGpoM1RpbWVZQTJUTnNicW1GVU5DOW9CMnZmeUZGeVVGc3orVGpJ?=
 =?utf-8?B?UFBMY1lLYzJhZUo2ZnZpUUE2RlBzckpBbzZNemdjWWljR3pIa0l6N01lY01I?=
 =?utf-8?B?andKQkVHSGRkQmx5aXpPTHgrem55MkhSRy91K0pqTFUrdUY1THpETE1lRlM0?=
 =?utf-8?B?eGRIT29GVEIvbFdrcnoyM1lvcjJCNGJVYll6cTRmOVh3dUxyWWh1MnVMbmRn?=
 =?utf-8?B?bWVMY3lFbUN0dDZ1dHp2aHFUenBkaUc0YVRjTVFNcGZzcjUxWnlLaUxCZ21j?=
 =?utf-8?B?ZnA4Zk9kSDQ5Zmc1SjBXMVhvUjJFTzRNbHZyeWNoZk1CdTF6cFljTGRxZi9I?=
 =?utf-8?B?UVVXOE5mcVp3RVhYY2lOeVB1RElDN3MzY2QzSkZFSVhIRStMMjJTV0N2UG5O?=
 =?utf-8?B?OEdvL3FrZkYwZFJDWGd4ZFlablFXNHFxTTFZRWZLMExEUHVISmZ6eTVzK2I0?=
 =?utf-8?B?SktLRmlLVjJHdXFzWlJWTXpTOThmSDhNM3BzUFRTSWphRGJLL2RWbFlmUHhV?=
 =?utf-8?B?ZmI4MnlsbTZzMjFYcVlhQjZJVWtkUnA0K3U5SzEySW5JUXREeHNMK2VIWmFt?=
 =?utf-8?B?Wkp4ZFRiSHJZUFVoZHVWT3F1VXVhdlVyTFlSZDVmV0F2dEFhNjQ1YU1MdWEz?=
 =?utf-8?B?VUppWkZ4UVNmckxLR0paOWo0RmlGVk9ZSFpIc2dBK3llZzFKVDY0NW1iT29O?=
 =?utf-8?B?dFluKzNlOTVCM1pKd04rRGc2SnNpNVY3Q21vUHQybTlxcjF2ZnFSUWFhQU5w?=
 =?utf-8?B?NDFPTnMyZEx1aGJhbjBXbEpGdFAzbVAxNFlYUXpSN0pvYjQ0a2syQzR3N1NN?=
 =?utf-8?B?SmNpZFBTQkZoamxsNXBqNzVZa0pHRlF5cENQdElqVGN4RzE5MExUOG40L3pw?=
 =?utf-8?B?cEVxRjErQW1MWHVLMm4vY3ZEOHJlNmRnaTY4WFg5MUs5eHJhZFFEd3pBWVhG?=
 =?utf-8?B?QU9vUjJFSkphb3greGVXWlhLSENhbTZGbjhYMjZHNEttT3Q4WG1UL3JOVG9y?=
 =?utf-8?B?ZUdtd0ZpaTJXZ3J3VkltbHJ2NEhwL3NUeFhEUDFuV0V5RHd5VVhWbFJ2SG9a?=
 =?utf-8?Q?OzYBdd5hRP8e7M2bGyLxHqZBXJwDmPqW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlRldzZERWJyNVFsZXVQc1p1aXVLcG9uWEhpQzhUd3o4TkZTWmxHbnNTM1BH?=
 =?utf-8?B?emRhQ2cyejA1L3hPL2NienlmVlFuNDZQYjJPZmdJbnk2SElJQ204ODMzaTBy?=
 =?utf-8?B?bTF3VWZWU3IzZWxpQWhVZnRUa29xQ0lpSklkM1pHYVJTYjBhZjk4QzMyVzVC?=
 =?utf-8?B?SGlnWU82Y3JRK3owOHQxc1E0eXRZTkdldmp6TkFLL1M4UnRxSHRUN1BCaStG?=
 =?utf-8?B?YjVLb1RWVm0wVkQ5WGVGM1FzL05UM3dzdVVOby80SVN0WTJDQVRMVkp5MGFU?=
 =?utf-8?B?Tmc3bldVSkQ2ZnhNays2eExIQkZNTC8wVld1N0ZsdGx6ZUs5RXhsdVZsbDJO?=
 =?utf-8?B?aTU1YzdxTEtoSzJDU3lTaEQwTXBnM0pZZEZuRnhQd3ZwdnVXc1JBOWwrRFdj?=
 =?utf-8?B?dEhyVEZhbTNBWHJEUTh3Y0h6YUV4ZFhPT1FieHNWSU1kQXM2M0FCczI1V3pz?=
 =?utf-8?B?ZVRhQnIwS3NWNWNTU3dIbnZPUmJyZURXUU9wb0lDdWZEcStmQU5LZGl1NnNp?=
 =?utf-8?B?a0lFaUtCSGhRSm9wcEJHdmZucHpTLzVHNy9rY3lhcHkwcWpoOGM4bVRwMkZ5?=
 =?utf-8?B?M0E2OWNTWURWZWp4cmtuS0VaZDFOVlNlb2pvZ1JjUDY5eDVadks1bGxXSHdH?=
 =?utf-8?B?UzZkOHJvYjY5eU1NNjhEcHBiVlYvZTB1MXZNKzJKNnJ6REw2WXU5YkM0VWNo?=
 =?utf-8?B?cTJ4R2lHd2N1M05lTENpZVRSQ3I3dW1GU3doeERYK24xejVFVGxocC9mcVFk?=
 =?utf-8?B?czByazNIbStIWmcwamhXZUZNb0RlT2JaV3JRNys3bEkzbGhZTzI1SU9TZ1Qx?=
 =?utf-8?B?TE00MzNmTVlUVnNCU1NxbVNjYlhrejRKdFZZQ01qVHkyamdEL2xLWXJzUktN?=
 =?utf-8?B?Mzl3bGhod1pjenBqS2Y1TjFNMXJ0cDR1R3BYRGlqQTQrcHlQUkVYeUVDekpF?=
 =?utf-8?B?Wkd1SnEvbEwwSEFIZ1NoYUVtQm1Ka216cUY0d2pwWnFmUzJMa2ZySnBlbEFT?=
 =?utf-8?B?bU1DZTBuaGhzMVlVTjByRnZWZ1Zra3oyTE9wM2EvKzhSdytvTTZ6eE1ibFZa?=
 =?utf-8?B?NnlOemR5NElXUmNnMCtxa1lHQVVLazdkZEtrUmlRbGpMQ0VER1R2c3JkYVUv?=
 =?utf-8?B?ZEZZN3Q5UytxS0NHdGNFblg2bUpyVG5EMXRaNFFmd1I2cXQ4NHZQVzFqZ0VS?=
 =?utf-8?B?MUd1bEEwTTNtOUNFVVdSazlDUGd3dEV1MUFBVENTc1JDTHhKUWplaTFxTFU1?=
 =?utf-8?B?Z1J3RG9ySWpNZzhJRWNUNHo5UldMTSsrNXNyM256c1YxVWJlQjR5NzE2MXdP?=
 =?utf-8?B?WWVXNGpyQWlxMWsxek42TVFyR3h1dW5tMVBTZjVMTXNQRWdLSFo2czQ4aXdN?=
 =?utf-8?B?SjIyWk1rYUhZRnEraExMSDFpczNBa3E1WFhpbC9YVFBsYXZJeFpoWWFnVVNa?=
 =?utf-8?B?UXh4T280UzVURlRXaEFsOGYwMlQ4M204a294OS9nYThyWjVUcXh4M1pwMGdt?=
 =?utf-8?B?VnhpeDhnMTdMQnJ3NFozYndPeWlhOXlzejFoQjd3ZlZ6NENLeGZaSEk3dmto?=
 =?utf-8?B?UitiUHJzazBFOFU1UGNYV1pHOUxNakN6VFhPOEhLRktGUVNuNFZ0bTlEMjhZ?=
 =?utf-8?B?Z1JLSERxTTlweTg3T0xBRE45OWVVQkpqMlJQUHFNcVJNYzliRko4MGVtYkdB?=
 =?utf-8?B?SmdQVlBadGwwd2plQ2V0dElZbkZvd2dreTY5ZHNKa0tWNGZVbkhUcHRhT09G?=
 =?utf-8?B?WVFzNkg1U2krL1ZUOXowU2JFbG5PZVJHdUlKUWhQdXUxSFloa3hBQU5jYUtF?=
 =?utf-8?B?K2JLZ0RsOHJWbEs0NVVtQXRaTVRJUE0rKytwU1VyWlVCNUk5VHRkeHErSGU4?=
 =?utf-8?B?K1hlOWVrVG9YemU0SDlWTVFoZFJ6RjA3VTRZMlM0QkdiRDlzS3FUc1gvU3Vx?=
 =?utf-8?B?UUovZzRaS3pQZ1FycHpmbjV0Vkx6TmljajN2OTBoYWE1MDh0MXg4Q3lzVmRZ?=
 =?utf-8?B?V0I5c2JnWDRDR05GY0lsdnlra05FVUlFNTlWdndlcmFRZGdWKzhkaXhQS3FT?=
 =?utf-8?B?c2ZPbVFSdXR3dytFeURzNVRnTkhvWW5ZTVY5THFMQTlhbGR1a0ZUUTJtZGZB?=
 =?utf-8?B?UTZ3RDMrSU1MNVpHL3JvMFdXYUpFWmFhdHV1NDViT2JOQWdmdjArT3UwUXlF?=
 =?utf-8?Q?FpJdc6O4MpjylIUSDSwAZGY=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a78010bb-50f7-47d2-8be2-08de33513f12
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:21:57.8337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsOqS5h95Sc+KHyCTuV0HjEkbBhgJRm9SjqKPaJEVgh4qS15hKhxw7NTlfQB99nYhd4mjFK7VtrqPMEzdrUGmCnZZe3Jwj95NM833j9iUiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7148
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 16/23] configs: stm32mp2: Enable LED_BOOT
 for stm32mp23_defconfig
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
