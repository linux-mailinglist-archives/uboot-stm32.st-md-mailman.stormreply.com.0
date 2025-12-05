Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3506CA73D0
	for <lists+uboot-stm32@lfdr.de>; Fri, 05 Dec 2025 11:47:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FFC9C628DA;
	Fri,  5 Dec 2025 10:47:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05590C628D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 10:47:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vjle2MWJFRTs4tdBU/Bo5/Aa+bxmCLq+FCEu/PE3LeiXjemFqgRlmfiTM4zRh71hvvdfiNDotiooEAT9E+HVi4U0KNdDVaXVUrhqMd0pRTZEP+cozKJrpn0ua2QILOU6KA0YJV4jBfEkTqQeHiqBqnwCTgib4+I9oZKOBjcFQKh3Wtr/phsyg340qrXM05udQGEyoBgy4px0/Dc8QD9EpCQgKZjMX5wIzr0NdgGvWUumJBTqGOgWMppfck29a5x+W7wHXNlOZNaEB+qc8GjYPp7++7OBgzX6DtL2qDK6WDMi2BGX9jG2XUfcaBLYigT9CEX3klFAHlkUhTuR/+MI5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+2PYkQ0XXv9Ep2ZdxigPJ1YWx0T+her2h5MbQZDFoA=;
 b=XZ/2lAKBnRTz2wX+ai7YtnPc+N8B0MAa4tfaHZS+tWIUQWfjoF/Cj9q40IQlXTtS4BraBOHLzeeFIRKdaqMmhdM1gtwcdHwMEIX17iXjSaddourGIu9bw7D6b/SttyeCgSxzwpxY334+o43cGWuUkLM3rV7KfqJjz3yshr1Gj/96y/E2EQzidqgUM3x8lesnD5abW2yJBbzx2zkSsosbbc1FPqmQEB1eFmYTkhjAegbNgcrjQWLCSxgSt1H1QuScLrn0/MbmJyn57JVRZ/3U4mZw9ECxW6ZNVOtFxYQO0LIc32zCCE1ECh3bDEkZQAAq4xTjLwd5Ztz1wdKB/eRgYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+2PYkQ0XXv9Ep2ZdxigPJ1YWx0T+her2h5MbQZDFoA=;
 b=BgwiXntZB9plRcCXl2sHpXP6fE97kJ1/XXqu62Ay5HtXBJL4yp8AoLtsc5mJPoxRUjEGVhPlO8pp86UkFeDvelaGMox0M4ubyHXG3aaY1JsK87IP9nMqBrgFq0gcToPZewFhaarBDC4Oj+pDLUC3aUVUrYQqdncrqgEFtSiFXN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB8137.eurprd04.prod.outlook.com (2603:10a6:10:244::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 10:47:14 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 10:47:14 +0000
Message-ID: <57068149-e026-48cc-acfd-eb1097cf90fe@cherry.de>
Date: Fri, 5 Dec 2025 11:47:13 +0100
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-18-patrice.chotard@foss.st.com>
 <07a85afa-dccf-48e2-86ac-5fa91477806e@cherry.de>
 <9fd0a6aa-8201-4202-a1cd-ec27bc24c59b@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <9fd0a6aa-8201-4202-a1cd-ec27bc24c59b@foss.st.com>
X-ClientProxiedBy: WA2P291CA0028.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::23) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1885df-604c-4d93-2004-08de33eba708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TE40RFBraWtGRnBaOVhIdGtvbkcvcHNhbWpadmVnVXlveDlQWStZVks4UlVN?=
 =?utf-8?B?V3Zja3psVVBHRk4vUmw1VjMxaWJrVmgzWVJYSkYxTHlJVjhJR2tIVEFJQldM?=
 =?utf-8?B?UjZValN4TllFdUVadm9HejR5Y0hLQWdBSWxNb0RFc2xCZmNQUjBneUUwaHRs?=
 =?utf-8?B?bzdUNmRCL1p0NFQwK1BreHE2dmhqZGxadTBxMHhuYkEzWlBydjZ4MWYrMmxL?=
 =?utf-8?B?MFhKQWJXL2dPT083T0dHNlRrOVFGZXo3RlJ2UnMwM0pkSmF6MXNVbXR1c1VK?=
 =?utf-8?B?SXpTN3RMUXhnQjJTMHdqNy9RelJQWExHc3ZCWGVrcTJxSHNoMm1JdUhNbmdD?=
 =?utf-8?B?Q1ZVOXpWdUk1ZXVOVEtHUnp0S1c3NXdSWFBScnZKU3Z2ZnRjdUtlRXcxcnJX?=
 =?utf-8?B?Z0NWSzJFOFMxWXRuOWJpYnNqTm5SR20xVnFtUy85clkxVkxnSHBrcU1VZkE1?=
 =?utf-8?B?U1RxNEY4ZDczMDNiSG9PNDI1dHpDUU8rTGxtNk5vTi9lSUZiTlljSE1Vakts?=
 =?utf-8?B?Q2paSmlSZ0RRSUhvaHJDYjRCNVFPODNMOHU5OE44U0h3bFVmZWNSQW5STmV3?=
 =?utf-8?B?TVQxU1FvL3hta3dOUEVQNGRJcXJxRmJpK00wZ0hMbmRSeGVPcStNRmExaGN5?=
 =?utf-8?B?OXdVanZueGhnck83MWZwdVpXbnQ3WHloYUJhajJOMEp6bVVzbzZrM2dnM0JZ?=
 =?utf-8?B?SzJYMXlYb3hib1pMa3E3RDI5TGhMQjRCMGpwTWgzbHpLeXdaaThLTjdYZmVX?=
 =?utf-8?B?S2VSaTQxS1F3V2ladkUvZFd3UG50cEt6MDVuUlBlNlNwODloQnN4ay93MkdV?=
 =?utf-8?B?QnYvWDF3WWhtckxVSk5wYnRUSlZRZ2RIOG5XMGxTTU9mQ3hLQXNHYXRQTjh1?=
 =?utf-8?B?OEJIRDRFVFZydENIU2ZHL0w3S2RRd2ZoOXlaeVdDR0ltUCt4b28rSVNuM0dU?=
 =?utf-8?B?YVllRnV3TTR0K2QzOXhibFY2WjRweHFCZWVaTUF6aXVSOXd0TGlQZzZDeGhY?=
 =?utf-8?B?M0dVc3puMGRxeE8vTTJmaHdKbVhYZVlEanpIS2lXT1NUNklwdHlyRUplMWJw?=
 =?utf-8?B?cmk3Tjl1dHF3dGdvemFMY1hucEg1YmhmT3QvOUwvdUVyRXRvVWxuVklGRDBy?=
 =?utf-8?B?c3YwQ3NhWHVpNXR5b25DSTJxbVA2dzhZdjlQME1sU292b2dHU1JjUkYwcW8z?=
 =?utf-8?B?a3JQb25KUVhNWW9wRDlWTzJpS1dKZmVqdHlxY0w3aHN5bG1XejkrL3FNTXJI?=
 =?utf-8?B?VldFa0lYZHAzM1VLQjN2YktKa01mdGlkeGtnRlpkZjU1MlFIYmtxelJ1MXpP?=
 =?utf-8?B?K1lhbzRJRWFqYWx5Wk9mSmpSaVB5ZHZOaXM4OEp5N0NHYTV6L1ppSjNpV0M5?=
 =?utf-8?B?b2dITUJVcHlTU0xvTlZacjlQUVAxSzNVSlpkMmcxY0FlTmxUVUE4RUErUWlD?=
 =?utf-8?B?L2VxaUhsYXVrQ0tWeWhmY3FnWDN2NkMzRnNWMmtQcnVpdkVFYjBxS1NPbWZm?=
 =?utf-8?B?am1QRVZacllIWm9Mc0pSQjZHZ0YrV2FMNlF5NGFVRDY1MXlBWlU4V2N3TEhI?=
 =?utf-8?B?NStGVnBJQTlJNmc1MGFhVDNaV0dkMG1idVc4Y3JSWGpGN3Nwak1FSW94Rjg5?=
 =?utf-8?B?ZCs1Q3ppb3FxUEpVYUUyYUhDZWhBMXQzTXNmSFo0SDk3eHdSMDM2K0dSQkVU?=
 =?utf-8?B?Q1lJcVZXaVZMcEZNb3lwejBrQWF3NmVtek5yVjNmeWRZNUpKbVRzMDdFMHJ0?=
 =?utf-8?B?Zk8vWW1nNGlDRTJkNEcvZXZqYy9lSWlBRXNFVytuWTZaVzVaTDRucThjY1ZD?=
 =?utf-8?B?RFFWWFB2RFdicm9HdEJ0dUlpSGtBNTFVZUpMQlhzTjlESUo0MCtUWnZmbGpu?=
 =?utf-8?B?ZnNCckNlOWlxc2xZTEdlUmRBeEY3V2x6V1lPMHVlV29QZGhpeGJUamtsLzZ2?=
 =?utf-8?Q?xLyuGFW+4ohN0PZqMep0MmHo9cN1ZHRQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXB5NldaSmZoeSs4aDlESlJFUG80c1VvbzhmUHRmUFVWVnQvc015c0thSlZ1?=
 =?utf-8?B?Y08yd0U0UE0zZDduN1hhemVCdjRKaUJrd2UwOVhTQTZpbXpNd0JLMjBQcDAv?=
 =?utf-8?B?NHNKRVZ0TElDTFlDVUJyL245Yjc5bTFBQnZPS0JqRkFEMHp0WlBJNDVNTDhh?=
 =?utf-8?B?UWVsSzlDdDJ0Uk9acmpsN3FNWXV5d3pHd0FDelRCN3VlTmRJanNMRjAyZXZE?=
 =?utf-8?B?S1JBN21LYjJEc3YyelJMeDRMemtlenRPY0RhWGE5a3hTbUp3T29ySk4rc2dv?=
 =?utf-8?B?VE40a0czY1BLQ2tndkRGallZeDhnOFNQTWtNajNlajVuSUVGMWFRVERua2dn?=
 =?utf-8?B?eVV3NHJ6WDMxa2VLZ1BrNUxuUjNlcWgrYUFFZlRTNWNMUThpN1pqWmlZcnU5?=
 =?utf-8?B?YU9MMzFKZUxjYkliRFkxQ2NPUktjRFVwTGQ0Z0ZYbm5jNzBZQ0oya3ZudDZq?=
 =?utf-8?B?c3VDL0JBbi9vVndoSXZ6cmJ0UzNNaEZkdlQxZXE3RGNKZlNOUnBpbE1FTkZD?=
 =?utf-8?B?djBYYkYxd3JBTnI0SVl6VkhzWVBNRGtQNk1lWnpZbDRsOTI2cEovdFZnNXpZ?=
 =?utf-8?B?MjZKdUxtai9vdWRsZjVSMXhPODNMRXMxQmdnTEg5djNmWVVHZXkxeUhuaEJx?=
 =?utf-8?B?V3ZtSEppVm11T29FbVhlZWR0cldrOVRBUytoQlBzbnV5Vm5pNTZzeU9nTjJV?=
 =?utf-8?B?M2xXeTIrMFEwbGE2c1lMK29Dby9yWDloUE5JaXZ6QjJZak81RDlDQWJVWnlV?=
 =?utf-8?B?QllVVnpHd0hWYVErUU1UNy9xYjFGYmtGeUl0cWlwaklGbjZLa2k0VGR3eDEy?=
 =?utf-8?B?L3NaS0VBZHFia2xWbHNTb25nd2RmS2FTdFZEVnhCTEFLK0RjYm5VNHdxWUV6?=
 =?utf-8?B?K1ZkQitxMUhYRGEyTEI0c1kyN3RNdUwrMWlDMGIvT0R5NFVYNE5DU3dvbVhy?=
 =?utf-8?B?Z2Q5WUdFYWRueXZMeGxMVm5iU2V1WWZpNFlrblBDVlUybjBIa0FsRjExS1J2?=
 =?utf-8?B?K2lDQUQ5dk81SlNwdFV4U0hyLy9FOThRMUoyR3JpdVU4NU1IMmRKN0tLR3lM?=
 =?utf-8?B?enU2aHh0dFFjSEJ5MWlMOGNqVG5mTGZDQXJKSFFobnZ4TWZNSW80UDBrb0s1?=
 =?utf-8?B?YkhlNEZVNFEyY3A3ZHJlajZnNmV3cDkrRHJPOHJhRUhiL3ZBV3NMQ0tEUndB?=
 =?utf-8?B?VTlvOGlpMVJMdEZuYTJKREJwZmdSWGsyVW5GOEhrVXBRTEtndkU2N3dPc1A4?=
 =?utf-8?B?V2laSU43Z1dONk42K1o2aFVUQlpuYU5BVUkzTmloOW5KN0c0U2ZOemFtV01M?=
 =?utf-8?B?Y2l4N254TWptMTUwUUVPejlyT3NaZGMvb2kyUm5JK3drZ2JYdnZySVBGd0xS?=
 =?utf-8?B?NXdTblZpQm0xSEhYU1FLaldDd2hBTy9zRlBIMjVOMFJ6N25mcDhFNGZ5RUs5?=
 =?utf-8?B?Qlc0RU5sc2ZiWXVhN3lUS3hXRjZKRHF6TlJ0aktFbUxEZTlGWlJnMGpIRy92?=
 =?utf-8?B?K0ZIQVdvc3hYL0VoK0w1RDVrQVVyQWNEQUYybzNkVnQ5RmdQTDU4dEpsZXJv?=
 =?utf-8?B?VEkwQkx0MzJSTUpaU3ZYM1p5SkZlM05DdzgwcldzMFBRbFkrTmtaUWMrRVBs?=
 =?utf-8?B?Nm92Skl0MlI1b09NS3podTYvdnRlL0VPUzhrempobGdQM2pHWlVIanJDV1pC?=
 =?utf-8?B?T1FxWHp1SDF6OEl2S2ZKMVdkbHBHRkEvczhva1E2cUdYcExtYnRBSC9NR0xK?=
 =?utf-8?B?N0o0aDZHL3ZhMFl1OWpyOE9MTVFXb2xjWG5hNHI2VHUrZmlyOTRJWDBvV1ZB?=
 =?utf-8?B?OUo1SDFVM2w1YVhlS2FIZWNTaGlJbVo5NThqYWM3WU12N1JaTTBuSGd0eS83?=
 =?utf-8?B?cHNMZkRGaGZ4UEdBVm4yZ0dHYmxlWDljOXV1OGpTZkhxdEthY25yM3VSTEJV?=
 =?utf-8?B?RVNBejhIWlltUnFLYTlBOGJnNDNOUDBUamZmU2NNeFpaRDN3Mmk4VFVxQjZa?=
 =?utf-8?B?VU56b0dqZHJwWEFWZUdvdlI4RXhLQzBYbFpXOXpJd2dNcnovdjNzZ3lhTXBj?=
 =?utf-8?B?SVZmTXFXVDV5aUVuL0lDcjlrWUNrUFFBZmc3VlNzVHU2emtQL3U2VnVoQXAv?=
 =?utf-8?B?amxtV1RscVhoZG5JWE8xcSt3Qm9WYjRaU2drVFU3Qm1lKzFNeEt2ODhpK2VJ?=
 =?utf-8?Q?+KS++v23hHjUFBMxiCpfyBE=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1885df-604c-4d93-2004-08de33eba708
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 10:47:14.6796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLp9bsfvpt+643mCPyCrqPaC/mmV4K5f73SjbWQmVoLc9o+v7wjNfydVwgQKvGGq5iQucNd9MNYm9on9KiTthWLouxk1bzwM00+1tLCdGEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8137
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 17/23] ARM: dts: stm32: Drop "u-boot-led"
 and "error-led" from stm32mp135f-dk-u-boot
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

On 12/5/25 10:45 AM, Patrice CHOTARD wrote:
> 
> 
> On 12/4/25 17:25, Quentin Schulz wrote:
>> Hi Patrice,
>>
>> On 11/14/25 5:23 PM, Patrice Chotard wrote:
>>> Remove obsolete properties "u-boot, u-boot-led" and "u-boot,error-led"
>>> from stm32mp135f-dk-u-boot.dtsi.
>>>
>>> Remove also led-red node which is now part of kernel DT.
>>> See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570
>>>
>>
>> You may want to wait for the DT to be sync'ed with Linux's for this patch so that the red LED can still be used with the led command?
>>
> 
> I will not wait for the DT to be synchronized, as the red led is no more functional since a while it's not a big deal.
> 

OK. Then this also answers my question sent by mail to patch 2 just now.

Cheers,
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
