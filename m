Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF073CA451B
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 16:44:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63A4BC60468;
	Thu,  4 Dec 2025 15:44:49 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BBCDC5F1FC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 15:44:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fApCcXzb5qpuGokWw4IRJcf6iHHHDgT0k75AqUDrVpgD7Bb7jU1zPqGIb0oLTsITyG9ESpyGA0zHSJsAKDq5cOXI77X4utdb7JIaGY/umsshMnd+2M+aJsr4PRHF4QwShtNsyBYp3XriUevAMckmVboy3SS64RVC++3cpX5X7xUoagp/mWyAubpz+DHRK7fpW6XIa2Ob2YeIcU8JqmQYw3NwgwA7yfGrfdkvrzhQwrifRX4ioC7lfUAIRzFWRVrPKw1KhZI666twNBGISJ4e/3acU7qsgD/QzmQ8G6HG239R7B7m12pHOD3e0wA9gEnjVb94hfRdssjrrC71y+2IqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dl/THlkqPqHn5Z1gvoxtecv8EbVD81B0xfiBTFrBh8=;
 b=HFAYCVBvpi79/ZHrGipENi+Unfo3YwG+Eqhw42WTYXgBlzUikNjjuZXAyhIJxZKGjUwEivtTk4/4LhcdjAVi9RC37HBbJHM94swJ2wfCLEZBvOdEW/WkQR79Od/I77FZTPu+S5rGXP6gOPTmb/AXnLla3MAQpy3ss2F1AEXh+mmWEtauI7nqfJuK3rRrCDlMKjx92Yo9EafDBuzCibjC3oxosnhK1gu2CDoY4x5RqbN1RXAAJfztcQ01y2PKjZtoRC027P+usq4DdYz4X7Ff1osVYzin+gw9+RubnljQuhVauRmD/iDEZLmKX7osDf3CpsvzFh2HVOCoBXn4XjpOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dl/THlkqPqHn5Z1gvoxtecv8EbVD81B0xfiBTFrBh8=;
 b=eiJ6RNQ5tq9m+1PiTyVWr/J4lGuIG0Rj2SohsKXIOt7lOadpzIrTh2b7qJ66MS3VL6OoWOSI/n5xXCCA3cP+/zDSVwA9b95fuExZYP53bsGG7qiNO5yC9KdwCTLUj8djQaA1ZhRixZf/HCoPIPc26650ybnbnvtaLGR7vAAHqBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 15:44:47 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:44:47 +0000
