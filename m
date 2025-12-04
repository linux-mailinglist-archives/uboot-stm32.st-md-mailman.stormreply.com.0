Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0FACA4685
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4E9AC628D0;
	Thu,  4 Dec 2025 16:08:30 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011048.outbound.protection.outlook.com
 [40.107.130.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA140C628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rU01c6fPP+Oj5fHJLPoSAZso97liMx72oZRzlLE3ieDPYY/OMlEy0Dx1JWGvLBFTKov3lTWK+0Fj3xALmESXpfdo5ojx5eBwHPZ5B4yQ6UONjXYO1X9hcU0YOQtTt58gjXCQSN3SkPHZjGHDCcIy0Xt1qy/bnh0XxDvs6T2K6MQg5HZp1JWNQT3UvDrLoWXiMQovcFqeEws5Iyn5+km91lYd/yFME0NyzP2C0QRBsJD0PtEFpLh8b+Pfae2HX7/3wf6bVDsK257MmMU74r7OSs+m93AYYW5gkOavspEm/qVdrlw1f6sEId60RRPMpdo1z5WA+svcyBOx+8r5/WwsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnJtRSUDSDgITl8nj8JuDcBYDKqczRB33GyxkJpNCOs=;
 b=uXeFbNkmriKHWn8f8XE/SKdKQowXFIrs/OLSjX20n8vHjh3Iv9tx9lh3dy98Q1DX0EmZiVFr3hEN2/nsl2qNtuh1q0hx04wTLYDEx6wxs1r0YmwjLMdqvb9bsE8KxnFAxwidzwquwWghcxRw3yRb5ubkZC5e6ZPYwvM0xxTj3oRC/DkfAc1F0zURIdv7Q9q+t6oNozv17zps8fA++WZ3IvFB7UQ6c+xobLFemPiOJzdDeLCrhZu4IUaORgIKLDoR/MvHk9kGuGOHVThXsn9H/c2DUfV52qYIrV11K9mXaf/iQ66Izs5ehoaPVqmbKtaDbc4+bjLZjzn+DAQscWhAvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnJtRSUDSDgITl8nj8JuDcBYDKqczRB33GyxkJpNCOs=;
 b=BtpVkmsBLZlIPSJDQZz7KMDE+MQjPWybAtwD7ld7y3HiJDtbtSIo9V2Bc1Ku7YqG0SUphq4Pegh5GbzSL4Uub/9HfBYxMpJJPThrpbzpJbv4mOLiXvlmrdY0BjkCtuYKAluaR00wGbXJ0zcRJmDCCdEJSZCtFseoJUVzXnQt9N4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 16:08:27 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:08:27 +0000
Message-ID: <658aa720-395d-40f4-aa5f-087eb0f2e70f@cherry.de>
Date: Thu, 4 Dec 2025 17:08:14 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-12-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-12-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM0PR04MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6fc3e4-9e63-43d1-a006-08de334f5bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1c5WjBZdEE2UmZBWVQzRWtXTG1xNWxNaXFGYWpxYVl3UUlQTkpyeDdNQVN2?=
 =?utf-8?B?bDZ2WUFBR2xpSzBEdDB3NHJDeWdLdmNTOUZaYWkvYzVDeUk1RnBkbmFCVThj?=
 =?utf-8?B?UkxSczg2bkdPaUFDQkdIcFlad25SY3l1VmNmaktvYnloNllGaG5JNUxmdXZY?=
 =?utf-8?B?eko0NWhKbUFSOEZ3aURWeWFEMytsRmVmeUNYUVVzdHBvaGJnck1hM3JUQnBC?=
 =?utf-8?B?cnIyTUVsVjJ1VUNCODJRM1NrUE9rYzZDWGZ4OVhnYjI5Y0JVY1NsdHZQV01K?=
 =?utf-8?B?a1N6NExmRVlMTmVEYUcrdXpUSjVxZk1DMnBxMDZIOWpsQTVwblpsV1pkU1hS?=
 =?utf-8?B?RmJZL2QrcnpMejF2NmFGSU1TZnQ1K3BTekgyNE9RcFYzQzBiSnlJQjBrNDBa?=
 =?utf-8?B?dklneU9VRnE2djY4OGptY2syYUxqY0tnUVlPZGNHVXo2MWtuYmtoekRKYlIx?=
 =?utf-8?B?aTNYU1h5R1Q5cXFCZ3QwdzhPVlFEM3hmSWVmWXN6TDZ6Q1dxTlg0OWNsK3V1?=
 =?utf-8?B?SGRaN2tQa0l2QUxUNXRNUkpocnBOY2doamVIcmFFK3Y3VS94cFgydjl3SVNa?=
 =?utf-8?B?ZkhvbjRieXpBNWJ2MnBiVXZVMkcvZHhKWFNacXNpeFF0OE80a1NwWGhiYmlU?=
 =?utf-8?B?azlOY0JtZXdSYkhtYkJ0NVhsbmt1V0oxZDR0RHJ0aW1kMUJaZm5DN1liL0xC?=
 =?utf-8?B?Sm80OTBkRjNMam5jaE1HOWNvb0xUZTlPYjljN1YwSG1QSFFFUG5LY2dsOUUz?=
 =?utf-8?B?RUdJRmFBdTZFNWJYMnduUHZ4RkVuWlVUMEl5RGpyemNiUDZ4MHlqVlluK2xP?=
 =?utf-8?B?VENLN2ZDUU11Z1doRjN1aE1YY21iMGpXSDBhMS9CQW9nNUhEcTJNU0ZuWlhz?=
 =?utf-8?B?OTgrUlBMYlpxUWlSTWJnakJaRG9mL1haVDFBa0diNHRpNHpWT01acC8yZlQ2?=
 =?utf-8?B?QVM0OUFDUURFTnFQTElsajA4bEtwdkZLVnF0V0VaMzBEb3lYd040VDRKNGZm?=
 =?utf-8?B?NnVNUlRlbWQyQTcxdU1seld3WVBUVnZUZERXQkJreE1kMlRVTm0rbjVSZFFa?=
 =?utf-8?B?ZjZVdXJXa0xwcGJtNUlxck5pVjQ5cW5abUt5RFlDMHdlajA4Vkl5bUZMdGJ4?=
 =?utf-8?B?OXZwSTR2ZDhIeW9UZmI2bUlzMDI4Wjh5a1YwclM1YnVDT0RSREVxeW00Tk5x?=
 =?utf-8?B?dDA3ZEQybWhkSnZSMVVoWFo3OEpNK01oTHBpY0tmRDVQM1RYTHllNnI3enZ6?=
 =?utf-8?B?UDdHNXBETVV3bEJrMVoyeS9DaDlKS3lJYzAvZENCUk1MTmFoajl1Wm1hdDhr?=
 =?utf-8?B?OFc0WDZvZUhXd3Q0NGFhMi9mQ3N6djFQN1ZUN0tiQkFkWWNQcTkyU0I1dXB6?=
 =?utf-8?B?OTZTK1lMTVZ2L0lROUtKaWVQKyttMjZGZk11TlpSVEdIVVRDZ1FOaTFqYjZh?=
 =?utf-8?B?ZFl3ZmVOaTZpNXl3VEtHQmZqRmhiVDgvVzVIVXJZSkFnTmNYM1lOS1V5UDFq?=
 =?utf-8?B?eU92Y0x5NHBlQ1o0OUxvamhqZ1JaWGdFV29qb1htcEltaUVRTUtnL09kc0xt?=
 =?utf-8?B?bjVsT2hWR3IyY0ltdmg5TEI1MlpNOTFtNVFOUmIzVmJVbDhDNmYwL3N0VTBr?=
 =?utf-8?B?b1haOUIwaU9LcWdzUTJXZjJwQVJtLzcyYXFqck1mYmRsczlmY3VTVGR0QU9M?=
 =?utf-8?B?WkNGeE96cm1pODNDY01uR1ZFa0ZXMkpzQkhUcFB1ejJUMm5tclpHWVBYTmV0?=
 =?utf-8?B?cXgwYjYwZ2pndHRDd1QzME9UQkdENkRxNUJxT2FuVndBUzU0dWlLM3Z1QlRy?=
 =?utf-8?B?WUdndGVwRGduREF5d01rSmlNYWlsd1FQM044REpvWlpTT1pUYWtzM05zMVA0?=
 =?utf-8?B?TXIwUlo4U3J3TXRya2dWWEJNQ3BDU0JYaFpxbWoxVm1LS1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTJOZ2xGQzVaRkZWb1FaRXI1QzFmRy9sRElkVXVmS0VsSTgzUkxsMEJjTGwy?=
 =?utf-8?B?VHBzY2RZWklUNi96bktqam5BaFAyeGJyZjJ4KzI1TlRXZDRFb0cydFhlZExv?=
 =?utf-8?B?QUJRSnY4blNyZFJwSC9SNWYxeEdqamxZaThSSGxQRmlnS3lGRG16aEVHNXNt?=
 =?utf-8?B?dkhwSEJXNXJDSDEvcFIzYW5uYkRyVVIvUWJyMFNMR3laRkxSMSs2eGNVUTlE?=
 =?utf-8?B?QUZzdTF4VVl2R0JTRXQrWkdZU1JST01MdTlaM2pGNklTYjZkK2tLUkNlKzlH?=
 =?utf-8?B?dFpSZTh3MUtQN3pBdGxIVG1BTGtqT3NxeUd2dnM5WUxEVnNWR1EyeFlSYUdX?=
 =?utf-8?B?eXdURzBuZTRtTmppT2ZkM1VnSnBWRnFJQ3R3ckVkZnNieUlrQnNCQ1NaNmJz?=
 =?utf-8?B?LzhwenRlRTFrT0IwQnJOQjJoL21WODcrUHJZSVFTa3RYS21pYVdCRS9NMVBx?=
 =?utf-8?B?dUxYeUFNV3Fxd1A5TEVZbFRXYzMwVCtpSlZmT3g2SS90VjdSRFNuWndiS0lp?=
 =?utf-8?B?cFFpU2hWVGp0MGZYY1luVkNDZUhuUE41TlgxSzhTVDdKRU9WWS9mQ2pPaE9s?=
 =?utf-8?B?TWU0cEFuK1ZyYThvWlJNcVptVXFrYnlhdFpjZ0ZiV1F0UWNCNFFON1RmVEpM?=
 =?utf-8?B?YUdBLzhqZCtYSko5OWlQS0dVbThvTVVtK0t6ZWRkNUtTQlF0V0VsQ3dOa09P?=
 =?utf-8?B?ai9KSmIwdFBjWGNyYVNlR3dJcWEwZ0ZkbzZPU2NXTFN0ZE5ITUhUMENqWVpy?=
 =?utf-8?B?a0N4azAzZnV5ampjeFFOekVKVHB5OGtEK214OHJOakFQQ09EOGxhRVpVRFpp?=
 =?utf-8?B?UXJHSUZDRTZGakF2eExnbGpsQk1QVUpTQUZHWEYzNjFBd0VwclpZR2VJMnQ4?=
 =?utf-8?B?L2RqR3ZibHpoRjQvcHYzRUt4cGV1UU5xY2p0VG9ERFNjenV6cU9yY0U5dzBl?=
 =?utf-8?B?REUzNndQWmdqZXRpb09KK1IxVHFpdHJTMUUxQ2ZrV0lDYUJiQkc1MHVrQVkr?=
 =?utf-8?B?WitwZjVLRFhQT25kRzh5ZTVSMUplajBpaFlPclZISEdYY3ROcURiU08vY29K?=
 =?utf-8?B?YlR0Q25TcEplblpNdmVjdG8va3pWQURBTXVtQ0U2eGNsWStPdnhpcWVnS0gx?=
 =?utf-8?B?Uk52TlJZb0dzbDNiS2w1UFV1bXBHSnJpb0x3anQzUlkrNWFscGd3anQzQy9w?=
 =?utf-8?B?Tmk0Qy9hNkt6Mk82aUs5SHNwRUttejN6Q1hHYURQU1o2WkJKcEw4eEVKcERZ?=
 =?utf-8?B?UEFGckE5amwxakxGZ1pDamYrZXJJS0xLVDdsa2lUbnd3bUlpYis2bmU2d21H?=
 =?utf-8?B?dTdPQ0J4VFA4akZnSDV0b3l6UFRFdkdhMlN4QUd6WHhJRUg0NXZoUlNGUktB?=
 =?utf-8?B?Z201eHZ5MTJtNURjM2l2eC9XRFIvemsrMHpSc3BhMG1SUlZYVU1IVEd4SWp2?=
 =?utf-8?B?anVPRUtoc1dIcVZHbFEvQVh2MnJaT050ZWszMGY0SGREWncrd0haMjZHQTg0?=
 =?utf-8?B?ckJsVUpKU0NFanZkYnRuVUdCVDZWb0pieExnSVp2QjR0aE5taUVaR3lCQmVq?=
 =?utf-8?B?Nmcza01yT0xNUWxnZlcxNThzYzI0VTZPNTM0Z0VpdER4cjZRUGYvQjJRZ0p6?=
 =?utf-8?B?NElGaTNTQlQ0SGlIbFZlclpSbnZXUHJKVXhES2tUc3lsMWxYS0FzSkR4bTdN?=
 =?utf-8?B?emJzeHcwa3FnRUs0aS9qZmJDYVFDa3dtUTlCNDNPQS9YekJ0R3pWSndvaWFx?=
 =?utf-8?B?K1pRZFo5MzBYR2ZzQTh1WW5POW1YU2RHWXl6eTRscFNYM0xLeHZPRmVtTm9P?=
 =?utf-8?B?QUpVSnYzRWwwTDd2a2lTd0V2M29HY1VwU2YyRXc0MGQ3YW9ObWFDcDJRbTlS?=
 =?utf-8?B?UDJ5WVFsTTE2ZE1hQ3lUSGhQOE9Tc3NvMFp5YXh0ZjBkRlJocFE4MndXYnFR?=
 =?utf-8?B?dVZBZUozOW42eVFrSERWQ0w0enFteEczNUIxRHM0bHdRalFBZG5mWXJJL0xI?=
 =?utf-8?B?dU56NzAwaDRWQWYwQzhqQ2FLcmtqNTNCSEp6dWt2STNSc24yYUNWQlJkcHFX?=
 =?utf-8?B?eDA3UUZXK3ZqSG1NSUk2TVF2cytYc3hTdGVtYW1GT2J2M0FoeW9KQ2ZBemtP?=
 =?utf-8?B?ZHJHemVKSEVPMWZjUEZZQ3VHRU1tdTUrRDgwcndmcGdTRUZyVG5zS3QwQTgr?=
 =?utf-8?Q?3w1cJN5Wa3HqmLF/SnGLaGY=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6fc3e4-9e63-43d1-a006-08de334f5bb9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:08:26.9109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hk2uQL/YmLPwiT9v9ClTU+6wMFvTlLTscb3oikctWt5Lr71vN74NNc9Bz/oDm9Pf9cNGBd83XeW8BYw2PyqISJqJ8oVwXmSoEYRt7hXXVT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 11/23] configs: stm32mp13: Enable LED_BOOT
 for stm32mp13_defconfig
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

Note that the first BOOTP packet will turn off the boot LED, c.f. 
https://elixir.bootlin.com/u-boot/v2025.10/source/net/bootp.c#L392 which 
will be switched over to the new API, c.f. 
https://lore.kernel.org/u-boot/20251120-legacy-led-removal-v1-1-369d44338358@cherry.de/

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
