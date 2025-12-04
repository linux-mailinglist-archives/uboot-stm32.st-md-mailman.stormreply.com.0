Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640DCA4568
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 16:50:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A678C60468;
	Thu,  4 Dec 2025 15:50:17 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011024.outbound.protection.outlook.com [52.101.65.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1DFAC5F1FC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 15:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwp5ou4Z4Bh4V5PD6yBGC0uykVlBIcUpoFAveJTcofi7MJCg7qtUYnZUUsET04jc2DYh6mnTokBbMY/IklcHGyR6txWQSKIRlSy4IhVlFfIx04+lh5tpFprS0RchsIB80i0IKPhM37rNoIpr2A73G8SVjk/ge+Dwbd27P4M07uraqn6XhRkqcJbQynucPPPw5f3KFB69nZzLIR7DtEEYuHCX2up53tpGs5cBnZne0+yfoVJCr7DKDEuTNr90G4kIFDXwyY74QUyxc38TY/F7MSamsq72kFltn0Nm/2sWY6dtgYAGvfNfGP247+0gj+mGepyhx4SpfjQLiXISCe72Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YgAvTQ7GX7FPNS7Q/BF4ZbEyKmZ/O9bgyJKMqwh8Ec=;
 b=XBUiXtHHZAS2TBnFiuy66GUSe3SFfqoNRRYOWdYBjys8yeLSCv6t+xuxqhGVuVXkW2r8RA8uwiIwUf5wVvdk49w9sr4zQV/1D2aCQOf5bFS/9D7rxNHr6Us4HQMnYTyQ1dTdHFV/JfO5TKE7/n7NstqcwjwMlJLLbkvZVi36YVvsTdw7l/qpTbIY0530swDB0j5V3qGiJ93pL3+fnlM2emyRYjC9CAL7/q7jhopdjFMRzId+bGSmDhYEzWaHrXhPc/a8eNaRUyigjjpu2HJ3r/HIyTvY6McF3RzLLeJaCsKk0wTr/oujRH2uX4wnI0grlDjA/1dZYp8YtoVOBlgjyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YgAvTQ7GX7FPNS7Q/BF4ZbEyKmZ/O9bgyJKMqwh8Ec=;
 b=S2EV7hb/2lyJhzMBGYbJDtJaG84tSziexHTGlXJtXOEMvh/hxBJ2afI6fDakljTVrBy1lmrR8ABSr11H7tfwd+tSRN3hcFuUppwlBkEH5saAhbVHujrL2moENuZKFGsPHhmOvyjI5hMFflrzRq3Y15lukj5j1icZAip/xk38vdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 15:50:13 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:50:13 +0000
Message-ID: <fc9341a2-6fd6-40f6-a877-c57582dea967@cherry.de>
Date: Thu, 4 Dec 2025 16:50:12 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-6-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-6-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA4PR04MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ebb7f8-a856-4808-97d0-08de334ccfd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RW1EckNibHVobFBBTDhJbnFpNnl3andRT2xrWVdWTUxKYjJvV3lPbEc2N3pF?=
 =?utf-8?B?MVJIMVFqUHhVQngwQVc3c0dqVUpOMU13T21rRW4vejFoTGxGMFovM0xqcGox?=
 =?utf-8?B?T1Y3c203Z2tBK0xjWWtSVFpLRFlUdUp6RFpTc296VE5QNmhlWTFwMjhxSmxM?=
 =?utf-8?B?RlFkRTRPMGZockRoQVJ6SUVQOUlEeEJUTmpzbFFnN29HUmNUanVFQkFLOWE4?=
 =?utf-8?B?ZmdiL3hFam9nV0svZnAzVVZ6WlhPc3NLRlM1YllPUzcxVkp5WE1WdEJLL3ZZ?=
 =?utf-8?B?bFZucjNiZnNJUHRpYkJXSlJjcVptOVJjcElrc3RmR1E2bkRIR2dBU0FEQnp3?=
 =?utf-8?B?NndWR0ZweTF2cGtlbTNlR0daY2FuTzk4RnlHaUhlTFE1ODIveDYxR2hzYnFx?=
 =?utf-8?B?a1hxV3I0cThBTExYSnREcy9DSUNSRVFRSXE4RGpIcnB3T1BFYVl4blQxK1hX?=
 =?utf-8?B?dVAwU3dESWJwb2N5YkVYOG1RUUNxUFdjQjFlR3Mvc1lrSHMvZmZrMmxibU5D?=
 =?utf-8?B?Z0lFNWVwNW1NNFJqcFkzMmVrZEhweWR5TUlNekRpUExIYUZjYndrMWRKanpa?=
 =?utf-8?B?ZFJSYXhhbWM0a0lqVXg1MTQ5b1BmNllrTXUxMXowM1ExY3F5ZTdjTmlMd1U5?=
 =?utf-8?B?c05KZStmR1cxcnpqdHNMZitxdjhxNlAyTVVpdnZBRGFqMFRtUVRoV2lsYWpC?=
 =?utf-8?B?SjhCeGJzWU1ISmUwRDVrTjlZMjdiMGxFNVgxTVJKL3h4MjhpUjV4aXowY25T?=
 =?utf-8?B?Z2c2UXQyRDNoZmZIOUVNZnFPVW5Cc2gybkJ2SjMxWklXVEZWQUVuckdTc2VZ?=
 =?utf-8?B?S2VnNXhrVlFnRi9BUC9nalRkeDVxNHRMSmFtTjRvSmJGVExMUXNFaDNWQ1Nt?=
 =?utf-8?B?SFJrSnROTXM2KzYrWVhZRzJYVFk4d2tHakxhU2tsc3MvOU5EQU5yQVlOV3Yy?=
 =?utf-8?B?N1lnZzg2M1hVNGZPTTh1bzNKeXVLaWlQMHRuTUdiRUhXSzcycCthYk52T1Fu?=
 =?utf-8?B?dFhKbm9nS2IvaXllV09YMk8vWXl3bTlmVFdORU9XZElrSW05K3Y2Ni96TC8v?=
 =?utf-8?B?RTY1RVB0Vm1KOFg3dEdVbHBlTEdPSmZSVUpqRkNQUXJlTVdpNGhMV044ZHNG?=
 =?utf-8?B?UFV5c1N3TEpxVXM1SkdYSWhkTDJZemgzY2F0ME1iY3Z3VFlYekRVelJ5RWw5?=
 =?utf-8?B?YnJVU0VJOWxSa0VibGUrem1PUGludHJKTDV6YTEwMWZiYU4yMlpUMDg4RHBv?=
 =?utf-8?B?SFRLMmxha0pWSWVzdjFmL05zaWJxd0VHQkZSMitIaXlOTmswZWx6MUlYeDhH?=
 =?utf-8?B?M2lRTXNkQ2ZIQ1lGblFObEZMdmExR2xMUXROTUNUNzZQZ2ZxeXFFK3Irb2tr?=
 =?utf-8?B?bS9rcU5LcVF1eSs1TDNacURlbmtpK3dSS01taGEydFpkcGFWRHhJdXlNYmlX?=
 =?utf-8?B?elNMaUkvcWxUbTJmL21tc09TOXk0YVFmbklta0psN25HczBXV2FPQ3RmQ05V?=
 =?utf-8?B?Yk1Yc3lzSzF3dWpaN09INTJqdEtqZWxHUmlCOEtZWFdSMHFFSTVMQnl1RzJV?=
 =?utf-8?B?MHVhZ2k3QWw1YXdzZUlFdHhmYkRUYUg3bzFHMnBUWEtHMzFSSlVYano0bzhL?=
 =?utf-8?B?di9PbU42d0xEeGU2L1d0UDFOUE1LUlZ5QktxbHZxWlRtTXRqb0ZSZkRVamtz?=
 =?utf-8?B?aWdBSXl0NEhsWGQ5RUhYNnM0WHlPMzIwRXVQM1JYU0JMU29sUGR4REszYWxR?=
 =?utf-8?B?MG10SjhIS3loYll2eDI0anRsWjhDbFRDeGlzZmNZd3Qvelh6WVNZWUlGSEJl?=
 =?utf-8?B?QXZIUXFsR3gvOUpNdExaMWtKVUhvMjJCREJ5eHdwNzdua2hyclBXVWF1T0dJ?=
 =?utf-8?B?TkVwMkJlQ09VUTJPNU1udUZ0R2ZhOUpJekNvTEJKVlVSbERVbXBzUkNNcDE4?=
 =?utf-8?Q?uh+dDs3NTo/iBTqNexrVHNL+nc1S8QWt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG93R1NhTnpBUnpGODlYd2VQZmZWTWVUNnZ3S2ZyWWtYUlQ3V2hNQ0FRNkU1?=
 =?utf-8?B?Y2hGazhKa0prVC82dGwyc0VDMzVMQnhDQnA4RkJaa2ozYWlVZFhwaFQwQXlM?=
 =?utf-8?B?MUpaZnlDOG9rb3VZWHc0SXc4ZVYrZ1dBSEhqV0lVT3pwUEp3dEhBZE9Tcmcr?=
 =?utf-8?B?ejBtZ2ZqUnVaa3BYUXZuRENqMDNYMlU3eDhhbUU0MGtWNmJIZ0E4SkVlWENl?=
 =?utf-8?B?UmcwVkVqYjVhZW5ZWExRZjVoZnNzNWVLTWpEL1NsYzQza2VvR3d0MVUreTZx?=
 =?utf-8?B?aHlKRVNNYlpRQ3pndkVseWZ6bXd1UzZwVlJ2V3BhYUNGRlZMdm9NdCs0OFFP?=
 =?utf-8?B?aGNTQlowUnZsdnBrQWsrS0J2ZTQ1V1pqYVk4M0c2V08zUTBIcWYyOTh5eCti?=
 =?utf-8?B?OE9zQ1lHeGxwZENQMzZaZzJtS1pkclloRlZUODFmWU5HNTRzRkZFMytNUncy?=
 =?utf-8?B?eFJtYmNKcXA1MlAxczlldnBiSEt3c3BSOVJSQm5KQnRSeHJlV001aWFlZkc0?=
 =?utf-8?B?LzhiTFFqUVlrdWxmangxY21qV0NMNGFjQTJQUU52My9kckxzNXowenlzOHJK?=
 =?utf-8?B?L3ZGbmFTMC9CMFFxTnBWNDk4bW1kUzFwdmNJUWhDU2FXK1ZoVXcrSUNhZG4z?=
 =?utf-8?B?b0hkM3IzSzRMeGVxcFJvZTJaZm4vSkowcFAvbkkyRDBMUkcxbDhnakxLdHVX?=
 =?utf-8?B?UlRveVN3QW82dm5ud3E3MzNmN1BRWHkrdDd2QUo3bGh3Y2h5aENTWGp0QVpU?=
 =?utf-8?B?V3pDVFNLS0lXSVU3b1NadHpsY0N3SytRQjA0SUMrRTFOTGlkMm9ITlF4TnZa?=
 =?utf-8?B?dVFxTjhuUnNWeHB1azR3Vm9NSTRlZU82YVVQbXh0VXpHRHdRVnJ5TmlPZnFh?=
 =?utf-8?B?bTlQclZUQlZqdTZBOWN0bWN3bUkyeXp6Z2tQTjlpUHl2c29PY1JCaTBXdHRT?=
 =?utf-8?B?N1lxSVJVSDl4L1g4REhUaExBbEpzZnZpTU9sRGlQWW01dDFocUtYN0xvekpX?=
 =?utf-8?B?a0xDeTFmWStTUnozclRPR1dIVkxYSkJ2YWlVQ1hYaDQyKzZWZmwrQkFPN1N1?=
 =?utf-8?B?MWJjU1d4bHNWVVJZdnJWVTBUSWNYUXNpbjN4eGRheGIzYzV6THpZUGJOVk1R?=
 =?utf-8?B?VWRyekNlcTV0UFpYYVlGMzJUMGgzbUNmT3FIb1RpRUxJaEE0OVhPUTZQbUFF?=
 =?utf-8?B?S1QrUElKd1ZVY3RsM1E0TExuUTJoRG9oaURkeGo0OWtKQjlsWDFHMWtCMWtn?=
 =?utf-8?B?UEFHRTY2bXl0RldNMmtSYXROT1VESVZmSGsxQmY3VjB5NHNTWFRNUGFNMHRl?=
 =?utf-8?B?WkY4YnVuV251N1ZSVkxrM2IrZzFSMzI4d25tcGhPc28zdmRsRGpMQWpMc0dk?=
 =?utf-8?B?djB2VE1UcjVJdUFrczFFay9TRmF5N1FvR1huNDZFN1ZiYUVUVnc5OTFzblJr?=
 =?utf-8?B?d042d2ovd1dtVVd2dTE1dEtBSmVYbXJhUHdlS1VvVmJ2WjRhL2dOTW92bzEr?=
 =?utf-8?B?LzZVRncwc2labExqQkhoKzh2WTdCb2dod1gydjZDQ0IvdXp2VFlhYWJBdms2?=
 =?utf-8?B?Vmg0OUVJQnMvTFdrd1JvY2lqaUNCd0NQS0hLbkhxNEc1OTNSRDgvMUl0TFNt?=
 =?utf-8?B?YUs4Z2dNaHVoblJORzhDQkRzbnFtMkNGUVhSZ3FaUld2dGVjL0pUNU5wV1JK?=
 =?utf-8?B?bVJvV2ROVWhXNGZBRWNTa3oyWTVvS1NpTEtXRVJMMGFLVVNDMWE5R2ozMTdw?=
 =?utf-8?B?OUZZMzBnRlYxbFowY1FWeW1NNGwzTW5OVTA5SlYza2tsQ0UrUDVJN0V4SFNM?=
 =?utf-8?B?c3E1Y0FSRCtFdThjTEJGbU0xNWV6ZE9UbDlZYjBBdEs1SmdjUnBSVFBLZUFB?=
 =?utf-8?B?eEM5NUllZnJhNk12S1J3WUo5VFQ4UGFTV3MwbU5zZkpaTkl2QVk1cksvU0h2?=
 =?utf-8?B?eHg4TmlFWjIzbGEwZTNGQU9vaGJuSTlvWlRQOWFRQzRhQWFadjJNdnJFL2xY?=
 =?utf-8?B?dTFSNnZaUDQzeC91czZkbll3Q0g3RHRxd1RvY09TV2w3ZmVXMHVFYUlMYUxz?=
 =?utf-8?B?WFQrMGhrZUpaM0xXMGlCK1hwUUdzbFFYQXN4b0NGZ1EvNk9RUG9kTmh0dm9K?=
 =?utf-8?B?bVhsWnEzK0d1V3BkOG9NTnNDN3BVSE5ZcC9WZkJoK1k2Unl2dk9XVWNIR2s2?=
 =?utf-8?Q?xTeBFYAj65SDujPkhDZnO1c=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ebb7f8-a856-4808-97d0-08de334ccfd5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:50:13.2091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yB9AuEbsD4WU0nuNeCFaAZ2Y1W1gTlt+8c1mPvxkSUSYBci1vxPFI+y3CUb0h3sTw207ubEOZRlyYtJl7cpC23Ur9DShg3qrtFEp0/DYL1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 05/23] configs: stm32: Enable LED config
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

Typo in the commit title, should be stm32f469-disco instead of 
stm32f429-disco.

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