Message-ID: <6c8725c2-cf51-4ff3-a91e-a5d1faf0375b@cherry.de>
Date: Thu, 4 Dec 2025 16:43:57 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-4-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-4-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBAPR04MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: fd734812-598e-4789-81a5-08de334c0d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzlnSEJzL2ZLb3dtU2V5Umh4VWVmY1ZaYlFqV25OdDNXSWYzbUJFVVBuNTht?=
 =?utf-8?B?U2lCbFZybFN3SGh4V3g4NjYxUUkzYTMwQ1VQWnVQSjN0WDF4dzVNaFg3R2Iw?=
 =?utf-8?B?Q2djRUNtUGF1VmlrV1N1cWxVYzVBbWMzSGw5Yyt3NkRqZVhWc2RnamI5SWM4?=
 =?utf-8?B?VCs5a2VMTzJPSDFvbndrckIyY0ZWd2ZGRUUwbUJYT2FqQUhzUWJpVGozY1Ra?=
 =?utf-8?B?TmVYdlUwMUx1T2ljRGYyWTZ6WEhVQnRuNGxmdWFQcUg0Y25vQTR1UE1LTDNh?=
 =?utf-8?B?V01sWjl1aGRwaVZLNXhMcEpMY1pZN0xFYnlBSmFVVVQvcG45cnYyajlXZmJK?=
 =?utf-8?B?OFhtQm1CL0lsVUhGOFluM2FIQ3dVcXgvVlgwa2d2MVF1cDZvYk9rbmk2MW16?=
 =?utf-8?B?ZHRPTnYzRWtoSHl3MnJOckhQRTV5MjB6NWZRNVJBNWUwRVZGTWhqQTBrUjFX?=
 =?utf-8?B?eldQY2M3Q2NCc1N5dVcyd1R2ajRoUHdmeHB0bzdicXRXLzJpdGpHWnV4SVYx?=
 =?utf-8?B?MDhaTS9ZemJnd3pqMkk5RlVUL0V3MGhyTTRrRW5BVDlxM0toNHZudmViSCtw?=
 =?utf-8?B?WkkvRUt6bTVaaEVLVDJlNHZwSDN3eTFwak4xaTN0MitWaTJQWS81S3ptdnFM?=
 =?utf-8?B?Q3BGaDFIbkNHRDIzcGJZcXdwMHdTaEUyR1ZnWHRJblFTanpSVndxT0dYb1N3?=
 =?utf-8?B?U05vRGRpdEk2WkNkZVhTU2thRFhrK0thOW1IamluUDZTQzhWT2twbG9yd2R4?=
 =?utf-8?B?WTA2M2EyZDVKRXY1c1pWZy9SbmR6b256RTJidTJ6RGVWRXFaUW05VDNRU09s?=
 =?utf-8?B?aEhDL1NYZVphQ00vYTR2cUZZNEl3QUY3bHh4YjZPYXY1Qi9FVkhJZXA4ZzNm?=
 =?utf-8?B?RjZ1Ujd6cnVJaHh0ak9leGdFQlFwYi9XWGF0QzJrcnJON1czNldYVE1qcnVa?=
 =?utf-8?B?MG5TbStyVXV3ckpodVkvY1cvQks2RXJSMmFJYWw3dG5od0dGUlpNQTlJekJr?=
 =?utf-8?B?NXo3cTVhY1FUcFN0dDhoTnpDK3c0ckJwYXlFTEIzSnIvUjg4aEhsekRxUXEy?=
 =?utf-8?B?NGptZzV0SHdjSHZydzNyczZsVVVLUlcvQ0MydkpSYnF6Qlc5bmFUcjBiTlcx?=
 =?utf-8?B?OC9ibkhwWW90OTZMSGkwdm5EeTVaeEVjWHA2Z296NUNpUUJMZS9zVGJyUXRI?=
 =?utf-8?B?bVhXQ1EwVWFPYUZXLzJFM2luWnRUa2xvUmNiYm0reDlXVU9WYTFudXk0NTZV?=
 =?utf-8?B?cU9odWZ6eXZvY0t5OHFMaXJTbEd5U0g2bi9VTmJPNm92dWRsc2hSOGgrT2Fo?=
 =?utf-8?B?bFFLSGw2WDcrMmdpemhKTGEvUjh3UU5aN3NpV3M4Z1FJcERueTZUZW5BVzhS?=
 =?utf-8?B?N3ArUzYwTzNiRkRjNjZqV3BEd2FBZWRhZkoyUHRyWUFaZDVXQlJpRlFudXJC?=
 =?utf-8?B?UFlkMTVmcWtNOVl5YWx3V1NvbElleWN6dHZvUE9GblM0V3BGSmQ0c3hKU09N?=
 =?utf-8?B?SUtrV2FYNjJUajlhakkxb3UraW15NkN2bkNVVFUzUTBsQU9ieFJvR3ZpMUtZ?=
 =?utf-8?B?dTBvNXpFY3NEc2FVbGpCUnVxVGp4VXJmNWY0UEdPZDNJc0M2d1hqREFpZHcw?=
 =?utf-8?B?YU5WU2hveEFQN0RQdkJyeDBnaXVTbWpqWEZOK3JIS3VkajdhaGtURlc1dFhZ?=
 =?utf-8?B?aDl2Tkt3U0JNa3JnWVB5blZPcEo4andweVhVOE1HSkhBd08xdjMwODBPVHBL?=
 =?utf-8?B?czNwYTdZVlMyMFNUZDJzSU1oY1Q1dmdXZUgvNjhnWEE5Q2trRTRaR2xsMWtK?=
 =?utf-8?B?b2F3NFFLbGM5dG84Z3NGRzgzMnA3OUh5NzBrMXpjSThpcm4zY25vTG5LcUh6?=
 =?utf-8?B?RzRxTWVuOE12cmt6dHRxSVppL1d1eXBzL1c0RDJxZmhNNGd3cEZEMXNzYUFM?=
 =?utf-8?Q?EpFgJbgNtdP5HhTCOfuuFhi3tch0x7O9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWNOaG1DV1ZsRnphR05IdWZQNFhmTTZXenQ4SVZWOThVbENMczMvWjZEYnp0?=
 =?utf-8?B?dFFHb3JrbC9tY1VGZTRXTU5VaUp6NXN5VVdWUFBJKzRMSEJtT05VMXYwRENY?=
 =?utf-8?B?K040ZlhCMm42d3FjVzBpREJTa0RLNXpnb05kMzBsTjlsL3FiaHpFRE9lSXRE?=
 =?utf-8?B?WnNwQWJoSkxrY2thb0t3SFdLNGdheVl3ZWVwQXg2S0E4amx2V0tBZ2FnMlg5?=
 =?utf-8?B?QjE3Q09lbkVoK3JvNmEvbEx0YjRsUjFsRmV3OEtWVmU4TXdWTi9iWTNaUU0z?=
 =?utf-8?B?cThDWk5vS0lkUCs3dHJ5VmpXNEJQVkJZN2hoUFB3MnNjL1p2Qmx0RThFOC8y?=
 =?utf-8?B?RXpMWGNOS1ZwQ0IxWTdRUjByTkpTMmJBT1A2dlRtQXlJRFFaQU1rRkowaGlx?=
 =?utf-8?B?ZVN0WCtUV01KZGI2YnVMQVJ4a3FEVjdxT1RWZ0c1TzRZbXJac3NTbnI4K2t2?=
 =?utf-8?B?djE1am9yaytYcWVXYnVVOHRVaW9oaHdWTG1LdVV5Z3lEdXBLenJDa1FxV1gy?=
 =?utf-8?B?NGxOS1U1NXRLRUtMK1JUbDArV2hILzF5YWVLcUhjaGdqWEUxdG1MWjE4b1dz?=
 =?utf-8?B?SkVSQ3RueHFEdDlFbkJ6a2dmVU1hbFFkMFJwRUJJbmF6dTFQczJTUnhtc0tx?=
 =?utf-8?B?ejdZeW53eXF0SW9Zb0VWbUY5SS9hbDZYUjgvR3lxSU9DTGo2aUpyVmI4dE94?=
 =?utf-8?B?T2IvZG14LzRldThqN0M4TWJ6WTdxWlRTZ3UxYTdCaGZGbjlCNlY5dnYyYmhF?=
 =?utf-8?B?SWFZUk5XT29tOXZ6ckJvVG1NNm1mUlJxbWI4MTVmQ0hzUGFxNlM1TElnUjBm?=
 =?utf-8?B?QXNUVlJHZ05IaFU2U1gyRStsWk1kR29GdlRiOHhHWkhoTExoRTJrYjhRL0E1?=
 =?utf-8?B?K1UrSTNMeVZ6Nk55aW0vUGsySlZiR0k3d3ZKTzM2SHJkVllldDZzcDBkcnAy?=
 =?utf-8?B?cFZVSUNYUlJCRHd4S2NLeGQ2L0VIc3V6ZXVlNnBESjdCcThWTFZ6WWoxdk5n?=
 =?utf-8?B?TmxRTTdpTGZEVVIzaUREUC9pZ2hvSkFNSmlxcTc1Vk1hd3FLTWR4MVZUWnJa?=
 =?utf-8?B?eFErRGJ3aEJjbTZtbHJjYW8rdHdjVis2clMyaUxjSy9yZGxyQUVHV0JVaHhX?=
 =?utf-8?B?cVZGblRTVUJ4N0dXRmh0Zy8vQ09FRDJ2YzQvU0owaHhSU21WL2VPdVR6cUxu?=
 =?utf-8?B?cUoycFFPV0tLMG53ZDJIQmNTaHA5RER2RTJsaEx4YThHS2dINTdReTBiUjVU?=
 =?utf-8?B?WUFmNm4zenhydy9DSmorRnNvQ1FaTXN6WWc3dG5GWVNUV0pON0FiQnR0OFlC?=
 =?utf-8?B?ZmFhY3Z4VWFPM0ZnMkc4d2dxdjlncE5zdndLaVJTdG5jY2hjYVU1VGxsQ2R1?=
 =?utf-8?B?TVFEZExkdVMwV0xUR3hIODF6ZXE0a2ZNUkFXVXRKYjJzcjNHK1V3dUhpemxX?=
 =?utf-8?B?UUFOT2RDczhWMEY3cFVvWkJpMWhjKzIxUWZ2NURzKzBjNXVyYUJOYi9xcmw2?=
 =?utf-8?B?UW13d1NQbjNucnhFcjF1Ri96S2FMSUlRSmZjU0VqMkIwSFUyZmpEeGdFTzlT?=
 =?utf-8?B?RU5WaFg2V05lTmZBNUxla3BYeDhIMDd5blFLUHZyaE5DVitVeUhFVjhnQkh3?=
 =?utf-8?B?ZUN3ZTRuNng0enJqMDVJeHZvSHhMWnkrT05kSGU4eWlJKzZwNS9nZ3hHejlH?=
 =?utf-8?B?L0J0TVVSaFJyQzd0SmZUek4vRFo1R2JOcTkyblZQZzZrNzJsLy9HbCt0ZTZi?=
 =?utf-8?B?eHBJRHVSbjBtVTBVZll1bTBXb0R3R1pFdXlWVGg2a2YvQ01YZE53VEtzMWls?=
 =?utf-8?B?MS9GdzdGYzBMb29OMmNMUFk2MTdGc3hYYlJxZnZnN1JYQWQwZDdEYkNxUXBx?=
 =?utf-8?B?cGgxSzMvSURBQVdiY3VlTXZYZlVjalM4bnNMVnlRbHZhN1VyR2ZWQklTTUZt?=
 =?utf-8?B?THZ2K3FiRUZCMytDSCtZNWM5bktwdDYzc3E0TEpWNUQwVFl2aU50SmxMVCtU?=
 =?utf-8?B?dE1mTFJaT0VXNmo0Wno1bmxDZTZlenNxV2JEWWVzS2M1cjVLd1M0NlUxV1VR?=
 =?utf-8?B?WUhrbCt3QXlTQ0xQYlBvd0hoaFdQWmZrVG9PaGpoZ1NBUW1hNHNUSit3ajU4?=
 =?utf-8?B?VjdLVk5wOGNOSGphQS9FaXczSWkzdXJZa3R2aWlQQ3M3N2x3N29VanRjeGhr?=
 =?utf-8?Q?QqniWJ/syBkQeGejuTxlLUU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fd734812-598e-4789-81a5-08de334c0d7c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:44:47.1241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ykXPnaHCfnQjY/kzmbcQrugZtE3qB2FpEa+iq8k38DE0HRzyTxJjgsoksLd+QWW1dMObkkD5KkWKPhx9r2bwp6NYdLot4+uqTppTauoh5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 03/23] board: st: Update LED management
	for stm32mp2
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
> Remove get_led() and setup_led() which became obsolete since
> led_boot_on() introduction. led_boot_on() is automatically called
> from board_r.c
> 
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
